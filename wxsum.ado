*! version 6.0.0  13oct2026
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
*  v 6.0  13oct2026 Mata engine, long default, heat metrics, robust validation  *
*********************************************************************************

program define wxsum, rclass

version 15.1

	local cmdline `"wxsum `0'"'

	syntax anything								///
		,										///
		type(string)							///
		[										///
		ini_month(string)						///
		fin_month(string)						///
		ini_day(string)							///
		fin_day(string)							///
		keep(varlist)							///
		save(string asis)						///
		shape(string)							///
		outstub(string)							///
		rain_threshold(real -999999999)			///
		gdd_lo(real -999999999)					///
		gdd_hi(real -999999999)					///
		heat_threshold(real -999999999)			///
		kdd_base(real -999999999)				///
		gdd_bin(real -999999999)				///
		gdd_binlo(real -999999999)				///
		gdd_binhi(real -999999999)				///
		tmp_bin(integer -999999999)				///
		tmp_binlo(real -999999999)				///
		tmp_binhi(real -999999999)				///
		cuts(numlist)							///
		lr_years(integer -999999999)			///
		baseline(numlist min=2 max=2)			///
		ref_min(integer -999999999)				///
		minobs(integer 1)						///
		start(varname)							///
		end(varname)							///
		event_date(varname)						///
		days(integer -999999999)				///
		lag(integer 0)							///
		partial									///
		]

	local NA = -999999999

	* =========================================================================
	* 1. PARSE & VALIDATE
	* =========================================================================

	* ---- save(filename [, replace]) ----
	local save_replace ""
	local savefile ""
	if `"`save'"' != "" {
		local 0 `"`save'"'
		capture syntax anything(name=sfile id="filename") [, replace]
		if _rc {
			di as error "save() must be save(filename [, replace])"
			exit 198
		}
		local savefile `"`sfile'"'
		if substr(`"`savefile'"', 1, 1) == `"""' & substr(`"`savefile'"', -1, 1) == `"""' {
			local savefile = substr(`"`savefile'"', 2, strlen(`"`savefile'"') - 2)
		}
		local save_replace "`replace'"
		if "`save_replace'" == "" {
			capture confirm new file `"`savefile'"'
			if _rc {
				di as error `"file `savefile' already exists; use save(filename, replace)"'
				exit 602
			}
		}
	}

	* ---- shape() validation (D1: default long) ----
	local shape_user "`shape'"
	if "`shape'" == "" local shape "long"
	if "`shape'" != "long" & "`shape'" != "wide" {
		di as error "shape() must be long or wide"
		exit 198
	}

	* ---- outstub() validation (D11) ----
	if "`outstub'" != "" {
		capture confirm names `outstub'x
		if _rc {
			di as error "outstub() must specify a valid variable name prefix"
			exit 198
		}
		if strlen("`outstub'") > 11 {
			di as error "outstub() must be at most 11 characters so variable names do not exceed 32 characters"
			exit 198
		}
	}

	* ---- window mode (D12) ----
	local has_cal = ("`ini_month'" != "" | "`fin_month'" != "")
	local has_unit = ("`start'" != "" | "`end'" != "" | "`event_date'" != "")

	if `has_cal' & `has_unit' {
		di as error "Cannot combine calendar window options with unit-specific window options"
		exit 198
	}
	if !`has_cal' & !`has_unit' {
		di as error "Window options required: calendar (ini_month fin_month) or unit-specific (start end / event_date days)"
		exit 198
	}
	if "`partial'" != "" & !`has_unit' {
		di as error "partial is only allowed with unit-specific windows"
		exit 198
	}

	local mode = cond(`has_cal', "calendar", "unit")
	local has_partial = ("`partial'" != "")

	if "`mode'" == "unit" {
		if "`event_date'" != "" {
			if "`start'" != "" | "`end'" != "" {
				di as error "Cannot specify both event_date() and start()/end()"
				exit 198
			}
			if `days' == `NA' | `days' <= 0 {
				di as error "days() must be specified as a positive integer with event_date()"
				exit 198
			}
			capture confirm numeric variable `event_date'
			if _rc {
				di as error "event_date() must specify a numeric variable (%td)"
				exit 198
			}
			tempvar __wxsum_start __wxsum_end
			quietly gen long `__wxsum_start' = `event_date' - `days' - `lag'
			quietly gen long `__wxsum_end' = `event_date' - 1 - `lag'
			local start_var "`__wxsum_start'"
			local end_var "`__wxsum_end'"
			local window_str "`event_date' (days `days', lag `lag')"
		}
		else {
			if "`start'" == "" | "`end'" == "" {
				di as error "Both start() and end() must be specified for unit-specific windows"
				exit 198
			}
			capture confirm numeric variable `start'
			if _rc {
				di as error "start() must specify a numeric variable (%td)"
				exit 198
			}
			capture confirm numeric variable `end'
			if _rc {
				di as error "end() must specify a numeric variable (%td)"
				exit 198
			}
			capture assert `end' >= `start' if !missing(`start') & !missing(`end')
			if _rc {
				di as error "end date must be greater than or equal to start date"
				exit 198
			}
			local start_var "`start'"
			local end_var "`end'"
			local window_str "`start'–`end'"
		}

		if "`shape_user'" != "" {
			di as text "note: shape() has no effect in unit-specific window mode; one window is produced per observation."
		}
	}

	* ---- type() validation ----
	if "`type'" != "rain" & "`type'" != "temp" {
		di as error "type() must be either rain or temp"
		exit 198
	}

	* ---- type-specific options & mutual exclusivity ----
	if "`type'" == "rain" {
		foreach o in gdd_lo gdd_hi heat_threshold kdd_base gdd_bin gdd_binlo gdd_binhi tmp_bin tmp_binlo tmp_binhi {
			if ``o'' != `NA' {
				di as error "`o'() is not allowed with type(rain)"
				exit 198
			}
		}
		if `rain_threshold' == `NA' local rain_threshold = 1
		if `rain_threshold' < 0 {
			di as error "rain_threshold() must be nonnegative"
			exit 198
		}
	}
	else {
		* type(temp)
		if `rain_threshold' != `NA' {
			di as error "rain_threshold() is not allowed with type(temp)"
			exit 198
		}
		if `heat_threshold' == `NA' {
			if `kdd_base' != `NA' {
				di as error "heat_threshold() is required in wxsum 6; in v5, kdd_base() set the KDD threshold."
				di as error "Use heat_threshold(#), and add kdd_base(#) only if the KDD base should differ."
			}
			else {
				di as error "heat_threshold() is required for type(temp)"
			}
			exit 198
		}
		if `kdd_base' == `NA' local kdd_base = `heat_threshold'

		if `gdd_lo' == `NA' {
			di as error "Please define gdd_lo() for type(temp)"
			exit 198
		}
		if `gdd_hi' == `NA' {
			di as error "Please define gdd_hi() for type(temp)"
			exit 198
		}
		if `gdd_hi' <= `gdd_lo' {
			di as error "gdd_hi() must be greater than gdd_lo()"
			exit 198
		}
	}

	* ---- tmp_bin / cuts validation ----
	local has_tmp_bin = (`tmp_bin' != `NA')
	local has_tmp_binlo = (`tmp_binlo' != `NA')
	local has_tmp_binhi = (`tmp_binhi' != `NA')
	local has_cuts = ("`cuts'" != "")

	if `has_tmp_bin' & `has_cuts' {
		di as error "tmp_bin() and cuts() cannot be specified together"
		exit 198
	}

	if `has_tmp_binlo' & !`has_tmp_bin' {
		di as error "tmp_binlo() requires tmp_bin()"
		exit 198
	}
	if `has_tmp_binhi' & !`has_tmp_bin' {
		di as error "tmp_binhi() requires tmp_bin()"
		exit 198
	}
	if `has_tmp_bin' {
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

	if `has_cuts' {
		local n_cuts : word count `cuts'
		local prev_cut = .
		foreach c of local cuts {
			if `c' == . {
				di as error "cuts() must contain valid numbers"
				exit 198
			}
			if `prev_cut' != . & `c' <= `prev_cut' {
				di as error "cuts() must be in strictly ascending order"
				exit 198
			}
			local prev_cut = `c'
		}
	}

	* ---- gdd_bin validation ----
	local has_gdd_bin = (`gdd_bin' != `NA')
	local has_gdd_binlo = (`gdd_binlo' != `NA')
	local has_gdd_binhi = (`gdd_binhi' != `NA')

	if `has_gdd_binlo' & !`has_gdd_bin' {
		di as error "gdd_binlo() requires gdd_bin()"
		exit 198
	}
	if `has_gdd_binhi' & !`has_gdd_bin' {
		di as error "gdd_binhi() requires gdd_bin()"
		exit 198
	}
	if `has_gdd_bin' {
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
				exit 198
			}
		}
	}

	* ---- reference period: baseline() vs lr_years() ----
	local has_baseline = ("`baseline'" != "")
	local is_baseline = `has_baseline'
	local base_y1 = 0
	local base_y2 = 0

	if `has_baseline' {
		if `lr_years' != `NA' {
			di as error "baseline() and lr_years() cannot be specified together"
			exit 198
		}
		local base_y1 : word 1 of `baseline'
		local base_y2 : word 2 of `baseline'
		if `base_y1' > `base_y2' {
			di as error "baseline(y1 y2): y1 must be <= y2"
			exit 198
		}
		local n_base_years = `base_y2' - `base_y1' + 1
		if `ref_min' == `NA' local ref_min = `n_base_years'
		if `ref_min' < 1 | `ref_min' > `n_base_years' {
			di as error "ref_min() must be between 1 and the number of baseline years (`n_base_years')"
			exit 198
		}
		local lr_years = 0
	}
	else {
		if `lr_years' == `NA' local lr_years = 10
		if `lr_years' < 2 | `lr_years' > 50 {
			di as error "lr_years must be between 2 and 50"
			exit 198
		}
		if `ref_min' == `NA' local ref_min = `lr_years'
		if `ref_min' < 1 | `ref_min' > `lr_years' {
			di as error "ref_min() must be between 1 and lr_years()"
			exit 198
		}
	}

	* ---- minobs validation ----
	if `minobs' < 1 {
		di as error "minobs() must be an integer >= 1"
		exit 198
	}

	* ---- keep() validation ----
	if "`shape'" == "long" {
		if "`keep'" == "" {
			di as text "note: shape(long) requested without keep(); output will not contain an explicit unit identifier."
		}
		else {
			local keep_has_year = 0
			foreach kv of local keep {
				if "`kv'" == "year" local keep_has_year = 1
			}
			if `keep_has_year' {
				di as error "shape(long) creates a variable named year; remove or rename year from keep()."
				exit 198
			}
		}
	}

	local prefix "`anything'"

	* ---- calendar bounds validation ----
	if "`mode'" == "calendar" {
		local default_fin_day = ("`fin_day'" == "")
		if "`ini_day'" == "" local ini_day = "01"

		local ini_month_n = real("`ini_month'")
		local fin_month_n = real("`fin_month'")
		local ini_day_n = real("`ini_day'")
		local fin_day_n = cond(`default_fin_day', 28, real("`fin_day'"))

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

		local crosses = (`ini_ref' > `fin_ref')
	}
	else {
		local crosses = 0
	}


	* =========================================================================
	* 2. DISCOVER DAILY VARIABLES & BUILD SEASONS
	* =========================================================================

	capture unab all_vars : `prefix'*
	if _rc != 0 {
		di as error "No variables found with prefix `prefix'"
		exit 111
	}

	local prefix_len = strlen("`prefix'")
	local min_date = .
	local max_date = .
	local n_daily = 0

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
					local n_daily = `n_daily' + 1
					if missing(`min_date') | `vdate' < `min_date' local min_date = `vdate'
					if missing(`max_date') | `vdate' > `max_date' local max_date = `vdate'
				}
			}
		}
	}

	if `n_daily' == 0 {
		di as error "No numeric daily variables found with prefix `prefix' and yyyymmdd suffix"
		exit 111
	}

	local min_year = year(`min_date')
	local max_year = year(`max_date')
	local season_years ""
	local w_starts ""
	local w_ends ""
	local w_days_count ""

	if "`mode'" == "calendar" {
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

			local season_years "`season_years' `j'"
			local w_starts "`w_starts' `start_date'"
			local w_ends "`w_ends' `end_date'"
			local dcount = `end_date' - `start_date' + 1
			local w_days_count "`w_days_count' `dcount'"
		}

		local W : word count `season_years'
		if `W' == 0 {
			di as error "No complete seasons found for prefix `prefix' and requested date window"
			exit 2000
		}

		local first_year : word 1 of `season_years'
		local last_year : word `W' of `season_years'
	}
	else {
		local W = 1
		local first_year = .
		local last_year = .
	}

	* =========================================================================
	* 3. PLANNED OUTPUT NAMES & MAXVAR CHECK
	* =========================================================================

	* Build core stem list matching Table 4.2 / v5 order
	local planned_vars ""
	if "`mode'" == "unit" {
		if "`type'" == "rain" {
			local core_stems nobs mean median var sd skew mean_mo dev_mean_mo z_mean_mo total dev_total z_total raindays dev_raindays z_raindays norain dev_norain z_norain pct_raindays dev_pct_raindays z_pct_raindays dry_start dev_dry_start z_dry_start dry dev_dry z_dry dry_end dev_dry_end z_dry_end
		}
		else {
			local core_stems nobs mean median var sd skew max gdd dev_gdd z_gdd kdd dev_kdd z_kdd heatdays dev_heatdays z_heatdays pct_heatdays dev_pct_heatdays z_pct_heatdays heat_start dev_heat_start z_heat_start heat dev_heat z_heat heat_end dev_heat_end z_heat_end
			if `has_gdd_bin' local core_stems "`core_stems' gddcat"
			if `has_tmp_bin' {
				forvalues b = 1/`tmp_bin' {
					local bpad = string(`b', "%02.0f")
					local core_stems "`core_stems' tmpbin`bpad'"
				}
			}
		}
		if `has_cuts' {
			local K_plus = `n_cuts' + 1
			forvalues b = 1/`K_plus' {
				local bpad = string(`b', "%02.0f")
				local core_stems "`core_stems' cut`bpad'"
			}
		}
		foreach s of local core_stems {
			local vname "`outstub'`s'"
			local planned_vars "`planned_vars' `vname'"
		}
	}
	else if "`shape'" == "long" {
		local planned_vars "year"
		if "`type'" == "rain" {
			local core_stems nobs mean median var sd skew mean_mo dev_mean_mo z_mean_mo total dev_total z_total raindays dev_raindays z_raindays norain dev_norain z_norain pct_raindays dev_pct_raindays z_pct_raindays dry_start dev_dry_start z_dry_start dry dev_dry z_dry dry_end dev_dry_end z_dry_end
		}
		else {
			local core_stems nobs mean median var sd skew max gdd dev_gdd z_gdd kdd dev_kdd z_kdd heatdays dev_heatdays z_heatdays pct_heatdays dev_pct_heatdays z_pct_heatdays heat_start dev_heat_start z_heat_start heat dev_heat z_heat heat_end dev_heat_end z_heat_end
			if `has_gdd_bin' local core_stems "`core_stems' gddcat"
			if `has_tmp_bin' {
				forvalues b = 1/`tmp_bin' {
					local bpad = string(`b', "%02.0f")
					local core_stems "`core_stems' tmpbin`bpad'"
				}
			}
		}
		if `has_cuts' {
			local K_plus = `n_cuts' + 1
			forvalues b = 1/`K_plus' {
				local bpad = string(`b', "%02.0f")
				local core_stems "`core_stems' cut`bpad'"
			}
		}
		foreach s of local core_stems {
			local vname "`outstub'`s'"
			local planned_vars "`planned_vars' `vname'"
		}
	}
	else {
		foreach j of local season_years {
			local has_ref_`j' = 0
			if !`is_baseline' {
				local n_ref = 0
				local y_start = `j' - `lr_years'
				local y_end = `j' - 1
				forvalues y = `y_start'/`y_end' {
					if `: list posof "`y'" in season_years' local n_ref = `n_ref' + 1
				}
				if `n_ref' >= `ref_min' local has_ref_`j' = 1
			}
			else {
				local n_ref = 0
				forvalues y = `base_y1'/`base_y2' {
					if `: list posof "`y'" in season_years' local n_ref = `n_ref' + 1
				}
				if `n_ref' >= `ref_min' local has_ref_`j' = 1
			}

			if "`type'" == "rain" {
				local y_stems nobs mean median var sd skew mean_mo
				if `has_ref_`j'' local y_stems "`y_stems' dev_mean_mo z_mean_mo"
				local y_stems "`y_stems' total"
				if `has_ref_`j'' local y_stems "`y_stems' dev_total z_total"
				local y_stems "`y_stems' raindays"
				if `has_ref_`j'' local y_stems "`y_stems' dev_raindays z_raindays"
				local y_stems "`y_stems' norain"
				if `has_ref_`j'' local y_stems "`y_stems' dev_norain z_norain"
				local y_stems "`y_stems' pct_raindays"
				if `has_ref_`j'' local y_stems "`y_stems' dev_pct_raindays z_pct_raindays"
				local y_stems "`y_stems' dry_start"
				if `has_ref_`j'' local y_stems "`y_stems' dev_dry_start z_dry_start"
				local y_stems "`y_stems' dry"
				if `has_ref_`j'' local y_stems "`y_stems' dev_dry z_dry"
				local y_stems "`y_stems' dry_end"
				if `has_ref_`j'' local y_stems "`y_stems' dev_dry_end z_dry_end"
			}
			else {
				local y_stems nobs mean median var sd skew max gdd
				if `has_ref_`j'' local y_stems "`y_stems' dev_gdd z_gdd"
				local y_stems "`y_stems' kdd"
				if `has_ref_`j'' local y_stems "`y_stems' dev_kdd z_kdd"
				local y_stems "`y_stems' heatdays"
				if `has_ref_`j'' local y_stems "`y_stems' dev_heatdays z_heatdays"
				local y_stems "`y_stems' pct_heatdays"
				if `has_ref_`j'' local y_stems "`y_stems' dev_pct_heatdays z_pct_heatdays"
				local y_stems "`y_stems' heat_start"
				if `has_ref_`j'' local y_stems "`y_stems' dev_heat_start z_heat_start"
				local y_stems "`y_stems' heat"
				if `has_ref_`j'' local y_stems "`y_stems' dev_heat z_heat"
				local y_stems "`y_stems' heat_end"
				if `has_ref_`j'' local y_stems "`y_stems' dev_heat_end z_heat_end"
				if `has_gdd_bin' local y_stems "`y_stems' gddcat"
				if `has_tmp_bin' {
					forvalues b = 1/`tmp_bin' {
						local bpad = string(`b', "%02.0f")
						local y_stems "`y_stems' tmpbin`bpad'"
					}
				}
			}
			if `has_cuts' {
				local K_plus = `n_cuts' + 1
				forvalues b = 1/`K_plus' {
					local bpad = string(`b', "%02.0f")
					local y_stems "`y_stems' cut`bpad'"
				}
			}

			foreach s of local y_stems {
				local vname "`outstub'`s'_`j'"
				local planned_vars "`planned_vars' `vname'"
			}
		}
	}

	* Check variable name collisions
	foreach v of local planned_vars {
		capture confirm new variable `v'
		if _rc {
			di as error "Variable `v' already exists in the dataset"
			exit 110
		}
	}

	* Maxvar check
	if "`shape'" == "wide" {
		local needed_vars = c(k) + `: word count `planned_vars''
		if `needed_vars' > c(maxvar) {
			di as error "wxsum requires approximately `needed_vars' variables, but maxvar is " c(maxvar) "."
			di as error "Increase the variable limit using: set maxvar `needed_vars' (or higher)."
			exit 900
		}
	}

	* =========================================================================
	* 4. COMPUTE & STORE IN MATA (WITH ATOMIC ROLLBACK PRESERVE)
	* =========================================================================

	preserve

	local orig_N = _N
	local dtype = cond("`type'" == "rain", "rain", "temp")

	* Execute Mata engine (computation + storage + r(missing))
	tempname mmat
	mata: _wxsum_engine("`mmat'")

	* Rollback test hook
	if "$WXSUM_TEST_FAIL" != "" {
		di as error "Forced test failure via WXSUM_TEST_FAIL"
		exit 999
	}

	* Post-processing long/wide ordering
	if "`mode'" == "unit" {
		if "`keep'" != "" {
			quietly keep `keep' `planned_vars'
			capture order `keep' `planned_vars'
		}
		else {
			capture order `planned_vars', after(_all)
		}
	}
	else if "`shape'" == "long" {
		if "`keep'" != "" {
			capture sort `keep' year
			capture order `keep' year *
		}
		else {
			capture sort year
			capture order year *
		}
	}
	else {
		if "`keep'" != "" {
			quietly keep `keep' `planned_vars'
			capture order `keep' `planned_vars'
		}
		else {
			capture order `planned_vars', after(_all)
		}
	}

	* =========================================================================
	* 5. LABELS, CHARACTERISTICS & rclass
	* =========================================================================

	local k_created : word count `planned_vars'

	* Variable labels
	_wxsum_apply_labels, shape(`shape') outstub(`outstub') type(`type') ///
		season_years(`season_years') lr_years(`lr_years') is_baseline(`is_baseline') ///
		base_y1(`base_y1') base_y2(`base_y2') rain_threshold(`rain_threshold') ///
		heat_threshold(`heat_threshold') gdd_lo(`gdd_lo') gdd_hi(`gdd_hi') ///
		kdd_base(`kdd_base') has_gdd_bin(`has_gdd_bin') gdd_bin(`gdd_bin') ///
		has_tmp_bin(`has_tmp_bin') tmp_bin(`tmp_bin') tmp_binlo(`tmp_binlo') tmp_binhi(`tmp_binhi') ///
		has_cuts(`has_cuts') cuts(`cuts')

	* Dataset characteristics
	char _dta[wxsum_cmdline] `"`cmdline'"'
	char _dta[wxsum_version] "6.0.0"
	char _dta[wxsum_type] "`type'"
	char _dta[wxsum_shape] "`shape'"
	char _dta[wxsum_mode] "`mode'"
	if "`mode'" == "calendar" {
		char _dta[wxsum_window] "`ini_month'/`ini_day'–`fin_month'/`fin_day'"
	}
	else {
		char _dta[wxsum_window] "`window_str'"
	}
	if `is_baseline' {
		char _dta[wxsum_ref] "baseline `base_y1'–`base_y2'"
	}
	else {
		char _dta[wxsum_ref] "rolling `lr_years'"
	}
	char _dta[wxsum_minobs] "`minobs'"

	* Variable characteristics
	foreach v of local planned_vars {
		if "`mode'" == "calendar" {
			char `v'[wxsum_window] "`ini_month'/`ini_day'–`fin_month'/`fin_day'"
		}
		else {
			char `v'[wxsum_window] "`window_str'"
		}
		local v_stem = "`v'"
		if "`outstub'" != "" {
			if substr("`v_stem'", 1, strlen("`outstub'")) == "`outstub'" {
				local v_stem = substr("`v_stem'", strlen("`outstub'") + 1, .)
			}
		}
		if "`shape'" == "wide" {
			if regexm("`v_stem'", "^(.*)_[0-9][0-9][0-9][0-9]$") {
				local v_stem = regexs(1)
			}
		}
		char `v'[wxsum_stat] "`v_stem'"
	}

	* Console summary output
	di _n as text "{hline 65}"
	if "`mode'" == "calendar" {
		di as text "wxsum v6.0 (" as result "`type'" as text ", " as result "`shape'" as text ")"
		di as text "Seasons: " as result "`W'" as text " (`first_year'–`last_year')"
	}
	else {
		di as text "wxsum v6.0 (" as result "`type'" as text ", unit-specific windows)"
		di as text "Window: " as result "`window_str'"
	}
	if `is_baseline' {
		di as text "Reference: Fixed baseline `base_y1'–`base_y2' (ref_min = `ref_min')"
	}
	else {
		di as text "Reference: Rolling `lr_years' years (ref_min = `ref_min')"
	}
	di as text "Created: " as result "`k_created'" as text " variables, " as result _N as text " observations"
	di as text "{hline 65}"

	* rclass returns
	return scalar N = _N
	if "`keep'" != "" {
		return scalar N_units = `orig_N'
	}
	return scalar k_created = `k_created'
	return local varlist "`planned_vars'"
	if "`mode'" == "calendar" {
		return scalar n_windows = `W'
		return scalar first_year = `first_year'
		return scalar last_year = `last_year'
		return local years "`season_years'"
		return local window "`ini_month'/`ini_day'–`fin_month'/`fin_day'"
	}
	else {
		return scalar n_windows = 1
		return local window "`window_str'"
	}
	return local mode "`mode'"
	return local type "`type'"
	return local shape "`shape'"
	if "`type'" == "rain" {
		return scalar rain_threshold = `rain_threshold'
	}
	else {
		return scalar gdd_lo = `gdd_lo'
		return scalar gdd_hi = `gdd_hi'
		return scalar heat_threshold = `heat_threshold'
		return scalar kdd_base = `kdd_base'
	}
	if `is_baseline' {
		return local ref "baseline `base_y1'–`base_y2'"
	}
	else {
		return local ref "rolling `lr_years'"
	}
	return scalar minobs = `minobs'
	return local cmdline `"`cmdline'"'
	return matrix missing = `mmat'

	quietly compress
	restore, not

	if `"`savefile'"' != "" {
		di as result `"Saving data set as `savefile'"'
		save `"`savefile'"', `save_replace'
	}
end

* =============================================================================
* HELPER: APPLY VARIABLE LABELS
* =============================================================================

program define _wxsum_apply_labels
	syntax , shape(string) [outstub(string)] type(string) [season_years(string)] ///
		lr_years(integer) is_baseline(integer) base_y1(integer) base_y2(integer) ///
		rain_threshold(real) heat_threshold(real) gdd_lo(real) gdd_hi(real) kdd_base(real) ///
		has_gdd_bin(integer) gdd_bin(real) has_tmp_bin(integer) tmp_bin(integer) ///
		tmp_binlo(real) tmp_binhi(real) has_cuts(integer) [cuts(string)]

	local dtype = cond("`type'" == "rain", "rain", "temp")
	local ref_lbl = cond(`is_baseline', "baseline `base_y1'-`base_y2' avg", "`lr_years' yr avg")

	if "`shape'" == "long" {
		capture label var `outstub'nobs "Number of non-missing daily observations"
		capture label var `outstub'mean "Mean daily `dtype'"
		capture label var `outstub'median "Median daily `dtype'"
		capture label var `outstub'var "Variance of daily `dtype'"
		capture label var `outstub'sd "Std dev of daily `dtype'"
		capture label var `outstub'skew "Adj sample skewness of daily `dtype'"

		if "`type'" == "rain" {
			capture label var `outstub'total "Total `dtype'"
			capture label var `outstub'dev_total "Deviation in total from `ref_lbl'"
			capture label var `outstub'z_total "Z-score of total from `ref_lbl'"
			capture label var `outstub'mean_mo "Mean of monthly rainfall totals"
			capture label var `outstub'dev_mean_mo "Deviation in mean_mo from `ref_lbl'"
			capture label var `outstub'z_mean_mo "Z-score of mean_mo from `ref_lbl'"
			capture label var `outstub'raindays "Number of observed days with rain"
			capture label var `outstub'dev_raindays "Deviation in raindays from `ref_lbl'"
			capture label var `outstub'z_raindays "Z-score of raindays from `ref_lbl'"
			capture label var `outstub'norain "Number of observed days without rain"
			capture label var `outstub'dev_norain "Deviation in norain from `ref_lbl'"
			capture label var `outstub'z_norain "Z-score of norain from `ref_lbl'"
			capture label var `outstub'pct_raindays "Share of observed days with rain"
			capture label var `outstub'dev_pct_raindays "Deviation in pct_raindays from `ref_lbl'"
			capture label var `outstub'z_pct_raindays "Z-score of pct_raindays from `ref_lbl'"
			capture label var `outstub'dry_start "Leading dry spell at start of window (season)"
			capture label var `outstub'dev_dry_start "Deviation in dry_start from `ref_lbl'"
			capture label var `outstub'z_dry_start "Z-score of dry_start from `ref_lbl'"
			capture label var `outstub'dry "Longest mid-season dry spell"
			capture label var `outstub'dev_dry "Deviation in dry from `ref_lbl'"
			capture label var `outstub'z_dry "Z-score of dry from `ref_lbl'"
			capture label var `outstub'dry_end "Trailing dry spell at end of window (season)"
			capture label var `outstub'dev_dry_end "Deviation in dry_end from `ref_lbl'"
			capture label var `outstub'z_dry_end "Z-score of dry_end from `ref_lbl'"
		}
		else {
			capture label var `outstub'max "Max daily `dtype'"
			capture label var `outstub'gdd "Growing degree days between `gdd_lo' and `gdd_hi'"
			capture label var `outstub'dev_gdd "Deviation in gdd from `ref_lbl'"
			capture label var `outstub'z_gdd "Z-score of gdd from `ref_lbl'"
			capture label var `outstub'kdd "Killing (extreme-heat) degree days above `kdd_base'"
			capture label var `outstub'dev_kdd "Deviation in kdd from `ref_lbl'"
			capture label var `outstub'z_kdd "Z-score of kdd from `ref_lbl'"
			capture label var `outstub'heatdays "Number of days with temp >= `heat_threshold'"
			capture label var `outstub'dev_heatdays "Deviation in heatdays from `ref_lbl'"
			capture label var `outstub'z_heatdays "Z-score of heatdays from `ref_lbl'"
			capture label var `outstub'pct_heatdays "Share of observed days with temp >= `heat_threshold'"
			capture label var `outstub'dev_pct_heatdays "Deviation in pct_heatdays from `ref_lbl'"
			capture label var `outstub'z_pct_heatdays "Z-score of pct_heatdays from `ref_lbl'"
			capture label var `outstub'heat_start "Leading heat spell at start of window (season)"
			capture label var `outstub'dev_heat_start "Deviation in heat_start from `ref_lbl'"
			capture label var `outstub'z_heat_start "Z-score of heat_start from `ref_lbl'"
			capture label var `outstub'heat "Longest mid-season heat spell"
			capture label var `outstub'dev_heat "Deviation in heat from `ref_lbl'"
			capture label var `outstub'z_heat "Z-score of heat from `ref_lbl'"
			capture label var `outstub'heat_end "Trailing heat spell at end of window (season)"
			capture label var `outstub'dev_heat_end "Deviation in heat_end from `ref_lbl'"
			capture label var `outstub'z_heat_end "Z-score of heat_end from `ref_lbl'"

			if `has_gdd_bin' {
				capture label var `outstub'gddcat "GDD category, width `gdd_bin'"
			}
			if `has_tmp_bin' {
				forvalues b = 1/`tmp_bin' {
					local bpad = string(`b', "%02.0f")
					capture label var `outstub'tmpbin`bpad' "Temperature bin count, bin `b'"
				}
			}
		}
		if `has_cuts' {
			local n_cuts : word count `cuts'
			local K_plus = `n_cuts' + 1
			forvalues b = 1/`K_plus' {
				local bpad = string(`b', "%02.0f")
				if `b' == 1 {
					local c1 : word 1 of `cuts'
					capture label var `outstub'cut`bpad' "Count in cut bin `b': (-inf, `c1')"
				}
				else if `b' == `K_plus' {
					local cK : word `n_cuts' of `cuts'
					capture label var `outstub'cut`bpad' "Count in cut bin `b': [`cK', inf)"
				}
				else {
					local bm1 = `b' - 1
					local clo : word `bm1' of `cuts'
					local chi : word `b' of `cuts'
					capture label var `outstub'cut`bpad' "Count in cut bin `b': [`clo', `chi')"
				}
			}
		}
	}
	else {
		* wide mode
		foreach j of local season_years {
			capture label var `outstub'nobs_`j' "Number of non-missing daily observations in `j'"
			capture label var `outstub'mean_`j' "Mean daily `dtype' in `j'"
			capture label var `outstub'median_`j' "Median daily `dtype' in `j'"
			capture label var `outstub'var_`j' "Variance of daily `dtype' in `j'"
			capture label var `outstub'sd_`j' "Std dev of daily `dtype' in `j'"
			capture label var `outstub'skew_`j' "Adj sample skewness of daily `dtype' in `j'"

			if "`type'" == "rain" {
				capture label var `outstub'total_`j' "Total `dtype' in `j'"
				capture label var `outstub'dev_total_`j' "Deviation in total from `ref_lbl'"
				capture label var `outstub'z_total_`j' "Z-score of total from `ref_lbl'"
				capture label var `outstub'mean_mo_`j' "Mean of monthly rainfall totals in `j'"
				capture label var `outstub'dev_mean_mo_`j' "Deviation in mean_mo from `ref_lbl'"
				capture label var `outstub'z_mean_mo_`j' "Z-score of mean_mo from `ref_lbl'"
				capture label var `outstub'raindays_`j' "Number of observed days with rain in `j'"
				capture label var `outstub'dev_raindays_`j' "Deviation in raindays from `ref_lbl'"
				capture label var `outstub'z_raindays_`j' "Z-score of raindays from `ref_lbl'"
				capture label var `outstub'norain_`j' "Number of observed days without rain in `j'"
				capture label var `outstub'dev_norain_`j' "Deviation in norain from `ref_lbl'"
				capture label var `outstub'z_norain_`j' "Z-score of norain from `ref_lbl'"
				capture label var `outstub'pct_raindays_`j' "Share of observed days with rain in `j'"
				capture label var `outstub'dev_pct_raindays_`j' "Deviation in pct_raindays from `ref_lbl'"
				capture label var `outstub'z_pct_raindays_`j' "Z-score of pct_raindays from `ref_lbl'"
				capture label var `outstub'dry_start_`j' "Leading dry spell at start of season in `j'"
				capture label var `outstub'dev_dry_start_`j' "Deviation in dry_start from `ref_lbl'"
				capture label var `outstub'z_dry_start_`j' "Z-score of dry_start from `ref_lbl'"
				capture label var `outstub'dry_`j' "Longest mid-season dry spell in `j'"
				capture label var `outstub'dev_dry_`j' "Deviation in dry from `ref_lbl'"
				capture label var `outstub'z_dry_`j' "Z-score of dry from `ref_lbl'"
				capture label var `outstub'dry_end_`j' "Trailing dry spell at end of season in `j'"
				capture label var `outstub'dev_dry_end_`j' "Deviation in dry_end from `ref_lbl'"
				capture label var `outstub'z_dry_end_`j' "Z-score of dry_end from `ref_lbl'"
			}
			else {
				capture label var `outstub'max_`j' "Max daily `dtype' in `j'"
				capture label var `outstub'gdd_`j' "Growing degree days in `j' between `gdd_lo' and `gdd_hi'"
				capture label var `outstub'dev_gdd_`j' "Deviation in gdd from `ref_lbl'"
				capture label var `outstub'z_gdd_`j' "Z-score of gdd from `ref_lbl'"
				capture label var `outstub'kdd_`j' "Killing degree days in `j' above `kdd_base'"
				capture label var `outstub'dev_kdd_`j' "Deviation in kdd from `ref_lbl'"
				capture label var `outstub'z_kdd_`j' "Z-score of kdd from `ref_lbl'"
				capture label var `outstub'heatdays_`j' "Number of days with temp >= `heat_threshold' in `j'"
				capture label var `outstub'dev_heatdays_`j' "Deviation in heatdays from `ref_lbl'"
				capture label var `outstub'z_heatdays_`j' "Z-score of heatdays from `ref_lbl'"
				capture label var `outstub'pct_heatdays_`j' "Share of observed days with temp >= `heat_threshold' in `j'"
				capture label var `outstub'dev_pct_heatdays_`j' "Deviation in pct_heatdays from `ref_lbl'"
				capture label var `outstub'z_pct_heatdays_`j' "Z-score of pct_heatdays from `ref_lbl'"
				capture label var `outstub'heat_start_`j' "Leading heat spell at start of season in `j'"
				capture label var `outstub'dev_heat_start_`j' "Deviation in heat_start from `ref_lbl'"
				capture label var `outstub'z_heat_start_`j' "Z-score of heat_start from `ref_lbl'"
				capture label var `outstub'heat_`j' "Longest mid-season heat spell in `j'"
				capture label var `outstub'dev_heat_`j' "Deviation in heat from `ref_lbl'"
				capture label var `outstub'z_heat_`j' "Z-score of heat from `ref_lbl'"
				capture label var `outstub'heat_end_`j' "Trailing heat spell at end of season in `j'"
				capture label var `outstub'dev_heat_end_`j' "Deviation in heat_end from `ref_lbl'"
				capture label var `outstub'z_heat_end_`j' "Z-score of heat_end from `ref_lbl'"

				if `has_gdd_bin' {
					capture label var `outstub'gddcat_`j' "GDD category in `j', width `gdd_bin'"
				}
				if `has_tmp_bin' {
					forvalues b = 1/`tmp_bin' {
						local bpad = string(`b', "%02.0f")
						capture label var `outstub'tmpbin`bpad'_`j' "Temperature bin count, bin `b', `j'"
					}
				}
			}
			if `has_cuts' {
				local n_cuts : word count `cuts'
				local K_plus = `n_cuts' + 1
				forvalues b = 1/`K_plus' {
					local bpad = string(`b', "%02.0f")
					if `b' == 1 {
						local c1 : word 1 of `cuts'
						capture label var `outstub'cut`bpad'_`j' "Count in cut bin `b', `j': (-inf, `c1')"
					}
					else if `b' == `K_plus' {
						local cK : word `n_cuts' of `cuts'
						capture label var `outstub'cut`bpad'_`j' "Count in cut bin `b', `j': [`cK', inf)"
					}
					else {
						local bm1 = `b' - 1
						local clo : word `bm1' of `cuts'
						local chi : word `b' of `cuts'
						capture label var `outstub'cut`bpad'_`j' "Count in cut bin `b', `j': [`clo', `chi')"
					}
				}
			}
		}
	}
