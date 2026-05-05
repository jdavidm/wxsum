*********************************************************************************
* 	wxsum                                                   			       	 	    *
*	v 1.0  17may2017	by	Oscar Barriga Cabanillas	- obarriga@ucdavis.edu		    *
*	v 2.0  16jul2017	by	Oscar Barriga Cabanillas	- obarriga@ucdavis.edu		    *
*				New stuff done by Aleksandr Michuda 		- amichuda@ucdavis.edu		    *
*	v 3.0  2july2019	by  Jeffrey D. Michler			- jdmichler@email.arizona.edu   *
*   v 3.1  5july2019  	by  Brian McGreal				- bmcgreal@email.arizona.edu    *
*   v 3.2  8july2019  	by  Anna Josepshon				- aljosephson@arizona.edu 		*
*	v 3.3  24apr2020	by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*	v 3.3  2nov2023		by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*	v 4.0  2apr2026		by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*********************************************************************************


cap program drop wxsum
program define wxsum


version 15.1

	syntax anything 								///
		,											///
		ini_month(string)							///
		fin_month(string)							///
		[											///
		ini_day(string)								///
		fin_day(string)								///
		keep(string)								///
		save(string)								///
		gdd_lo(real 0)								///
		gdd_hi(real 0)								///
		kdd_base(real 0)							///
		bins(real 4)								///
		lr_years(integer 10)						///
		temp_data									///
		rain_data									///
		rain_threshold(real 1)						///
		]

*0.0) If day is missing, it is assumed to be 01

if "`ini_day'" == "" {
	loc ini_day = "01"
}
if "`fin_day'" == "" {
	loc fin_day = "01"
}

*0.3) Check options

* Require exactly one of rain_data or temp_data
if "`rain_data'" == "" & "`temp_data'" == "" {
	di as error "Please specify either rain_data or temp_data"
	error 198
}
if "`rain_data'" == "rain_data" & "`temp_data'" == "temp_data" {
	di as error "rain_data and temp_data cannot be used simultaneously"
	error 198
}

* Validate lr_years for both data types
if `lr_years' < 2 | `lr_years' > 50 {
	di as error "lr_years must be between 2 and 50"
	error 198
}

if "`temp_data'" == "temp_data" {
	if `gdd_lo' == 0 {
		di as error "Please define the temperature range to evaluate"
		error 198
	}
	if `gdd_hi' == 0 {
		di as error "Please define the temperature range to evaluate"
		error 198
	}
	if `bins' < 4 | `bins' > 10 {
		di as error "Bins must be between 4 and 10"
		error 198
	}
}


*1) Detect year range dynamically from variable names

loc prefix_len = length("`anything'")

qui: ds `anything'*
loc all_data_vars `r(varlist)'
loc min_year = 9999
loc max_year = 0
foreach v of local all_data_vars {
	cap confirm numeric variable `v'
	if _rc != 0 continue
	loc suffix = substr("`v'", `prefix_len' + 1, .)
	if length("`suffix'") != 8 continue
	loc yr = real(substr("`suffix'", 1, 4))
	if !missing(`yr') & `yr' >= 1900 & `yr' <= 2100 {
		if `yr' < `min_year' loc min_year = `yr'
		if `yr' > `max_year' loc max_year = `yr'
	}
}

if `min_year' > `max_year' {
	di as error "No valid date variables found with prefix `anything'"
	error 111
}

*2) Determine if season crosses calendar year boundary

loc crosses = (`ini_month' > `fin_month')

loc first_year = .
loc last_year = .
loc dtype = ""
if "`temp_data'" == "temp_data" loc dtype = "temp"
if "`rain_data'" == "rain_data" loc dtype = "rain"

loc months = "01 02 03 04 05 06 07 08 09 10 11 12"

*3) Iterate over seasons using date arithmetic

