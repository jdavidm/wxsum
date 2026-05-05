*********************************************************************************
*  wxsum                                                                        *
*  v 1.0  17may2017 by Oscar Barriga Cabanillas - obarriga@ucdavis.edu          *
*  v 2.0  16jul2017 by Oscar Barriga Cabanillas - obarriga@ucdavis.edu          *
*         New stuff done by Aleksandr Michuda - amichuda@ucdavis.edu            *
*  v 3.0  2july2019 by Jeffrey D. Michler - jdmichler@email.arizona.edu         *
*  v 3.1  5july2019 by Brian McGreal - bmcgreal@email.arizona.edu               *
*  v 3.2  8july2019 by Anna Josepshon - aljosephson@arizona.edu                 *
*  v 3.3  24apr2020 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 3.3  2nov2023  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.0  2apr2026  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*********************************************************************************

cap program drop wxsum
program define wxsum

version 15.1

	syntax anything								///
		,										///
		ini_month(string)						///
		fin_month(string)						///
		[										///
		ini_day(string)							///
		fin_day(string)							///
		keep(string)							///
		save(string)							///
		gdd_lo(real -999999999)					///
		gdd_hi(real -999999999)					///
		kdd_base(real 0)						///
		bins(real 4)							///
		lr_years(integer 10)					///
		temp_data								///
		rain_data								///
		rain_threshold(real 1)					///
		]

	local prefix "`anything'"

	if "`ini_day'" == "" local ini_day = "01"
	if "`fin_day'" == "" local fin_day = "01"

	local ini_month_n = real("`ini_month'")
	local fin_month_n = real("`fin_month'")
	local ini_day_n = real("`ini_day'")
	local fin_day_n = real("`fin_day'")

	if missing(`ini_month_n') | `ini_month_n' != floor(`ini_month_n') | `ini_month_n' < 1 | `ini_month_n' > 12 {
		di as error "ini_month() must be an integer between 1 and 12"
		exit 198
	}
	if missing(`fin_month_n') | `fin_month_n' != floor(`fin_month_n') | `fin_month_n' < 1 | `fin_month_n' > 12 {
		di as error "fin_month() must be an integer between 1 and 12"
		exit 198
	}
	if missing(`ini_day_n') | `ini_day_n' != floor(`ini_day_n') | `ini_day_n' < 1 | `ini_day_n' > 31 {
		di as error "ini_day() must be an integer between 1 and 31"
		exit 198
	}
	if missing(`fin_day_n') | `fin_day_n' != floor(`fin_day_n') | `fin_day_n' < 1 | `fin_day_n' > 31 {
		di as error "fin_day() must be an integer between 1 and 31"
		exit 198
	}

	local ini_month = `ini_month_n'
	local fin_month = `fin_month_n'
	local ini_day = `ini_day_n'
	local fin_day = `fin_day_n'

	local ini_ref = mdy(`ini_month', `ini_day', 2000)
	local fin_ref = mdy(`fin_month', `fin_day', 2000)
	if missing(`ini_ref') | month(`ini_ref') != `ini_month' | day(`ini_ref') != `ini_day' {
		di as error "ini_month()/ini_day() is not a valid date"
		exit 198
	}
	if missing(`fin_ref') | month(`fin_ref') != `fin_month' | day(`fin_ref') != `fin_day' {
		di as error "fin_month()/fin_day() is not a valid date"
		exit 198
	}

	local modes = ("`rain_data'" != "") + ("`temp_data'" != "")
	if `modes' != 1 {
		di as error "Specify exactly one of rain_data or temp_data"
		exit 198
	}

	if `lr_years' < 2 | `lr_years' > 50 {
		di as error "lr_years must be between 2 and 50"
		exit 198
	}

	if "`temp_data'" != "" {
		if `gdd_lo' == -999999999 | `gdd_hi' == -999999999 {
			di as error "Please define gdd_lo() and gdd_hi() for temperature data"
			exit 198
		}
		if `gdd_hi' <= `gdd_lo' {
			di as error "gdd_hi() must be greater than gdd_lo()"
			exit 198
		}
		if `bins' != floor(`bins') | `bins' < 4 | `bins' > 10 {
			di as error "bins() must be an integer between 4 and 10"
			exit 198
		}
	}

	if `rain_threshold' < 0 {
		di as error "rain_threshold() must be nonnegative"
		exit 198
	}

	capture unab all_vars : `prefix'*
	if _rc != 0 {
		di as error "No variables found with prefix `prefix'"
		exit 111
	}

	local prefix_len = strlen("`prefix'")
	local date_vars ""
	local min_date = .
	local max_date = .

	foreach v of local all_vars {
		capture confirm numeric variable `v'
		if _rc == 0 {
			local suffix = substr("`v'", `prefix_len' + 1, .)
			if regexm("`suffix'", "^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$") {
				local vy = real(substr("`suffix'", 1, 4))
				local vm = real(substr("`suffix'", 5, 2))
				local vd = real(substr("`suffix'", 7, 2))
				local vdate = mdy(`vm', `vd', `vy')
				if !missing(`vdate') & year(`vdate') == `vy' & month(`vdate') == `vm' & day(`vdate') == `vd' {
					local date_vars "`date_vars' `v'"
					if missing(`min_date') | `vdate' < `min_date' local min_date = `vdate'
					if missing(`max_date') | `vdate' > `max_date' local max_date = `vdate'
				}
			}
		}
	}

	if "`date_vars'" == "" {
		di as error "No numeric daily variables found with prefix `prefix' and yyyymmdd suffix"
		exit 111
	}

	local min_year = year(`min_date')
	local max_year = year(`max_date')
	local crosses = (`ini_ref' > `fin_ref')
	local created_vars ""
	local first_year = .
	local last_year = .
	local dtype = cond("`temp_data'" != "", "temp", "rain")

	forvalues j = `min_year'/`max_year' {
		local end_year = `j' + `crosses'
		local start_date = mdy(`ini_month', `ini_day', `j')
		local end_date = mdy(`fin_month', `fin_day', `end_year')

		if missing(`start_date') | missing(`end_date') continue
		if month(`start_date') != `ini_month' | day(`start_date') != `ini_day' continue
		if month(`end_date') != `fin_month' | day(`end_date') != `fin_day' continue
		if `start_date' < `min_date' | `end_date' > `max_date' continue

		local var ""
		forvalues d = `start_date'/`end_date' {
			local yy = year(`d')
			local mm = string(month(`d'), "%02.0f")
			local dd = string(day(`d'), "%02.0f")
			local candidate "`prefix'`yy'`mm'`dd'"
			capture confirm numeric variable `candidate'
			if _rc == 0 local var "`var' `candidate'"
		}

		local count_days : word count `var'
		if `count_days' == 0 continue

		if missing(`first_year') local first_year = `j'
		local last_year = `j'

		quietly egen mean_`j' = rowmean(`var')
		label var mean_`j' "Mean daily `dtype' in `j'"
		local created_vars "`created_vars' mean_`j'"

		quietly egen median_`j' = rowmedian(`var')
		label var median_`j' "Median daily `dtype' in `j'"
		local created_vars "`created_vars' median_`j'"

		if `count_days' > 1 {
			quietly egen sd_`j' = rowsd(`var')
		}
		else {
			quietly gen sd_`j' = .
		}
		label var sd_`j' "Std dev of daily `dtype' in `j'"
		local created_vars "`created_vars' sd_`j'"

		quietly gen skew_`j' = (mean_`j' - median_`j') / sd_`j'
		label var skew_`j' "Skew of daily `dtype' in `j'"
		local created_vars "`created_vars' skew_`j'"

		tempvar observed_days
		quietly egen `observed_days' = rownonmiss(`var')

		if "`temp_data'" != "" {
			quietly egen max_`j' = rowmax(`var')
			label var max_`j' "Max daily `dtype' in `j'"
			local created_vars "`created_vars' max_`j'"

			local gdd_aux ""
			foreach f of local var {
				tempvar gd
				quietly gen double `gd' = min(max(`f' - `gdd_lo', 0), `gdd_hi' - `gdd_lo') if !missing(`f')
				local gdd_aux "`gdd_aux' `gd'"
			}
			quietly egen gdd_`j' = rowtotal(`gdd_aux')
			label var gdd_`j' "Growing degree days in `j' between `gdd_lo' and `gdd_hi'"
			local created_vars "`created_vars' gdd_`j'"
			quietly drop `gdd_aux'

			if `kdd_base' > 0 {
				local kdd_aux ""
				foreach f of local var {
					tempvar kd
					quietly gen double `kd' = max(`f' - `kdd_base', 0) if !missing(`f')
					local kdd_aux "`kdd_aux' `kd'"
				}
				quietly egen kdd_`j' = rowtotal(`kdd_aux')
				label var kdd_`j' "Killing degree days in `j' above `kdd_base'"
				local created_vars "`created_vars' kdd_`j'"
				quietly drop `kdd_aux'
			}

			local max_bound = `bins' - 1
			if `count_days' >= `bins' {
				local pct_vars ""
				forvalues b = 1/`max_bound' {
					local p_val = round(`b' * 100 / `bins')
					tempvar pct`b'
					quietly egen `pct`b'' = rowpctile(`var'), p(`p_val')
					local pct_vars "`pct_vars' `pct`b''"
				}

				forvalues b = 1/`bins' {
					local b_str = string(`b', "%02.0f")
					local bin_aux ""
					foreach f of local var {
						tempvar bin
						if `b' == 1 {
							local upper "`pct1'"
							quietly gen byte `bin' = (`f' < `upper') if !missing(`f') & !missing(`upper')
						}
						else if `b' == `bins' {
							local lower "`pct`max_bound''"
							quietly gen byte `bin' = (`f' >= `lower') if !missing(`f') & !missing(`lower')
						}
						else {
							local prev = `b' - 1
							local lower "`pct`prev''"
							local upper "`pct`b''"
							quietly gen byte `bin' = (`f' >= `lower' & `f' < `upper') if !missing(`f') & !missing(`lower') & !missing(`upper')
						}
						local bin_aux "`bin_aux' `bin'"
					}

					quietly egen tempbin`b_str'_`j' = rowtotal(`bin_aux')
					quietly replace tempbin`b_str'_`j' = tempbin`b_str'_`j' / `observed_days' if `observed_days' > 0
					quietly replace tempbin`b_str'_`j' = . if `observed_days' == 0
					local p_val_end = round(`b' * 100 / `bins')
					label var tempbin`b_str'_`j' "Share of observed days in bin `b' ending at `p_val_end'th percentile in `j'"
					local created_vars "`created_vars' tempbin`b_str'_`j'"
					quietly drop `bin_aux'
				}
				quietly drop `pct_vars'
			}
		}

		if "`rain_data'" != "" {
			quietly egen total_`j' = rowtotal(`var')
			label var total_`j' "Total `dtype' in `j'"
			local created_vars "`created_vars' total_`j'"

			local monthly_totals ""
			forvalues m = 1/12 {
				local m_string = string(`m', "%02.0f")
				local mvar ""
				foreach v of local var {
					if substr("`v'", -4, 2) == "`m_string'" {
						local mvar "`mvar' `v'"
					}
				}
				if "`mvar'" != "" {
					tempvar mo_total
					quietly egen `mo_total' = rowtotal(`mvar')
					local monthly_totals "`monthly_totals' `mo_total'"
				}
			}

			if "`monthly_totals'" != "" {
				quietly egen mean_mo_total_`j' = rowmean(`monthly_totals')
				label var mean_mo_total_`j' "Mean monthly rain in `j'"
				local created_vars "`created_vars' mean_mo_total_`j'"

				quietly egen median_mo_total_`j' = rowmedian(`monthly_totals')
				label var median_mo_total_`j' "Median monthly rain in `j'"
				local created_vars "`created_vars' median_mo_total_`j'"

				local monthly_count : word count `monthly_totals'
				if `monthly_count' > 1 {
					quietly egen sd_mo_total_`j' = rowsd(`monthly_totals')
				}
				else {
					quietly gen sd_mo_total_`j' = .
				}
				label var sd_mo_total_`j' "Std dev of monthly rain in `j'"
				local created_vars "`created_vars' sd_mo_total_`j'"

				quietly gen skew_mo_total_`j' = (mean_mo_total_`j' - median_mo_total_`j') / sd_mo_total_`j'
				label var skew_mo_total_`j' "Skew of monthly rain in `j'"
				local created_vars "`created_vars' skew_mo_total_`j'"
				quietly drop `monthly_totals'
			}

			local no_rain_aux ""
			local rain_aux ""
			foreach f of local var {
				tempvar no_rain rain_day
				quietly gen byte `no_rain' = (`f' < `rain_threshold') if !missing(`f')
				quietly gen byte `rain_day' = (`f' >= `rain_threshold') if !missing(`f')
				local no_rain_aux "`no_rain_aux' `no_rain'"
				local rain_aux "`rain_aux' `rain_day'"
			}

			quietly egen norain_`j' = rowtotal(`no_rain_aux')
			label var norain_`j' "Number of observed days without rain in `j'"
			local created_vars "`created_vars' norain_`j'"

			quietly egen raindays_`j' = rowtotal(`rain_aux')
			label var raindays_`j' "Number of observed days with rain in `j'"
			local created_vars "`created_vars' raindays_`j'"

			quietly gen pct_raindays_`j' = raindays_`j' / `observed_days' if `observed_days' > 0
			label var pct_raindays_`j' "Share of observed days with rain in `j'"
			local created_vars "`created_vars' pct_raindays_`j'"
			quietly drop `no_rain_aux' `rain_aux'

			tempvar dry_run
			quietly gen `dry_run' = 0
			quietly gen dry_`j' = 0
			foreach f of local var {
				quietly replace `dry_run' = cond(missing(`f'), 0, cond(`f' < `rain_threshold', `dry_run' + 1, 0))
				quietly replace dry_`j' = max(dry_`j', `dry_run')
			}
			label var dry_`j' "Longest observed dry spell in `j'"
			local created_vars "`created_vars' dry_`j'"
			quietly drop `dry_run'
		}

		local deviation ""
		if "`rain_data'" != "" {
			local deviation "total raindays norain pct_raindays"
		}
		if "`temp_data'" != "" {
			local deviation "gdd"
			if `kdd_base' > 0 local deviation "`deviation' kdd"
		}

		foreach v of local deviation {
			capture confirm numeric variable `v'_`j'
			if _rc == 0 {
				local pvars ""
				local start_year = `j' - `lr_years'
				local end_dev_year = `j' - 1
				forvalues y = `start_year'/`end_dev_year' {
					capture confirm numeric variable `v'_`y'
					if _rc == 0 local pvars "`pvars' `v'_`y'"
				}

				local wordcount : word count `pvars'
				if `wordcount' == `lr_years' {
					tempvar aux_mean aux_sd
					quietly egen `aux_mean' = rowmean(`pvars')
					quietly egen `aux_sd' = rowsd(`pvars')

					quietly gen dev_`v'_`j' = `v'_`j' - `aux_mean'
					label var dev_`v'_`j' "Deviation in `v' from `lr_years' yr avg"
					local created_vars "`created_vars' dev_`v'_`j'"

					quietly gen z_`v'_`j' = (`v'_`j' - `aux_mean') / `aux_sd'
					label var z_`v'_`j' "Z-score of `v' from `lr_years' yr avg"
					local created_vars "`created_vars' z_`v'_`j'"
				}
			}
		}
		quietly drop `observed_days'
	}

	if "`created_vars'" == "" {
		di as error "No complete seasons found for prefix `prefix' and requested date window"
		exit 2000
	}

	if "`temp_data'" != "" {
		forvalues k = 1/`bins' {
			local k_str = string(`k', "%02.0f")
			local binvars ""
			forvalues y = `first_year'/`last_year' {
				capture confirm numeric variable tempbin`k_str'_`y'
				if _rc == 0 local binvars "`binvars' tempbin`k_str'_`y'"
			}
			local binvar_count : word count `binvars'
			if `binvar_count' > 0 {
				quietly egen binmean_`k_str' = rowmean(`binvars')
				label var binmean_`k_str' "Mean share of days in temperature bin `k' across all seasons"
				local created_vars "`created_vars' binmean_`k_str'"

				if `binvar_count' > 1 {
					quietly egen binsd_`k_str' = rowsd(`binvars')
				}
				else {
					quietly gen binsd_`k_str' = .
				}
				label var binsd_`k_str' "Std dev of share of days in temperature bin `k' across all seasons"
				local created_vars "`created_vars' binsd_`k_str'"
			}
		}
	}

	if "`keep'" != "" {
		quietly keep `keep' `created_vars'
	}

	if "`save'" != "" {
		di as result "Saving data set as `save'"
		save "`save'", replace
	}
end

exit
