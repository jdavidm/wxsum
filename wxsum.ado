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
forvalues j = 1979(1)2027 {


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

					* Mean
					qui: egen mean_season_`j' = rowmean(`var')
					label var mean_season_`j' "Season avg months: `ini_month' `fin_month' on `j'"

					* Median
					qui: egen median_season_`j' = rowmedian(`var')
					label var median_season_`j' "Season median months: `ini_month' `fin_month' on `j'"

					* sd
					qui: egen sd_season_`j' = rowsd(`var')
					label var sd_season_`j' "Season s.d months: `ini_month' `fin_month' on `j'"

					* Total
					qui: egen total_season_`j' = rowtotal(`var')
					label var total_season_`j' "Season total months: `ini_month' `fin_month' on `j'"

					* skewness
					qui: gen skew_season_`j' = (mean_season_`j' - median_season_`j')/sd_season_`j'
					label var skew_season_`j' "Season skew months: `ini_month' `fin_month' on `j'"

					* max
					qui: egen max_season_`j' = rowmax(`var')
					label var max_season_`j' "Season max months: `ini_month' `fin_month' on `j'"


					* Number of days in the season
					loc count_days : word count  `var'


					* Some sats are only calculated for temperature data, but nor for rain

					if "`temp_data'" == "temp_data" {

						*growing degree days
						foreach f of local var {
							qui: gen aux_gd_`f' = inrange(`f' , `gdd_lo' , `gdd_hi')
						}

						qui: egen gdd_`j' = rowtotal(aux_gd_*)
						label var gdd_`j' "Number of growing degree days in `j' between `gdd_lo' `gdd_hi'"

						drop aux_gd_*

						*killing degree days
						if `kdd_base' > 0 {
							foreach f of local var {
								qui: gen aux_kd_`f' = max(`f' - `kdd_base', 0)
							}
							qui: egen kdd_`j' = rowtotal(aux_kd_*)
							label var kdd_`j' "Number of killing degree days in `j' base `kdd_base'"
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
							label var tempbin`b'`j' "The percentage of days in the `p_val_end'th percentile of temperature in year `j'"
						}

						qui: drop aux1*
						forval b=2/`bins' {
							qui: drop aux`b'*
						}

					}

				if "`rain_data'" == "rain_data" {

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
					qui: gen percent_raindays_`j' = raindays_`j'/`count_days'
					label var percent_raindays_`j' "Percentage of days with rain in `j'"

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

					* Cleans the loc var so it can start again from zero and updates the dafe2 local indicatig that a new round of vars is going to be collected
					loc var = ""
					loc safe2 = 1

				}

			}

		}
	}
}


***********
* Now we create deviations from the seasons
***********
if "`rain_data'" == "rain_data" {

loc deviation = "total_season raindays norain percent_raindays"

foreach var of loc deviation {

	* gen average of the seasons - keep this
	qui: egen mean_period_`var' = rowmean(`var'_*)
	label var mean_period_`var' "Average of `var' between seasons in months: `ini_month' `fin_month' on years `ini_year' `final_year'"

	* gen sd of the seasons - keep this
	qui: egen sd_period_`var' = rowsd(`var'_*)
	label var sd_period_`var' "SD of `var' between seasons in months: `ini_month' `fin_month' on years `ini_year' `final_year'"


	* Z-scores - keep this
	forvalues j = 1979(1)2027{

		* We only start until the variables start existing
		qui: cap confirm numeric variable `var'_`j'

		if _rc == 0 {
			qui: gen dev_`var'_`j' = `var'_`j' - mean_period_`var'
			label var dev_`var'_`j' "Deviation in `var' from long-run average"

			qui: gen z_`var'_`j'  = (`var'_`j'-mean_period_`var')/sd_period_`var'
			label var z_`var'_`j' "Z-score of `var'  between seasons in months: `ini_month' `fin_month' on years `ini_year' `final_year'"

		}

	}

}

}

***********
* Main Temperature Statistics
***********
if "`temp_data'" == "temp_data" {
*** GDD deviations from LR mean - keep this
	* gen average annual number of growing degree days
	qui: egen mean_gdd = rowmean(gdd_*)
	label var mean_gdd "Long Term growing degree days between  `gdd_lo' `gdd_hi' seasons"

	* gen sd of growing degree days - keep this
	qui: egen sd_gdd = rowsd(gdd_*)
	label var sd_gdd "Standard Deviation of growing days between seasons between  `gdd_lo' `gdd_hi'"


	* Z-scores - keep this
	forvalues j = 1979(1)2027{

	* We only start until the variables start existing
		qui: cap confirm numeric variable gdd_`j'

		if _rc == 0 {
			qui: gen dev_gdd_`j' = gdd_`j' - mean_gdd
			label var dev_gdd_`j' "Deviation in GDD from long-run average"

			qui: gen z_gdd_`j'  = (gdd_`j'-mean_gdd)/sd_gdd
			label var z_gdd_`j' "Z-score of GDD between seasons in months: `ini_month' `fin_month' on years `ini_year' `final_year'"

		}

	}

*** KDD deviations from LR mean - keep this
	if `kdd_base' > 0 {
		qui: egen mean_kdd = rowmean(kdd_*)
		label var mean_kdd "Long Term killing degree days base `kdd_base' seasons"

		qui: egen sd_kdd = rowsd(kdd_*)
		label var sd_kdd "Standard Deviation of killing days between seasons base `kdd_base'"

		forvalues j = 1979(1)2027{
			qui: cap confirm numeric variable kdd_`j'

			if _rc == 0 {
				qui: gen dev_kdd_`j' = kdd_`j' - mean_kdd
				label var dev_kdd_`j' "Deviation in KDD from long-run average"

				qui: gen z_kdd_`j'  = (kdd_`j'-mean_kdd)/sd_kdd
				label var z_kdd_`j' "Z-score of KDD between seasons in months: `ini_month' `fin_month' on years `ini_year' `final_year'"
			}
		}
	}

	forval k = 1/10 {
		qui: cap confirm numeric variable tempbin`k'`ini_year'
		if _rc == 0 {
			qui: egen mean_`k' = rowmean(tempbin`k'*)
			label var mean_`k' "Average percentage number of days in the bin `k' between all seasons"

			qui: egen sd_`k' = rowsd(tempbin`k'*)
			label var sd_`k' "SD of the percentage of number of days in the bin `k' between all seasons"
		}
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
		qui: keep `keep' *season*  *norain* *raindays* dry* *percent_raindays*
		qui: drop z_raindays* z_norain* max* z_percent*


	}

	if "`temp_data'" == "temp_data" {
		qui: keep `keep' *season* *gdd* *kdd* tempbin*
		qui: drop total_season_*

	}
}

if "`save'" != "" {


	di in y "Saving data set as `save'"
	save "`save'" , replace
}

end
// ------------------------------------------------------------------

exit
