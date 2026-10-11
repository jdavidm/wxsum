*! version 6.0.0-ws1  11oct2026  (v6 reference implementation, egen-based)
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
*  v 4.1  9jun2026  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.2  10jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.3  11jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.4  11jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 5.0  12jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 6.0  11oct2026 WS1 reference: missing-data, baseline, spell and option     *
*         fixes from the v6 implementation plan                                 *
*********************************************************************************

program define wxsum

version 15.1

	syntax anything								///
		,										///
		ini_month(string)						///
		fin_month(string)						///
		type(string)							///
		[										///
		ini_day(string)							///
		fin_day(string)							///
		keep(varlist)							///
		save(string asis)						///
		gdd_lo(string)							///
		gdd_hi(string)							///
		heat_threshold(string)					///
		kdd_base(string)						///
		gdd_bin(real -999999999)				///
		gdd_binlo(real -999999999)				///
		gdd_binhi(real -999999999)				///
		tmp_bin(integer -999999999)				///
		tmp_binlo(real -999999999)				///
		tmp_binhi(real -999999999)				///
		shape(string)							///
		lr_years(integer 10)					///
		ref_min(string)							///
		rain_threshold(string)					///
		]

	local prefix "`anything'"

	local default_fin_day = ("`fin_day'" == "")
	if "`ini_day'" == "" local ini_day = "01"

	local ini_month_n = real("`ini_month'")
	local fin_month_n = real("`fin_month'")
	local ini_day_n = real("`ini_day'")
	if `default_fin_day' {
		local fin_day_n = 28
	}
	else {
		local fin_day_n = real("`fin_day'")
	}

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
	if `default_fin_day' {
		local fin_ref = dofm(ym(2000, `fin_month') + 1) - 1
	}
	else {
		local fin_ref = mdy(`fin_month', `fin_day', 2000)
	}
	if missing(`ini_ref') | month(`ini_ref') != `ini_month' | day(`ini_ref') != `ini_day' {
		di as error "ini_month()/ini_day() is not a valid date"
		exit 198
	}
	if !`default_fin_day' {
		if missing(`fin_ref') | month(`fin_ref') != `fin_month' | day(`fin_ref') != `fin_day' {
			di as error "fin_month()/fin_day() is not a valid date"
			exit 198
		}
	}

	if "`type'" != "rain" & "`type'" != "temp" {
		di as error "type() must be either rain or temp"
		exit 198
	}
	if "`type'" == "rain" {
		local rain_data "rain_data"
		local temp_data ""
	}
	else {
		local rain_data ""
		local temp_data "temp_data"
	}

	if `lr_years' < 2 | `lr_years' > 50 {
		di as error "lr_years must be between 2 and 50"
		exit 198
	}
	if "`ref_min'" == "" local ref_min = `lr_years'
	capture confirm integer number `ref_min'
	if _rc {
		di as error "ref_min() must be an integer"
		exit 198
	}
	if `ref_min' < 2 | `ref_min' > `lr_years' {
		di as error "ref_min() must be between 2 and lr_years() (`lr_years')"
		exit 198
	}

	* ---- options that apply to only one data type ----
	if "`rain_data'" != "" {
		foreach opt in gdd_lo gdd_hi heat_threshold kdd_base {
			if `"``opt''"' != "" {
				di as error "`opt'() cannot be used with type(rain)"
				exit 198
			}
		}
		if "`rain_threshold'" == "" local rain_threshold = 1
		capture confirm number `rain_threshold'
		if _rc {
			di as error "rain_threshold() must be a number"
			exit 198
		}
		if `rain_threshold' < 0 {
			di as error "rain_threshold() must be nonnegative"
			exit 198
		}
	}
	else {
		if "`rain_threshold'" != "" {
			di as error "rain_threshold() cannot be used with type(temp)"
			exit 198
		}
		if "`heat_threshold'" == "" {
			if "`kdd_base'" != "" {
				di as error "heat_threshold() is required for type(temp) in wxsum 6."
				di as error "In wxsum 5, kdd_base() set the KDD threshold. Use heat_threshold(#), and add"
				di as error "kdd_base(#) only if the KDD base should differ from heat_threshold()."
			}
			else {
				di as error "Please define heat_threshold() for type(temp)"
			}
			exit 198
		}
		foreach opt in gdd_lo gdd_hi heat_threshold kdd_base {
			if "``opt''" != "" {
				capture confirm number ``opt''
				if _rc {
					di as error "`opt'() must be a number"
					exit 198
				}
			}
		}
		if "`gdd_lo'" == "" {
			di as error "Please define gdd_lo() for type(temp)"
			exit 198
		}
		if "`gdd_hi'" == "" {
			di as error "Please define gdd_hi() for type(temp)"
			exit 198
		}
		if `gdd_hi' <= `gdd_lo' {
			di as error "gdd_hi() must be greater than gdd_lo()"
			exit 198
		}
		* KDD base: kdd_base() if given, otherwise heat_threshold()
		if "`kdd_base'" == "" local kdd_base = `heat_threshold'
	}

	* gdd_bin / gdd_binlo / gdd_binhi validation
	local has_gdd_bin = (`gdd_bin' != -999999999)
	local has_gdd_binlo = (`gdd_binlo' != -999999999)
	local has_gdd_binhi = (`gdd_binhi' != -999999999)

	if `has_gdd_binlo' & !`has_gdd_bin' {
		di as error "gdd_binlo() requires gdd_bin()"
		exit 198
	}
	if `has_gdd_binhi' & !`has_gdd_bin' {
		di as error "gdd_binhi() requires gdd_bin()"
		exit 198
	}
	if `has_gdd_bin' {
		if "`rain_data'" != "" {
			di as error "gdd_bin() cannot be used with type(rain)"
			exit 198
		}
		if `gdd_bin' <= 0 {
			di as error "gdd_bin() must be positive"
			exit 198
		}
		local gb_lo = cond(`has_gdd_binlo', `gdd_binlo', 0)
		if `has_gdd_binhi' {
			if `gdd_binhi' <= `gb_lo' {
				di as error "gdd_binhi() must be greater than gdd_binlo()"
				exit 198
			}
			local gb_q = (`gdd_binhi' - `gb_lo') / `gdd_bin'
			if abs(`gb_q' - round(`gb_q')) > 1e-8 {
				di as error "(gdd_binhi() - gdd_binlo()) must be evenly divisible by gdd_bin()"
				di as error "Range = " %12.4g (`gdd_binhi' - `gb_lo') ", width = " %12.4g `gdd_bin'
				exit 198
			}
		}
	}

	* ---- tmp_bin / tmp_binlo / tmp_binhi validation ----
	local has_tmp_bin = (`tmp_bin' != -999999999)
	local has_tmp_binlo = (`tmp_binlo' != -999999999)
	local has_tmp_binhi = (`tmp_binhi' != -999999999)

	if `has_tmp_binlo' & !`has_tmp_bin' {
		di as error "tmp_binlo() requires tmp_bin()"
		exit 198
	}
	if `has_tmp_binhi' & !`has_tmp_bin' {
		di as error "tmp_binhi() requires tmp_bin()"
		exit 198
	}
	if `has_tmp_bin' {
		if "`rain_data'" != "" {
			di as error "tmp_bin() cannot be used with type(rain)"
			exit 198
		}
		if `tmp_bin' != floor(`tmp_bin') | `tmp_bin' < 1 {
			di as error "tmp_bin() must be a positive integer"
			exit 198
		}
		if `tmp_bin' > 42 {
			di as error "tmp_bin() must be 42 or less"
			exit 198
		}
		if !`has_tmp_binlo' | !`has_tmp_binhi' {
			di as error "tmp_binlo() and tmp_binhi() are required when tmp_bin() is specified"
			exit 198
		}
		if `tmp_binhi' <= `tmp_binlo' {
			di as error "tmp_binhi() must be greater than tmp_binlo()"
			exit 198
		}
	}

	* ---- shape() validation (long is the default in v6) ----
	if "`shape'" == "" local shape "long"
	if "`shape'" != "wide" & "`shape'" != "long" {
		di as error "shape() must be wide or long"
		exit 198
	}

	if "`shape'" == "long" {
		if "`keep'" == "" {
			di as text "note: shape(long) requested without keep(); output will not contain an explicit unit identifier."
		}
		else {
			local keep_has_year = 0
			foreach kv of local keep {
				if "`kv'" == "year" {
					local keep_has_year = 1
				}
			}
			if `keep_has_year' {
				di as error "shape(long) creates a variable named year; remove or rename year from keep()."
				exit 198
			}
		}
	}

	* ---- save(filename [, replace]) ----
	local save_file ""
	local save_replace ""
	if `"`save'"' != "" {
		local 0 `"`save'"'
		capture syntax anything(name=save_spec id="filename") [, REPLACE]
		if _rc {
			di as error "save() must be save(filename [, replace])"
			exit 198
		}
		gettoken save_file save_rest : save_spec
		if `"`save_rest'"' != "" {
			di as error "save() takes a single filename; enclose names with spaces in quotes"
			exit 198
		}
		local save_replace "`replace'"
		if !regexm(`"`save_file'"', "\.[A-Za-z0-9]+$") local save_file `"`save_file'.dta"'
		if "`save_replace'" == "" {
			capture confirm new file `"`save_file'"'
			if _rc == 602 {
				di as error `"file `save_file' already exists; specify save(`save_file', replace) to overwrite it"'
				exit 602
			}
			else if _rc {
				di as error `"cannot write file `save_file'"'
				exit _rc
			}
		}
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
	local gdd_vars ""
	local first_year = .
	local last_year = .
	local dtype = cond("`temp_data'" != "", "temp", "rain")
	local season_years ""

	forvalues j = `min_year'/`max_year' {
		local end_year = `j' + `crosses'
		if `default_fin_day' {
			local end_date = dofm(ym(`end_year', `fin_month') + 1) - 1
			local fd = day(`end_date')
		}
		else {
			local fd = `fin_day'
			local end_date = mdy(`fin_month', `fd', `end_year')
		}
		local start_date = mdy(`ini_month', `ini_day', `j')

		if missing(`start_date') | missing(`end_date') continue
		if month(`start_date') != `ini_month' | day(`start_date') != `ini_day' continue
		if month(`end_date') != `fin_month' | day(`end_date') != `fd' continue
		if `start_date' < `min_date' | `end_date' > `max_date' continue

		* var:  daily variables that exist in the window
		* days: one token per calendar day in the window; "." marks a day
		*       without a daily variable, which is treated as a missing day
		local var ""
		local days ""
		forvalues d = `start_date'/`end_date' {
			local yy = year(`d')
			local mm = string(month(`d'), "%02.0f")
			local dd = string(day(`d'), "%02.0f")
			local candidate "`prefix'`yy'`mm'`dd'"
			capture confirm numeric variable `candidate'
			if _rc == 0 {
				local var "`var' `candidate'"
				local days "`days' `candidate'"
			}
			else local days "`days' ."
		}

		local count_days : word count `var'
		if `count_days' == 0 continue

		if missing(`first_year') local first_year = `j'
		local last_year = `j'
		local season_years "`season_years' `j'"

		tempvar observed_days
		quietly egen `observed_days' = rownonmiss(`var')

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

		tempvar sum3
		quietly gen double `sum3' = 0
		quietly gen var_`j' = sd_`j'^2 if `observed_days' >= 2
		label var var_`j' "Variance of daily `dtype' in `j'"
		local created_vars "`created_vars' var_`j'"

		foreach f of local var {
			quietly replace `sum3' = `sum3' + ((`f' - mean_`j') / sd_`j')^3 if !missing(`f') & sd_`j' > 0
		}
		quietly gen skew_`j' = (`observed_days' / ((`observed_days' - 1) * (`observed_days' - 2))) * `sum3' if `observed_days' >= 3 & sd_`j' > 0
		label var skew_`j' "Adj sample skewness of daily `dtype' in `j'"
		local created_vars "`created_vars' skew_`j'"
		quietly drop `sum3'
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
			quietly egen gdd_`j' = rowtotal(`gdd_aux'), missing
			label var gdd_`j' "Growing degree days in `j' between `gdd_lo' and `gdd_hi'"
			local created_vars "`created_vars' gdd_`j'"
			local gdd_vars "`gdd_vars' gdd_`j'"
			quietly drop `gdd_aux'

			local kdd_aux ""
			foreach f of local var {
				tempvar kd
				quietly gen double `kd' = max(`f' - `kdd_base', 0) if !missing(`f')
				local kdd_aux "`kdd_aux' `kd'"
			}
			quietly egen kdd_`j' = rowtotal(`kdd_aux'), missing
			label var kdd_`j' "Killing degree days in `j' above `kdd_base'"
			local created_vars "`created_vars' kdd_`j'"
			quietly drop `kdd_aux'

			* ---- tmp_bin() temperature bin counts ----
			if `has_tmp_bin' {
				local tb_J = `tmp_bin'
				local tb_lo = `tmp_binlo'
				local tb_hi = `tmp_binhi'

				if `tb_J' == 1 {
					* J == 1: count all nonmissing daily temperature readings
					quietly gen tmpbin01_`j' = `observed_days'
					quietly replace tmpbin01_`j' = . if `observed_days' == 0
					label var tmpbin01_`j' "Temperature bin count, all nonmissing, `j'"
					local created_vars "`created_vars' tmpbin01_`j'"
				}
				else if `tb_J' == 2 {
					* J == 2: split at midpoint m = (lo + hi) / 2
					local tb_mid = (`tb_lo' + `tb_hi') / 2
					local tb_mid_str : di %12.0g `tb_mid'
					local tb_mid_str = strtrim("`tb_mid_str'")

					local tb_below_aux ""
					local tb_above_aux ""
					foreach f of local var {
						tempvar tb1 tb2
						quietly gen byte `tb1' = (`f' < `tb_mid') if !missing(`f')
						quietly gen byte `tb2' = (`f' >= `tb_mid') if !missing(`f')
						local tb_below_aux "`tb_below_aux' `tb1'"
						local tb_above_aux "`tb_above_aux' `tb2'"
					}
					quietly egen tmpbin01_`j' = rowtotal(`tb_below_aux')
					quietly egen tmpbin02_`j' = rowtotal(`tb_above_aux')
					quietly replace tmpbin01_`j' = . if `observed_days' == 0
					quietly replace tmpbin02_`j' = . if `observed_days' == 0
					label var tmpbin01_`j' "Temperature bin count, T < `tb_mid_str', `j'"
					label var tmpbin02_`j' "Temperature bin count, T >= `tb_mid_str', `j'"
					local created_vars "`created_vars' tmpbin01_`j' tmpbin02_`j'"
					quietly drop `tb_below_aux' `tb_above_aux'
				}
				else {
					* J >= 3: lower tail / interior bins / upper tail
					local tb_width = (`tb_hi' - `tb_lo') / (`tb_J' - 2)

					forvalues b = 1/`tb_J' {
						local bpad = string(`b', "%02.0f")

						if `b' == 1 {
							* Lower tail: T < lo
							local tb_ind_aux ""
							foreach f of local var {
								tempvar tbi
								quietly gen byte `tbi' = (`f' < `tb_lo') if !missing(`f')
								local tb_ind_aux "`tb_ind_aux' `tbi'"
							}
							quietly egen tmpbin`bpad'_`j' = rowtotal(`tb_ind_aux')
							local lo_str : di %12.0g `tb_lo'
							local lo_str = strtrim("`lo_str'")
							label var tmpbin`bpad'_`j' "Temperature bin count, T < `lo_str', `j'"
							quietly drop `tb_ind_aux'
						}
						else if `b' == `tb_J' {
							* Upper tail: T >= hi
							local tb_ind_aux ""
							foreach f of local var {
								tempvar tbi
								quietly gen byte `tbi' = (`f' >= `tb_hi') if !missing(`f')
								local tb_ind_aux "`tb_ind_aux' `tbi'"
							}
							quietly egen tmpbin`bpad'_`j' = rowtotal(`tb_ind_aux')
							local hi_str : di %12.0g `tb_hi'
							local hi_str = strtrim("`hi_str'")
							label var tmpbin`bpad'_`j' "Temperature bin count, T >= `hi_str', `j'"
							quietly drop `tb_ind_aux'
						}
						else {
							* Interior bin: lo + (b-2)*width <= T < lo + (b-1)*width
							local edge_lo = `tb_lo' + (`b' - 2) * `tb_width'
							local edge_hi = `tb_lo' + (`b' - 1) * `tb_width'
							local tb_ind_aux ""
							foreach f of local var {
								tempvar tbi
								quietly gen byte `tbi' = (`f' >= `edge_lo' & `f' < `edge_hi') if !missing(`f')
								local tb_ind_aux "`tb_ind_aux' `tbi'"
							}
							quietly egen tmpbin`bpad'_`j' = rowtotal(`tb_ind_aux')
							local elo_str : di %12.0g `edge_lo'
							local elo_str = strtrim("`elo_str'")
							local ehi_str : di %12.0g `edge_hi'
							local ehi_str = strtrim("`ehi_str'")
							label var tmpbin`bpad'_`j' "Temperature bin count, `elo_str' <= T < `ehi_str', `j'"
							quietly drop `tb_ind_aux'
						}

						quietly replace tmpbin`bpad'_`j' = . if `observed_days' == 0
						local created_vars "`created_vars' tmpbin`bpad'_`j'"
					}
				}
			}

		}

		if "`rain_data'" != "" {
			quietly egen total_`j' = rowtotal(`var'), missing
			label var total_`j' "Total `dtype' in `j'"
			local created_vars "`created_vars' total_`j'"

			* monthly totals by calendar year-month (yyyymm), so a window that
			* covers the same month in two years keeps the two months apart;
			* months with no observed day are excluded from the mean
			local ym_list ""
			foreach v of local var {
				local ym = substr("`v'", -8, 6)
				local ym_seen : list ym in ym_list
				if !`ym_seen' local ym_list "`ym_list' `ym'"
			}
			local monthly_totals ""
			foreach ym of local ym_list {
				local mvar ""
				foreach v of local var {
					if substr("`v'", -8, 6) == "`ym'" {
						local mvar "`mvar' `v'"
					}
				}
				tempvar mo_total
				quietly egen `mo_total' = rowtotal(`mvar'), missing
				local monthly_totals "`monthly_totals' `mo_total'"
			}

			if "`monthly_totals'" != "" {
				quietly egen mean_mo_`j' = rowmean(`monthly_totals')
				label var mean_mo_`j' "Mean of monthly rainfall totals in `j'"
				local created_vars "`created_vars' mean_mo_`j'"

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

			quietly egen norain_`j' = rowtotal(`no_rain_aux'), missing
			label var norain_`j' "Number of observed days without rain in `j'"
			local created_vars "`created_vars' norain_`j'"

			quietly egen raindays_`j' = rowtotal(`rain_aux'), missing
			label var raindays_`j' "Number of observed days with rain in `j'"
			local created_vars "`created_vars' raindays_`j'"

			quietly gen pct_raindays_`j' = raindays_`j' / `observed_days' if `observed_days' > 0
			label var pct_raindays_`j' "Share of observed days with rain in `j'"
			local created_vars "`created_vars' pct_raindays_`j'"
			quietly drop `no_rain_aux' `rain_aux'

			* ---- dry spells (plan D3/D4) ----
			* A dry day is an observed day with rain < rain_threshold; a rainy
			* day is an observed day with rain >= rain_threshold. Missing days
			* (including calendar days without a daily variable) end runs.
			tempvar started active nb fb lb runall maxall runmid maxmid

			* leading spell: skip leading missing days, then count dry days
			* from the first observed day
			quietly gen dry_start_`j' = 0
			quietly gen byte `started' = 0
			quietly gen byte `active' = 0
			foreach f of local days {
				if "`f'" == "." {
					quietly replace `active' = 0 if `started'
					continue
				}
				quietly replace dry_start_`j' = dry_start_`j' + 1 if `started' & `active' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `active' = 0 if `started' & `active' & !(!missing(`f') & `f' < `rain_threshold')
				quietly replace dry_start_`j' = 1 if !`started' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `active' = 1 if !`started' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `started' = 1 if !`started' & !missing(`f')
			}

			* trailing spell: same rule, counting back from the last observed day
			local rev_days ""
			foreach f of local days {
				local rev_days "`f' `rev_days'"
			}
			quietly gen dry_end_`j' = 0
			quietly replace `started' = 0
			quietly replace `active' = 0
			foreach f of local rev_days {
				if "`f'" == "." {
					quietly replace `active' = 0 if `started'
					continue
				}
				quietly replace dry_end_`j' = dry_end_`j' + 1 if `started' & `active' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `active' = 0 if `started' & `active' & !(!missing(`f') & `f' < `rain_threshold')
				quietly replace dry_end_`j' = 1 if !`started' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `active' = 1 if !`started' & !missing(`f') & `f' < `rain_threshold'
				quietly replace `started' = 1 if !`started' & !missing(`f')
			}

			* mid-window spell: with >= 2 rainy days, the longest dry run
			* strictly between the first and last rainy day; with 0-1 rainy
			* days, the longest dry run anywhere in the window
			quietly gen int `nb' = 0
			quietly gen int `fb' = .
			quietly gen int `lb' = .
			local d_idx = 0
			foreach f of local days {
				local ++d_idx
				if "`f'" == "." continue
				quietly replace `fb' = `d_idx' if missing(`fb') & !missing(`f') & `f' >= `rain_threshold'
				quietly replace `lb' = `d_idx' if !missing(`f') & `f' >= `rain_threshold'
				quietly replace `nb' = `nb' + 1 if !missing(`f') & `f' >= `rain_threshold'
			}
			quietly gen int `runall' = 0
			quietly gen int `maxall' = 0
			quietly gen int `runmid' = 0
			quietly gen int `maxmid' = 0
			local d_idx = 0
			foreach f of local days {
				local ++d_idx
				if "`f'" == "." {
					quietly replace `runall' = 0
					quietly replace `runmid' = 0
					continue
				}
				quietly replace `runall' = cond(!missing(`f') & `f' < `rain_threshold', `runall' + 1, 0)
				quietly replace `maxall' = max(`maxall', `runall')
				quietly replace `runmid' = cond(!missing(`f') & `f' < `rain_threshold' & `d_idx' > `fb' & `d_idx' < `lb', `runmid' + 1, 0)
				quietly replace `maxmid' = max(`maxmid', `runmid')
			}
			quietly gen dry_`j' = cond(`nb' >= 2, `maxmid', `maxall')

			quietly replace dry_start_`j' = . if `observed_days' == 0
			quietly replace dry_end_`j' = . if `observed_days' == 0
			quietly replace dry_`j' = . if `observed_days' == 0

			label var dry_start_`j' "Leading dry spell at start of season in `j'"
			label var dry_end_`j' "Trailing dry spell at end of season in `j'"
			label var dry_`j' "Longest mid-season dry spell in `j'"
			local created_vars "`created_vars' dry_start_`j' dry_end_`j' dry_`j'"
			quietly drop `started' `active' `nb' `fb' `lb' `runall' `maxall' `runmid' `maxmid'
		}

		local deviation ""
		if "`rain_data'" != "" {
			local deviation "total raindays norain pct_raindays mean_mo"
		}
		if "`temp_data'" != "" {
			local deviation "gdd kdd"
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

				* the window needs at least ref_min() reference seasons in the
				* data, and each unit needs at least ref_min() nonmissing values
				local wordcount : word count `pvars'
				if `wordcount' >= `ref_min' {
					tempvar aux_mean aux_sd aux_n
					quietly egen `aux_n' = rownonmiss(`pvars')
					quietly egen `aux_mean' = rowmean(`pvars')
					quietly egen `aux_sd' = rowsd(`pvars')

					quietly gen dev_`v'_`j' = `v'_`j' - `aux_mean' if `aux_n' >= `ref_min'
					label var dev_`v'_`j' "Deviation in `v' from `lr_years' yr avg"
					local created_vars "`created_vars' dev_`v'_`j'"

					quietly gen z_`v'_`j' = (`v'_`j' - `aux_mean') / `aux_sd' if `aux_n' >= `ref_min'
					label var z_`v'_`j' "Z-score of `v' from `lr_years' yr avg"
					local created_vars "`created_vars' z_`v'_`j'"
					quietly drop `aux_mean' `aux_sd' `aux_n'
				}
			}
		}
		quietly drop `observed_days'
	}

	if "`created_vars'" == "" {
		di as error "No complete seasons found for prefix `prefix' and requested date window"
		exit 2000
	}

	* ---- GDD category construction ----
	if `has_gdd_bin' & "`gdd_vars'" != "" {
		* find pooled empirical min and max across all gdd_YYYY
		local gb_lo = cond(`has_gdd_binlo', `gdd_binlo', 0)
		local gdd_pool_min = .
		local gdd_pool_max = .
		foreach gv of local gdd_vars {
			quietly summarize `gv', meanonly
			if r(N) > 0 {
				if missing(`gdd_pool_min') | r(min) < `gdd_pool_min' {
					local gdd_pool_min = r(min)
				}
				if missing(`gdd_pool_max') | r(max) > `gdd_pool_max' {
					local gdd_pool_max = r(max)
				}
			}
		}

		if !missing(`gdd_pool_max') {
			* determine upper endpoint
			local gb_width = `gdd_bin'
			if `has_gdd_binhi' {
				local gb_hi = `gdd_binhi'
				local gb_has_top = 1
			}
			else {
				* auto upper: next bin boundary strictly above empirical max
				local gb_n = ceil((`gdd_pool_max' - `gb_lo') / `gb_width')
				* if max falls exactly on a boundary, push up one more
				local gb_auto_hi = `gb_lo' + `gb_n' * `gb_width'
				if `gdd_pool_max' >= `gb_auto_hi' - 1e-12 {
					local gb_n = `gb_n' + 1
					local gb_auto_hi = `gb_lo' + `gb_n' * `gb_width'
				}
				* handle case where pool max == lo (e.g. all zeros)
				if `gb_n' < 1 local gb_n = 1
				local gb_hi = `gb_lo' + `gb_n' * `gb_width'
				local gb_has_top = 0
			}

			* determine if bottom-coded category is needed
			local gb_has_bot = 0
			if !missing(`gdd_pool_min') & `gdd_pool_min' < `gb_lo' {
				local gb_has_bot = 1
			}

			* compute number of regular intervals
			local gb_nreg = round((`gb_hi' - `gb_lo') / `gb_width')
			local gb_ncat = `gb_nreg' + `gb_has_bot' + `gb_has_top'

			if `gb_ncat' > 100 {
				di as error "gdd_bin() would create `gb_ncat' categories (max 100)"
				di as error "Consider a wider gdd_bin(), a lower gdd_binhi(), or different endpoints"
				exit 198
			}

			* build the value label
			capture label drop _gddcat_lbl
			local catnum = 0

			if `gb_has_bot' {
				local catnum = `catnum' + 1
				local lo_str : di %12.0g `gb_lo'
				local lo_str = strtrim("`lo_str'")
				label define _gddcat_lbl `catnum' "GDD < `lo_str'", add
			}

			forvalues r = 1/`gb_nreg' {
				local catnum = `catnum' + 1
				local edge_lo = `gb_lo' + (`r' - 1) * `gb_width'
				local edge_hi = `gb_lo' + `r' * `gb_width'
				local elo_str : di %12.0g `edge_lo'
				local elo_str = strtrim("`elo_str'")
				local ehi_str : di %12.0g `edge_hi'
				local ehi_str = strtrim("`ehi_str'")
				label define _gddcat_lbl `catnum' "GDD [`elo_str',`ehi_str')", add
			}

			if `gb_has_top' {
				local catnum = `catnum' + 1
				local hi_str : di %12.0g `gb_hi'
				local hi_str = strtrim("`hi_str'")
				label define _gddcat_lbl `catnum' "GDD >= `hi_str'", add
			}

			* assign categories to each gdd_YYYY
			local w_str : di %12.0g `gb_width'
			local w_str = strtrim("`w_str'")

			foreach gv of local gdd_vars {
				local gyear = substr("`gv'", 5, .)
				quietly gen int gddcat_`gyear' = .

				* bottom-coded
				if `gb_has_bot' {
					quietly replace gddcat_`gyear' = 1 if !missing(`gv') & `gv' < `gb_lo'
				}

				* regular intervals
				forvalues r = 1/`gb_nreg' {
					local edge_lo = `gb_lo' + (`r' - 1) * `gb_width'
					local edge_hi = `gb_lo' + `r' * `gb_width'
					local rc = `r' + `gb_has_bot'
					quietly replace gddcat_`gyear' = `rc' if !missing(`gv') & `gv' >= `edge_lo' - 1e-12 & `gv' < `edge_hi' - 1e-12 & missing(gddcat_`gyear')
				}

				* top-coded
				if `gb_has_top' {
					local tc = `gb_nreg' + `gb_has_bot' + 1
					quietly replace gddcat_`gyear' = `tc' if !missing(`gv') & `gv' >= `gb_hi' - 1e-12
				}

				label values gddcat_`gyear' _gddcat_lbl
				label var gddcat_`gyear' "GDD category in `gyear', width `w_str'"
				local created_vars "`created_vars' gddcat_`gyear'"
			}
		}
	}

	* ---- Final Variable Ordering ----
	local final_order ""
	foreach j of local season_years {
		if "`temp_data'" != "" {
			local try_vars mean_`j' median_`j' var_`j' sd_`j' skew_`j' max_`j' gdd_`j' dev_gdd_`j' z_gdd_`j' gddcat_`j' kdd_`j' dev_kdd_`j' z_kdd_`j'
			foreach v of local try_vars {
				capture confirm variable `v'
				if _rc == 0 local final_order "`final_order' `v'"
			}
			if `has_tmp_bin' {
				forvalues b = 1/`tmp_bin' {
					local bpad = string(`b', "%02.0f")
					capture confirm variable tmpbin`bpad'_`j'
					if _rc == 0 local final_order "`final_order' tmpbin`bpad'_`j'"
				}
			}
		}
		else {
			local try_vars mean_`j' median_`j' var_`j' sd_`j' skew_`j' mean_mo_`j' dev_mean_mo_`j' z_mean_mo_`j' total_`j' dev_total_`j' z_total_`j' raindays_`j' dev_raindays_`j' z_raindays_`j' norain_`j' dev_norain_`j' z_norain_`j' pct_raindays_`j' dev_pct_raindays_`j' z_pct_raindays_`j' dry_start_`j' dry_`j' dry_end_`j'
			foreach v of local try_vars {
				capture confirm variable `v'
				if _rc == 0 local final_order "`final_order' `v'"
			}
		}
	}

	local created_vars "`final_order'"
	if "`keep'" != "" {
		capture order `keep' `final_order'
	}
	else {
		capture order `final_order'
	}

	* ---- shape(long) output stacking ----
	if "`shape'" == "long" {
		* collect the set of unique years
		local long_years ""
		foreach cy of local season_years {
			local already = 0
			foreach ly of local long_years {
				if `cy' == `ly' local already = 1
			}
			if !`already' local long_years "`long_years' `cy'"
		}

		local long_tempfiles ""
		local long_count = 0

		foreach yr of local long_years {
			* identify created vars for this year
			local yr_vars ""
			local yr_sfx "_`yr'"
			local yr_sfx_len = strlen("`yr_sfx'")
			foreach cv of local created_vars {
				local cv_len = strlen("`cv'")
				if `cv_len' > `yr_sfx_len' {
					local cv_tail = substr("`cv'", `cv_len' - `yr_sfx_len' + 1, .)
					if "`cv_tail'" == "`yr_sfx'" {
						local yr_vars "`yr_vars' `cv'"
					}
				}
			}

			if "`yr_vars'" == "" continue

			local long_count = `long_count' + 1
			tempfile _long_tf_`long_count'

			preserve

			* keep only keep() vars plus this year's created vars
			if "`keep'" != "" {
				quietly keep `keep' `yr_vars'
			}
			else {
				quietly keep `yr_vars'
			}

			* rename each var_YYYY -> var (strip _YYYY suffix)
			foreach cv of local yr_vars {
				local cv_len = strlen("`cv'")
				local stem = substr("`cv'", 1, `cv_len' - `yr_sfx_len')
				quietly rename `cv' `stem'
			}

			quietly gen int year = `yr'
			label var year "Season year"

			* apply value labels to gddcat if it exists
			capture confirm variable gddcat
			if _rc == 0 {
				capture label values gddcat _gddcat_lbl
			}

			quietly save `_long_tf_`long_count'', replace

			restore
		}

		* stack all tempfiles
		if `long_count' > 0 {
			quietly use `_long_tf_1', clear
			forvalues lf = 2/`long_count' {
				quietly append using `_long_tf_`lf''
			}

			* sort and order by keep vars and year if possible
			if "`keep'" != "" {
				capture sort `keep' year
				capture order `keep' year *
			}
			else {
				capture sort year
				capture order year *
			}
		}
	}
	else {
		* shape(wide): existing keep/save logic
		if "`keep'" != "" {
			quietly keep `keep' `created_vars'
		}
	}

	if `"`save_file'"' != "" {
		di as result `"Saving data set as `save_file'"'
		save `"`save_file'"', `save_replace'
	}
end

exit
