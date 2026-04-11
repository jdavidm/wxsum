*********************************************************************************
* 	wxsum                                                   			       	 	    *
*	v 1.0  17may2017	by	Oscar Barriga Cabanillas	- obarriga@ucdavis.edu		    *
*	v 2.0  16mjul2017	by	Oscar Barriga Cabanillas	- obarriga@ucdavis.edu		    *
*			New stuff done by Aleksandr Michuda 		- amichuda@ucdavis.edu		    *
*	v 3.0  2july2019	by  Jeffrey D. Michler			- jdmichler@email.arizona.edu   *
*   v 3.1  5july2019  	by  Brian McGreal				- bmcgreal@email.arizona.edu    *
*   v 3.2  8july2019  	by  Anna Josepshon				- aljosephson@arizona.edu 		*
*	v 3.3  24apr2020	by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*	v 3.3  2nov2023		by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*	v 4.0  2apr2026		by  Jeffrey D. Michler			- jdmichler@arizona.edu			*
*********************************************************************************


pause on
cap program drop wxsum
program define wxsum  , eclass


* Define tempnames

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
		]											///

*0.0) If day is missing, it is assumed to be 01

if "'`ini_day'" == "" {
	loc ini_day = "01"
}
if "'`fin_day'" == "" {
	loc fin_day = "01"
}

*0.3) Check options

if "`temp_data'" == "temp_data" {
	if `gdd_lo' == 0 {
		di in red "Please define the temperature range to evaluate"
		error
	}
	if `gdd_hi' == 0 {
		di in red "Please define the temperature range to evaluate"
		error
	}
	if `bins' < 4 | `bins' > 10 {
		di in red "Bins must be between 4 and 10"
		error
	}
	if `lr_years' < 2 | `lr_years' > 50 {
		di in red "lr_years must be between 2 and 50"
		error
	}
	if "`rain_data'" == "rain_data" {
		di in red "rain and temp_data options cannot be used simultaneously"
		error
	}

}


*1) loading variables to be use in the estimation

/*
*2) loading variables to be use in the estimation
	we get the variables that match certain name characteristics
	specified in the options of the command
*/

loc months = "01 02 03 04 05 06 07 08 09 10 11 12"
loc days = "01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31"