end

* =============================================================================
* MATA ENGINE
* =============================================================================

mata:
mata set matastrict on

// Helper: sort nonmissing values in vector x and return median
real scalar _wxsum_row_median(real rowvector x)
{
	real rowvector v
	real scalar n, mid
	v = select(x, (x :< .))
	n = length(v)
	if (n == 0) return(.)
	v = sort(v', 1)'
	if (mod(n, 2) == 1) {
		return(v[(n + 1) / 2])
	}
	else {
		mid = n / 2
		return((v[mid] + v[mid + 1]) / 2)
	}
}

// Compute distribution moments: mean, median, var, sd, skew, nobs
void _wxsum_calc_moments(real matrix X,
                         real colvector nobs,
                         real colvector mean_v,
                         real colvector med_v,
                         real colvector var_v,
                         real colvector sd_v,
                         real colvector skew_v)
{
	real scalar N, i, n_i, s2, s, sum_diff3
	real rowvector row, diff
	
	N = rows(X)
	nobs = rownonmissing(X)
	mean_v = J(N, 1, .)
	med_v  = J(N, 1, .)
	var_v  = J(N, 1, .)
	sd_v   = J(N, 1, .)
	skew_v = J(N, 1, .)
	
	for (i = 1; i <= N; i++) {
		n_i = nobs[i]
		if (n_i == 0) continue
		
		row = X[i, .]
		mean_v[i] = mean(select(row, (row :< .))')
		med_v[i]  = _wxsum_row_median(row)
		
		if (n_i >= 2) {
			diff = select(row :- mean_v[i], (row :< .))
			s2 = (diff * diff') / (n_i - 1)
			var_v[i] = s2
			s = sqrt(s2)
			sd_v[i] = s
			
			if (n_i >= 3 && s > 0 && s < .) {
				sum_diff3 = sum((diff :/ s):^3)
				skew_v[i] = (n_i / ((n_i - 1) * (n_i - 2))) * sum_diff3
			}
		}
	}
}

// Unified spell calculator (dry or heat)
// D3: edge missing skipped (count from first/last observed day)
// D4: mid-window spell (with >= 2 break days, strictly between first & last; with 0-1 break days, anywhere in observed days)
void _wxsum_calc_spells(real matrix X,
                        real scalar thresh,
                        real scalar is_temp,
                        real colvector nobs,
                        real colvector sp_start,
                        real colvector sp_mid,
                        real colvector sp_end)
{
	real scalar N, D, i, d, n_i
	real scalar first_obs, last_obs, n_break, first_b, last_b
	real scalar cur_run, max_run, is_sp, is_br
	real rowvector row
	
	N = rows(X)
	D = cols(X)
	
	sp_start = J(N, 1, .)
	sp_mid   = J(N, 1, .)
	sp_end   = J(N, 1, .)
	
	for (i = 1; i <= N; i++) {
		n_i = nobs[i]
		if (n_i == 0) continue
		
		row = X[i, .]
		first_obs = 0
		last_obs = 0
		n_break = 0
		first_b = 0
		last_b = 0
		
		for (d = 1; d <= D; d++) {
			if (row[d] < .) {
				if (first_obs == 0) first_obs = d
				last_obs = d
				
				is_br = (is_temp ? (row[d] < thresh) : (row[d] >= thresh))
				if (is_br) {
					n_break++
					if (first_b == 0) first_b = d
					last_b = d
				}
			}
		}
		
		// Leading spell (forward from first_obs)
		sp_start[i] = 0
		for (d = first_obs; d <= D; d++) {
			if (row[d] >= .) break
			is_sp = (is_temp ? (row[d] >= thresh) : (row[d] < thresh))
			if (is_sp) {
				sp_start[i] = sp_start[i] + 1
			}
			else {
				break
			}
		}
		
		// Trailing spell (backward from last_obs)
		sp_end[i] = 0
		for (d = last_obs; d >= 1; d--) {
			if (row[d] >= .) break
			is_sp = (is_temp ? (row[d] >= thresh) : (row[d] < thresh))
			if (is_sp) {
				sp_end[i] = sp_end[i] + 1
			}
			else {
				break
			}
		}
		
		// Mid-window spell (D4)
		max_run = 0
		cur_run = 0
		if (n_break >= 2) {
			for (d = first_b + 1; d < last_b; d++) {
				if (row[d] >= .) {
					cur_run = 0
				}
				else {
					is_sp = (is_temp ? (row[d] >= thresh) : (row[d] < thresh))
					if (is_sp) {
						cur_run++
						if (cur_run > max_run) max_run = cur_run
					}
					else {
						cur_run = 0
					}
				}
			}
		}
		else {
			for (d = first_obs; d <= last_obs; d++) {
				if (row[d] >= .) {
					cur_run = 0
				}
				else {
					is_sp = (is_temp ? (row[d] >= thresh) : (row[d] < thresh))
					if (is_sp) {
						cur_run++
						if (cur_run > max_run) max_run = cur_run
					}
					else {
						cur_run = 0
					}
				}
			}
		}
		sp_mid[i] = max_run
	}
}

// Compute reference deviations and z-scores
void _wxsum_calc_ref(real matrix M,
                     real rowvector Y,
                     real scalar is_baseline,
                     real scalar lr_years,
                     real scalar ref_min,
                     real scalar base_y1,
                     real scalar base_y2,
                     real matrix dev_M,
                     real matrix z_M)
{
	real scalar N, W, w, k, m_i, s, m_val, i
	real rowvector K_w, vals, diff
	
	N = rows(M)
	W = cols(M)
	dev_M = J(N, W, .)
	z_M   = J(N, W, .)
	
	if (!is_baseline) {
		for (w = 1; w <= W; w++) {
			K_w = J(1, 0, .)
			for (k = 1; k <= W; k++) {
				if (Y[k] >= Y[w] - lr_years && Y[k] <= Y[w] - 1) {
					K_w = K_w, k
				}
			}
			if (length(K_w) < ref_min) continue
			
			for (i = 1; i <= N; i++) {
				vals = select(M[i, K_w], (M[i, K_w] :< .))
				m_i = length(vals)
				if (m_i >= ref_min) {
					m_val = mean(vals')
					dev_M[i, w] = M[i, w] - m_val
					if (m_i >= 2) {
						diff = vals :- m_val
						s = sqrt((diff * diff') / (m_i - 1))
						if (s > 0 && s < .) {
							z_M[i, w] = (M[i, w] - m_val) / s
						}
					}
				}
			}
		}
	}
	else {
		K_w = J(1, 0, .)
		for (k = 1; k <= W; k++) {
			if (Y[k] >= base_y1 && Y[k] <= base_y2) {
				K_w = K_w, k
			}
		}
		if (length(K_w) >= ref_min) {
			for (i = 1; i <= N; i++) {
				vals = select(M[i, K_w], (M[i, K_w] :< .))
				m_i = length(vals)
				if (m_i >= ref_min) {
					m_val = mean(vals')
					s = .
					if (m_i >= 2) {
						diff = vals :- m_val
						s = sqrt((diff * diff') / (m_i - 1))
					}
					for (w = 1; w <= W; w++) {
						if (M[i, w] < .) {
							dev_M[i, w] = M[i, w] - m_val
							if (s > 0 && s < .) {
								z_M[i, w] = (M[i, w] - m_val) / s
							}
						}
					}
				}
			}
		}
	}
}

// Compute GDD categories across pooled seasons
void _wxsum_calc_gddcat(real matrix GDD,
                        real scalar bin_width,
                        real scalar has_binlo,
                        real scalar binlo,
                        real scalar has_binhi,
                        real scalar binhi,
                        real matrix gddcat,
                        real rowvector cat_info)
{
	real scalar N, W, i, w, r, rc, tc
	real scalar gdd_min, gdd_max, gb_lo, gb_hi, gb_has_bot, gb_has_top
	real scalar gb_n, gb_auto_hi, gb_nreg, gb_ncat, edge_lo, edge_hi
	real rowvector nonmiss_vals
	
	N = rows(GDD)
	W = cols(GDD)
	gddcat = J(N, W, .)
	cat_info = J(1, 7, .)
	
	nonmiss_vals = select(vec(GDD)', (vec(GDD)' :< .))
	if (length(nonmiss_vals) == 0) return
	
	gdd_min = min(nonmiss_vals)
	gdd_max = max(nonmiss_vals)
	
	gb_lo = (has_binlo ? binlo : 0)
	if (has_binhi) {
		gb_hi = binhi
		gb_has_top = 1
	}
	else {
		gb_n = ceil((gdd_max - gb_lo) / bin_width)
		gb_auto_hi = gb_lo + gb_n * bin_width
		if (gdd_max >= gb_auto_hi - 1e-12) {
			gb_n++
			gb_auto_hi = gb_lo + gb_n * bin_width
		}
		if (gb_n < 1) gb_n = 1
		gb_hi = gb_lo + gb_n * bin_width
		gb_has_top = 0
	}
	
	gb_has_bot = (gdd_min < gb_lo)
	gb_nreg = round((gb_hi - gb_lo) / bin_width)
	gb_ncat = gb_nreg + gb_has_bot + gb_has_top
	
	cat_info = (gb_has_bot, gb_has_top, gb_nreg, gb_ncat, gb_lo, gb_hi, bin_width)
	
	for (w = 1; w <= W; w++) {
		for (i = 1; i <= N; i++) {
			if (GDD[i, w] >= .) continue
			
			if (gb_has_bot && GDD[i, w] < gb_lo) {
				gddcat[i, w] = 1
				continue
			}
			
			if (gb_has_top && GDD[i, w] >= gb_hi - 1e-12) {
				tc = gb_nreg + gb_has_bot + 1
				gddcat[i, w] = tc
				continue
			}
			
			for (r = 1; r <= gb_nreg; r++) {
				edge_lo = gb_lo + (r - 1) * bin_width
				edge_hi = gb_lo + r * bin_width
				if (GDD[i, w] >= edge_lo - 1e-12 && GDD[i, w] < edge_hi - 1e-12) {
					rc = r + gb_has_bot
					gddcat[i, w] = rc
					break
				}
			}
		}
	}
}

// Define gddcat value labels in Stata
void _wxsum_apply_gddcat_lbl(real rowvector cat_info, string scalar outstub, string scalar shape, real rowvector season_years)
{
	real scalar has_bot, has_top, nreg, lo, hi, w, r, catnum
	real scalar edge_lo, edge_hi
	string scalar cmd
	
	if (length(cat_info) < 7 || cat_info[4] >= .) return
	
	has_bot = cat_info[1]
	has_top = cat_info[2]
	nreg    = cat_info[3]
	lo      = cat_info[5]
	hi      = cat_info[6]
	w       = cat_info[7]
	
	stata("capture label drop _gddcat_lbl")
	catnum = 0
	
	if (has_bot) {
		catnum++
		cmd = sprintf(`"label define _gddcat_lbl %f "GDD < %s", add"', catnum, strtrim(sprintf("%12.0g", lo)))
		stata(cmd)
	}
	
	for (r = 1; r <= nreg; r++) {
		catnum++
		edge_lo = lo + (r - 1) * w
		edge_hi = lo + r * w
		cmd = sprintf(`"label define _gddcat_lbl %f "GDD [%s,%s)", add"',
		              catnum,
		              strtrim(sprintf("%12.0g", edge_lo)),
		              strtrim(sprintf("%12.0g", edge_hi)))
		stata(cmd)
	}
	
	if (has_top) {
		catnum++
		cmd = sprintf(`"label define _gddcat_lbl %f "GDD >= %s", add"', catnum, strtrim(sprintf("%12.0g", hi)))
		stata(cmd)
	}
	
	if (shape == "long") {
		stata(sprintf("capture label values %sgddcat _gddcat_lbl", outstub))
	}
	else {
		for (r = 1; r <= length(season_years); r++) {
			stata(sprintf("capture label values %sgddcat_%04.0f _gddcat_lbl", outstub, season_years[r]))
		}
	}
}

// Helper functions for unit-specific windows
real scalar _wxsum_is_leap_year(real scalar y)
{
	return((mod(y, 4) == 0 && mod(y, 100) != 0) || mod(y, 400) == 0)
}

real scalar _wxsum_shift_date(real scalar d_num, real scalar l)
{
	real scalar y, m, d, ty
	y = year(d_num)
	m = month(d_num)
	d = day(d_num)
	ty = y - l
	if (m == 2 && d == 29 && !_wxsum_is_leap_year(ty)) {
		d = 28
	}
	return(mdy(m, d, ty))
}

real scalar _wxsum_baseline_date(real scalar d_num, real scalar ty)
{
	real scalar m, d
	m = month(d_num)
	d = day(d_num)
	if (m == 2 && d == 29 && !_wxsum_is_leap_year(ty)) {
		d = 28
	}
	return(mdy(m, d, ty))
}

void _wxsum_compute_dev_z(real scalar val_curr,
                          real colvector ref_vals,
                          real scalar ref_min,
                          real scalar dev,
                          real scalar z)
{
	real scalar k, m, s
	real colvector v
	if (val_curr >= . || length(ref_vals) == 0) {
		dev = .
		z = .
		return
	}
	v = select(ref_vals, (ref_vals :< .))
	k = length(v)
	if (k < ref_min) {
		dev = .
		z = .
		return
	}
	m = mean(v)
	dev = val_curr - m
	if (k >= 2) {
		s = sqrt(variance(v))
		if (s > 0 && s < .) {
			z = dev / s
		}
		else {
			z = .
		}
	}
	else {
		z = .
	}
}

// UNIT-SPECIFIC WINDOW MATA ENGINE
void _wxsum_engine_unit(| string scalar mmat_name)
{
	real scalar N, all_k, k, p_len, y, m, d, dt, ord, v_idx
	real scalar i, minobs, rain_thresh, gdd_lo, gdd_hi, heat_thresh, kdd_base
	real scalar lr_years, ref_min, is_baseline, base_y1, base_y2, has_partial
	real scalar has_tmp_bin, tb_J, tb_lo, tb_hi, tb_width, elo, ehi
	real scalar has_gdd_bin, gb_bin, has_gb_lo, gb_lo, has_gb_hi, gb_hi
	real scalar has_cuts, n_cuts, b
	real scalar D_min, D_max, s_i, e_i, is_out, s_use, e_use, n_obs
	real scalar s2, s, d_idx, v_d, gdd_sum, kdd_sum, l, delta_y
	real scalar s_ref, e_ref, s_ref_use, e_ref_use, nobs_ref, v_tot, v_raindays, v_norain
	real scalar v_pct_raindays, v_gdd, v_kdd, v_heatdays, v_pct_heatdays
	real scalar dev_val, z_val
	real scalar n_outside, n_missing_dates, n_minobs_count
	
	real rowvector daily_indices, d_dates, d_ym, cols_i, yms_i, unique_yms, cols_ym
	real rowvector row_i, cuts, m_totals, nonmiss_m, gddcat_info, vals, diff
	real rowvector cols_ref, row_ref, yms_ref, vals_ref, m_tot_ref, nonmiss_m_ref
	real rowvector ref_tot, ref_mean_mo, ref_raindays, ref_norain, ref_pct_raindays
	real rowvector ref_dry_start, ref_dry, ref_dry_end
	real rowvector ref_gdd, ref_kdd, ref_heatdays, ref_pct_heatdays
	real rowvector ref_heat_start, ref_heat, ref_heat_end
	
	real colvector sp_s, sp_m, sp_e
	real colvector starts, ends, days_v, val_days, val_nobs, valid_idx
	real colvector nobs_v, mean_v, med_v, var_v, sd_v, skew_v
	real colvector tot_v, mean_mo_v, raindays_v, norain_v, pct_raindays_v
	real colvector dry_start_v, dry_v, dry_end_v
	real colvector dev_tot_v, z_tot_v, dev_mean_mo_v, z_mean_mo_v
	real colvector dev_raindays_v, z_raindays_v, dev_norain_v, z_norain_v
	real colvector dev_pct_raindays_v, z_pct_raindays_v
	real colvector dev_dry_start_v, z_dry_start_v, dev_dry_v, z_dry_v
	real colvector dev_dry_end_v, z_dry_end_v
	
	real colvector max_v, gdd_v, kdd_v, heatdays_v, pct_heatdays_v
	real colvector heat_start_v, heat_v, heat_end_v
	real colvector dev_gdd_v, z_gdd_v, dev_kdd_v, z_kdd_v
	real colvector dev_heatdays_v, z_heatdays_v, dev_pct_heatdays_v, z_pct_heatdays_v
	real colvector dev_heat_start_v, z_heat_start_v, dev_heat_v, z_heat_v
	real colvector dev_heat_end_v, z_heat_end_v
	real matrix M_gddcat
	
	real matrix X_all, miss_mat, M_tmp_bin, M_cuts
	string scalar prefix, vname, sfx, type, outstub, start_var, end_var
	string rowvector col_names, row_names

	// Read parameters from Stata locals
	type         = st_local("type")
	outstub      = st_local("outstub")
	prefix       = st_local("prefix")
	p_len        = strlen(prefix)
	start_var    = st_local("start_var")
	end_var      = st_local("end_var")
	has_partial  = (st_local("has_partial") == "1")
	
	minobs       = strtoreal(st_local("minobs"))
	rain_thresh  = strtoreal(st_local("rain_threshold"))
	gdd_lo       = strtoreal(st_local("gdd_lo"))
	gdd_hi       = strtoreal(st_local("gdd_hi"))
	heat_thresh  = strtoreal(st_local("heat_threshold"))
	kdd_base     = strtoreal(st_local("kdd_base"))
	
	lr_years     = strtoreal(st_local("lr_years"))
	ref_min      = strtoreal(st_local("ref_min"))
	is_baseline  = strtoreal(st_local("is_baseline"))
	base_y1      = strtoreal(st_local("base_y1"))
	base_y2      = strtoreal(st_local("base_y2"))
	
	has_tmp_bin  = strtoreal(st_local("has_tmp_bin"))
	tb_J         = strtoreal(st_local("tmp_bin"))
	tb_lo        = strtoreal(st_local("tmp_binlo"))
	tb_hi        = strtoreal(st_local("tmp_binhi"))
	
	has_gdd_bin  = strtoreal(st_local("has_gdd_bin"))
	gb_bin       = strtoreal(st_local("gdd_bin"))
	has_gb_lo    = strtoreal(st_local("has_gdd_binlo"))
	gb_lo        = strtoreal(st_local("gdd_binlo"))
	has_gb_hi    = strtoreal(st_local("has_gdd_binhi"))
	gb_hi        = strtoreal(st_local("gdd_binhi"))
	
	has_cuts     = strtoreal(st_local("has_cuts"))
	if (has_cuts) {
		cuts     = strtoreal(tokens(st_local("cuts")))
		n_cuts   = length(cuts)
	}
	else {
		n_cuts   = 0
	}

	// Discover daily weather variables
	all_k = st_nvar()
	daily_indices = J(1, 0, .)
	d_dates = J(1, 0, .)
	d_ym = J(1, 0, .)
	
	for (k = 1; k <= all_k; k++) {
		vname = st_varname(k)
		if (substr(vname, 1, p_len) == prefix) {
			sfx = substr(vname, p_len + 1, .)
			if (strlen(sfx) == 8 && strtrim(sfx) == sfx) {
				y = strtoreal(substr(sfx, 1, 4))
				m = strtoreal(substr(sfx, 5, 2))
				d = strtoreal(substr(sfx, 7, 2))
				if (y < . && m >= 1 && m <= 12 && d >= 1 && d <= 31) {
					dt = mdy(m, d, y)
					if (dt < .) {
						daily_indices = daily_indices, k
						d_dates = d_dates, dt
						d_ym = d_ym, (y * 100 + m)
					}
				}
			}
		}
	}
	
	ord = order(d_dates', 1)'
	daily_indices = daily_indices[ord]
	d_dates = d_dates[ord]
	d_ym = d_ym[ord]
	
	D_min = min(d_dates)
	D_max = max(d_dates)

	// Read daily weather matrix and unit start/end dates
	X_all  = st_data(., daily_indices)
	starts = st_data(., start_var)
	ends   = st_data(., end_var)
	N      = rows(X_all)

	// Initialize result vectors
	days_v   = J(N, 1, .)
	nobs_v   = J(N, 1, .)
	mean_v   = J(N, 1, .)
	med_v    = J(N, 1, .)
	var_v    = J(N, 1, .)
	sd_v     = J(N, 1, .)
	skew_v   = J(N, 1, .)
	
	if (type == "rain") {
		tot_v              = J(N, 1, .)
		mean_mo_v          = J(N, 1, .)
		raindays_v         = J(N, 1, .)
		norain_v           = J(N, 1, .)
		pct_raindays_v     = J(N, 1, .)
		dry_start_v        = J(N, 1, .)
		dry_v              = J(N, 1, .)
		dry_end_v          = J(N, 1, .)
		
		dev_tot_v          = J(N, 1, .)
		z_tot_v            = J(N, 1, .)
		dev_mean_mo_v      = J(N, 1, .)
		z_mean_mo_v        = J(N, 1, .)
		dev_raindays_v     = J(N, 1, .)
		z_raindays_v       = J(N, 1, .)
		dev_norain_v       = J(N, 1, .)
		z_norain_v         = J(N, 1, .)
		dev_pct_raindays_v = J(N, 1, .)
		z_pct_raindays_v   = J(N, 1, .)
		dev_dry_start_v    = J(N, 1, .)
		z_dry_start_v      = J(N, 1, .)
		dev_dry_v          = J(N, 1, .)
		z_dry_v            = J(N, 1, .)
		dev_dry_end_v      = J(N, 1, .)
		z_dry_end_v        = J(N, 1, .)
	}
	else {
		max_v              = J(N, 1, .)
		gdd_v              = J(N, 1, .)
		kdd_v              = J(N, 1, .)
		heatdays_v         = J(N, 1, .)
		pct_heatdays_v     = J(N, 1, .)
		heat_start_v       = J(N, 1, .)
		heat_v             = J(N, 1, .)
		heat_end_v         = J(N, 1, .)
		
		dev_gdd_v          = J(N, 1, .)
		z_gdd_v            = J(N, 1, .)
		dev_kdd_v          = J(N, 1, .)
		z_kdd_v            = J(N, 1, .)
		dev_heatdays_v     = J(N, 1, .)
		z_heatdays_v       = J(N, 1, .)
		dev_pct_heatdays_v = J(N, 1, .)
		z_pct_heatdays_v   = J(N, 1, .)
		dev_heat_start_v   = J(N, 1, .)
		z_heat_start_v     = J(N, 1, .)
		dev_heat_v         = J(N, 1, .)
		z_heat_v           = J(N, 1, .)
		dev_heat_end_v     = J(N, 1, .)
		z_heat_end_v       = J(N, 1, .)
		
		if (has_tmp_bin) {
			M_tmp_bin      = J(N, tb_J, .)
		}
	}
	if (has_cuts) {
		M_cuts             = J(N, n_cuts + 1, .)
	}

	n_outside = 0
	n_missing_dates = 0
	n_minobs_count = 0

	// COMPUTE ACTIVE WINDOW FOR EACH UNIT OBSERVATION
	for (i = 1; i <= N; i++) {
		s_i = starts[i]
		e_i = ends[i]
		if (s_i >= . || e_i >= .) {
			n_missing_dates++
			continue
		}
		days_v[i] = e_i - s_i + 1
		
		is_out = (s_i < D_min || e_i > D_max)
		if (is_out) {
			n_outside++
			if (!has_partial) {
				continue
			}
		}
		
		s_use = (has_partial ? max((s_i, D_min)) : s_i)
		e_use = (has_partial ? min((e_i, D_max)) : e_i)
		if (s_use > e_use) {
			nobs_v[i] = 0
			n_minobs_count++
			continue
		}
		
		cols_i = select(1..length(d_dates), (d_dates :>= s_use :& d_dates :<= e_use))
		if (length(cols_i) == 0) {
			nobs_v[i] = 0
			n_minobs_count++
			continue
		}
		
		row_i = X_all[i, cols_i]
		yms_i = d_ym[cols_i]
		n_obs = rownonmissing(row_i)
		nobs_v[i] = n_obs
		
		if (n_obs < minobs) {
			n_minobs_count++
			continue
		}
		
		vals = select(row_i, (row_i :< .))
		mean_v[i] = mean(vals')
		med_v[i]  = _wxsum_row_median(row_i)
		if (n_obs >= 2) {
			diff = vals :- mean_v[i]
			s2 = (diff * diff') / (n_obs - 1)
			var_v[i] = s2
			s = sqrt(s2)
			sd_v[i] = s
			if (n_obs >= 3 && s > 0 && s < .) {
				skew_v[i] = (n_obs / ((n_obs - 1) * (n_obs - 2))) * sum((diff :/ s):^3)
			}
		}
		
		if (type == "rain") {
			tot_v[i]          = sum(vals)
			norain_v[i]       = sum(vals :< rain_thresh)
			raindays_v[i]     = sum(vals :>= rain_thresh)
			if (n_obs > 0) {
				pct_raindays_v[i] = raindays_v[i] / n_obs
			}
			
			unique_yms = uniqrows(yms_i')'
			m_totals = J(1, length(unique_yms), .)
			for (m = 1; m <= length(unique_yms); m++) {
				cols_ym = select(1..length(cols_i), (yms_i :== unique_yms[m]))
				if (sum(row_i[cols_ym] :< .) > 0) {
					m_totals[m] = sum(select(row_i[cols_ym], (row_i[cols_ym] :< .)))
				}
			}
			nonmiss_m = select(m_totals, (m_totals :< .))
			if (length(nonmiss_m) > 0) {
				mean_mo_v[i] = mean(nonmiss_m')
			}
			
			_wxsum_calc_spells(row_i, rain_thresh, 0, n_obs, sp_s=., sp_m=., sp_e=.)
			dry_start_v[i] = sp_s[1]
			dry_v[i]       = sp_m[1]
			dry_end_v[i]   = sp_e[1]
		}
		else {
			vals = select(row_i, (row_i :< .))
			max_v[i] = max(vals)
			
			gdd_sum = 0
			kdd_sum = 0
			for (d_idx = 1; d_idx <= length(vals); d_idx++) {
				v_d = vals[d_idx]
				gdd_sum = gdd_sum + min((max((v_d - gdd_lo, 0)), gdd_hi - gdd_lo))
				kdd_sum = kdd_sum + max((v_d - kdd_base, 0))
			}
			gdd_v[i] = gdd_sum
			kdd_v[i] = kdd_sum
			heatdays_v[i] = sum(vals :>= heat_thresh)
			if (n_obs > 0) {
				pct_heatdays_v[i] = heatdays_v[i] / n_obs
			}
			
			_wxsum_calc_spells(row_i, heat_thresh, 1, n_obs, sp_s=., sp_m=., sp_e=.)
			heat_start_v[i] = sp_s[1]
			heat_v[i]       = sp_m[1]
			heat_end_v[i]   = sp_e[1]
			
			if (has_tmp_bin) {
				if (tb_J == 1) {
					M_tmp_bin[i, 1] = n_obs
				}
				else if (tb_J == 2) {
					M_tmp_bin[i, 1] = sum(vals :< (tb_lo + tb_hi)/2)
					M_tmp_bin[i, 2] = sum(vals :>= (tb_lo + tb_hi)/2)
				}
				else {
					tb_width = (tb_hi - tb_lo) / (tb_J - 2)
					for (b = 1; b <= tb_J; b++) {
						if (b == 1) {
							M_tmp_bin[i, 1] = sum(vals :< tb_lo)
						}
						else if (b == tb_J) {
							M_tmp_bin[i, tb_J] = sum(vals :>= tb_hi)
						}
						else {
							elo = tb_lo + (b - 2) * tb_width
							ehi = tb_lo + (b - 1) * tb_width
							M_tmp_bin[i, b] = sum((vals :>= elo) :* (vals :< ehi))
						}
					}
				}
			}
		}
		
		if (has_cuts) {
			for (b = 1; b <= n_cuts + 1; b++) {
				if (b == 1) {
					M_cuts[i, 1] = sum(vals :< cuts[1])
				}
				else if (b == n_cuts + 1) {
					M_cuts[i, b] = sum(vals :>= cuts[n_cuts])
				}
				else {
					M_cuts[i, b] = sum((vals :>= cuts[b - 1]) :* (vals :< cuts[b]))
				}
			}
		}
	}

	// GDD categories
	if (type == "temp" && has_gdd_bin) {
		_wxsum_calc_gddcat(gdd_v, gb_bin, has_gb_lo, gb_lo, has_gb_hi, gb_hi, M_gddcat=., gddcat_info=.)
	}

	// COMPUTE REFERENCE WINDOWS FOR EACH OBSERVATION
	for (i = 1; i <= N; i++) {
		s_i = starts[i]
		e_i = ends[i]
		if (s_i >= . || e_i >= .) continue
		if (nobs_v[i] < minobs) continue
		
		if (type == "rain") {
			ref_tot          = J(1, 0, .)
			ref_mean_mo      = J(1, 0, .)
			ref_raindays     = J(1, 0, .)
			ref_norain       = J(1, 0, .)
			ref_pct_raindays = J(1, 0, .)
			ref_dry_start    = J(1, 0, .)
			ref_dry          = J(1, 0, .)
			ref_dry_end      = J(1, 0, .)
		}
		else {
			ref_gdd          = J(1, 0, .)
			ref_kdd          = J(1, 0, .)
			ref_heatdays     = J(1, 0, .)
			ref_pct_heatdays = J(1, 0, .)
			ref_heat_start   = J(1, 0, .)
			ref_heat         = J(1, 0, .)
			ref_heat_end     = J(1, 0, .)
		}
		
		if (!is_baseline) {
			// Rolling reference
			for (l = 1; l <= lr_years; l++) {
				s_ref = _wxsum_shift_date(s_i, l)
				e_ref = _wxsum_shift_date(e_i, l)
				
				if (!has_partial && (s_ref < D_min || e_ref > D_max)) continue
				s_ref_use = (has_partial ? max((s_ref, D_min)) : s_ref)
				e_ref_use = (has_partial ? min((e_ref, D_max)) : e_ref)
				if (s_ref_use > e_ref_use) continue
				
				cols_ref = select(1..length(d_dates), (d_dates :>= s_ref_use :& d_dates :<= e_ref_use))
				if (length(cols_ref) == 0) continue
				
				row_ref = X_all[i, cols_ref]
				yms_ref = d_ym[cols_ref]
				nobs_ref = rownonmissing(row_ref)
				if (nobs_ref < minobs) continue
				
				vals_ref = select(row_ref, (row_ref :< .))
				if (type == "rain") {
					v_tot = sum(vals_ref)
					v_norain = sum(vals_ref :< rain_thresh)
					v_raindays = sum(vals_ref :>= rain_thresh)
					v_pct_raindays = (nobs_ref > 0 ? v_raindays / nobs_ref : .)
					
					unique_yms = uniqrows(yms_ref')'
					m_tot_ref = J(1, length(unique_yms), .)
					for (m = 1; m <= length(unique_yms); m++) {
						cols_ym = select(1..length(cols_ref), (yms_ref :== unique_yms[m]))
						if (sum(row_ref[cols_ym] :< .) > 0) {
							m_tot_ref[m] = sum(select(row_ref[cols_ym], (row_ref[cols_ym] :< .)))
						}
					}
					nonmiss_m_ref = select(m_tot_ref, (m_tot_ref :< .))
					
					_wxsum_calc_spells(row_ref, rain_thresh, 0, nobs_ref, sp_s=., sp_m=., sp_e=.)
					
					ref_tot          = ref_tot, v_tot
					ref_raindays     = ref_raindays, v_raindays
					ref_norain       = ref_norain, v_norain
					ref_pct_raindays = ref_pct_raindays, v_pct_raindays
					if (length(nonmiss_m_ref) > 0) {
						ref_mean_mo  = ref_mean_mo, mean(nonmiss_m_ref')
					}
					else {
						ref_mean_mo  = ref_mean_mo, .
					}
					ref_dry_start    = ref_dry_start, sp_s[1]
					ref_dry          = ref_dry, sp_m[1]
					ref_dry_end      = ref_dry_end, sp_e[1]
				}
				else {
					v_gdd = 0
					v_kdd = 0
					for (d_idx = 1; d_idx <= length(vals_ref); d_idx++) {
						v_d = vals_ref[d_idx]
						v_gdd = v_gdd + min((max((v_d - gdd_lo, 0)), gdd_hi - gdd_lo))
						v_kdd = v_kdd + max((v_d - kdd_base, 0))
					}
					v_heatdays = sum(vals_ref :>= heat_thresh)
					v_pct_heatdays = (nobs_ref > 0 ? v_heatdays / nobs_ref : .)
					
					_wxsum_calc_spells(row_ref, heat_thresh, 1, nobs_ref, sp_s=., sp_m=., sp_e=.)
					
					ref_gdd          = ref_gdd, v_gdd
					ref_kdd          = ref_kdd, v_kdd
					ref_heatdays     = ref_heatdays, v_heatdays
					ref_pct_heatdays = ref_pct_heatdays, v_pct_heatdays
					ref_heat_start   = ref_heat_start, sp_s[1]
					ref_heat         = ref_heat, sp_m[1]
					ref_heat_end     = ref_heat_end, sp_e[1]
				}
			}
		}
		else {
			// Fixed baseline reference
			delta_y = year(e_i) - year(s_i)
			for (y = base_y1; y <= base_y2; y++) {
				s_ref = _wxsum_baseline_date(s_i, y)
				e_ref = _wxsum_baseline_date(e_i, y + delta_y)
				
				if (!has_partial && (s_ref < D_min || e_ref > D_max)) continue
				s_ref_use = (has_partial ? max((s_ref, D_min)) : s_ref)
				e_ref_use = (has_partial ? min((e_ref, D_max)) : e_ref)
				if (s_ref_use > e_ref_use) continue
				
				cols_ref = select(1..length(d_dates), (d_dates :>= s_ref_use :& d_dates :<= e_ref_use))
				if (length(cols_ref) == 0) continue
				
				row_ref = X_all[i, cols_ref]
				yms_ref = d_ym[cols_ref]
				nobs_ref = rownonmissing(row_ref)
				if (nobs_ref < minobs) continue
				
				vals_ref = select(row_ref, (row_ref :< .))
				if (type == "rain") {
					v_tot = sum(vals_ref)
					v_norain = sum(vals_ref :< rain_thresh)
					v_raindays = sum(vals_ref :>= rain_thresh)
					v_pct_raindays = (nobs_ref > 0 ? v_raindays / nobs_ref : .)
					
					unique_yms = uniqrows(yms_ref')'
					m_tot_ref = J(1, length(unique_yms), .)
					for (m = 1; m <= length(unique_yms); m++) {
						cols_ym = select(1..length(cols_ref), (yms_ref :== unique_yms[m]))
						if (sum(row_ref[cols_ym] :< .) > 0) {
							m_tot_ref[m] = sum(select(row_ref[cols_ym], (row_ref[cols_ym] :< .)))
						}
					}
					nonmiss_m_ref = select(m_tot_ref, (m_tot_ref :< .))
					
					_wxsum_calc_spells(row_ref, rain_thresh, 0, nobs_ref, sp_s=., sp_m=., sp_e=.)
					
					ref_tot          = ref_tot, v_tot
					ref_raindays     = ref_raindays, v_raindays
					ref_norain       = ref_norain, v_norain
					ref_pct_raindays = ref_pct_raindays, v_pct_raindays
					if (length(nonmiss_m_ref) > 0) {
						ref_mean_mo  = ref_mean_mo, mean(nonmiss_m_ref')
					}
					else {
						ref_mean_mo  = ref_mean_mo, .
					}
					ref_dry_start    = ref_dry_start, sp_s[1]
					ref_dry          = ref_dry, sp_m[1]
					ref_dry_end      = ref_dry_end, sp_e[1]
				}
				else {
					v_gdd = 0
					v_kdd = 0
					for (d_idx = 1; d_idx <= length(vals_ref); d_idx++) {
						v_d = vals_ref[d_idx]
						v_gdd = v_gdd + min((max((v_d - gdd_lo, 0)), gdd_hi - gdd_lo))
						v_kdd = v_kdd + max((v_d - kdd_base, 0))
					}
					v_heatdays = sum(vals_ref :>= heat_thresh)
					v_pct_heatdays = (nobs_ref > 0 ? v_heatdays / nobs_ref : .)
					
					_wxsum_calc_spells(row_ref, heat_thresh, 1, nobs_ref, sp_s=., sp_m=., sp_e=.)
					
					ref_gdd          = ref_gdd, v_gdd
					ref_kdd          = ref_kdd, v_kdd
					ref_heatdays     = ref_heatdays, v_heatdays
					ref_pct_heatdays = ref_pct_heatdays, v_pct_heatdays
					ref_heat_start   = ref_heat_start, sp_s[1]
					ref_heat         = ref_heat, sp_m[1]
					ref_heat_end     = ref_heat_end, sp_e[1]
				}
			}
		}
		
		// Compute deviations and z-scores
		if (type == "rain") {
			_wxsum_compute_dev_z(tot_v[i], ref_tot', ref_min, dev_val=., z_val=.)
			dev_tot_v[i] = dev_val; z_tot_v[i] = z_val
			
			_wxsum_compute_dev_z(mean_mo_v[i], ref_mean_mo', ref_min, dev_val=., z_val=.)
			dev_mean_mo_v[i] = dev_val; z_mean_mo_v[i] = z_val
			
			_wxsum_compute_dev_z(raindays_v[i], ref_raindays', ref_min, dev_val=., z_val=.)
			dev_raindays_v[i] = dev_val; z_raindays_v[i] = z_val
			
			_wxsum_compute_dev_z(norain_v[i], ref_norain', ref_min, dev_val=., z_val=.)
			dev_norain_v[i] = dev_val; z_norain_v[i] = z_val
			
			_wxsum_compute_dev_z(pct_raindays_v[i], ref_pct_raindays', ref_min, dev_val=., z_val=.)
			dev_pct_raindays_v[i] = dev_val; z_pct_raindays_v[i] = z_val
			
			_wxsum_compute_dev_z(dry_start_v[i], ref_dry_start', ref_min, dev_val=., z_val=.)
			dev_dry_start_v[i] = dev_val; z_dry_start_v[i] = z_val
			
			_wxsum_compute_dev_z(dry_v[i], ref_dry', ref_min, dev_val=., z_val=.)
			dev_dry_v[i] = dev_val; z_dry_v[i] = z_val
			
			_wxsum_compute_dev_z(dry_end_v[i], ref_dry_end', ref_min, dev_val=., z_val=.)
			dev_dry_end_v[i] = dev_val; z_dry_end_v[i] = z_val
		}
		else {
			_wxsum_compute_dev_z(gdd_v[i], ref_gdd', ref_min, dev_val=., z_val=.)
			dev_gdd_v[i] = dev_val; z_gdd_v[i] = z_val
			
			_wxsum_compute_dev_z(kdd_v[i], ref_kdd', ref_min, dev_val=., z_val=.)
			dev_kdd_v[i] = dev_val; z_kdd_v[i] = z_val
			
			_wxsum_compute_dev_z(heatdays_v[i], ref_heatdays', ref_min, dev_val=., z_val=.)
			dev_heatdays_v[i] = dev_val; z_heatdays_v[i] = z_val
			
			_wxsum_compute_dev_z(pct_heatdays_v[i], ref_pct_heatdays', ref_min, dev_val=., z_val=.)
			dev_pct_heatdays_v[i] = dev_val; z_pct_heatdays_v[i] = z_val
			
			_wxsum_compute_dev_z(heat_start_v[i], ref_heat_start', ref_min, dev_val=., z_val=.)
			dev_heat_start_v[i] = dev_val; z_heat_start_v[i] = z_val
			
			_wxsum_compute_dev_z(heat_v[i], ref_heat', ref_min, dev_val=., z_val=.)
			dev_heat_v[i] = dev_val; z_heat_v[i] = z_val
			
			_wxsum_compute_dev_z(heat_end_v[i], ref_heat_end', ref_min, dev_val=., z_val=.)
			dev_heat_end_v[i] = dev_val; z_heat_end_v[i] = z_val
		}
	}

	// STORE OUTPUT VARIABLES IN STATA
	v_idx = st_addvar("int", outstub + "nobs")
	st_store(., v_idx, nobs_v)
	
	v_idx = st_addvar("float", outstub + "mean")
	st_store(., v_idx, mean_v)
	
	v_idx = st_addvar("float", outstub + "median")
	st_store(., v_idx, med_v)
	
	v_idx = st_addvar("float", outstub + "var")
	st_store(., v_idx, var_v)
	
	v_idx = st_addvar("float", outstub + "sd")
	st_store(., v_idx, sd_v)
	
	v_idx = st_addvar("float", outstub + "skew")
	st_store(., v_idx, skew_v)
	
	if (type == "rain") {
		v_idx = st_addvar("float", outstub + "mean_mo")
		st_store(., v_idx, mean_mo_v)
		
		v_idx = st_addvar("float", outstub + "dev_mean_mo")
		st_store(., v_idx, dev_mean_mo_v)
		
		v_idx = st_addvar("float", outstub + "z_mean_mo")
		st_store(., v_idx, z_mean_mo_v)
		
		v_idx = st_addvar("float", outstub + "total")
		st_store(., v_idx, tot_v)
		
		v_idx = st_addvar("float", outstub + "dev_total")
		st_store(., v_idx, dev_tot_v)
		
		v_idx = st_addvar("float", outstub + "z_total")
		st_store(., v_idx, z_tot_v)
		
		v_idx = st_addvar("int", outstub + "raindays")
		st_store(., v_idx, raindays_v)
		
		v_idx = st_addvar("float", outstub + "dev_raindays")
		st_store(., v_idx, dev_raindays_v)
		
		v_idx = st_addvar("float", outstub + "z_raindays")
		st_store(., v_idx, z_raindays_v)
		
		v_idx = st_addvar("int", outstub + "norain")
		st_store(., v_idx, norain_v)
		
		v_idx = st_addvar("float", outstub + "dev_norain")
		st_store(., v_idx, dev_norain_v)
		
		v_idx = st_addvar("float", outstub + "z_norain")
		st_store(., v_idx, z_norain_v)
		
		v_idx = st_addvar("float", outstub + "pct_raindays")
		st_store(., v_idx, pct_raindays_v)
		
		v_idx = st_addvar("float", outstub + "dev_pct_raindays")
		st_store(., v_idx, dev_pct_raindays_v)
		
		v_idx = st_addvar("float", outstub + "z_pct_raindays")
		st_store(., v_idx, z_pct_raindays_v)
		
		v_idx = st_addvar("int", outstub + "dry_start")
		st_store(., v_idx, dry_start_v)
		
		v_idx = st_addvar("float", outstub + "dev_dry_start")
		st_store(., v_idx, dev_dry_start_v)
		
		v_idx = st_addvar("float", outstub + "z_dry_start")
		st_store(., v_idx, z_dry_start_v)
		
		v_idx = st_addvar("int", outstub + "dry")
		st_store(., v_idx, dry_v)
		
		v_idx = st_addvar("float", outstub + "dev_dry")
		st_store(., v_idx, dev_dry_v)
		
		v_idx = st_addvar("float", outstub + "z_dry")
		st_store(., v_idx, z_dry_v)
		
		v_idx = st_addvar("int", outstub + "dry_end")
		st_store(., v_idx, dry_end_v)
		
		v_idx = st_addvar("float", outstub + "dev_dry_end")
		st_store(., v_idx, dev_dry_end_v)
		
		v_idx = st_addvar("float", outstub + "z_dry_end")
		st_store(., v_idx, z_dry_end_v)
	}
	else {
		v_idx = st_addvar("float", outstub + "max")
		st_store(., v_idx, max_v)
		
		v_idx = st_addvar("float", outstub + "gdd")
		st_store(., v_idx, gdd_v)
		
		v_idx = st_addvar("float", outstub + "dev_gdd")
		st_store(., v_idx, dev_gdd_v)
		
		v_idx = st_addvar("float", outstub + "z_gdd")
		st_store(., v_idx, z_gdd_v)
		
		v_idx = st_addvar("float", outstub + "kdd")
		st_store(., v_idx, kdd_v)
		
		v_idx = st_addvar("float", outstub + "dev_kdd")
		st_store(., v_idx, dev_kdd_v)
		
		v_idx = st_addvar("float", outstub + "z_kdd")
		st_store(., v_idx, z_kdd_v)
		
		v_idx = st_addvar("int", outstub + "heatdays")
		st_store(., v_idx, heatdays_v)
		
		v_idx = st_addvar("float", outstub + "dev_heatdays")
		st_store(., v_idx, dev_heatdays_v)
		
		v_idx = st_addvar("float", outstub + "z_heatdays")
		st_store(., v_idx, z_heatdays_v)
		
		v_idx = st_addvar("float", outstub + "pct_heatdays")
		st_store(., v_idx, pct_heatdays_v)
		
		v_idx = st_addvar("float", outstub + "dev_pct_heatdays")
		st_store(., v_idx, dev_pct_heatdays_v)
		
		v_idx = st_addvar("float", outstub + "z_pct_heatdays")
		st_store(., v_idx, z_pct_heatdays_v)
		
		v_idx = st_addvar("int", outstub + "heat_start")
		st_store(., v_idx, heat_start_v)
		
		v_idx = st_addvar("float", outstub + "dev_heat_start")
		st_store(., v_idx, dev_heat_start_v)
		
		v_idx = st_addvar("float", outstub + "z_heat_start")
		st_store(., v_idx, z_heat_start_v)
		
		v_idx = st_addvar("int", outstub + "heat")
		st_store(., v_idx, heat_v)
		
		v_idx = st_addvar("float", outstub + "dev_heat")
		st_store(., v_idx, dev_heat_v)
		
		v_idx = st_addvar("float", outstub + "z_heat")
		st_store(., v_idx, z_heat_v)
		
		v_idx = st_addvar("int", outstub + "heat_end")
		st_store(., v_idx, heat_end_v)
		
		v_idx = st_addvar("float", outstub + "dev_heat_end")
		st_store(., v_idx, dev_heat_end_v)
		
		v_idx = st_addvar("float", outstub + "z_heat_end")
		st_store(., v_idx, z_heat_end_v)
		
		if (has_gdd_bin) {
			v_idx = st_addvar("int", outstub + "gddcat")
			st_store(., v_idx, M_gddcat)
			_wxsum_apply_gddcat_lbl(gddcat_info, outstub, "long", J(1, 0, .))
		}
		
		if (has_tmp_bin) {
			for (b = 1; b <= tb_J; b++) {
				vname = outstub + sprintf("tmpbin%02.0f", b)
				v_idx = st_addvar("int", vname)
				st_store(., v_idx, M_tmp_bin[., b])
			}
		}
	}
	
	if (has_cuts) {
		for (b = 1; b <= n_cuts + 1; b++) {
			vname = outstub + sprintf("cut%02.0f", b)
			v_idx = st_addvar("int", vname)
			st_store(., v_idx, M_cuts[., b])
		}
	}

	// Store r(missing) matrix: 1 row, 7 columns
	miss_mat = J(1, 7, .)
	val_days = select(days_v, (days_v :< .))
	miss_mat[1, 1] = (length(val_days) > 0 ? mean(val_days) : .)
	
	val_nobs = select(nobs_v, (nobs_v :< .))
	miss_mat[1, 2] = (length(val_nobs) > 0 ? mean(val_nobs) : .)
	
	valid_idx = select((1..N)', (days_v :< .))
	if (length(valid_idx) > 0) {
		miss_mat[1, 3] = mean(nobs_v[valid_idx] :< days_v[valid_idx])
		miss_mat[1, 4] = mean(nobs_v[valid_idx] :== 0)
	}
	else {
		miss_mat[1, 3] = .
		miss_mat[1, 4] = .
	}
	miss_mat[1, 5] = n_minobs_count
	miss_mat[1, 6] = n_outside
	miss_mat[1, 7] = n_missing_dates
	
	col_names = ("mean_days" \ "mean_nobs" \ "share_any_miss" \ "share_all_miss" \ "n_minobs" \ "n_outside" \ "n_missing_dates")
	row_names = ("unit")
	
	if (args() >= 1 && mmat_name != "") {
		st_matrix(mmat_name, miss_mat)
		st_matrixcolstripe(mmat_name, (J(7, 1, ""), col_names))
		st_matrixrowstripe(mmat_name, (J(1, 1, ""), row_names))
	}
	else {
		st_matrix("r(missing)", miss_mat)
		st_matrixcolstripe("r(missing)", (J(7, 1, ""), col_names))
		st_matrixrowstripe("r(missing)", (J(1, 1, ""), row_names))
	}
}

// MAIN MATA COORDINATOR
void _wxsum_engine(| string scalar mmat_name)
{
	if (st_local("mode") == "unit") {
		_wxsum_engine_unit(mmat_name)
		return
	}

	real scalar N, W, all_k, k, p_len, y, m, d, dt, ord, v_idx
	real scalar w, i, minobs, rain_thresh, gdd_lo, gdd_hi, heat_thresh, kdd_base
	real scalar lr_years, ref_min, is_baseline, base_y1, base_y2
	real scalar has_tmp_bin, tb_J, tb_lo, tb_hi, tb_width, elo, ehi
	real scalar has_gdd_bin, gb_bin, has_gb_lo, gb_lo, has_gb_hi, gb_hi
	real scalar has_cuts, n_cuts, K_plus, b, d_w
	real scalar d_idx, v_d, gdd_sum, kdd_sum, has_ref_w, K_w_count, K_base_count
	real rowvector daily_indices, d_dates, d_ym, cols_w, yms_w, unique_yms, cols_ym
	real rowvector row, cuts, m_totals, nonmiss_m, gddcat_info, vals
	real rowvector season_years, w_starts, w_ends, w_days_count
	real colvector nobs_w, mean_w, med_w, var_w, sd_w, skew_w
	real colvector tot_w, mean_mo_w, raindays_w, norain_w, pct_raindays_w
	real colvector dry_start_w, dry_w, dry_end_w
	real colvector max_w, gdd_w, kdd_w
	real colvector heatdays_w, pct_heatdays_w, heat_start_w, heat_w, heat_end_w
	real matrix X_all, X_w, miss_mat, cur_bin, M_tmp_bin, M_cuts
	string scalar prefix, vname, sfx, type, shape, outstub, yr, keep_vars
	string rowvector rownames
	
	// Matrices for all statistics (N x W)
	real matrix M_mean, M_med, M_var, M_sd, M_skew, M_nobs
	real matrix M_total, M_dev_total, M_z_total
	real matrix M_mean_mo, M_dev_mean_mo, M_z_mean_mo
	real matrix M_raindays, M_dev_raindays, M_z_raindays
	real matrix M_norain, M_dev_norain, M_z_norain
	real matrix M_pct_raindays, M_dev_pct_raindays, M_z_pct_raindays
	real matrix M_dry_start, M_dev_dry_start, M_z_dry_start
	real matrix M_dry, M_dev_dry, M_z_dry
	real matrix M_dry_end, M_dev_dry_end, M_z_dry_end
	real matrix M_max, M_gdd, M_dev_gdd, M_z_gdd, M_kdd, M_dev_kdd, M_z_kdd, M_gddcat
	real matrix M_heatdays, M_dev_heatdays, M_z_heatdays
	real matrix M_pct_heatdays, M_dev_pct_heatdays, M_z_pct_heatdays
	real matrix M_heat_start, M_dev_heat_start, M_z_heat_start
	real matrix M_heat, M_dev_heat, M_z_heat
	real matrix M_heat_end, M_dev_heat_end, M_z_heat_end
	
	// Read parameters from Stata locals
	type         = st_local("type")
	shape        = st_local("shape")
	outstub      = st_local("outstub")
	prefix       = st_local("prefix")
	p_len        = strlen(prefix)
	keep_vars    = st_local("keep")
	
	minobs       = strtoreal(st_local("minobs"))
	rain_thresh  = strtoreal(st_local("rain_threshold"))
	gdd_lo       = strtoreal(st_local("gdd_lo"))
	gdd_hi       = strtoreal(st_local("gdd_hi"))
	heat_thresh  = strtoreal(st_local("heat_threshold"))
	kdd_base     = strtoreal(st_local("kdd_base"))
	
	lr_years     = strtoreal(st_local("lr_years"))
	ref_min      = strtoreal(st_local("ref_min"))
	is_baseline  = strtoreal(st_local("is_baseline"))
	base_y1      = strtoreal(st_local("base_y1"))
	base_y2      = strtoreal(st_local("base_y2"))
	
	has_tmp_bin  = strtoreal(st_local("has_tmp_bin"))
	tb_J         = strtoreal(st_local("tmp_bin"))
	tb_lo        = strtoreal(st_local("tmp_binlo"))
	tb_hi        = strtoreal(st_local("tmp_binhi"))
	
	has_gdd_bin  = strtoreal(st_local("has_gdd_bin"))
	gb_bin       = strtoreal(st_local("gdd_bin"))
	has_gb_lo    = strtoreal(st_local("has_gdd_binlo"))
	gb_lo        = strtoreal(st_local("gdd_binlo"))
	has_gb_hi    = strtoreal(st_local("has_gdd_binhi"))
	gb_hi        = strtoreal(st_local("gdd_binhi"))
	
	has_cuts     = strtoreal(st_local("has_cuts"))
	if (has_cuts) {
		cuts     = strtoreal(tokens(st_local("cuts")))
		n_cuts   = length(cuts)
	}
	else {
		cuts     = J(1, 0, .)
		n_cuts   = 0
	}
	
	season_years = strtoreal(tokens(st_local("season_years")))
	w_starts     = strtoreal(tokens(st_local("w_starts")))
	w_ends       = strtoreal(tokens(st_local("w_ends")))
	w_days_count = strtoreal(tokens(st_local("w_days_count")))
	
	N = st_nobs()
	W = length(season_years)
	
	// Scan Stata variables matching prefix + yyyymmdd
	all_k = st_nvar()
	daily_indices = J(1, 0, .)
	d_dates = J(1, 0, .)
	d_ym = J(1, 0, .)
	
	for (k = 1; k <= all_k; k++) {
		vname = st_varname(k)
		if (substr(vname, 1, p_len) == prefix) {
			sfx = substr(vname, p_len + 1, .)
			if (strlen(sfx) == 8 && st_isnumvar(k)) {
				y = strtoreal(substr(sfx, 1, 4))
				m = strtoreal(substr(sfx, 5, 2))
				d = strtoreal(substr(sfx, 7, 2))
				if (y < . && m >= 1 && m <= 12 && d >= 1 && d <= 31) {
					dt = mdy(m, d, y)
					if (dt < .) {
						daily_indices = daily_indices, k
						d_dates = d_dates, dt
						d_ym = d_ym, (y * 100 + m)
					}
				}
			}
		}
	}
	
	// Sort by date
	ord = order(d_dates', 1)'
	daily_indices = daily_indices[ord]
	d_dates = d_dates[ord]
	d_ym = d_ym[ord]
	
	X_all = .
	st_view(X_all, ., daily_indices)
	
	// Initialize result matrices
	M_mean = J(N, W, .)
	M_med  = J(N, W, .)
	M_var  = J(N, W, .)
	M_sd   = J(N, W, .)
	M_skew = J(N, W, .)
	M_nobs = J(N, W, .)
	
	if (type == "rain") {
		M_total        = J(N, W, .)
		M_mean_mo      = J(N, W, .)
		M_raindays     = J(N, W, .)
		M_norain       = J(N, W, .)
		M_pct_raindays = J(N, W, .)
		M_dry_start    = J(N, W, .)
		M_dry          = J(N, W, .)
		M_dry_end      = J(N, W, .)
	}
	else {
		M_max          = J(N, W, .)
		M_gdd          = J(N, W, .)
		M_kdd          = J(N, W, .)
		M_heatdays     = J(N, W, .)
		M_pct_heatdays = J(N, W, .)
		M_heat_start   = J(N, W, .)
		M_heat         = J(N, W, .)
		M_heat_end     = J(N, W, .)
		if (has_tmp_bin) {
			M_tmp_bin  = J(N, tb_J * W, .)
		}
	}
	if (has_cuts) {
		M_cuts         = J(N, (n_cuts + 1) * W, .)
	}
	
	// Compute each window
	for (w = 1; w <= W; w++) {
		cols_w = select(1..length(d_dates), (d_dates :>= w_starts[w] :& d_dates :<= w_ends[w]))
		if (length(cols_w) == 0) continue
		
		X_w = X_all[., cols_w]
		
		// Distribution moments
		_wxsum_calc_moments(X_w, nobs_w=., mean_w=., med_w=., var_w=., sd_w=., skew_w=.)
		
		for (i = 1; i <= N; i++) {
			if (nobs_w[i] < minobs) {
				mean_w[i] = .
				med_w[i]  = .
				var_w[i]  = .
				sd_w[i]   = .
				skew_w[i] = .
			}
		}
		
		M_nobs[., w] = nobs_w
		M_mean[., w] = mean_w
		M_med[., w]  = med_w
		M_var[., w]  = var_w
		M_sd[., w]   = sd_w
		M_skew[., w] = skew_w
		
		if (type == "rain") {
			tot_w          = J(N, 1, .)
			mean_mo_w      = J(N, 1, .)
			raindays_w     = J(N, 1, .)
			norain_w       = J(N, 1, .)
			pct_raindays_w = J(N, 1, .)
			
			yms_w = d_ym[cols_w]
			unique_yms = uniqrows(yms_w')'
			
			for (i = 1; i <= N; i++) {
				if (nobs_w[i] < minobs) continue
				
				row = X_w[i, .]
				tot_w[i] = sum(select(row, (row :< .)))
				norain_w[i] = sum((row :< rain_thresh) :* (row :< .))
				raindays_w[i] = sum((row :>= rain_thresh) :* (row :< .))
				if (nobs_w[i] > 0) {
					pct_raindays_w[i] = raindays_w[i] / nobs_w[i]
				}
				
				m_totals = J(1, length(unique_yms), .)
				for (m = 1; m <= length(unique_yms); m++) {
					cols_ym = select(1..length(cols_w), (yms_w :== unique_yms[m]))
					if (sum(row[cols_ym] :< .) > 0) {
						m_totals[m] = sum(select(row[cols_ym], (row[cols_ym] :< .)))
					}
				}
				nonmiss_m = select(m_totals, (m_totals :< .))
				if (length(nonmiss_m) > 0) {
					mean_mo_w[i] = mean(nonmiss_m')
				}
			}
			
			_wxsum_calc_spells(X_w, rain_thresh, 0, nobs_w, dry_start_w=., dry_w=., dry_end_w=.)
			for (i = 1; i <= N; i++) {
				if (nobs_w[i] < minobs) {
					dry_start_w[i] = .
					dry_w[i]       = .
					dry_end_w[i]   = .
				}
			}
			
			M_total[., w]        = tot_w
			M_mean_mo[., w]      = mean_mo_w
			M_raindays[., w]     = raindays_w
			M_norain[., w]       = norain_w
			M_pct_raindays[., w] = pct_raindays_w
			M_dry_start[., w]    = dry_start_w
			M_dry[., w]          = dry_w
			M_dry_end[., w]      = dry_end_w
		}
		else {
			max_w          = J(N, 1, .)
			gdd_w          = J(N, 1, .)
			kdd_w          = J(N, 1, .)
			heatdays_w     = J(N, 1, .)
			pct_heatdays_w = J(N, 1, .)
			
			for (i = 1; i <= N; i++) {
				if (nobs_w[i] < minobs) continue
				
				row = X_w[i, .]
				vals = select(row, (row :< .))
				max_w[i] = max(vals)
				
				// Clamped GDD: min(max(T - gdd_lo, 0), gdd_hi - gdd_lo)
				// Clamped KDD: max(T - kdd_base, 0)
				gdd_sum = 0
				kdd_sum = 0
				for (d_idx = 1; d_idx <= length(vals); d_idx++) {
					v_d = vals[d_idx]
					gdd_sum = gdd_sum + min((max((v_d - gdd_lo, 0)), gdd_hi - gdd_lo))
					kdd_sum = kdd_sum + max((v_d - kdd_base, 0))
				}
				gdd_w[i] = gdd_sum
				kdd_w[i] = kdd_sum
				heatdays_w[i] = sum((row :>= heat_thresh) :* (row :< .))
				if (nobs_w[i] > 0) {
					pct_heatdays_w[i] = heatdays_w[i] / nobs_w[i]
				}
			}
			
			_wxsum_calc_spells(X_w, heat_thresh, 1, nobs_w, heat_start_w=., heat_w=., heat_end_w=.)
			for (i = 1; i <= N; i++) {
				if (nobs_w[i] < minobs) {
					heat_start_w[i] = .
					heat_w[i]       = .
					heat_end_w[i]   = .
				}
			}
			
			M_max[., w]          = max_w
			M_gdd[., w]          = gdd_w
			M_kdd[., w]          = kdd_w
			M_heatdays[., w]     = heatdays_w
			M_pct_heatdays[., w] = pct_heatdays_w
			M_heat_start[., w]   = heat_start_w
			M_heat[., w]         = heat_w
			M_heat_end[., w]     = heat_end_w
			
			if (has_tmp_bin) {
				if (tb_J == 1) {
					for (i = 1; i <= N; i++) {
						if (nobs_w[i] >= minobs) M_tmp_bin[i, w] = nobs_w[i]
					}
				}
				else if (tb_J == 2) {
					for (i = 1; i <= N; i++) {
						if (nobs_w[i] < minobs) continue
						row = X_w[i, .]
						M_tmp_bin[i, w] = sum((row :< (tb_lo + tb_hi)/2) :* (row :< .))
						M_tmp_bin[i, W + w] = sum((row :>= (tb_lo + tb_hi)/2) :* (row :< .))
					}
				}
				else {
					tb_width = (tb_hi - tb_lo) / (tb_J - 2)
					for (i = 1; i <= N; i++) {
						if (nobs_w[i] < minobs) continue
						row = X_w[i, .]
						for (b = 1; b <= tb_J; b++) {
							if (b == 1) {
								M_tmp_bin[i, (b - 1) * W + w] = sum((row :< tb_lo) :* (row :< .))
							}
							else if (b == tb_J) {
								M_tmp_bin[i, (b - 1) * W + w] = sum((row :>= tb_hi) :* (row :< .))
							}
							else {
								elo = tb_lo + (b - 2) * tb_width
								ehi = tb_lo + (b - 1) * tb_width
								M_tmp_bin[i, (b - 1) * W + w] = sum((row :>= elo) :* (row :< ehi) :* (row :< .))
							}
						}
					}
				}
			}
		}
		
		if (has_cuts) {
			K_plus = n_cuts + 1
			for (i = 1; i <= N; i++) {
				if (nobs_w[i] < minobs) continue
				row = X_w[i, .]
				for (b = 1; b <= K_plus; b++) {
					if (b == 1) {
						M_cuts[i, (b - 1) * W + w] = sum((row :< cuts[1]) :* (row :< .))
					}
					else if (b == K_plus) {
						M_cuts[i, (b - 1) * W + w] = sum((row :>= cuts[n_cuts]) :* (row :< .))
					}
					else {
						M_cuts[i, (b - 1) * W + w] = sum((row :>= cuts[b - 1]) :* (row :< cuts[b]) :* (row :< .))
					}
				}
			}
		}
	}
	
	// Reference calculations
	if (type == "rain") {
		_wxsum_calc_ref(M_total, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_total=., M_z_total=.)
		_wxsum_calc_ref(M_mean_mo, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_mean_mo=., M_z_mean_mo=.)
		_wxsum_calc_ref(M_raindays, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_raindays=., M_z_raindays=.)
		_wxsum_calc_ref(M_norain, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_norain=., M_z_norain=.)
		_wxsum_calc_ref(M_pct_raindays, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_pct_raindays=., M_z_pct_raindays=.)
		_wxsum_calc_ref(M_dry_start, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_dry_start=., M_z_dry_start=.)
		_wxsum_calc_ref(M_dry, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_dry=., M_z_dry=.)
		_wxsum_calc_ref(M_dry_end, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_dry_end=., M_z_dry_end=.)
	}
	else {
		_wxsum_calc_ref(M_gdd, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_gdd=., M_z_gdd=.)
		_wxsum_calc_ref(M_kdd, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_kdd=., M_z_kdd=.)
		_wxsum_calc_ref(M_heatdays, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_heatdays=., M_z_heatdays=.)
		_wxsum_calc_ref(M_pct_heatdays, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_pct_heatdays=., M_z_pct_heatdays=.)
		_wxsum_calc_ref(M_heat_start, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_heat_start=., M_z_heat_start=.)
		_wxsum_calc_ref(M_heat, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_heat=., M_z_heat=.)
		_wxsum_calc_ref(M_heat_end, season_years, is_baseline, lr_years, ref_min, base_y1, base_y2, M_dev_heat_end=., M_z_heat_end=.)
		
		if (has_gdd_bin) {
			_wxsum_calc_gddcat(M_gdd, gb_bin, has_gb_lo, gb_lo, has_gb_hi, gb_hi, M_gddcat=., gddcat_info=.)
		}
	}
	
	// STORE OUTPUT VARIABLES
	if (shape == "long") {
		// Expand in Stata
		stata("gen long _wxsum_orig_id = _n")
		if (keep_vars != "") {
			stata("quietly keep " + keep_vars + " _wxsum_orig_id")
		}
		else {
			stata("quietly keep _wxsum_orig_id")
		}
		stata("quietly expand " + strofreal(W))
		stata("quietly sort _wxsum_orig_id")
		stata("quietly by _wxsum_orig_id: gen int _wxsum_w_idx = _n")
		stata("quietly sort _wxsum_w_idx _wxsum_orig_id")
		stata("quietly gen int year = .")
		stata(`"label var year "Season year""')
		
		st_store(., st_varindex("year"), vec(J(N, 1, 1) * season_years))
		
		v_idx = st_addvar("int", outstub + "nobs")
		st_store(., v_idx, vec(M_nobs))
		
		v_idx = st_addvar("float", outstub + "mean")
		st_store(., v_idx, vec(M_mean))
		
		v_idx = st_addvar("float", outstub + "median")
		st_store(., v_idx, vec(M_med))
		
		v_idx = st_addvar("float", outstub + "var")
		st_store(., v_idx, vec(M_var))
		
		v_idx = st_addvar("float", outstub + "sd")
		st_store(., v_idx, vec(M_sd))
		
		v_idx = st_addvar("float", outstub + "skew")
		st_store(., v_idx, vec(M_skew))
		
		if (type == "rain") {
			v_idx = st_addvar("float", outstub + "mean_mo")
			st_store(., v_idx, vec(M_mean_mo))
			
			v_idx = st_addvar("float", outstub + "dev_mean_mo")
			st_store(., v_idx, vec(M_dev_mean_mo))
			
			v_idx = st_addvar("float", outstub + "z_mean_mo")
			st_store(., v_idx, vec(M_z_mean_mo))
			
			v_idx = st_addvar("float", outstub + "total")
			st_store(., v_idx, vec(M_total))
			
			v_idx = st_addvar("float", outstub + "dev_total")
			st_store(., v_idx, vec(M_dev_total))
			
			v_idx = st_addvar("float", outstub + "z_total")
			st_store(., v_idx, vec(M_z_total))
			
			v_idx = st_addvar("int", outstub + "raindays")
			st_store(., v_idx, vec(M_raindays))
			
			v_idx = st_addvar("float", outstub + "dev_raindays")
			st_store(., v_idx, vec(M_dev_raindays))
			
			v_idx = st_addvar("float", outstub + "z_raindays")
			st_store(., v_idx, vec(M_z_raindays))
			
			v_idx = st_addvar("int", outstub + "norain")
			st_store(., v_idx, vec(M_norain))
			
			v_idx = st_addvar("float", outstub + "dev_norain")
			st_store(., v_idx, vec(M_dev_norain))
			
			v_idx = st_addvar("float", outstub + "z_norain")
			st_store(., v_idx, vec(M_z_norain))
			
			v_idx = st_addvar("float", outstub + "pct_raindays")
			st_store(., v_idx, vec(M_pct_raindays))
			
			v_idx = st_addvar("float", outstub + "dev_pct_raindays")
			st_store(., v_idx, vec(M_dev_pct_raindays))
			
			v_idx = st_addvar("float", outstub + "z_pct_raindays")
			st_store(., v_idx, vec(M_z_pct_raindays))
			
			v_idx = st_addvar("int", outstub + "dry_start")
			st_store(., v_idx, vec(M_dry_start))
			
			v_idx = st_addvar("float", outstub + "dev_dry_start")
			st_store(., v_idx, vec(M_dev_dry_start))
			
			v_idx = st_addvar("float", outstub + "z_dry_start")
			st_store(., v_idx, vec(M_z_dry_start))
			
			v_idx = st_addvar("int", outstub + "dry")
			st_store(., v_idx, vec(M_dry))
			
			v_idx = st_addvar("float", outstub + "dev_dry")
			st_store(., v_idx, vec(M_dev_dry))
			
			v_idx = st_addvar("float", outstub + "z_dry")
			st_store(., v_idx, vec(M_z_dry))
			
			v_idx = st_addvar("int", outstub + "dry_end")
			st_store(., v_idx, vec(M_dry_end))
			
			v_idx = st_addvar("float", outstub + "dev_dry_end")
			st_store(., v_idx, vec(M_dev_dry_end))
			
			v_idx = st_addvar("float", outstub + "z_dry_end")
			st_store(., v_idx, vec(M_z_dry_end))
		}
		else {
			v_idx = st_addvar("float", outstub + "max")
			st_store(., v_idx, vec(M_max))
			
			v_idx = st_addvar("float", outstub + "gdd")
			st_store(., v_idx, vec(M_gdd))
			
			v_idx = st_addvar("float", outstub + "dev_gdd")
			st_store(., v_idx, vec(M_dev_gdd))
			
			v_idx = st_addvar("float", outstub + "z_gdd")
			st_store(., v_idx, vec(M_z_gdd))
			
			v_idx = st_addvar("float", outstub + "kdd")
			st_store(., v_idx, vec(M_kdd))
			
			v_idx = st_addvar("float", outstub + "dev_kdd")
			st_store(., v_idx, vec(M_dev_kdd))
			
			v_idx = st_addvar("float", outstub + "z_kdd")
			st_store(., v_idx, vec(M_z_kdd))
			
			v_idx = st_addvar("int", outstub + "heatdays")
			st_store(., v_idx, vec(M_heatdays))
			
			v_idx = st_addvar("float", outstub + "dev_heatdays")
			st_store(., v_idx, vec(M_dev_heatdays))
			
			v_idx = st_addvar("float", outstub + "z_heatdays")
			st_store(., v_idx, vec(M_z_heatdays))
			
			v_idx = st_addvar("float", outstub + "pct_heatdays")
			st_store(., v_idx, vec(M_pct_heatdays))
			
			v_idx = st_addvar("float", outstub + "dev_pct_heatdays")
			st_store(., v_idx, vec(M_dev_pct_heatdays))
			
			v_idx = st_addvar("float", outstub + "z_pct_heatdays")
			st_store(., v_idx, vec(M_z_pct_heatdays))
			
			v_idx = st_addvar("int", outstub + "heat_start")
			st_store(., v_idx, vec(M_heat_start))
			
			v_idx = st_addvar("float", outstub + "dev_heat_start")
			st_store(., v_idx, vec(M_dev_heat_start))
			
			v_idx = st_addvar("float", outstub + "z_heat_start")
			st_store(., v_idx, vec(M_z_heat_start))
			
			v_idx = st_addvar("int", outstub + "heat")
			st_store(., v_idx, vec(M_heat))
			
			v_idx = st_addvar("float", outstub + "dev_heat")
			st_store(., v_idx, vec(M_dev_heat))
			
			v_idx = st_addvar("float", outstub + "z_heat")
			st_store(., v_idx, vec(M_z_heat))
			
			v_idx = st_addvar("int", outstub + "heat_end")
			st_store(., v_idx, vec(M_heat_end))
			
			v_idx = st_addvar("float", outstub + "dev_heat_end")
			st_store(., v_idx, vec(M_dev_heat_end))
			
			v_idx = st_addvar("float", outstub + "z_heat_end")
			st_store(., v_idx, vec(M_z_heat_end))
			
			if (has_gdd_bin) {
				v_idx = st_addvar("int", outstub + "gddcat")
				st_store(., v_idx, vec(M_gddcat))
			}
			
			if (has_tmp_bin) {
				for (b = 1; b <= tb_J; b++) {
					vname = outstub + sprintf("tmpbin%02.0f", b)
					cur_bin = M_tmp_bin[., (b - 1) * W + 1 .. b * W]
					v_idx = st_addvar("int", vname)
					st_store(., v_idx, vec(cur_bin))
				}
			}
		}
		
		if (has_cuts) {
			for (b = 1; b <= n_cuts + 1; b++) {
				vname = outstub + sprintf("cut%02.0f", b)
				cur_bin = M_cuts[., (b - 1) * W + 1 .. b * W]
				v_idx = st_addvar("int", vname)
				st_store(., v_idx, vec(cur_bin))
			}
		}
		stata("drop _wxsum_orig_id _wxsum_w_idx")
	}
	else {
		// Wide mode
		for (w = 1; w <= W; w++) {
			y = season_years[w]
			yr = sprintf("_%04.0f", y)
			
			has_ref_w = 0
			if (!is_baseline) {
				K_w_count = 0
				for (k = 1; k <= W; k++) {
					if (season_years[k] >= season_years[w] - lr_years && season_years[k] <= season_years[w] - 1) {
						K_w_count++
					}
				}
				if (K_w_count >= ref_min) has_ref_w = 1
			}
			else {
				K_base_count = 0
				for (k = 1; k <= W; k++) {
					if (season_years[k] >= base_y1 && season_years[k] <= base_y2) {
						K_base_count++
					}
				}
				if (K_base_count >= ref_min) has_ref_w = 1
			}
			
			v_idx = st_addvar("int", outstub + "nobs" + yr)
			st_store(., v_idx, M_nobs[., w])
			
			v_idx = st_addvar("float", outstub + "mean" + yr)
			st_store(., v_idx, M_mean[., w])
			
			v_idx = st_addvar("float", outstub + "median" + yr)
			st_store(., v_idx, M_med[., w])
			
			v_idx = st_addvar("float", outstub + "var" + yr)
			st_store(., v_idx, M_var[., w])
			
			v_idx = st_addvar("float", outstub + "sd" + yr)
			st_store(., v_idx, M_sd[., w])
			
			v_idx = st_addvar("float", outstub + "skew" + yr)
			st_store(., v_idx, M_skew[., w])
			
			if (type == "rain") {
				v_idx = st_addvar("float", outstub + "mean_mo" + yr)
				st_store(., v_idx, M_mean_mo[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_mean_mo" + yr)
					st_store(., v_idx, M_dev_mean_mo[., w])
					
					v_idx = st_addvar("float", outstub + "z_mean_mo" + yr)
					st_store(., v_idx, M_z_mean_mo[., w])
				}
				
				v_idx = st_addvar("float", outstub + "total" + yr)
				st_store(., v_idx, M_total[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_total" + yr)
					st_store(., v_idx, M_dev_total[., w])
					
					v_idx = st_addvar("float", outstub + "z_total" + yr)
					st_store(., v_idx, M_z_total[., w])
				}
				
				v_idx = st_addvar("int", outstub + "raindays" + yr)
				st_store(., v_idx, M_raindays[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_raindays" + yr)
					st_store(., v_idx, M_dev_raindays[., w])
					
					v_idx = st_addvar("float", outstub + "z_raindays" + yr)
					st_store(., v_idx, M_z_raindays[., w])
				}
				
				v_idx = st_addvar("int", outstub + "norain" + yr)
				st_store(., v_idx, M_norain[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_norain" + yr)
					st_store(., v_idx, M_dev_norain[., w])
					
					v_idx = st_addvar("float", outstub + "z_norain" + yr)
					st_store(., v_idx, M_z_norain[., w])
				}
				
				v_idx = st_addvar("float", outstub + "pct_raindays" + yr)
				st_store(., v_idx, M_pct_raindays[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_pct_raindays" + yr)
					st_store(., v_idx, M_dev_pct_raindays[., w])
					
					v_idx = st_addvar("float", outstub + "z_pct_raindays" + yr)
					st_store(., v_idx, M_z_pct_raindays[., w])
				}
				
				v_idx = st_addvar("int", outstub + "dry_start" + yr)
				st_store(., v_idx, M_dry_start[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_dry_start" + yr)
					st_store(., v_idx, M_dev_dry_start[., w])
					
					v_idx = st_addvar("float", outstub + "z_dry_start" + yr)
					st_store(., v_idx, M_z_dry_start[., w])
				}
				
				v_idx = st_addvar("int", outstub + "dry" + yr)
				st_store(., v_idx, M_dry[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_dry" + yr)
					st_store(., v_idx, M_dev_dry[., w])
					
					v_idx = st_addvar("float", outstub + "z_dry" + yr)
					st_store(., v_idx, M_z_dry[., w])
				}
				
				v_idx = st_addvar("int", outstub + "dry_end" + yr)
				st_store(., v_idx, M_dry_end[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_dry_end" + yr)
					st_store(., v_idx, M_dev_dry_end[., w])
					
					v_idx = st_addvar("float", outstub + "z_dry_end" + yr)
					st_store(., v_idx, M_z_dry_end[., w])
				}
			}
			else {
				v_idx = st_addvar("float", outstub + "max" + yr)
				st_store(., v_idx, M_max[., w])
				
				v_idx = st_addvar("float", outstub + "gdd" + yr)
				st_store(., v_idx, M_gdd[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_gdd" + yr)
					st_store(., v_idx, M_dev_gdd[., w])
					
					v_idx = st_addvar("float", outstub + "z_gdd" + yr)
					st_store(., v_idx, M_z_gdd[., w])
				}
				
				v_idx = st_addvar("float", outstub + "kdd" + yr)
				st_store(., v_idx, M_kdd[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_kdd" + yr)
					st_store(., v_idx, M_dev_kdd[., w])
					
					v_idx = st_addvar("float", outstub + "z_kdd" + yr)
					st_store(., v_idx, M_z_kdd[., w])
				}
				
				v_idx = st_addvar("int", outstub + "heatdays" + yr)
				st_store(., v_idx, M_heatdays[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_heatdays" + yr)
					st_store(., v_idx, M_dev_heatdays[., w])
					
					v_idx = st_addvar("float", outstub + "z_heatdays" + yr)
					st_store(., v_idx, M_z_heatdays[., w])
				}
				
				v_idx = st_addvar("float", outstub + "pct_heatdays" + yr)
				st_store(., v_idx, M_pct_heatdays[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_pct_heatdays" + yr)
					st_store(., v_idx, M_dev_pct_heatdays[., w])
					
					v_idx = st_addvar("float", outstub + "z_pct_heatdays" + yr)
					st_store(., v_idx, M_z_pct_heatdays[., w])
				}
				
				v_idx = st_addvar("int", outstub + "heat_start" + yr)
				st_store(., v_idx, M_heat_start[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_heat_start" + yr)
					st_store(., v_idx, M_dev_heat_start[., w])
					
					v_idx = st_addvar("float", outstub + "z_heat_start" + yr)
					st_store(., v_idx, M_z_heat_start[., w])
				}
				
				v_idx = st_addvar("int", outstub + "heat" + yr)
				st_store(., v_idx, M_heat[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_heat" + yr)
					st_store(., v_idx, M_dev_heat[., w])
					
					v_idx = st_addvar("float", outstub + "z_heat" + yr)
					st_store(., v_idx, M_z_heat[., w])
				}
				
				v_idx = st_addvar("int", outstub + "heat_end" + yr)
				st_store(., v_idx, M_heat_end[., w])
				
				if (has_ref_w) {
					v_idx = st_addvar("float", outstub + "dev_heat_end" + yr)
					st_store(., v_idx, M_dev_heat_end[., w])
					
					v_idx = st_addvar("float", outstub + "z_heat_end" + yr)
					st_store(., v_idx, M_z_heat_end[., w])
				}
				
				if (has_gdd_bin) {
					v_idx = st_addvar("int", outstub + "gddcat" + yr)
					st_store(., v_idx, M_gddcat[., w])
				}
				
				if (has_tmp_bin) {
					for (b = 1; b <= tb_J; b++) {
						vname = outstub + sprintf("tmpbin%02.0f", b) + yr
						v_idx = st_addvar("int", vname)
						st_store(., v_idx, M_tmp_bin[., (b - 1) * W + w])
					}
				}
			}
			
			if (has_cuts) {
				for (b = 1; b <= n_cuts + 1; b++) {
					vname = outstub + sprintf("cut%02.0f", b) + yr
					v_idx = st_addvar("int", vname)
					st_store(., v_idx, M_cuts[., (b - 1) * W + w])
				}
			}
		}
	}
	
	// Value labels for gddcat
	if (has_gdd_bin) {
		_wxsum_apply_gddcat_lbl(gddcat_info, outstub, shape, season_years)
	}
	
	// Store r(missing) matrix
	miss_mat = J(W, 5, .)
	rownames = J(1, W, "")
	for (w = 1; w <= W; w++) {
		d_w = w_days_count[w]
		miss_mat[w, 1] = d_w
		miss_mat[w, 2] = mean(M_nobs[., w])
		miss_mat[w, 3] = mean((M_nobs[., w] :< d_w))
		miss_mat[w, 4] = mean((M_nobs[., w] :== 0))
		miss_mat[w, 5] = sum((M_nobs[., w] :< minobs))
		rownames[w] = sprintf("%04.0f", season_years[w])
	}
	if (args() >= 1 && mmat_name != "") {
		st_matrix(mmat_name, miss_mat)
		st_matrixcolstripe(mmat_name, (J(5, 1, ""), ("days" \ "mean_nobs" \ "share_any_miss" \ "share_all_miss" \ "n_minobs")))
		st_matrixrowstripe(mmat_name, (J(W, 1, ""), rownames'))
	}
	else {
		st_matrix("r(missing)", miss_mat)
		st_matrixcolstripe("r(missing)", (J(5, 1, ""), ("days" \ "mean_nobs" \ "share_any_miss" \ "share_all_miss" \ "n_minobs")))
		st_matrixrowstripe("r(missing)", (J(W, 1, ""), rownames'))
	}
}

end
