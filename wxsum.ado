*! version 6.3.1  22oct2026
*********************************************************************************
*  wxsum                                                                        *
*  v 1.0  17may2017 by Oscar Barriga Cabanillas - obarriga@ucdavis.edu          *
*  v 2.0  16jul2017 by Oscar Barriga Cabanillas - obarriga@ucdavis.edu          *
*         New stuff done by Aleksandr Michuda - amichuda@ucdavis.edu            *
*  v 3.0  2july2019 by Jeffrey D. Michler - jdmichler@email.arizona.edu         *
*  v 3.1  5july2019 by Brian McGreal - bmcgreal@email.arizona.edu               *
*  v 3.2  8july2019 by Anna Josephson - aljosephson@arizona.edu                 *
*  v 3.3  24apr2020 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 3.3  2nov2023  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.0  2apr2026  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.1  9jun2026  by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.2  10jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.3  11jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 4.4  11jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 5.0  12jun2026 by Jeffrey D. Michler - jdmichler@arizona.edu               *
*  v 5.1  11oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*  v 6.0  11oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*  v 6.1  15oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*  v 6.2  16oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*  v 6.3  20oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*********************************************************************************

program define wxsum, rclass
	version 15.1
	local cmdline `"wxsum `0'"'

	syntax anything(id="stubname" name=stub)							///
		, type(string)													///
		[																///
		ini_month(string) fin_month(string)							///
		ini_day(string) fin_day(string)								///
		start(varname numeric) end(varname numeric)					///
		event_date(varname numeric) days(string) lag(string)			///
		partial														///
		rain_threshold(string)											///
		gdd_lo(string) gdd_hi(string)									///
		heat_threshold(string) kdd_base(string)						///
		gdd_bin(string) gdd_binlo(string) gdd_binhi(string)			///
		tmp_bin(string) tmp_binlo(string) tmp_binhi(string)			///
		cuts(numlist)													///
		lr_years(string) baseline(numlist integer min=2 max=2)		///
		ref_min(string) minobs(string)									///
		shape(string) outstub(string)									///
		keep(varlist) save(string asis)								///
		]

	if `: word count `stub'' != 1 {
		di as error "specify one stubname, the common prefix of the daily variables (e.g., rf_)"
		exit 198
	}
	if _N == 0 {
		di as error "no observations"
		exit 2000
	}

	* ------------------------------------------------------------------
	* Data type
	* ------------------------------------------------------------------
	if !inlist("`type'", "rain", "temp") {
		di as error "type() must be either rain or temp"
		exit 198
	}
	local israin = ("`type'" == "rain")

	* ------------------------------------------------------------------
	* Window: calendar (ini_month/fin_month) or unit-specific
	* (start/end or event_date/days)
	* ------------------------------------------------------------------
	local has_cal = (`"`ini_month'`fin_month'`ini_day'`fin_day'"' != "")
	local has_rng = ("`start'`end'" != "")
	local has_evt = (`"`event_date'`days'`lag'"' != "")
	local n_modes = `has_cal' + `has_rng' + `has_evt'
	if `n_modes' == 0 {
		di as error "specify the window: ini_month() and fin_month() for a calendar window, or"
		di as error "start() and end(), or event_date() and days(), for unit-specific windows"
		exit 198
	}
	if `n_modes' > 1 {
		di as error "specify only one kind of window: ini_month()/fin_month(), start()/end(),"
		di as error "or event_date()/days()"
		exit 198
	}

	if `has_cal' {
		local mode "calendar"
		if "`ini_month'" == "" | "`fin_month'" == "" {
			di as error "ini_month() and fin_month() are both required for a calendar window"
			exit 198
		}
		if "`partial'" != "" {
			di as error "partial is only allowed with unit-specific windows (start()/end(),"
			di as error "or event_date()/days())"
			exit 198
		}
		local default_fin_day = ("`fin_day'" == "")
		if "`ini_day'" == "" local ini_day 1
		* without fin_day() the window ends on the last day of fin_month();
		* 28 only stands in for the checks below
		if `default_fin_day' local fin_day 28
		_wxsum_checknum `"`ini_month'"' ini_month integer 1 12
		_wxsum_checknum `"`fin_month'"' fin_month integer 1 12
		_wxsum_checknum `"`ini_day'"' ini_day integer 1 31
		_wxsum_checknum `"`fin_day'"' fin_day integer 1 31
		* as plain numbers (05 becomes 5)
		local ini_month = `ini_month'
		local fin_month = `fin_month'
		local ini_day = `ini_day'
		local fin_day = `fin_day'
		* validate against leap year 2000 so that 29 Feb is allowed
		local ini_ref = mdy(`ini_month', `ini_day', 2000)
		if `default_fin_day' local fin_ref = dofm(ym(2000, `fin_month') + 1) - 1
		else local fin_ref = mdy(`fin_month', `fin_day', 2000)
		if missing(`ini_ref') {
			di as error "ini_month()/ini_day() is not a valid date"
			exit 198
		}
		if missing(`fin_ref') {
			di as error "fin_month()/fin_day() is not a valid date"
			exit 198
		}
		local crosses = (`ini_ref' > `fin_ref')
		local window_desc = lower(string(`ini_ref', "%tdDDmon")) + "-" + ///
			cond(`default_fin_day' & `fin_month' == 2, "28/29feb", lower(string(`fin_ref', "%tdDDmon")))
	}
	else {
		local mode "unit"
		if `has_rng' {
			if "`start'" == "" | "`end'" == "" {
				di as error "start() and end() must be specified together"
				exit 198
			}
			local unit_kind "range"
			local datevars "`start' `end'"
			local window_desc "start(`start') to end(`end')"
		}
		else {
			if "`event_date'" == "" | "`days'" == "" {
				di as error "event_date() and days() must be specified together"
				exit 198
			}
			_wxsum_checknum `"`days'"' days integer
			if `days' < 1 {
				di as error "days() must be a positive integer"
				exit 198
			}
			if "`lag'" == "" local lag = 0
			_wxsum_checknum `"`lag'"' lag integer
			local unit_kind "event"
			local datevars "`event_date'"
			local window_desc "event_date(`event_date'), days(`days'), lag(`lag')"
		}
		foreach dv of local datevars {
			local fmt : format `dv'
			if regexm("`fmt'", "^%-?t[cC]") {
				di as error "`dv' is a datetime (%tc); convert it to a daily date with dofc(),"
				di as error "or with the convert() option of wxprep"
				exit 198
			}
		}
	}

	* ------------------------------------------------------------------
	* Options that apply to only one data type
	* ------------------------------------------------------------------
	if `israin' {
		foreach opt in gdd_lo gdd_hi heat_threshold kdd_base gdd_bin gdd_binlo gdd_binhi tmp_bin tmp_binlo tmp_binhi {
			if `"``opt''"' != "" {
				di as error "`opt'() cannot be used with type(rain)"
				exit 198
			}
		}
		if "`rain_threshold'" == "" local rain_threshold = 1
		_wxsum_checknum `"`rain_threshold'"' rain_threshold number
		if `rain_threshold' < 0 {
			di as error "rain_threshold() must be nonnegative"
			exit 198
		}
		local thr_desc "rain_threshold(`rain_threshold')"
	}
	else {
		if "`rain_threshold'" != "" {
			di as error "rain_threshold() cannot be used with type(temp)"
			exit 198
		}
		if "`heat_threshold'" == "" {
			if "`kdd_base'" != "" {
				di as error "heat_threshold() is required for type(temp); use heat_threshold(#) and"
				di as error "add kdd_base(#) only if the KDD base should differ from heat_threshold()"
			}
			else di as error "heat_threshold() is required for type(temp)"
			exit 198
		}
		if "`gdd_lo'" == "" | "`gdd_hi'" == "" {
			di as error "gdd_lo() and gdd_hi() are required for type(temp)"
			exit 198
		}
		foreach opt in gdd_lo gdd_hi heat_threshold kdd_base {
			if `"``opt''"' != "" _wxsum_checknum `"``opt''"' `opt' number
		}
		if `gdd_hi' <= `gdd_lo' {
			di as error "gdd_hi() must be greater than gdd_lo()"
			exit 198
		}
		local kdd_given = ("`kdd_base'" != "")
		if !`kdd_given' local kdd_base = `heat_threshold'
		local thr_desc "gdd_lo(`gdd_lo') gdd_hi(`gdd_hi') heat_threshold(`heat_threshold')"
		if `kdd_given' local thr_desc "`thr_desc' kdd_base(`kdd_base')"
	}

	* GDD categories: gdd_bin(), gdd_binlo(), gdd_binhi()
	foreach opt in gdd_bin gdd_binlo gdd_binhi {
		if `"``opt''"' != "" _wxsum_checknum `"``opt''"' `opt' number
	}
	foreach opt in gdd_binlo gdd_binhi {
		if "``opt''" != "" & "`gdd_bin'" == "" {
			di as error "`opt'() requires gdd_bin()"
			exit 198
		}
	}
	if "`gdd_bin'" != "" {
		if `gdd_bin' <= 0 {
			di as error "gdd_bin() must be positive"
			exit 198
		}
		local gb_lo = 0
		if "`gdd_binlo'" != "" local gb_lo = `gdd_binlo'
		if "`gdd_binhi'" != "" {
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

	* Daily bins: tmp_bin() (equal-width, temp only) or cuts() (cutpoints)
	foreach opt in tmp_binlo tmp_binhi {
		if `"``opt''"' != "" _wxsum_checknum `"``opt''"' `opt' number
	}
	if "`tmp_bin'" != "" _wxsum_checknum `"`tmp_bin'"' tmp_bin integer
	if "`tmp_binlo'" != "" & "`tmp_bin'" == "" {
		di as error "tmp_binlo() requires tmp_bin()"
		exit 198
	}
	if "`tmp_binhi'" != "" & "`tmp_bin'" == "" {
		di as error "tmp_binhi() requires tmp_bin()"
		exit 198
	}
	if "`tmp_bin'" != "" {
		if `tmp_bin' < 1 {
			di as error "tmp_bin() must be a positive integer"
			exit 198
		}
		if `tmp_bin' > 42 {
			di as error "tmp_bin() must be 42 or less"
			exit 198
		}
		if "`tmp_binlo'" == "" | "`tmp_binhi'" == "" {
			di as error "tmp_binlo() and tmp_binhi() are required when tmp_bin() is specified"
			exit 198
		}
		if `tmp_binhi' <= `tmp_binlo' {
			di as error "tmp_binhi() must be greater than tmp_binlo()"
			exit 198
		}
	}
	if "`cuts'" != "" {
		if "`tmp_bin'" != "" {
			di as error "tmp_bin() and cuts() cannot be combined"
			exit 198
		}
		local n_cuts : word count `cuts'
		if `n_cuts' > 41 {
			di as error "cuts() accepts at most 41 cutpoints (42 bins)"
			exit 198
		}
		local prev = .
		foreach c of local cuts {
			if !missing(`prev') & `c' <= `prev' {
				di as error "cuts() must be strictly increasing"
				exit 198
			}
			local prev = `c'
		}
	}

	* ------------------------------------------------------------------
	* Reference period: rolling lr_years() or fixed baseline()
	* ------------------------------------------------------------------
	if "`baseline'" != "" {
		if "`lr_years'" != "" {
			di as error "lr_years() and baseline() cannot be combined"
			exit 198
		}
		local ref_mode "baseline"
		local b1 : word 1 of `baseline'
		local b2 : word 2 of `baseline'
		if `b2' <= `b1' {
			di as error "baseline() needs a first year before the last year, e.g. baseline(1981 2010)"
			exit 198
		}
		local ref_len = `b2' - `b1' + 1
		local lr_years = .
		local ref_desc "baseline `b1'-`b2'"
	}
	else {
		local ref_mode "rolling"
		if "`lr_years'" == "" local lr_years = 10
		_wxsum_checknum `"`lr_years'"' lr_years integer
		if `lr_years' < 2 | `lr_years' > 50 {
			di as error "lr_years must be between 2 and 50"
			exit 198
		}
		local ref_len = `lr_years'
		local b1 = .
		local b2 = .
		local ref_desc "rolling `lr_years'"
	}
	if "`ref_min'" == "" local ref_min = `ref_len'
	_wxsum_checknum `"`ref_min'"' ref_min integer
	if `ref_min' < 2 | `ref_min' > `ref_len' {
		di as error "ref_min() must be between 2 and `ref_len' (the number of reference years)"
		exit 198
	}
	if "`minobs'" == "" local minobs = 1
	_wxsum_checknum `"`minobs'"' minobs integer
	if `minobs' < 1 {
		di as error "minobs() must be a positive integer"
		exit 198
	}

	* ------------------------------------------------------------------
	* Output: shape(), outstub(), keep(), save()
	* ------------------------------------------------------------------
	local shape_given = ("`shape'" != "")
	if "`shape'" == "" local shape "long"
	if "`shape'" != "wide" & "`shape'" != "long" {
		di as error "shape() must be wide or long"
		exit 198
	}
	if "`mode'" == "unit" {
		if `shape_given' di as text "note: shape() has no effect with unit-specific windows; output has one row per observation."
		local shape "wide"
	}
	if "`outstub'" != "" {
		if !regexm("`outstub'", "^[A-Za-z_][A-Za-z0-9_]*$") {
			di as error "outstub() must start with a letter or underscore and contain only letters, digits, and underscores"
			exit 198
		}
	}
	if "`mode'" == "calendar" & "`shape'" == "long" {
		if "`keep'" == "" {
			di as text "note: shape(long) requested without keep(); output will not contain an explicit unit identifier"
		}
		else {
			local keep_has_year : list posof "year" in keep
			if `keep_has_year' {
				di as error "shape(long) creates a variable named year; remove or rename year from keep()"
				exit 198
			}
		}
	}

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

	* ------------------------------------------------------------------
	* Find the daily variables and windows, check every output name,
	* and compute all statistics in Mata. The data are not changed here.
	* ------------------------------------------------------------------
	* window description stored in the characteristics
	local window_char "`window_desc'"
	if "`mode'" == "unit" & "`partial'" != "" local window_char "`window_desc', partial"

	tempname missmat
	mata: _wxsum_setup()
	mata: _wxsum_compute()

	* ------------------------------------------------------------------
	* Write the output. Everything after -preserve- is undone if
	* anything fails, so the data in memory change only on success.
	* ------------------------------------------------------------------
	preserve
	* number of distinct units identified by keep() (the row order is kept)
	local N_units = .
	if "`keep'" != "" {
		tempvar obsno unit_tag
		quietly gen long `obsno' = _n
		* -bysort- rather than -egen tag()-, which fails (r(1004)) when keep()
		* names thousands of variables, such as the daily variables of a
		* second data type kept for a later run with outstub()
		quietly bysort `keep': gen byte `unit_tag' = (_n == 1)
		quietly count if `unit_tag'
		local N_units = r(N)
		sort `obsno'
		drop `obsno' `unit_tag'
	}
	if "`mode'" == "calendar" & "`shape'" == "long" {
		tempvar rowid wid
		quietly gen long `rowid' = _n
		quietly keep `keep' `rowid'
		if `n_windows' > 1 quietly expand `n_windows'
		sort `rowid', stable
		quietly by `rowid': gen int `wid' = _n
		* test hook: tests/wxsum_v6_features.do forces a failure here to check
		* that the data are restored
		if "$WXSUM_TEST_FAIL" == "store" error 9
		mata: _wxsum_store("`rowid'", "`wid'")
		drop `rowid' `wid'
		order `keep' year `created'
	}
	else {
		if "`keep'" != "" quietly keep `keep'
		* test hook (see above)
		if "$WXSUM_TEST_FAIL" == "store" error 9
		mata: _wxsum_store("", "")
		order `keep' `created'
	}
	quietly compress `created'
	* metadata that survive -save- (each variable also has [wxsum_stat] and
	* [wxsum_window])
	char _dta[wxsum_cmdline] `"`cmdline'"'
	* the version on the *! line at the top of this file
	char _dta[wxsum_version] "6.3.1"
	char _dta[wxsum_type] "`type'"
	char _dta[wxsum_shape] "`=cond("`mode'" == "unit", "unit", "`shape'")'"
	char _dta[wxsum_window] "`window_char'"
	char _dta[wxsum_ref] "`ref_desc', ref_min(`ref_min')"
	char _dta[wxsum_thresholds] "`thr_desc'"
	char _dta[wxsum_minobs] "`minobs'"
	* save before -restore, not-, so that a failed save restores the input
	if `"`save_file'"' != "" quietly save `"`save_file'"', `save_replace'
	restore, not

	* ------------------------------------------------------------------
	* Summary and stored results
	* ------------------------------------------------------------------
	* one item per line, so that the summary fits in 80 columns
	local k_created : word count `created'
	di as text _n "{bf:wxsum} summary"
	di as text "  Data:          " as result "`type'" as text ", stub " as result "`stub'"
	di as text "  Thresholds:    `thr_desc'"
	if "`mode'" == "calendar" {
		local wtxt = cond(`n_windows' == 1, "window", "windows")
		local ytxt = cond(`first_year' == `last_year', "`first_year'", "`first_year'-`last_year'")
		di as text "  Window:        calendar, " as result "`window_desc'" as text "; " ///
			as result "`n_windows'" as text " `wtxt', " as result "`ytxt'"
		if "`shape'" == "long" {
			di as text "  Output:        long, " as result _N as text " rows (" as result "`n_windows'" ///
				as text " per observation); " as result "`k_created'" as text " new variables"
		}
		else {
			di as text "  Output:        wide, " as result _N as text " rows; " ///
				as result "`k_created'" as text " new variables"
		}
	}
	else {
		di as text "  Window:        unit-specific, " as result "`window_desc'" ///
			as text cond("`partial'" != "", ", partial", "")
		di as text "  Output:        " as result _N as text " rows, one per observation; " ///
			as result "`k_created'" as text " new variables"
	}
	if "`ref_mode'" == "rolling" local ref_txt "rolling, `lr_years' years before each window"
	else local ref_txt "fixed baseline `b1'-`b2'"
	di as text "  Reference:     `ref_txt'; ref_min(`ref_min')"
	if "`has_dev'" == "1" {
		if "`mode'" == "calendar" di as text "  Deviations:    from " as result "`first_dev'"
		else di as text "  Deviations:    for " as result "`n_dev_ok'" as text " of " as result _N as text " observations"
	}
	else di as text "  Deviations:    " as result "none" as text " (not enough reference years)"
	di as text "  Missing days:  " as result "`n_anymiss'" as text " of " as result "`n_unitwin'" ///
		as text cond(`n_unitwin' == 1, " unit-window; ", " unit-windows; ") ///
		as result "`n_allmiss'" as text cond(`n_allmiss' == 1, " has", " have") " no observed day"
	di as text "  Below minobs:  " as result "`n_below'" ///
		as text cond(`n_below' == 1, " unit-window", " unit-windows") " (minobs(`minobs'))"
	if "`mode'" == "unit" {
		local how ""
		if `n_outside' local how = cond("`partial'" != "", ": days inside the data used", ": statistics missing (see partial)")
		di as text "  Outside data:  " as result "`n_outside'" ///
			as text cond(`n_outside' == 1, " window runs", " windows run") " past the data`how'"
		if `n_missdate' di as text "  Missing dates: " as result "`n_missdate'" ///
			as text cond(`n_missdate' == 1, " observation", " observations")
	}
	if `"`save_file'"' != "" di as text `"  Saved:         `save_file'"'
	di as text "  Stored results: type {stata return list}"

	return clear
	return scalar N = _N
	if !missing(`N_units') return scalar N_units = `N_units'
	return scalar k_created = `k_created'
	return scalar n_windows = `n_windows'
	if "`mode'" == "calendar" {
		return scalar first_year = `first_year'
		return scalar last_year = `last_year'
		return local years "`w_years'"
	}
	return scalar minobs = `minobs'
	return scalar ref_min = `ref_min'
	if "`ref_mode'" == "rolling" return scalar lr_years = `lr_years'
	else {
		return scalar baseline_first = `b1'
		return scalar baseline_last = `b2'
	}
	if `israin' return scalar rain_threshold = `rain_threshold'
	else {
		return scalar gdd_lo = `gdd_lo'
		return scalar gdd_hi = `gdd_hi'
		return scalar heat_threshold = `heat_threshold'
		return scalar kdd_base = `kdd_base'
	}
	return local varlist "`created'"
	return local ref "`ref_desc'"
	return local window "`window_desc'"
	return local shape = cond("`mode'" == "unit", "unit", "`shape'")
	return local mode "`mode'"
	return local type "`type'"
	return local stub "`stub'"
	if "`outstub'" != "" return local outstub "`outstub'"
	return local cmdline `"`cmdline'"'
	return matrix missing = `missmat'
end

* Checks that an option value is a number (or an integer), optionally
* between lo and hi.
program define _wxsum_checknum
	args value opt kind lo hi
	if "`kind'" == "integer" capture confirm integer number `value'
	else capture confirm number `value'
	local bad = _rc
	if !`bad' & "`lo'" != "" local bad = (`value' < `lo' | `value' > `hi')
	if `bad' {
		local what = cond("`kind'" == "integer", "an integer", "a number")
		if "`lo'" != "" di as error "`opt'() must be `what' between `lo' and `hi'"
		else di as error "`opt'() must be `what'"
		exit 198
	}
end

version 15.1
mata:

// ---------------------------------------------------------------------------
// State shared between _wxsum_setup(), _wxsum_compute() and _wxsum_store().
// ---------------------------------------------------------------------------
struct _wx_state {
	// options
	string scalar    stub, type, mode, shape, outstub, unitkind, vtype
	real scalar      israin, thr, glo, ghi, hthr, kbase, minobs, partial
	real scalar      refbase, L, b1, b2, refmin
	real scalar      gbin, gblo, gbhi         // gbin, gbhi missing when not given
	real matrix      bins                 // nb x 2: lower and upper bin edges
	string colvector bindesc              // nb: label text for each bin
	string scalar    binstem
	real scalar      ini_m, ini_d, fin_m, fin_d, deffin, crosses
	// daily variables (sorted by date)
	real scalar      N, d1, d2
	string rowvector dvars
	real rowvector   ddates, dvidx, dmap
	// windows
	real scalar      W
	real colvector   wyear, wstart, wend, wqual
	real colvector   us, ue, ustat        // unit mode: start, end, status
	// statistics
	string rowvector stems
	real rowvector   devk
	pointer(real matrix) rowvector RP, DP, ZP
	real matrix      GC
	real colvector   gcvals
	string colvector gctexts
	string scalar    vlname, refdesc, vname, wdesc
	real scalar      has_dev
	// output variables
	string rowvector onames, otypes, olabels, ostems, owins
	real matrix      osrc                 // kind, index, window
	real scalar      nout                 // number of entries in use
}

// Statistic stems in the order of the columns of _wx_core().
// Rows 1-6 are common; rows 7-14 depend on the data type; bins follow.
// devk: the stems with deviations and z-scores; of the spells, only the
// mid-window spell (13) has them
void _wx_stems(struct _wx_state scalar S)
{
	real scalar b
	if (S.israin) {
		S.stems = ("nobs", "mean", "median", "var", "sd", "skew", "mean_mo",
			"total", "raindays", "norain", "pct_raindays", "dry_start", "dry", "dry_end")
		S.devk = (7, 8, 9, 10, 11, 13)
	}
	else {
		S.stems = ("nobs", "mean", "median", "var", "sd", "skew", "max",
			"gdd", "kdd", "heatdays", "pct_heatdays", "heat_start", "heat", "heat_end")
		S.devk = (8, 9, 10, 11, 13)
	}
	for (b = 1; b <= rows(S.bins); b++) {
		S.stems = S.stems, S.binstem + strofreal(b, "%02.0f")
	}
}

// Number formatting for labels: %12.0g with a leading zero (0.5, not .5).
string scalar _wx_fmt(real scalar x)
{
	string scalar r
	r = strtrim(strofreal(x, "%12.0g"))
	if (substr(r, 1, 1) == ".") r = "0" + r
	else if (substr(r, 1, 2) == "-.") r = "-0" + substr(r, 2, .)
	return(r)
}

// ---------------------------------------------------------------------------
// Setup: read options, find the daily variables and windows, build the list
// of output variables, and check names, value labels, and maxvar before
// anything is computed.
// ---------------------------------------------------------------------------
void _wxsum_setup()
{
	struct _wx_state scalar S
	pointer() scalar p

	S.stub    = st_local("stub")
	S.type    = st_local("type")
	S.israin  = (S.type == "rain")
	S.vname   = (S.israin ? "rain" : "temp")
	S.mode    = st_local("mode")
	S.shape   = st_local("shape")
	S.outstub = st_local("outstub")
	S.vtype   = c("type")
	S.minobs  = strtoreal(st_local("minobs"))
	S.partial = (st_local("partial") != "")
	S.N       = st_nobs()
	if (S.israin) S.thr = strtoreal(st_local("rain_threshold"))
	else {
		S.glo   = strtoreal(st_local("gdd_lo"))
		S.ghi   = strtoreal(st_local("gdd_hi"))
		S.hthr  = strtoreal(st_local("heat_threshold"))
		S.kbase = strtoreal(st_local("kdd_base"))
	}
	S.refbase  = (st_local("ref_mode") == "baseline")
	S.L        = strtoreal(st_local("lr_years"))
	S.b1       = strtoreal(st_local("b1"))
	S.b2       = strtoreal(st_local("b2"))
	S.refmin   = strtoreal(st_local("ref_min"))
	S.refdesc  = (S.refbase ? st_local("b1") + "-" + st_local("b2") + " baseline" :
		st_local("lr_years") + "-yr rolling mean")
	S.gbin     = strtoreal(st_local("gdd_bin"))
	S.gblo     = editmissing(strtoreal(st_local("gdd_binlo")), 0)
	S.gbhi     = strtoreal(st_local("gdd_binhi"))
	S.vlname   = S.outstub + "gddcat"
	S.unitkind = st_local("unit_kind")
	S.wdesc    = st_local("window_char")

	_wx_discover(S)
	if (S.mode == "calendar") _wx_calwindows(S)
	else _wx_unitwindows(S)
	_wx_bins(S)
	_wx_stems(S)
	_wx_reftable(S)
	S.has_dev = 1
	_wx_names(S, 1)
	_wx_checks(S)

	p = findexternal("_wxsum_S")
	if (p == NULL) p = crexternal("_wxsum_S")
	*p = S
}

// Find numeric variables named stub + yyyymmdd with a valid date; sort by date.
void _wx_discover(struct _wx_state scalar S)
{
	real scalar      nv, L, k
	real rowvector   idx, ok, dates, o
	string rowvector names, sfx

	nv = st_nvar()
	L = strlen(S.stub)
	names = st_varname(1..nv)
	idx = selectindex((substr(names, 1, L) :== S.stub) :& (strlen(names) :== L + 8))
	if (cols(idx) > 0) {
		names = names[idx]
		sfx = substr(names, L + 1, 8)
		ok = J(1, cols(idx), 0)
		for (k = 1; k <= cols(idx); k++) {
			ok[k] = (regexm(sfx[k], "^[0-9]+$") & st_isnumvar(idx[k]))
		}
		dates = mdy(strtoreal(substr(sfx, 5, 2)), strtoreal(substr(sfx, 7, 2)), strtoreal(substr(sfx, 1, 4)))
		ok = ok :& (dates :< .)
		idx = select(idx, ok)
		names = select(names, ok)
		dates = select(dates, ok)
	}
	if (cols(idx) == 0) {
		errprintf("No numeric daily variables found with prefix %s and yyyymmdd suffix\n", S.stub)
		exit(111)
	}
	o = order(dates', 1)'
	S.dvars = names[o]
	S.ddates = dates[o]
	S.dvidx = idx[o]
	S.d1 = S.ddates[1]
	S.d2 = S.ddates[cols(S.ddates)]
	// dmap[t - d1 + 1] = position of date t among the daily variables (0 = none)
	S.dmap = J(1, S.d2 - S.d1 + 1, 0)
	S.dmap[S.ddates :- S.d1 :+ 1] = (1..cols(S.ddates))
}

// Calendar windows: one per start year, inside the range of the data.
void _wx_calwindows(struct _wx_state scalar S)
{
	real scalar y, ey, sd, ed, y1, y2
	real colvector wy, ws, we

	S.ini_m   = strtoreal(st_local("ini_month"))
	S.ini_d   = strtoreal(st_local("ini_day"))
	S.fin_m   = strtoreal(st_local("fin_month"))
	S.fin_d   = strtoreal(st_local("fin_day"))
	S.deffin  = strtoreal(st_local("default_fin_day"))
	S.crosses = strtoreal(st_local("crosses"))
	wy = J(0, 1, .)
	ws = J(0, 1, .)
	we = J(0, 1, .)
	y1 = year(S.d1)
	y2 = year(S.d2)
	for (y = y1; y <= y2; y++) {
		ey = y + S.crosses
		// 29 February in ini_day()/fin_day() is 28 February in common years
		// (max() ignores the missing date)
		if (S.deffin) {
			if (S.fin_m == 12) ed = mdy(12, 31, ey)
			else ed = mdy(S.fin_m + 1, 1, ey) - 1
		}
		else ed = max((mdy(S.fin_m, S.fin_d, ey), mdy(S.fin_m, S.fin_d - 1, ey)))
		sd = max((mdy(S.ini_m, S.ini_d, y), mdy(S.ini_m, S.ini_d - 1, y)))
		// windows inside the dates of the data; days without a daily variable
		// are missing days, so a window may have no observed day at all
		if (sd < S.d1 | ed > S.d2) continue
		wy = wy \ y
		ws = ws \ sd
		we = we \ ed
	}
	if (rows(wy) == 0) {
		errprintf("No complete windows found for prefix %s and the requested dates\n", S.stub)
		exit(2000)
	}
	S.W = rows(wy)
	S.wyear = wy
	S.wstart = ws
	S.wend = we
	st_local("n_windows", strofreal(S.W))
	st_local("first_year", strofreal(wy[1]))
	st_local("last_year", strofreal(wy[S.W]))
	st_local("w_years", invtokens(strofreal(wy')))
}

// Unit-specific windows: start and end dates read from the data.
void _wx_unitwindows(struct _wx_state scalar S)
{
	real colvector s, e, ev, nm, out
	real scalar    dd, lg, bad

	if (S.unitkind == "range") {
		s = st_data(., st_local("start"))
		e = st_data(., st_local("end"))
	}
	else {
		ev = st_data(., st_local("event_date"))
		dd = strtoreal(st_local("days"))
		lg = strtoreal(st_local("lag"))
		s = ev :- dd :- lg
		e = ev :- 1 :- lg
	}
	nm = (s :< .) :& (e :< .)
	bad = sum(nm :& ((s :!= floor(s)) :| (e :!= floor(e))))
	if (bad > 0) {
		errprintf("window dates must be daily dates (whole numbers of days); %f observations are not\n", bad)
		exit(198)
	}
	bad = sum(nm :& (e :< s))
	if (bad > 0) {
		errprintf("the window ends before it starts in %f observations\n", bad)
		exit(198)
	}
	out = nm :& ((s :< S.d1) :| (e :> S.d2))
	S.us = s
	S.ue = e
	// status: 0 = missing date, 1 = inside the data, 2 = (partly) outside the data
	S.ustat = nm :* (1 :+ out)
	S.W = 1
	S.wyear = .
	st_local("n_windows", "1")
}

// Bin edges and labels for tmp_bin() or cuts().
void _wx_bins(struct _wx_state scalar S)
{
	real rowvector cv, ed
	real scalar    nJ, lo, hi, w, b, k
	string scalar  v

	v = S.vname
	cv = strtoreal(tokens(st_local("cuts")))
	nJ = strtoreal(st_local("tmp_bin"))
	S.bins = J(0, 2, .)
	S.bindesc = J(0, 1, "")
	if (cols(cv) > 0) {
		S.binstem = "cut"
		k = cols(cv)
		S.bins = (mindouble(), cv[1])
		S.bindesc = "Days with " + v + " < " + _wx_fmt(cv[1])
		for (b = 2; b <= k; b++) {
			S.bins = S.bins \ (cv[b - 1], cv[b])
			S.bindesc = S.bindesc \ ("Days with " + _wx_fmt(cv[b - 1]) + " <= " + v + " < " + _wx_fmt(cv[b]))
		}
		S.bins = S.bins \ (cv[k], maxdouble())
		S.bindesc = S.bindesc \ ("Days with " + v + " >= " + _wx_fmt(cv[k]))
	}
	else if (nJ < .) {
		S.binstem = "tmpbin"
		lo = strtoreal(st_local("tmp_binlo"))
		hi = strtoreal(st_local("tmp_binhi"))
		if (nJ == 1) {
			S.bins = (mindouble(), maxdouble())
			S.bindesc = "Days with temp observed (single bin)"
		}
		else if (nJ == 2) {
			w = (lo + hi) / 2
			S.bins = (mindouble(), w) \ (w, maxdouble())
			S.bindesc = ("Days with temp < " + _wx_fmt(w)) \ ("Days with temp >= " + _wx_fmt(w))
		}
		else {
			// edges lo, lo + w, ..., ending at hi itself: lo + (nJ - 2) * w
			// can differ from hi in the last bit, which would count a day
			// equal to hi in two bins, or a day just below it in none
			w = (hi - lo) / (nJ - 2)
			ed = lo :+ (0..(nJ - 2)) :* w
			ed[nJ - 1] = hi
			S.bins = (mindouble(), lo)
			S.bindesc = "Days with temp < " + _wx_fmt(lo)
			for (b = 2; b <= nJ - 1; b++) {
				S.bins = S.bins \ (ed[b - 1], ed[b])
				S.bindesc = S.bindesc \ ("Days with " + _wx_fmt(ed[b - 1]) + " <= temp < " + _wx_fmt(ed[b]))
			}
			S.bins = S.bins \ (hi, maxdouble())
			S.bindesc = S.bindesc \ ("Days with temp >= " + _wx_fmt(hi))
		}
	}
}

// Reference windows for each calendar window: qualifies if at least
// ref_min() reference windows exist in the data. A baseline() that covers
// fewer than ref_min() windows (calendar) or years (unit-specific) of the data
// is an error.
void _wx_reftable(struct _wx_state scalar S)
{
	real scalar    w, nref
	real colvector idx
	real rowvector yrs

	if (S.mode != "calendar") {
		S.wqual = 1
		if (S.refbase) {
			yrs = (S.b1..S.b2)
			nref = sum((yrs :>= year(S.d1)) :& (yrs :<= year(S.d2)))
			if (nref < S.refmin) {
				errprintf("baseline(%f %f) covers %f year(s) of the data, but ref_min() requires %f\n",
					S.b1, S.b2, nref, S.refmin)
				exit(198)
			}
		}
		return
	}
	S.wqual = J(S.W, 1, 0)
	for (w = 1; w <= S.W; w++) {
		idx = _wx_refidx(S, w)
		S.wqual[w] = (rows(idx) >= S.refmin)
	}
	if (S.refbase) {
		nref = rows(_wx_refidx(S, 1))
		if (nref < S.refmin) {
			errprintf("baseline(%f %f) covers %f window(s) in the data, but ref_min() requires %f\n",
				S.b1, S.b2, nref, S.refmin)
			exit(198)
		}
	}
}

// Indices of the reference windows for calendar window w.
real colvector _wx_refidx(struct _wx_state scalar S, real scalar w)
{
	if (S.refbase) return(_wx_which((S.wyear :>= S.b1) :& (S.wyear :<= S.b2)))
	return(_wx_which((S.wyear :>= S.wyear[w] - S.L) :& (S.wyear :<= S.wyear[w] - 1)))
}

// Indices of the nonzero elements of a column vector, always as a column
// vector (selectindex() returns a 1 x 0 row vector when a 1 x 1 input is 0).
real colvector _wx_which(real colvector v)
{
	if (rows(v) == 0) return(J(0, 1, .))
	if (sum(v :!= 0) == 0) return(J(0, 1, .))
	return(selectindex(v :!= 0))
}

// Variable label for a statistic stem (without the year).
string scalar _wx_label(struct _wx_state scalar S, string scalar stem)
{
	string scalar v, ct, h
	v = S.vname
	if (stem == "nobs")         return("Observed days in window")
	if (stem == "mean")         return("Mean daily " + v)
	if (stem == "median")       return("Median daily " + v)
	if (stem == "var")          return("Variance of daily " + v)
	if (stem == "sd")           return("Std. dev. of daily " + v)
	if (stem == "skew")         return("Skewness of daily " + v)
	if (S.israin) {
		ct = _wx_fmt(S.thr)
		if (stem == "mean_mo")      return("Mean of monthly rain totals")
		if (stem == "total")        return("Total rain")
		if (stem == "raindays")     return("Days with rain >= " + ct)
		if (stem == "norain")       return("Days with rain < " + ct)
		if (stem == "pct_raindays") return("Share of days with rain >= " + ct)
		if (stem == "dry_start")    return("Leading dry spell, days (rain < " + ct + ")")
		if (stem == "dry")          return("Longest mid-window dry spell, days (rain < " + ct + ")")
		if (stem == "dry_end")      return("Trailing dry spell, days (rain < " + ct + ")")
	}
	else {
		h = _wx_fmt(S.hthr)
		if (stem == "max")          return("Maximum daily temp")
		if (stem == "gdd")          return("Growing degree days, " + _wx_fmt(S.glo) + " to " + _wx_fmt(S.ghi))
		if (stem == "kdd")          return("Killing degree days above " + _wx_fmt(S.kbase))
		if (stem == "heatdays")     return("Days with temp >= " + h)
		if (stem == "pct_heatdays") return("Share of days with temp >= " + h)
		if (stem == "heat_start")   return("Leading heat spell, days (temp >= " + h + ")")
		if (stem == "heat")         return("Longest mid-window heat spell, days (temp >= " + h + ")")
		if (stem == "heat_end")     return("Trailing heat spell, days (temp >= " + h + ")")
		if (stem == "gddcat")       return("GDD category (bin width " + _wx_fmt(S.gbin) + ")")
	}
	return(stem)
}

// Storage type for a statistic: counts are integers, the rest use c(type).
string scalar _wx_vtype(struct _wx_state scalar S, string scalar stem)
{
	if (anyof(("nobs", "raindays", "norain", "dry_start", "dry", "dry_end",
		"heatdays", "heat_start", "heat", "heat_end", "gddcat"), stem)) return("long")
	if (strpos(stem, S.binstem) == 1 & S.binstem != "") return("long")
	return(S.vtype)
}

// Adds one output variable to the list (capacity doubles when full).
void _wx_addout(struct _wx_state scalar S, string scalar name, string scalar type,
	string scalar label, string scalar stem, string scalar win,
	real scalar kind, real scalar index, real scalar w)
{
	real scalar cap
	cap = cols(S.onames)
	if (S.nout >= cap) {
		cap = max((64, cap))
		S.onames  = S.onames, J(1, cap, "")
		S.otypes  = S.otypes, J(1, cap, "")
		S.olabels = S.olabels, J(1, cap, "")
		S.ostems  = S.ostems, J(1, cap, "")
		S.owins   = S.owins, J(1, cap, "")
		S.osrc    = S.osrc \ J(cap, 3, .)
	}
	S.nout = S.nout + 1
	S.onames[S.nout]  = name
	S.otypes[S.nout]  = type
	S.olabels[S.nout] = substr(label, 1, 80)
	S.ostems[S.nout]  = stem
	S.owins[S.nout]   = win
	S.osrc[S.nout, .] = (kind, index, w)
}

// Builds the output variable list. With superset = 1 (setup), every variable
// that could be created is listed, for the name and maxvar checks.
// kind: 1 statistic, 2 deviation, 3 z-score, 4 GDD category, 5 year
void _wx_names(struct _wx_state scalar S, real scalar superset)
{
	real scalar    K, k, w, j, nw, wide
	real rowvector wl
	string scalar  sfx, lsfx, ys, st, o

	o = S.outstub
	S.nout = 0
	S.onames = J(1, 0, "")
	S.otypes = J(1, 0, "")
	S.olabels = J(1, 0, "")
	S.ostems = J(1, 0, "")
	S.owins = J(1, 0, "")
	S.osrc = J(0, 3, .)
	K = cols(S.stems)
	wide = (S.mode == "calendar" & S.shape == "wide")
	if (S.mode == "calendar" & S.shape == "long") {
		_wx_addout(S, "year", "int", "Window (season) start year", "year", S.wdesc, 5, 0, 0)
	}
	nw = (wide ? S.W : 1)
	for (w = 1; w <= nw; w++) {
		// ys: the window stored in [wxsum_window], with the year in wide output
		if (wide) {
			sfx = "_" + strofreal(S.wyear[w])
			lsfx = ", " + strofreal(S.wyear[w])
			ys = S.wdesc + " " + strofreal(S.wyear[w])
		}
		else {
			sfx = ""
			lsfx = ""
			ys = S.wdesc
		}
		for (k = 1; k <= K; k++) {
			st = S.stems[k]
			if (k > 14) {
				_wx_addout(S, o + st + sfx, _wx_vtype(S, st), S.bindesc[k - 14] + lsfx, st, ys, 1, k, w)
				continue
			}
			_wx_addout(S, o + st + sfx, _wx_vtype(S, st), _wx_label(S, st) + lsfx, st, ys, 1, k, w)
			j = selectindex(S.devk :== k)
			if (cols(j) == 1) {
				if (superset | (wide ? S.wqual[w] : S.has_dev)) {
					_wx_addout(S, o + "dev_" + st + sfx, S.vtype,
						"Deviation of " + st + " from " + S.refdesc + lsfx, "dev_" + st, ys, 2, j, w)
					_wx_addout(S, o + "z_" + st + sfx, S.vtype,
						"Z-score of " + st + " vs " + S.refdesc + lsfx, "z_" + st, ys, 3, j, w)
				}
			}
			if (st == "gdd" & S.gbin < .) {
				if (superset | rows(S.GC) > 0) {
					_wx_addout(S, o + "gddcat" + sfx, "long", _wx_label(S, "gddcat") + lsfx, "gddcat", ys, 4, 0, w)
				}
			}
		}
	}
	// drop unused capacity
	if (S.nout > 0) {
		S.onames  = S.onames[(1..S.nout)]
		S.otypes  = S.otypes[(1..S.nout)]
		S.olabels = S.olabels[(1..S.nout)]
		S.ostems  = S.ostems[(1..S.nout)]
		S.owins   = S.owins[(1..S.nout)]
		S.osrc    = S.osrc[(1..S.nout), .]
	}
}

// Checks run before anything is computed: output names, value label, maxvar.
void _wx_checks(struct _wx_state scalar S)
{
	string rowvector ex
	real scalar      o, proj, mv

	if (S.mode == "calendar" & S.shape == "long") ex = tokens(st_local("keep"))
	else if (st_local("keep") != "") ex = tokens(st_local("keep"))
	else ex = st_varname(1..st_nvar())
	for (o = 1; o <= cols(S.onames); o++) {
		if (strlen(S.onames[o]) > 32 | !st_isname(S.onames[o])) {
			errprintf("output variable name %s is not a valid Stata name (32 characters at most);\n", S.onames[o])
			errprintf("use a shorter outstub()\n")
			exit(198)
		}
		if (anyof(ex, S.onames[o])) {
			errprintf("variable %s already defined; use outstub() to add a prefix to the output names\n", S.onames[o])
			exit(110)
		}
	}
	if (S.gbin < . & st_vlexists(S.vlname)) {
		errprintf("value label %s already defined; use outstub() or drop the label first\n", S.vlname)
		exit(110)
	}
	mv = c("maxvar")
	proj = cols(ex) + cols(S.onames) + 4
	if (proj > mv) {
		errprintf("wxsum needs about %f variables, but maxvar is %f.\n", proj, mv)
		errprintf("Use shape(long) or keep(), or save your data, type -clear all-,\n")
		errprintf("-set maxvar #- with a larger number, reload the data, and run wxsum again.\n")
		exit(900)
	}
}

// ---------------------------------------------------------------------------
// Compute
// ---------------------------------------------------------------------------
void _wxsum_compute()
{
	struct _wx_state scalar S
	real matrix   V, X, R, MISS
	real scalar   K, w, D, k, N, chunk, r0, r1, nr
	real rowvector cl, pres
	real colvector n

	S = *findexternal("_wxsum_S")
	K = cols(S.stems)
	N = S.N
	st_view(V, ., S.dvidx)
	S.RP = J(1, K, NULL)
	for (k = 1; k <= K; k++) S.RP[k] = &(J(N, S.W, .))

	if (S.mode == "calendar") {
		MISS = J(S.W, 5, .)
		for (w = 1; w <= S.W; w++) {
			D = S.wend[w] - S.wstart[w] + 1
			cl = S.dmap[|S.wstart[w] - S.d1 + 1 \ S.wend[w] - S.d1 + 1|]
			pres = selectindex(cl :> 0)
			// rows are processed in chunks to bound memory
			chunk = max((1, floor(4000000 / D)))
			for (r0 = 1; r0 <= N; r0 = r0 + chunk) {
				r1 = min((N, r0 + chunk - 1))
				nr = r1 - r0 + 1
				X = J(nr, D, .)
				if (cols(pres) > 0) X[., pres] = V[(r0::r1), cl[pres]]
				R = _wx_core(X, J(nr, 1, S.wstart[w]), J(nr, 1, D), S)
				for (k = 1; k <= K; k++) (*S.RP[k])[|r0, w \ r1, w|] = R[., k]
			}
			n = (*S.RP[1])[., w]
			MISS[w, .] = (D, mean(n), sum(n :< D), sum(n :== 0), sum(n :< S.minobs))
		}
		_wx_refcal(S)
		st_local("n_unitwin", strofreal(N * S.W))
		st_local("n_anymiss", strofreal(sum(MISS[., 3])))
		st_local("n_allmiss", strofreal(sum(MISS[., 4])))
		st_local("n_below", strofreal(sum(MISS[., 5])))
		MISS[., 3] = MISS[., 3] :/ N
		MISS[., 4] = MISS[., 4] :/ N
		st_matrix(st_local("missmat"), MISS)
		st_matrixrowstripe(st_local("missmat"), (J(S.W, 1, ""), strofreal(S.wyear)))
		st_matrixcolstripe(st_local("missmat"), (J(5, 1, ""),
			("days" \ "mean_nobs" \ "any_missing" \ "all_missing" \ "below_minobs")))
	}
	else {
		_wx_unitcompute(S, V)
	}
	_wx_gddcat(S)
	_wx_names(S, 0)
	*findexternal("_wxsum_S") = S
}

// All statistics for one set of windows.
//   X:   N x D daily values (missing = unobserved or outside the window)
//   s:   N x 1 first date of each row's window (for calendar months)
//   len: N x 1 window length; columns after len are padding
// Returns an N x K matrix with columns in the order of S.stems.
real matrix _wx_core(real matrix X, real colvector s, real colvector len, struct _wx_state scalar S)
{
	real matrix    M, Xz, Dv, Rd, Sp, G, Kd, H, R
	real colvector n, sm, mn, m0, vr, sd, sdpos, den, sk, med, rd, hd
	real colvector lead, mid, trail, bad
	real scalar    N, K, b, cap

	N = rows(X)
	K = cols(S.stems)
	R = J(N, K, .)
	M = (X :< .)
	Xz = editmissing(X, 0)
	n = rowsum(M)
	sm = rowsum(Xz)
	mn = sm :/ n
	m0 = editmissing(mn, 0)
	Dv = (Xz :- m0) :* M
	vr = (rowsum(Dv :^ 2) :/ (n :- 1)) :/ (n :>= 2)
	sd = sqrt(vr)
	sdpos = (sd :> 0) :& (sd :< .)
	den = sdpos :* editmissing(sd, 0) + (1 :- sdpos)
	sk = (n :/ ((n :- 1) :* (n :- 2))) :* rowsum((Dv :/ den) :^ 3)
	sk = sk :/ ((n :>= 3) :& sdpos)
	med = _wx_rowmedian(X, n)
	R[., (1..6)] = (n, mn, med, vr, sd, sk)
	lead = trail = mid = J(N, 1, 0)
	if (S.israin) {
		Rd = (Xz :>= S.thr) :* M
		rd = rowsum(Rd)
		Sp = M - Rd
		_wx_spells(Sp, Rd, lead, mid, trail)
		R[., (7..14)] = (sm :/ _wx_months(M, s, len, S.mode == "calendar"), sm, rd, n - rd, rd :/ n, lead, mid, trail)
	}
	else {
		cap = S.ghi - S.glo
		G = Xz :- S.glo
		G = G :* (G :> 0)
		G = G :* (G :< cap) + cap :* (G :>= cap)
		Kd = Xz :- S.kbase
		H = (Xz :>= S.hthr) :* M
		hd = rowsum(H)
		_wx_spells(H, M - H, lead, mid, trail)
		R[., (7..14)] = (rowmax(X), rowsum(G :* M), rowsum(Kd :* (Kd :> 0) :* M), hd, hd :/ n, lead, mid, trail)
	}
	for (b = 1; b <= rows(S.bins); b++) {
		R[., 14 + b] = rowsum(((Xz :>= S.bins[b, 1]) :& (Xz :< S.bins[b, 2])) :* M)
	}
	// statistics are missing when fewer than minobs() days are observed;
	// nobs (column 1) is always reported
	bad = _wx_which(n :< S.minobs)
	if (rows(bad) > 0) R[bad, (2..K)] = J(rows(bad), K - 1, .)
	return(R)
}

// Row medians of the nonmissing values (missing values sort last).
real colvector _wx_rowmedian(real matrix X, real colvector n)
{
	real scalar    N, i, k
	real colvector med
	real rowvector v

	N = rows(X)
	med = J(N, 1, .)
	for (i = 1; i <= N; i++) {
		k = n[i]
		if (k == 0) continue
		v = sort(X[i, .]', 1)'
		med[i] = (v[floor((k + 1) / 2)] + v[floor(k / 2) + 1]) / 2
	}
	return(med)
}

// Leading, mid-window, and trailing spells (plan D3/D4), all rows at once.
//   Sp: 1 for an observed spell day (dry day, or hot day), else 0
//   Bk: 1 for an observed break day (rainy day, or cooler day), else 0
// A day with neither is missing and ends any run.
void _wx_spells(real matrix Sp, real matrix Bk, real colvector lead,
	real colvector mid, real colvector trail)
{
	real scalar    N, D, d
	real matrix    P, O, Smid
	real colvector F, G, Lst, H, nb, runall, maxall, runmid, maxmid

	N = rows(Sp)
	D = cols(Sp)
	P = J(N, 1, (1..D))
	O = Sp + Bk
	// leading spell: from the first observed day F to the first later day
	// that is not a spell day (a break day or a missing day)
	F = editmissing(rowmin(P :/ O), D + 1)
	G = editmissing(rowmin(P :/ ((P :> F) :& (Sp :== 0))), D + 1)
	lead = (G - F) :* rowmax(Sp :* (P :== F))
	// trailing spell: back from the last observed day
	Lst = rowmax(P :* O)
	H = rowmax(P :* ((P :< Lst) :& (Sp :== 0)))
	trail = (Lst - H) :* rowmax(Sp :* (P :== Lst))
	// mid-window spell: with >= 2 break days, the longest run that is
	// neither the leading nor the trailing run (so the longest run anywhere is
	// max(lead, mid, trail)); otherwise the longest run anywhere. The leading
	// run is F..F+lead-1 and the trailing run Lst-trail+1..Lst; the day next to
	// each is not a spell day, so dropping them leaves the other runs intact.
	nb = rowsum(Bk)
	Smid = Sp :* !((P :>= F) :& (P :< F :+ lead)) :* !((P :> Lst :- trail) :& (P :<= Lst))
	runall = maxall = runmid = maxmid = J(N, 1, 0)
	for (d = 1; d <= D; d++) {
		runall = (runall :+ 1) :* Sp[., d]
		maxall = rowmax((maxall, runall))
		runmid = (runmid :+ 1) :* Smid[., d]
		maxmid = rowmax((maxmid, runmid))
	}
	mid = (nb :>= 2) :* maxmid + (nb :< 2) :* maxall
}

// Number of calendar months with at least one observed day in each row's
// window. Months without an observed day add nothing to the total, so the
// mean of the monthly totals is total / months.
//   same = 1: all rows share the same dates (calendar windows)
real colvector _wx_months(real matrix M, real colvector s, real colvector len, real scalar same)
{
	real scalar    N, D, k, K
	real rowvector dts, mo, sel
	real colvector um, cnt
	real matrix    dd, rel

	N = rows(M)
	D = cols(M)
	cnt = J(N, 1, 0)
	if (same) {
		dts = s[1] :+ (0..(D - 1))
		mo = year(dts) :* 12 :+ month(dts)
		um = uniqrows(mo')
		for (k = 1; k <= rows(um); k++) {
			sel = selectindex(mo :== um[k])
			cnt = cnt + rowmax(M[., sel])
		}
	}
	else {
		// relative calendar month of each day; padding columns have M = 0
		dd = s :+ J(N, 1, (0..(D - 1)))
		rel = (year(dd) :* 12 :+ month(dd)) :- (year(s) :* 12 :+ month(s))
		K = max(rel)
		for (k = 0; k <= K; k++) cnt = cnt + rowmax(M :* (rel :== k))
	}
	return(cnt)
}

// Number, mean, and standard deviation of the nonmissing reference values in
// each row of Rr. When the values of a row are all equal, the mean is that
// value: their sum can be off in the last bit (three 0.1s add up to
// 0.30000000000000004), which would give a tiny positive sd, and a huge
// z-score instead of a missing one.
void _wx_refmoments(real matrix Rr, real colvector cnt, real colvector mu,
	real colvector sdv)
{
	real matrix    Rc
	real colvector lo, same

	cnt = rownonmissing(Rr)
	mu = rowsum(Rr) :/ cnt
	lo = rowmin(Rr)
	same = _wx_which((cnt :> 0) :& (lo :== rowmax(Rr)))
	if (rows(same) > 0) mu[same] = lo[same]
	Rc = (editmissing(Rr, 0) :- editmissing(mu, 0)) :* (Rr :< .)
	sdv = sqrt(rowsum(Rc :^ 2) :/ (cnt :- 1))
}

// Deviations and z-scores for calendar windows.
void _wx_refcal(struct _wx_state scalar S)
{
	real scalar    nd, j, w, N
	real matrix    V, Rr
	real colvector idx, cnt, mu, sdv, ok, dv, qi

	N = S.N
	nd = cols(S.devk)
	S.DP = J(1, nd, NULL)
	S.ZP = J(1, nd, NULL)
	for (j = 1; j <= nd; j++) {
		S.DP[j] = &(J(N, S.W, .))
		S.ZP[j] = &(J(N, S.W, .))
		V = *S.RP[S.devk[j]]
		for (w = 1; w <= S.W; w++) {
			if (!S.wqual[w]) continue
			idx = _wx_refidx(S, w)
			Rr = V[., idx]
			_wx_refmoments(Rr, cnt, mu, sdv)
			ok = (cnt :>= S.refmin)
			dv = (V[., w] - mu) :/ ok
			(*S.DP[j])[., w] = dv
			(*S.ZP[j])[., w] = dv :/ sdv
		}
	}
	S.has_dev = (sum(S.wqual) > 0)
	st_local("has_dev", strofreal(S.has_dev))
	if (S.has_dev) {
		qi = _wx_which(S.wqual)
		st_local("first_dev", strofreal(S.wyear[qi[1]]))
	}
}

// Unit-specific windows: statistics for each row's own window, and for the
// same window in each reference year.
void _wx_unitcompute(struct _wx_state scalar S, real matrix V)
{
	real matrix    R, MISS
	real scalar    K, k, nd, j, nref, r, N
	real colvector n, ys, ye, valid, idx, s, e, cnt, mu, sdv, ok, wl
	pointer(real matrix) rowvector REF
	real matrix    Rr

	N = S.N
	K = cols(S.stems)
	R = _wx_unitpass(S, V, S.us, S.ue)
	for (k = 1; k <= K; k++) S.RP[k] = &(R[., k])

	// reference windows: the same window shifted back 1..L years, or moved
	// to each baseline year
	nd = cols(S.devk)
	ys = year(S.us)
	ye = year(S.ue)
	nref = (S.refbase ? S.b2 - S.b1 + 1 : S.L)
	REF = J(1, nd, NULL)
	for (j = 1; j <= nd; j++) REF[j] = &(J(N, nref, .))
	for (r = 1; r <= nref; r++) {
		if (S.refbase) {
			s = _wx_shiftdate(S.us, J(N, 1, S.b1 + r - 1))
			e = _wx_shiftdate(S.ue, (S.b1 + r - 1) :+ (ye - ys))
		}
		else {
			s = _wx_shiftdate(S.us, ys :- r)
			e = _wx_shiftdate(S.ue, ye :- r)
		}
		Rr = _wx_unitpass(S, V, s, e)
		for (j = 1; j <= nd; j++) (*REF[j])[., r] = Rr[., S.devk[j]]
	}
	S.DP = J(1, nd, NULL)
	S.ZP = J(1, nd, NULL)
	for (j = 1; j <= nd; j++) {
		Rr = *REF[j]
		_wx_refmoments(Rr, cnt, mu, sdv)
		ok = (cnt :>= S.refmin)
		// &(expression) points to a new matrix; a pointer to a local variable
		// (&dv) would point every stem at the same matrix, which the next
		// iteration overwrites
		S.DP[j] = &(((*S.RP[S.devk[j]]) - mu) :/ ok)
		S.ZP[j] = &((*S.DP[j]) :/ sdv)
	}
	S.has_dev = (sum((*S.DP[1]) :< .) > 0)
	st_local("has_dev", strofreal(S.has_dev))
	st_local("n_dev_ok", strofreal(sum((*S.DP[1]) :< .)))

	// missing-data summary
	n = R[., 1]
	valid = (n :< .)
	idx = _wx_which(valid)
	wl = (S.ue - S.us) :+ 1
	MISS = J(1, 7, 0)
	if (rows(idx) > 0) {
		MISS[1] = mean(wl[idx])
		MISS[2] = mean(n[idx])
		MISS[3] = mean(n[idx] :< wl[idx])
		MISS[4] = mean(n[idx] :== 0)
		MISS[5] = sum(n[idx] :< S.minobs)
	}
	else MISS[(1..4)] = J(1, 4, .)
	// windows that run past the data (with partial they use the days inside)
	MISS[6] = sum(S.ustat :== 2)
	MISS[7] = sum(S.ustat :== 0)
	st_local("n_unitwin", strofreal(rows(idx)))
	st_local("n_anymiss", strofreal(rows(idx) > 0 ? sum(n[idx] :< wl[idx]) : 0))
	st_local("n_allmiss", strofreal(rows(idx) > 0 ? sum(n[idx] :== 0) : 0))
	st_local("n_below", strofreal(MISS[5]))
	st_local("n_outside", strofreal(MISS[6]))
	st_local("n_missdate", strofreal(MISS[7]))
	st_matrix(st_local("missmat"), MISS)
	st_matrixrowstripe(st_local("missmat"), ("", "window"))
	st_matrixcolstripe(st_local("missmat"), (J(7, 1, ""),
		("days" \ "mean_nobs" \ "any_missing" \ "all_missing" \ "below_minobs" \ "outside" \ "missing_dates")))
}

// Same month and day in another year; 29 Feb becomes 28 Feb in common years.
real colvector _wx_shiftdate(real colvector d, real colvector y)
{
	real colvector m, dd
	m = month(d)
	dd = day(d)
	return(rowmax((mdy(m, dd, y), mdy(m, dd :- 1, y))))
}

// Statistics for row-specific windows [s, e], processed in chunks of rows.
real matrix _wx_unitpass(struct _wx_state scalar S, real matrix V, real colvector s, real colvector e)
{
	real scalar    N, i, maxlen, L, chunk, r0, r1, nr, row
	real colvector ok, inr, use, len, ui, s0
	real rowvector t, idx, valid, pres
	real matrix    X, R

	N = rows(s)
	ok = (s :< .) :& (e :< .)
	inr = ok :& (s :>= S.d1) :& (e :<= S.d2)
	use = (S.partial ? ok : inr)
	len = editmissing(((e - s) :+ 1) :* use, 0)
	maxlen = max((1, max(len)))
	s0 = editmissing(s, 0)
	R = J(N, cols(S.stems), .)
	chunk = max((1, floor(4000000 / maxlen)))
	for (r0 = 1; r0 <= N; r0 = r0 + chunk) {
		r1 = min((N, r0 + chunk - 1))
		nr = r1 - r0 + 1
		X = J(nr, maxlen, .)
		ui = _wx_which(use[|r0 \ r1|])
		for (i = 1; i <= rows(ui); i++) {
			row = r0 + ui[i] - 1
			L = len[row]
			t = (s[row] .. e[row])
			valid = (t :>= S.d1) :& (t :<= S.d2)
			idx = J(1, L, 0)
			if (sum(valid) > 0) idx[selectindex(valid)] = S.dmap[t[selectindex(valid)] :- S.d1 :+ 1]
			pres = selectindex(idx :> 0)
			if (cols(pres) > 0) X[ui[i], pres] = V[row, idx[pres]]
		}
		R[|r0, 1 \ r1, .|] = _wx_core(X, s0[|r0 \ r1|], len[|r0 \ r1|], S)
	}
	ui = _wx_which(use)
	if (rows(ui) < N) R[_wx_which(!use), .] = J(N - rows(ui), cols(R), .)
	return(R)
}

// GDD categories from the pooled seasonal GDD totals (v5 rules).
void _wx_gddcat(struct _wx_state scalar S)
{
	real matrix    G, C
	real colvector v
	real scalar    pmin, pmax, lo, w, hi, top, bot, nreg, ncat, n, r, elo, ehi, ah
	real matrix    sel

	S.GC = J(0, 0, .)
	if (S.gbin >= .) return
	G = *S.RP[8]
	v = select(vec(G), vec(G) :< .)
	if (rows(v) == 0) return
	pmin = min(v)
	pmax = max(v)
	lo = S.gblo
	w = S.gbin
	if (S.gbhi < .) {
		hi = S.gbhi
		top = 1
	}
	else {
		n = ceil((pmax - lo) / w)
		ah = lo + n * w
		if (pmax >= ah - 1e-12) n = n + 1
		if (n < 1) n = 1
		hi = lo + n * w
		top = 0
	}
	bot = (pmin < lo)
	nreg = round((hi - lo) / w)
	ncat = nreg + bot + top
	if (ncat > 100) {
		errprintf("gdd_bin() would create %f categories (max 100)\n", ncat)
		errprintf("Consider a wider gdd_bin(), a lower gdd_binhi(), or different endpoints\n")
		exit(198)
	}
	S.gcvals = J(0, 1, .)
	S.gctexts = J(0, 1, "")
	C = J(rows(G), cols(G), 0)
	if (bot) {
		S.gcvals = S.gcvals \ 1
		S.gctexts = S.gctexts \ ("GDD < " + _wx_fmt(lo))
		C = C + ((G :< .) :& (G :< lo))
	}
	for (r = 1; r <= nreg; r++) {
		elo = lo + (r - 1) * w
		// the last regular interval ends at hi itself: lo + nreg * w can
		// differ from gdd_binhi() in the last bit, which would leave a total
		// just below it without a category
		ehi = (r == nreg ? hi : lo + r * w)
		S.gcvals = S.gcvals \ (r + bot)
		S.gctexts = S.gctexts \ ("GDD [" + _wx_fmt(elo) + "," + _wx_fmt(ehi) + ")")
		sel = (G :< .) :& (G :>= elo - 1e-12) :& (G :< ehi - 1e-12) :& (C :== 0)
		C = C + (r + bot) :* sel
	}
	if (top) {
		S.gcvals = S.gcvals \ (nreg + bot + 1)
		S.gctexts = S.gctexts \ ("GDD >= " + _wx_fmt(hi))
		sel = (G :< .) :& (G :>= hi - 1e-12)
		C = C + ((nreg + bot + 1) :- C) :* sel
	}
	S.GC = C :/ (C :> 0)
}

// ---------------------------------------------------------------------------
// Store: create the output variables in the (already reshaped) data.
//   rowid, wid: in long output, the input row and window of each output row
// ---------------------------------------------------------------------------
void _wxsum_store(string scalar rowid, string scalar wid)
{
	struct _wx_state scalar S
	real scalar    o, kind, k, w, islong, N, firstgc
	real colvector ri, wi, lin, v, Mv
	real matrix    Msrc

	S = *findexternal("_wxsum_S")
	N = S.N
	islong = (rowid != "")
	if (islong) {
		ri = st_data(., rowid)
		wi = st_data(., wid)
		lin = (wi :- 1) :* N :+ ri
	}
	(void) st_addvar(S.otypes, S.onames)
	firstgc = 0
	for (o = 1; o <= cols(S.onames); o++) {
		kind = S.osrc[o, 1]
		k = S.osrc[o, 2]
		w = S.osrc[o, 3]
		if (kind == 5) v = S.wyear[wi]
		else {
			if (kind == 1)      Msrc = *S.RP[k]
			else if (kind == 2) Msrc = *S.DP[k]
			else if (kind == 3) Msrc = *S.ZP[k]
			else                Msrc = S.GC
			if (islong) {
				Mv = vec(Msrc)
				v = Mv[lin]
			}
			else v = Msrc[., w]
		}
		// subscripting a 1 x 1 matrix returns a row vector
		if (cols(v) > 1) v = v'
		st_store(., S.onames[o], v)
		st_varlabel(S.onames[o], S.olabels[o])
		st_global(S.onames[o] + "[wxsum_stat]", S.ostems[o])
		st_global(S.onames[o] + "[wxsum_window]", S.owins[o])
		if (kind == 4) {
			if (!firstgc) st_vlmodify(S.vlname, S.gcvals, S.gctexts)
			firstgc = 1
			st_varvaluelabel(S.onames[o], S.vlname)
		}
	}
	st_local("created", invtokens(select(S.onames, S.onames :!= "year")))
	rmexternal("_wxsum_S")
}

end