forvalues j = `min_year'/`max_year' {
	loc end_year = `j' + `crosses'

	* Build season start and end dates using Stata date functions
	loc start_date = mdy(`ini_month', `ini_day', `j')
	loc end_date = mdy(`fin_month', `fin_day', `end_year')

	* Skip invalid dates
	if missing(`start_date') | missing(`end_date') continue

	* Collect variables for this season by iterating calendar dates
	loc var = ""
	forvalues d = `start_date'/`end_date' {
		loc yy = year(`d')
		loc mm = string(month(`d'), "%02.0f")
		loc dd = string(day(`d'), "%02.0f")
		loc candidate = "`anything'`yy'`mm'`dd'"
		cap confirm numeric variable `candidate'
		if _rc == 0 {
			loc var = "`var' `candidate'"
		}
	}

	* Count days and skip empty seasons
	loc count_days : word count `var'
	if `count_days' == 0 continue

	* Guard: skip incomplete seasons at data boundaries
	* Check that both the first and last expected dates have data
	loc exp_first = "`anything'" + string(year(`start_date'))	///
		+ string(month(`start_date'), "%02.0f")					///
		+ string(day(`start_date'), "%02.0f")
	loc exp_last = "`anything'" + string(year(`end_date'))		///
		+ string(month(`end_date'), "%02.0f")					///
		+ string(day(`end_date'), "%02.0f")
	cap confirm numeric variable `exp_first'
	if _rc != 0 continue
	cap confirm numeric variable `exp_last'
	if _rc != 0 continue

	* Track processed years
	if missing(`first_year') loc first_year = `j'
	loc last_year = `j'


	* =========================================================
	* 4) Compute statistics for this season
	* =========================================================

	* Mean
	qui: egen mean_`j' = rowmean(`var')
	label var mean_`j' "Mean daily `dtype' in `j'"

	* Median
	qui: egen median_`j' = rowmedian(`var')
	label var median_`j' "Median daily `dtype' in `j'"

	* sd
	qui: egen sd_`j' = rowsd(`var')
	label var sd_`j' "Std dev of daily `dtype' in `j'"

	* skewness
	qui: gen skew_`j' = (mean_`j' - median_`j')/sd_`j'
	label var skew_`j' "Skew of daily `dtype' in `j'"


	* Some stats are only calculated for temperature data, but not for rain

	if "`temp_data'" == "temp_data" {

		* max
		qui: egen max_`j' = rowmax(`var')
		label var max_`j' "Max daily `dtype' in `j'"

		* Growing degree days (standard accumulated formula)
		* GDD = sum( min(max(T - T_lo, 0), T_hi - T_lo) )
		foreach f of local var {
			qui: gen aux_gd_`f' = min(max(`f' - `gdd_lo', 0), `gdd_hi' - `gdd_lo')
		}

		qui: egen gdd_`j' = rowtotal(aux_gd_*)
		label var gdd_`j' "Growing degree days in `j' between `gdd_lo' `gdd_hi'"

		drop aux_gd_*

		*killing degree days
		if `kdd_base' > 0 {
			foreach f of local var {
				qui: gen aux_kd_`f' = max(`f' - `kdd_base', 0)
			}
			qui: egen kdd_`j' = rowtotal(aux_kd_*)
			label var kdd_`j' "Killing degree days in `j' above `kdd_base'"
			drop aux_kd_*
		}

		* Dynamic Temperature Bins
		loc step = 100 / `bins'
		loc max_bound = `bins' - 1
		
		* Calculate percentiles
		forval b=1/`max_bound' {
			loc p_val = round(`b' * `step')
			qui: egen percentile`b'`j' = rowpctile(`var'), p(`p_val')
		}

		foreach f of local var {
			* First bin
			qui: gen aux1`f' = `f' < percentile1`j'
			
			* Middle bins
			forval b=2/`max_bound' {
				loc prev = `b' - 1
				qui: gen aux`b'`f' = inrange(`f' , percentile`prev'`j' , percentile`b'`j' - 0.00001)
			}
			
			* Last bin
			qui: gen aux`bins'`f' = `f' >= percentile`max_bound'`j'
		}

		forval b=1/`bins' {
			qui: egen tempbin`b'`j'  = rowtotal(aux`b'*)
			qui: replace tempbin`b'`j' = tempbin`b'`j'/`count_days'
			loc p_val_end = round(`b' * `step')
			label var tempbin`b'`j' "Percentage of days in the `p_val_end'th percentile in year `j'"
		}

		qui: drop aux1*
		forval b=2/`bins' {
			qui: drop aux`b'*
		}

		* Drop percentile variables (no longer needed)
		forval b=1/`max_bound' {
			qui: drop percentile`b'`j'
		}

	}

	if "`rain_data'" == "rain_data" {

		* Total
		qui: egen total_`j' = rowtotal(`var')
		label var total_`j' "Total `dtype' in `j'"

		* Calculate monthly totals
		foreach m of loc months {
			loc mvar = ""
			foreach v of loc var {
				* extract month portion from variable like pic_19790515
				* safe check matching `v' ends with `m'xx
				loc ml = length("`m'")
				if substr("`v'", -4, 2) == "`m'" {
					loc mvar = "`mvar' `v'"
				}
			}
			
			* if month had days in the season, get total
			if "`mvar'" != "" {
				qui: egen total_mo_`m'_`j' = rowtotal(`mvar')
			}
		}
		
		* Aggregate the monthly totals
		qui: cap drop aux_mo_*
		qui: cap egen mean_mo_total_`j' = rowmean(total_mo_*_`j')
		qui: cap egen median_mo_total_`j' = rowmedian(total_mo_*_`j')
		qui: cap egen sd_mo_total_`j' = rowsd(total_mo_*_`j')
		
		qui: cap gen skew_mo_total_`j' = (mean_mo_total_`j' - median_mo_total_`j')/sd_mo_total_`j'
		
		qui: cap label var mean_mo_total_`j' "Mean monthly rain in `j'"
		qui: cap label var median_mo_total_`j' "Median monthly rain in `j'"
		qui: cap label var sd_mo_total_`j' "Std dev of monthly rain in `j'"
		qui: cap label var skew_mo_total_`j' "Skew of monthly rain in `j'"

		qui: cap drop total_mo_*_`j'


		*days without rain (missing values excluded)
		foreach f of local var {
			qui: gen aux_norain_`f' = cond(mi(`f'), ., `f' < `rain_threshold')
		}

		*days without rain count
		qui: egen norain_`j' = rowtotal(aux_norain_*)
		label var norain_`j' "Number of days without rain in `j'"

		*days with rain
		qui: gen raindays_`j' = `count_days' - norain_`j'
		label var raindays_`j' "Number of days with rain in `j'"

		*percent days with rain
		qui: gen pct_raindays_`j' = raindays_`j'/`count_days'
		label var pct_raindays_`j' "Percentage of days with rain in `j'"

		drop aux_norain_*

		*longest dry spell (missing values treated as breaks)
		foreach f of local var {
			qui: gen aux_`f' = cond(mi(`f'), ., cond(`f' < `rain_threshold', 0, 1))
		}

		qui: egen hist_`j' = concat(aux*)
		drop aux*
		qui: gen ssn_`j' = substr(hist_`j', strpos(hist_`j', "1"), .)
		qui: replace ssn_`j' = substr(ssn_`j', 1, strrpos(ssn_`j', "1"))

		gen dry_`j'  = 0
		label var dry_`j' "Longest intra-season dry spell in `j'"

		local lookfor : di _dup(`count_days') "0"
		qui forval k = 1/`count_days' {
		replace dry_`j' = `k' if strpos(ssn_`j', substr("`lookfor'", 1, `k'))
		}

		* Drop orphaned temporary variables
		drop hist_`j' ssn_`j'
 	}

	* Calculate Deviations for the current year
	loc deviation = ""
	if "`rain_data'" == "rain_data" {
		loc deviation = "total raindays norain pct_raindays"
	}
	if "`temp_data'" == "temp_data" {
		loc deviation = "gdd"
		if `kdd_base' > 0 {
			loc deviation = "`deviation' kdd"
		}
	}
	
	if "`deviation'" != "" {
		foreach v of loc deviation {
			qui: cap confirm numeric variable `v'_`j'
			if _rc == 0 {
				* Build a varlist of previous lr_years
				loc pvars = ""
				loc start_year = `j' - `lr_years'
				loc end_year = `j' - 1
				forval y = `start_year'(1)`end_year' {
					qui: cap confirm numeric variable `v'_`y'
					if _rc == 0 {
						loc pvars = "`pvars' `v'_`y'"
					}
				}
				
				* Check if we found exactly lr_years
				loc wordcount : word count `pvars'
				if `wordcount' == `lr_years' {
					qui: egen aux_mean_`v'_`j' = rowmean(`pvars')
					qui: egen aux_sd_`v'_`j' = rowsd(`pvars')
					
					qui: gen dev_`v'_`j' = `v'_`j' - aux_mean_`v'_`j'
					label var dev_`v'_`j' "Deviation in `v' from `lr_years' yr avg"

					qui: gen z_`v'_`j'  = (`v'_`j'-aux_mean_`v'_`j')/aux_sd_`v'_`j'
					label var z_`v'_`j' "Z-score of `v' from `lr_years' yr avg"
					
					qui: drop aux_mean_`v'_`j' aux_sd_`v'_`j'
				}
			}
		}
	}

}


if "`temp_data'" == "temp_data" {
	forval k = 1/`bins' {
		qui: cap confirm numeric variable tempbin`k'`first_year'
		if _rc == 0 {
			qui: egen mean_`k' = rowmean(tempbin`k'*)
			label var mean_`k' "Mean percentage of days in the `k'th percentile across all seasons"

			qui: egen sd_`k' = rowsd(tempbin`k'*)
			label var sd_`k' "Std dev of percentage of days in the `k'th percentile across all seasons"
		}
	}
}


* We keep only what we need if the option keep was used
if "`keep'" != "" {
	if "`rain_data'" == "rain_data" {
		di in r "option keep was chosen"
		qui: keep `keep' mean_* median_* sd_* skew_* total_* mean_mo_total_* median_mo_total_* sd_mo_total_* skew_mo_total_* raindays_* norain_* pct_raindays_* dry_* dev_* z_*
	}

	if "`temp_data'" == "temp_data" {
		qui: keep `keep' mean_* median_* sd_* skew_* max_* gdd_* kdd_* tempbin* dev_* z_*
	}
}

if "`save'" != "" {


	di in y "Saving data set as `save'"
	save "`save'" , replace
}

end
// ------------------------------------------------------------------

exit
