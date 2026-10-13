*! version 6.0.0  13oct2026
*********************************************************************************
*  wxprep                                                                       *
*  Companion data preparation command for wxsum                                *
*  Subcommands:                                                                 *
*    wxprep towide   - Reshape long daily data to wide with calendar filling    *
*    wxprep rename   - Standardize wide variable names to YYYYMMDD suffix       *
*    wxprep tolong   - Reshape wide daily data to long                          *
*********************************************************************************

program define wxprep
	version 15.1

	gettoken subcmd 0 : 0, parse(" ,")
	local subcmd = lower("`subcmd'")

	if "`subcmd'" == "towide" {
		wxprep_towide `0'
	}
	else if "`subcmd'" == "rename" {
		wxprep_rename `0'
	}
	else if "`subcmd'" == "tolong" {
		wxprep_tolong `0'
	}
	else {
		di as error "Unknown subcommand: `subcmd'"
		di as error "Syntax: wxprep towide | wxprep rename | wxprep tolong"
		exit 198
	}
end

* =============================================================================
* 1. WXPREP TOWIDE
* =============================================================================

program define wxprep_towide, rclass
	syntax varname(numeric) [if] [in], id(varlist) date(varname) stub(string) ///
		[daily(string) dateformat(string) nofill clear save(string asis)]

	marksample touse

	* Validate save file before heavy work
	local savefile ""
	local save_replace ""
	if `"`save'"' != "" {
		local 0 `"`save'"'
		syntax [anything(name=savefile)] [, replace]
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

	* Validate daily() option
	if "`daily'" != "" {
		local daily = lower("`daily'")
		if !inlist("`daily'", "mean", "sum", "min", "max") {
			di as error "daily() must be mean, sum, min, or max"
			exit 198
		}
	}

	quietly keep if `touse'
	if _N == 0 {
		di as error "No observations"
		exit 2000
	}

	* Parse date variable to %td
	tempvar _wx_td
	capture confirm numeric variable `date'
	if _rc == 0 {
		local date_fmt : format `date'
		if regexm("`date_fmt'", "^%t[cC]") {
			quietly gen long `_wx_td' = dofc(`date')
		}
		else if regexm("`date_fmt'", "^%td") {
			quietly gen long `_wx_td' = `date'
		}
		else {
			* Check if values look like YYYYMMDD integers
			summarize `date', meanonly
			if r(min) >= 10000101 & r(max) <= 99991231 {
				quietly gen long `_wx_td' = mdy(floor(mod(`date', 10000) / 100), mod(`date', 100), floor(`date' / 10000))
			}
			else {
				* Treat as standard %td numeric date
				quietly gen long `_wx_td' = `date'
			}
		}
	}
	else {
		* String date
		if "`dateformat'" == "" {
			di as error "dateformat() is required when date() is a string variable"
			exit 198
		}
		local clean_fmt = ustrregexra("`dateformat'", "[^a-zA-Z0-9]", "")
		quietly gen long `_wx_td' = date(`date', "`dateformat'")
		if "`clean_fmt'" != "`dateformat'" & "`clean_fmt'" != "" {
			quietly replace `_wx_td' = date(`date', "`clean_fmt'") if missing(`_wx_td')
		}
	}

	format `_wx_td' %td
	capture assert !missing(`_wx_td')
	if _rc {
		di as error "Missing or unparseable dates encountered in `date'"
		exit 459
	}

	* Check duplicate id x date
	tempvar _wx_dup
	quietly duplicates tag `id' `_wx_td', gen(`_wx_dup')
	quietly count if `_wx_dup' > 0
	if r(N) > 0 {
		if "`daily'" == "" {
			di as error "Multiple observations found for the same id and date."
			di as error "Specify daily(mean|sum|min|max) to aggregate sub-daily readings."
			exit 459
		}
		else {
			quietly collapse (`daily') `varlist', by(`id' `_wx_td')
		}
	}
	capture drop `_wx_dup'

	* Discover date range
	summarize `_wx_td', meanonly
	local min_date = r(min)
	local max_date = r(max)
	local n_days = `max_date' - `min_date' + 1

	* Maxvar check
	local k_id : word count `id'
	local needed_vars = `k_id' + `n_days'
	if `needed_vars' > c(maxvar) {
		di as error "wxprep towide requires approximately `needed_vars' variables, but maxvar is " c(maxvar) "."
		di as error "Increase the variable limit using: set maxvar `needed_vars' (or higher)."
		exit 900
	}

	* Reshape wide using Mata engine
	tempvar _uid
	egen long `_uid' = group(`id')
	summarize `_uid', meanonly
	local M = r(max)

	local is_nofill = ("`fill'" == "nofill" | "`nofill'" != "")

	mata: _wxprep_towide_mata("`_uid'", "`_wx_td'", "`varlist'", "`stub'", `is_nofill')

	capture unab all_stub_vars : `stub'*
	if _rc == 0 {
		capture order `id' `all_stub_vars'
	}
	quietly sort `id'

	return scalar n_days = `n_days'
	return scalar min_date = `min_date'
	return scalar max_date = `max_date'
	return local stub "`stub'"

	* Save if requested
	if `"`savefile'"' != "" {
		di as result `"Saving wide data set as `savefile'"'
		save `"`savefile'"', `save_replace'
	}
end

* =============================================================================
* 2. WXPREP RENAME
* =============================================================================

program define wxprep_rename, rclass
	syntax varlist(numeric), stub(string) [firstdate(string) from(string) dateformat(string)]

	if "`firstdate'" == "" & ("`from'" == "" | "`dateformat'" == "") {
		di as error "Specify either firstdate(string) or from(oldstub) dateformat(string)"
		exit 198
	}
	if "`firstdate'" != "" & ("`from'" != "" | "`dateformat'" != "") {
		di as error "Cannot specify both firstdate() and from()/dateformat()"
		exit 198
	}

	local K : word count `varlist'

	* Parse planned dates and new variable names
	local planned_dates ""
	local planned_names ""

	if "`firstdate'" != "" {
		local dt0 = date("`firstdate'", "YMD")
		if missing(`dt0') local dt0 = date("`firstdate'", "DMY")
		if missing(`dt0') local dt0 = date("`firstdate'", "MDY")
		if missing(`dt0') {
			di as error "Cannot parse firstdate: '`firstdate''"
			exit 198
		}

		forvalues k = 1/`K' {
			local dtk = `dt0' + `k' - 1
			local vy = year(`dtk')
			local vm = month(`dtk')
			local vd = day(`dtk')
			local dstr = string(`vy', "%04.0f") + string(`vm', "%02.0f") + string(`vd', "%02.0f")
			local target "`stub'`dstr'"
			local planned_dates "`planned_dates' `dtk'"
			local planned_names "`planned_names' `target'"
		}
	}
	else {
		local clean_fmt = ustrregexra("`dateformat'", "[^a-zA-Z0-9]", "")
		local from_len = strlen("`from'")
		foreach v of local varlist {
			if substr("`v'", 1, `from_len') != "`from'" {
				di as error "Variable `v' does not start with prefix '`from''"
				exit 198
			}
			local sfx = substr("`v'", `from_len' + 1, .)
			local dtk = date("`sfx'", "`dateformat'")
			if missing(`dtk') & "`clean_fmt'" != "" {
				local dtk = date("`sfx'", "`clean_fmt'")
			}
			if missing(`dtk') {
				di as error "Cannot parse date from variable `v' using dateformat '`dateformat''"
				exit 198
			}
			local vy = year(`dtk')
			local vm = month(`dtk')
			local vd = day(`dtk')
			local dstr = string(`vy', "%04.0f") + string(`vm', "%02.0f") + string(`vd', "%02.0f")
			local target "`stub'`dstr'"
			local planned_dates "`planned_dates' `dtk'"
			local planned_names "`planned_names' `target'"
		}
	}

	* PRE-CHECKS: check every new name BEFORE renaming anything
	* 1. Check duplicate target names
	local uniq_names ""
	foreach tn of local planned_names {
		if `: list posof "`tn'" in uniq_names' {
			di as error "Duplicate target variable name detected: `tn'"
			exit 198
		}
		local uniq_names "`uniq_names' `tn'"
	}

	* 2. Check collisions with existing variables outside varlist
	foreach tn of local planned_names {
		capture confirm variable `tn'
		if _rc == 0 {
			if !`: list posof "`tn'" in varlist' {
				di as error "Target variable `tn' already exists in the dataset"
				exit 110
			}
		}
	}

	* 3. Validate variable names are legal Stata names
	foreach tn of local planned_names {
		capture confirm names `tn'
		if _rc {
			di as error "Target name '`tn'' is not a legal Stata variable name"
			exit 198
		}
	}

	* If all pre-checks passed, execute atomic rename
	* Use temporary intermediate names if any target name is in varlist to avoid collision
	local need_temp = 0
	foreach tn of local planned_names {
		if `: list posof "`tn'" in varlist' local need_temp = 1
	}

	if `need_temp' {
		local temp_names ""
		forvalues k = 1/`K' {
			local oldv : word `k' of `varlist'
			local tmpv "__wxprep_tmp_`k'"
			quietly rename `oldv' `tmpv'
			local temp_names "`temp_names' `tmpv'"
		}
		forvalues k = 1/`K' {
			local tmpv : word `k' of `temp_names'
			local newv : word `k' of `planned_names'
			quietly rename `tmpv' `newv'
		}
	}
	else {
		forvalues k = 1/`K' {
			local oldv : word `k' of `varlist'
			local newv : word `k' of `planned_names'
			if "`oldv'" != "`newv'" {
				quietly rename `oldv' `newv'
			}
		}
	}

	* Check date gaps
	local min_d : word 1 of `planned_dates'
	local max_d : word 1 of `planned_dates'
	foreach d of local planned_dates {
		if `d' < `min_d' local min_d = `d'
		if `d' > `max_d' local max_d = `d'
	}

	local n_gaps = 0
	forvalues dt = `min_d'/`max_d' {
		if !`: list posof "`dt'" in planned_dates' {
			local n_gaps = `n_gaps' + 1
		}
	}

	if `n_gaps' > 0 {
		local min_str : di %td `min_d'
		local max_str : di %td `max_d'
		di as text "note: date gaps detected (`n_gaps' calendar days missing between `min_str' and `max_str')."
	}

	return scalar n_renamed = `K'
	return scalar n_gaps = `n_gaps'
	return local varlist "`planned_names'"
end

* =============================================================================
* 3. WXPREP TOLONG
* =============================================================================

program define wxprep_tolong, rclass
	syntax anything(name=stub), id(varlist) [generate(string) date(string) clear]

	* Find wide variables
	capture unab wide_vars : `stub'*
	if _rc != 0 {
		di as error "No variables found with prefix '`stub''"
		exit 111
	}

	local stub_len = strlen("`stub'")
	local valid_wide_vars ""
	foreach v of local wide_vars {
		capture confirm numeric variable `v'
		if _rc == 0 {
			local sfx = substr("`v'", `stub_len' + 1, .)
			if regexm("`sfx'", "^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$") {
				local vy = real(substr("`sfx'", 1, 4))
				local vm = real(substr("`sfx'", 5, 2))
				local vd = real(substr("`sfx'", 7, 2))
				local vdate = mdy(`vm', `vd', `vy')
				if !missing(`vdate') & year(`vdate') == `vy' & month(`vdate') == `vm' & day(`vdate') == `vd' {
					local valid_wide_vars "`valid_wide_vars' `v'"
				}
			}
		}
	}

	local n_wide : word count `valid_wide_vars'
	if `n_wide' == 0 {
		di as error "No numeric wide daily variables found with prefix '`stub'' and yyyymmdd suffix"
		exit 111
	}

	* Target variable names
	if "`date'" == "" local date "date"
	if "`generate'" == "" {
		local generate "`stub'"
		if substr("`generate'", -1, 1) == "_" {
			local generate = substr("`generate'", 1, strlen("`generate'") - 1)
		}
	}

	* Check collision
	if `: list posof "`date'" in id' {
		di as error "Output date variable '`date'' conflicts with id variable list"
		exit 198
	}
	if `: list posof "`generate'" in id' {
		di as error "Output variable '`generate'' conflicts with id variable list"
		exit 198
	}

	* Keep only id and wide daily variables
	quietly keep `id' `valid_wide_vars'
	local K = `n_wide'

	* Extract vectors via Mata, expand IDs in Stata, and store long columns
	mata: _wxprep_tolong_step1("`valid_wide_vars'")
	quietly drop `valid_wide_vars'
	quietly expand `K'
	quietly sort `id'
	mata: _wxprep_tolong_step2("`generate'", "`date'")

	capture order `id' `date' `generate'
	quietly sort `id' `date'

	return scalar n_days = `K'
	return scalar n_obs = _N
end

* =============================================================================
* MATA HELPERS FOR WXPREP TOLONG
* =============================================================================

mata:
mata set matastrict on

void _wxprep_tolong_step1(string scalar wide_var_str)
{
	string rowvector wide_varnames
	real rowvector dates, p
	real matrix val_data
	real scalar K, k, N, vy, vm, vd
	string scalar vname, sfx
	pointer(real matrix) scalar val_ptr, date_ptr

	wide_varnames = tokens(wide_var_str)
	K = cols(wide_varnames)
	dates = J(1, K, .)
	for (k = 1; k <= K; k++) {
		vname = wide_varnames[k]
		sfx = substr(vname, strlen(vname) - 7, 8)
		vy = strtoreal(substr(sfx, 1, 4))
		vm = strtoreal(substr(sfx, 5, 2))
		vd = strtoreal(substr(sfx, 7, 2))
		dates[k] = mdy(vm, vd, vy)
	}
	p = order(dates', 1)
	dates = dates[p]
	wide_varnames = wide_varnames[p]

	val_data = st_data(., wide_varnames)
	N = rows(val_data)

	rmexternal("_WXPREP_VAL_VEC")
	rmexternal("_WXPREP_DATE_VEC")
	val_ptr = crexternal("_WXPREP_VAL_VEC")
	date_ptr = crexternal("_WXPREP_DATE_VEC")
	*val_ptr = vec(val_data[., p]')
	*date_ptr = vec(J(N, 1, dates)')
}

void _wxprep_tolong_step2(string scalar out_val_var, string scalar out_date_var)
{
	pointer(real colvector) scalar val_ptr, date_ptr
	real scalar d_idx, v_idx

	val_ptr = findexternal("_WXPREP_VAL_VEC")
	date_ptr = findexternal("_WXPREP_DATE_VEC")

	d_idx = st_addvar("long", out_date_var)
	st_varformat(d_idx, "%td")
	st_varlabel(d_idx, "Date (%td)")
	st_store(., d_idx, *date_ptr)

	v_idx = st_addvar("float", out_val_var)
	st_store(., v_idx, *val_ptr)

	rmexternal("_WXPREP_VAL_VEC")
	rmexternal("_WXPREP_DATE_VEC")
}

void _wxprep_towide_mata(string scalar uid_var, string scalar date_var, string scalar val_var, string scalar stub, real scalar nofill)
{
	real colvector uid, d, v, unique_dates
	real matrix Mwide
	real scalar M, D, i, r, c, min_d, max_d, vy, vm, vd, idx, dt
	transmorphic date_map
	string scalar val_type, vstr, vname

	uid = st_data(., uid_var)
	d = st_data(., date_var)
	v = st_data(., val_var)
	val_type = st_vartype(val_var)

	M = max(uid)
	min_d = min(d)
	max_d = max(d)

	if (nofill) {
		unique_dates = sort(uniqrows(d), 1)
		D = rows(unique_dates)
		date_map = asarray_create("real", 1)
		for (c = 1; c <= D; c++) {
			asarray(date_map, unique_dates[c], c)
		}
		Mwide = J(M, D, .)
		for (i = 1; i <= rows(uid); i++) {
			r = uid[i]
			c = asarray(date_map, d[i])
			Mwide[r, c] = v[i]
		}
	}
	else {
		unique_dates = (min_d::max_d)
		D = rows(unique_dates)
		Mwide = J(M, D, .)
		for (i = 1; i <= rows(uid); i++) {
			r = uid[i]
			c = d[i] - min_d + 1
			Mwide[r, c] = v[i]
		}
	}

	// Collapse Stata data to M rows keeping only id
	stata("bysort " + st_local("id") + ": keep if _n == 1")
	stata("sort " + st_local("id"))
	stata("keep " + st_local("id"))

	// Create variables and store data
	for (c = 1; c <= D; c++) {
		dt = unique_dates[c]
		vy = year(dt)
		vm = month(dt)
		vd = day(dt)
		vstr = sprintf("%04.0f%02.0f%02.0f", vy, vm, vd)
		vname = stub + vstr
		idx = st_addvar(val_type, vname)
		st_store(., idx, Mwide[., c])
	}
}
end