* We need to know how many characters to substract from the loc(candidate)
loc length_anything = length("`anything'")
loc length_anything = `length_anything ' + 1

* This local will store the variables that go into the matrix
loc var = ""
loc safe2 = 1

* Help identify the first year that is used, so I can create a local with that name
loc count = 0
forvalues j = 1979(1)2040 {


	* Tempname for the matrix
	*tempname mat_`j'
	
	qui: cap unab check_vars : `anything'`j'*
	if _rc != 0 continue

	foreach month of loc months  {
		foreach day of loc days  {

			loc candidate = "`anything'`j'`month'`day'"

			loc candidate_year = "`j'"
			loc candidate_month = "`month'"
			loc candidate_day = "`day'"


			* We start selecting the variables that will be  use in the estimation
			* We run this until we reach  fin_month and  day_month again.
			* When reached we should stop adding info to the matrix


			* WE only start until the variables start existing
			qui: cap confirm numeric variable `anything'`j'`month'`day'

			* To avoid entering the conditional of line 91 before the loop gets into a valid month thte first time
			loc safe = 0

			if _rc == 0 {
				loc go = 0

			if `count' == 0 loc ini_year = "`j'"
			loc ++count


				if (`ini_month' <= `fin_month') {
					if (`candidate_month' >= `ini_month') & (`candidate_month' <= `fin_month') {
						if (`candidate_month' == `ini_month' & `candidate_day' >= `ini_day' ) 			loc go = 1
						if (`candidate_month' > `ini_month' ) &	(`candidate_month' < `fin_month')		loc go = 1
						if (`candidate_month' == `fin_month') & (`candidate_day' <= `fin_day' ) 		loc go = 1
					}
				}
				else {
					if (`candidate_month' >= `ini_month') | (`candidate_month' <= `fin_month') {
						if (`candidate_month' == `ini_month' & `candidate_day' >= `ini_day' ) 			loc go = 1
						if (`candidate_month' > `ini_month' ) 											loc go = 1
						if (`candidate_month' < `fin_month' ) 											loc go = 1
						if (`candidate_month' == `fin_month') & (`candidate_day' <= `fin_day' ) 		loc go = 1
					}
				}

				if `go' == 1 {
					loc var = "`var' `anything'`j'`month'`day'"
					loc safe = 1
					loc safe2 = 0
				}

				loc trigger = 0
				if (`ini_month' <= `fin_month') {
					if (`candidate_month' >= `fin_month') & (`candidate_day' > `fin_day') & (`safe' == 0 ) & (`safe2' == 0) loc trigger = 1
				}
				else {
					if (`candidate_month' >= `fin_month') & (`candidate_month' < `ini_month') & (`candidate_day' > `fin_day') & (`safe' == 0 ) & (`safe2' == 0) loc trigger = 1
					if (`candidate_month' > `fin_month') & (`candidate_month' < `ini_month') & (`safe' == 0 ) & (`safe2' == 0) loc trigger = 1
				}

				if `trigger' == 1 {


					loc final_year = `j'

					* At this point I calculate the statistics I want using vars in loc var

					loc dtype = ""
					if "`temp_data'" == "temp_data" loc dtype = "temp"
					if "`rain_data'" == "rain_data" loc dtype = "rain"

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


					* Number of days in the season
					loc count_days : word count  `var'


					* Some sats are only calculated for temperature data, but nor for rain

					if "`temp_data'" == "temp_data" {

						* max
						qui: egen max_`j' = rowmax(`var')
						label var max_`j' "Max daily `dtype' in `j'"

						*growing degree days
						foreach f of local var {
							qui: gen aux_gd_`f' = inrange(`f' , `gdd_lo' , `gdd_hi')
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


					*days without rain
					foreach f of local var {
						qui: gen aux_norain_`f' = `f' < `rain_threshold'
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

					*longest dry spell
					foreach f of local var {
						qui: gen aux_`f' = 0 if `f' == 0
						qui: replace aux_`f' = 1 if `f' > 0
					}

					qui: egen hist_`j' = concat(aux*)
					drop aux*
					qui: gen ssn_`j' = substr(hist_`j', strpos(hist_`j', "1"), .)
					qui: replace ssn_`j' = substr(ssn_`j', 1, strrpos(ssn_`j', "1"))
					*qui: gen ssn_lngth_`j' = strlen(ssn_`j')

					gen dry_`j'  = 0
					label var dry_`j' "Longest intra-season dry spell in `j'"

					*local ssn_lngth ssn_lngth_*
					local lookfor : di _dup(`count_days') "0" // change count_days to lenght of ssn
					qui forval k = 1/`count_days' {
					replace dry_`j' = `k' if strpos(ssn_`j', substr("`lookfor'", 1, `k'))
					}
 				}

					* Calculate Deviations for the current year `j` right here to keep variables together
					loc deviation = ""
					if "`rain_data'" == "rain_data" {
						loc deviation = "total_season raindays norain pct_raindays"
					}
					if "`temp_data'" == "temp_data" {
						loc deviation = "total_season gdd"
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

					* Cleans the loc var so it can start again from zero and updates the dafe2 local indicatig that a new round of vars is going to be collected
					loc var = ""
					loc safe2 = 1

				}

			}

		}
	}
}


	forval k = 1/10 {
		qui: cap confirm numeric variable tempbin`k'`ini_year'
		if _rc == 0 {
			qui: egen mean_`k' = rowmean(tempbin`k'*)
			label var mean_`k' "Mean percentage of days in the `k'th percentile across all seasons"

			qui: egen sd_`k' = rowsd(tempbin`k'*)
			label var sd_`k' "Std dev of percentage of days in the `k'th percentile across all seasons"
		}
	}


***********
* Main Rainfall Statistics
***********

*** No rainfall deviations from the LR mean - keep this

* gen average annual number of days with no rain
*not using currently - 8 July 2019
/*

if "`rain_data'" == "rain_data" {

	qui: egen mean_norain = rowmean(norain_per*)
	label var mean_norain "Average number of days without rain between seasons"

	qui: egen sd_norain = rowsd(norain_per*)
	label var sd_norain "SD of days without rain between seasons"


}
*/

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
