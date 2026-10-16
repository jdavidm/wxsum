*! version 1.0.0  16oct2026
*********************************************************************************
*  wxprep: prepares daily weather data for wxsum                                *
*    wxprep towide  long data (one row per unit-day) -> wide wxsum layout       *
*    wxprep rename  wide data with other variable names -> stub + yyyymmdd      *
*    wxprep tolong  wide wxsum layout -> long data (one row per unit-day)       *
*  Part of the wxsum package.                                                   *
*  v 0.1  11oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*         towide, rename, and tolong; daily() combines readings within a day;   *
*         reshaping in Mata                                                     *
*  v 0.2  15oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*         Missing or empty id() values are rejected; new variables get the      *
*         narrowest storage type that holds every value exactly, instead of     *
*         compress (much faster); tolong keeps double and long values exact;    *
*         dates with data counted in Mata                                       *
*  v 0.3  15oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*         save() option for tolong                                              *
*  v 1.0  16oct2026 by Anna Josephson - aljosephson@arizona.edu                 *
*         Audit fixes: a failed save() leaves the data unchanged; years before  *
*         1000 keep four digits in variable names; shorter messages. Release    *
*         version.                                                              *
*********************************************************************************

program define wxprep, rclass
	version 15.1
	gettoken sub 0 : 0, parse(" ,")
	if "`sub'" == "towide" {
		_wxprep_towide `0'
	}
	else if "`sub'" == "rename" {
		_wxprep_rename `0'
	}
	else if "`sub'" == "tolong" {
		_wxprep_tolong `0'
	}
	else {
		if "`sub'" == "" di as error "subcommand required: wxprep towide, wxprep rename, or wxprep tolong"
		else di as error "unknown subcommand `sub': use wxprep towide, wxprep rename, or wxprep tolong"
		exit 198
	}
	return add
end

* ---------------------------------------------------------------------------
* wxprep towide varname [if] [in], id(varlist) date(varname) stub(string)
*     [daily(mean|sum|min|max) dateformat(string) nofill clear save(filename [, replace])]
* ---------------------------------------------------------------------------
program define _wxprep_towide, rclass
	syntax varname(numeric) [if] [in], id(varlist) date(varname) stub(string) ///
		[daily(string) dateformat(string) NOFILL clear save(string asis)]
	local value "`varlist'"

	if c(changed) & "`clear'" == "" {
		di as error "no; data in memory would be lost"
		di as error "wxprep towide replaces the data in memory; save them first or specify clear"
		exit 4
	}
	_wxprep_checkstub "`stub'"
	local in_id : list value in id
	local date_in_id : list date in id
	if `in_id' | `date_in_id' {
		di as error "id() must not include the weather variable or the date variable"
		exit 198
	}
	if "`daily'" != "" & !inlist("`daily'", "mean", "sum", "min", "max") {
		di as error "daily() must be mean, sum, min, or max"
		exit 198
	}
	local save_file ""
	local save_replace ""
	if `"`save'"' != "" {
		_wxprep_saveopt `save'
		local save_file `"`r(file)'"'
		local save_replace "`r(replace)'"
	}

	marksample touse, novarlist
	preserve
	quietly keep if `touse'
	if _N == 0 {
		di as error "no observations"
		exit 2000
	}
	quietly keep `id' `date' `value'

	* missing identifiers (numeric missing or empty strings) are not allowed
	foreach v of local id {
		quietly count if missing(`v')
		if r(N) {
			di as error "id() variable `v' is missing in `r(N)' observations"
			exit 416
		}
	}

	* daily date
	tempvar d
	capture confirm string variable `date'
	if !_rc {
		if `"`dateformat'"' == "" {
			di as error "`date' is a string; specify its order with dateformat(), e.g. dateformat(YMD)"
			exit 198
		}
		quietly gen long `d' = date(`date', `"`dateformat'"')
	}
	else {
		if `"`dateformat'"' != "" {
			di as error "dateformat() is only used with string dates"
			exit 198
		}
		local fmt : format `date'
		if regexm("`fmt'", "^%-?tc") quietly gen long `d' = dofc(`date')
		else if regexm("`fmt'", "^%-?tC") quietly gen long `d' = dofC(`date')
		else if regexm("`fmt'", "^%-?td") {
			quietly count if !missing(`date') & `date' != floor(`date')
			if r(N) {
				di as error "`date' has non-integer daily dates in `r(N)' observations"
				exit 198
			}
			quietly gen long `d' = `date'
		}
		else {
			* YYYYMMDD integers
			quietly count if !missing(`date') & (`date' != floor(`date') | `date' < 10000101 | `date' > 99991231)
			if r(N) {
				di as error "date() must be a %td daily date, a %tc datetime, a YYYYMMDD integer,"
				di as error "or a string date with dateformat()"
				exit 198
			}
			quietly gen long `d' = mdy(mod(floor(`date' / 100), 100), mod(`date', 100), floor(`date' / 10000))
		}
	}
	quietly count if missing(`d')
	if r(N) {
		di as error "`date' is missing or not a valid date in `r(N)' observations"
		exit 416
	}

	* several readings on the same day: combine with daily(), or stop
	tempvar ndup cnt
	sort `id' `d'
	quietly by `id' `d': gen long `ndup' = _N
	quietly count if `ndup' > 1
	local n_dupobs = r(N)
	local n_combined = 0
	if `n_dupobs' {
		if "`daily'" == "" {
			di as error "`n_dupobs' observations share an id() and a date;"
			di as error "use daily(mean), daily(sum), daily(min), or daily(max) to combine readings within a day"
			exit 459
		}
		local n_before = _N
		quietly collapse (`daily') `value' (count) `cnt' = `value', by(`id' `d') fast
		* a day whose readings are all missing stays missing
		quietly replace `value' = . if `cnt' == 0
		drop `cnt'
		local n_combined = `n_before' - _N
	}
	else drop `ndup'

	* sizes and maxvar
	quietly summarize `d', meanonly
	local dmin = r(min)
	local dmax = r(max)
	tempvar g t
	quietly egen long `g' = group(`id')
	quietly gen long `t' = `d' - `dmin' + 1
	* n_present: dates with data, counted in Mata without sorting
	mata: _wxprep_ndates("`t'", `dmax' - `dmin' + 1)
	local n_days = cond("`nofill'" != "", `n_present', `dmax' - `dmin' + 1)
	local nid : word count `id'
	if `nid' + `n_days' + 2 > c(maxvar) {
		di as error "the wide data need `=`nid' + `n_days'' variables, but maxvar is `c(maxvar)'."
		di as error "Save your data, type -clear all-, -set maxvar #- with a larger number,"
		di as error "reload the data, and run wxprep again, or convert fewer days at a time with if or in."
		exit 900
	}
	* the daily variables get the narrowest storage type that holds every
	* value exactly, chosen in Mata (much faster than -compress- on thousands
	* of variables); non-integer values keep float, or double if the input is
	* double or long
	local vtype : type `value'
	local vsrc = cond(inlist("`vtype'", "double", "long"), "double", "float")

	* read the values into Mata, keep one row per unit, then write the
	* daily variables
	mata: _wxprep_read("`g'", "`t'", "`value'")
	quietly bysort `g': keep if _n == 1
	quietly keep `id' `g'
	sort `g'
	mata: _wxprep_write("`stub'", `dmin', `dmax' - `dmin' + 1, ("`nofill'" == ""), "`vsrc'")
	drop `g'
	* save before -restore, not-, so that a failed save restores the input
	if `"`save_file'"' != "" quietly save `"`save_file'"', `save_replace'
	restore, not

	local n_filled = `n_days' - `n_present'
	local units = cond(_N == 1, "unit", "units")
	local dvars = cond(`n_days' == 1, "daily variable", "daily variables")
	di as text "wxprep towide: " as result _N as text " `units', " as result `n_days' as text " `dvars' " ///
		as result "`first_var'" as text " to " as result "`last_var'"
	if `n_filled' di as text "  `n_filled' days without data were added as missing days (nofill skips them)"
	if `n_combined' di as text "  `n_combined' readings were combined into daily values with daily(`daily')"
	if `"`save_file'"' != "" di as text `"  saved as `save_file'"'

	return scalar N = _N
	return scalar n_days = `n_days'
	return scalar n_filled = `n_filled'
	return scalar n_combined = `n_combined'
	return scalar first_date = `dmin'
	return scalar last_date = `dmax'
	return local stub "`stub'"
	return local first_var "`first_var'"
	return local last_var "`last_var'"
end

* ---------------------------------------------------------------------------
* wxprep rename varlist, stub(string) firstdate(string)
* wxprep rename varlist, stub(string) from(string) dateformat(string)
* ---------------------------------------------------------------------------
program define _wxprep_rename, rclass
	syntax varlist(numeric), stub(string) [firstdate(string) from(string) dateformat(string)]
	_wxprep_checkstub "`stub'"
	if "`firstdate'" != "" {
		if `"`from'`dateformat'"' != "" {
			di as error "use either firstdate() or from() with dateformat(), not both"
			exit 198
		}
		local fd = .
		if regexm("`firstdate'", "^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$") {
			local fd = mdy(real(substr("`firstdate'", 5, 2)), real(substr("`firstdate'", 7, 2)), real(substr("`firstdate'", 1, 4)))
		}
		else {
			local fd = date("`firstdate'", "DMY")
			if missing(`fd') local fd = date("`firstdate'", "YMD")
		}
		if missing(`fd') {
			di as error "firstdate() must be a date such as 01jan1993, 1993-01-01, or 19930101"
			exit 198
		}
		local mode "first"
	}
	else {
		if `"`from'"' == "" | `"`dateformat'"' == "" {
			di as error "wxprep rename needs firstdate(), or from() and dateformat()"
			exit 198
		}
		local fd = .
		local mode "from"
	}
	mata: _wxprep_renameplan("`varlist'", "`stub'", "`mode'", `fd', `"`from'"', `"`dateformat'"')
	rename (`varlist') (`newnames')
	local n : word count `varlist'
	di as text "wxprep rename: " as result `n' as text " variables renamed, " ///
		as result "`first_var'" as text " to " as result "`last_var'"
	if `n_gaps' di as text "  note: `n_gaps' calendar days between the first and last date have no variable"
	return scalar n_vars = `n'
	return scalar first_date = `rd1'
	return scalar last_date = `rd2'
	return scalar n_gaps = `n_gaps'
	return local stub "`stub'"
	return local first_var "`first_var'"
	return local last_var "`last_var'"
end

* ---------------------------------------------------------------------------
* wxprep tolong stub, id(varlist) [generate(name) date(name) clear save(filename [, replace])]
* ---------------------------------------------------------------------------
program define _wxprep_tolong, rclass
	syntax anything(name=stub id="stub"), id(varlist) [GENerate(name) date(name) clear save(string asis)]
	if `: word count `stub'' != 1 {
		di as error "specify one stub, the common prefix of the daily variables (e.g., rf_)"
		exit 198
	}
	if c(changed) & "`clear'" == "" {
		di as error "no; data in memory would be lost"
		di as error "wxprep tolong replaces the data in memory; save them first or specify clear"
		exit 4
	}
	local save_file ""
	local save_replace ""
	if `"`save'"' != "" {
		_wxprep_saveopt `save'
		local save_file `"`r(file)'"'
		local save_replace "`r(replace)'"
	}
	if "`generate'" == "" {
		local generate = cond(substr("`stub'", -1, 1) == "_", substr("`stub'", 1, strlen("`stub'") - 1), "`stub'")
		capture confirm name `generate'
		if _rc {
			di as error "specify the name of the weather variable with generate()"
			exit 198
		}
	}
	if "`date'" == "" local date "date"
	if "`generate'" == "`date'" {
		di as error "generate() and date() must be different names"
		exit 198
	}
	local clash : list id & generate
	local clash2 : list id & date
	if "`clash'`clash2'" != "" {
		di as error "generate() and date() must not be id() variables"
		exit 198
	}
	capture isid `id'
	if _rc {
		di as error "id() does not uniquely identify the observations"
		exit 459
	}

	preserve
	mata: _wxprep_tolong_read("`stub'")
	quietly keep `id'
	tempvar rowid j
	quietly gen long `rowid' = _n
	if `n_days' > 1 quietly expand `n_days'
	sort `rowid', stable
	quietly by `rowid': gen long `j' = _n
	mata: _wxprep_tolong_write("`rowid'", "`j'", "`date'", "`generate'", "`vtype'")
	drop `rowid' `j'
	format `date' %td
	label variable `date' "Date"
	sort `id' `date'
	* save before -restore, not-, so that a failed save restores the input
	if `"`save_file'"' != "" quietly save `"`save_file'"', `save_replace'
	restore, not

	di as text "wxprep tolong: " as result `n_units' as text " units x " as result `n_days' ///
		as text " days = " as result _N as text " observations"
	di as text "  new variables " as result "`date'" as text " and " as result "`generate'"
	if `"`save_file'"' != "" di as text `"  saved as `save_file'"'

	return scalar N = _N
	return scalar n_units = `n_units'
	return scalar n_days = `n_days'
	return scalar first_date = `d1'
	return scalar last_date = `d2'
	return local generate "`generate'"
	return local date "`date'"
end

* stub + yyyymmdd must be a valid name of at most 32 characters
program define _wxprep_checkstub
	args stub
	if !regexm("`stub'", "^[A-Za-z_][A-Za-z0-9_]*$") | strlen("`stub'") > 24 {
		di as error "stub() must start with a letter or underscore, contain only letters, digits,"
		di as error "and underscores, and have at most 24 characters"
		exit 198
	}
end

* save(filename [, replace])
program define _wxprep_saveopt, rclass
	capture syntax anything(name=spec id="filename") [, REPLACE]
	if _rc {
		di as error "save() must be save(filename [, replace])"
		exit 198
	}
	gettoken file rest : spec
	if `"`rest'"' != "" {
		di as error "save() takes a single filename; enclose names with spaces in quotes"
		exit 198
	}
	if !regexm(`"`file'"', "\.[A-Za-z0-9]+$") local file `"`file'.dta"'
	if "`replace'" == "" {
		capture confirm new file `"`file'"'
		if _rc == 602 {
			di as error `"file `file' already exists; specify save(`file', replace) to overwrite it"'
			exit 602
		}
		else if _rc {
			di as error `"cannot write file `file'"'
			exit _rc
		}
	}
	return local file `"`file'"'
	return local replace "`replace'"
end

version 15.1
mata:

// The narrowest storage type that holds every value of X exactly: byte, int,
// or long for integers in range, otherwise src (float or double).
string scalar _wxprep_type(real matrix X, string scalar src)
{
	real scalar    j, lo, hi, any
	real colvector v

	lo = hi = .
	any = 0
	for (j = 1; j <= cols(X); j++) {
		v = select(X[., j], X[., j] :< .)
		if (rows(v) == 0) continue
		any = 1
		if (!all(v :== floor(v))) return(src)
		lo = min((lo, min(v)))
		hi = max((hi, max(v)))
	}
	if (!any) return("byte")
	if (lo >= -127 & hi <= 100) return("byte")
	if (lo >= -32767 & hi <= 32740) return("int")
	if (lo >= -2147483647 & hi <= 2147483620) return("long")
	return(src)
}

// towide: number of distinct dates with data (t is 1..D), without sorting
void _wxprep_ndates(string scalar tv, real scalar D)
{
	real matrix    t
	real colvector seen
	st_view(t, ., tv)
	seen = J(D, 1, 0)
	// [t, 1], not [t]: a 1 x 1 seen (a single date) would act as a row vector
	seen[t, 1] = J(rows(t), 1, 1)
	st_local("n_present", strofreal(sum(seen)))
}

// towide, step 1: unit index g, day index t and value x, kept in Mata
void _wxprep_read(string scalar gv, string scalar tv, string scalar xv)
{
	pointer() scalar p
	real matrix      A
	A = st_data(., (gv, tv, xv))
	p = findexternal("_wxprep_A")
	if (p == NULL) p = crexternal("_wxprep_A")
	*p = A
}

// towide, step 2: one daily variable per date, written in blocks of days
//   src: storage type for non-integer values (float or double)
void _wxprep_write(string scalar stub, real scalar dmin, real scalar D,
	real scalar fill, string scalar src)
{
	real matrix      A, W
	real colvector   g, t, x, cp, o, v, sel
	real rowvector   days, colpos, dts
	string rowvector names
	real scalar      G, nc, B, c0, c1, k, r0, r1, nb
	real colvector   cnt, start

	A = *findexternal("_wxprep_A")
	rmexternal("_wxprep_A")
	g = A[., 1]
	t = A[., 2]
	x = A[., 3]
	G = st_nobs()
	if (fill) days = (1..D)
	else days = uniqrows(t)'
	nc = cols(days)
	colpos = J(1, D, 0)
	colpos[days] = (1..nc)
	dts = days :+ (dmin - 1)
	names = J(1, nc, "")
	for (k = 1; k <= nc; k++) {
		names[k] = stub + strofreal(year(dts[k]), "%04.0f") + strofreal(month(dts[k]), "%02.0f") + strofreal(day(dts[k]), "%02.0f")
	}
	(void) st_addvar(_wxprep_type(x, src), names)
	// observations sorted by output column, so that each block is contiguous
	cp = colpos[t]'
	o = order(cp, 1)
	cp = cp[o]
	g = g[o]
	x = x[o]
	B = max((1, floor(4000000 / max((1, G)))))
	r0 = 1
	for (c0 = 1; c0 <= nc; c0 = c0 + B) {
		c1 = min((nc, c0 + B - 1))
		nb = c1 - c0 + 1
		r1 = r0 - 1
		while (r1 < rows(cp)) {
			if (cp[r1 + 1] > c1) break
			r1++
		}
		v = J(G * nb, 1, .)
		if (r1 >= r0) v[(cp[|r0 \ r1|] :- c0) :* G :+ g[|r0 \ r1|]] = x[|r0 \ r1|]
		W = colshape(v, G)'
		st_store(., names[|c0 \ c1|], W)
		r0 = r1 + 1
	}
	st_local("first_var", names[1])
	st_local("last_var", names[nc])
}

// rename: new names for wide data that do not follow stub + yyyymmdd
void _wxprep_renameplan(string scalar vl, string scalar stub, string scalar mode,
	real scalar fd, string scalar from, string scalar mask)
{
	string rowvector old, others, newn
	real rowvector   dts, o
	real scalar      k, n, L, gaps
	string scalar    rest

	old = tokens(vl)
	n = cols(old)
	if (mode == "first") dts = fd :+ (0..(n - 1))
	else {
		L = strlen(from)
		dts = J(1, n, .)
		for (k = 1; k <= n; k++) {
			if (substr(old[k], 1, L) != from) {
				errprintf("%s does not start with %s\n", old[k], from)
				exit(198)
			}
			rest = substr(old[k], L + 1, .)
			dts[k] = date(rest, mask)
			if (dts[k] >= .) {
				errprintf("%s: %s is not a date in dateformat(%s)\n", old[k], rest, mask)
				exit(198)
			}
		}
	}
	o = order(dts', 1)'
	for (k = 2; k <= n; k++) {
		if (dts[o[k]] == dts[o[k - 1]]) {
			errprintf("%s and %s have the same date\n", old[o[k - 1]], old[o[k]])
			exit(198)
		}
	}
	newn = J(1, n, "")
	for (k = 1; k <= n; k++) {
		newn[k] = stub + strofreal(year(dts[k]), "%04.0f") + strofreal(month(dts[k]), "%02.0f") + strofreal(day(dts[k]), "%02.0f")
		if (strlen(newn[k]) > 32) {
			errprintf("new name %s is longer than 32 characters; use a shorter stub()\n", newn[k])
			exit(198)
		}
	}
	others = st_varname(1..st_nvar())
	for (k = 1; k <= n; k++) {
		if (anyof(others, newn[k]) & !anyof(old, newn[k])) {
			errprintf("variable %s already defined\n", newn[k])
			exit(110)
		}
	}
	gaps = (max(dts) - min(dts) + 1) - n
	st_local("newnames", invtokens(newn))
	st_local("n_gaps", strofreal(gaps))
	st_local("rd1", strofreal(min(dts)))
	st_local("rd2", strofreal(max(dts)))
	st_local("first_var", newn[o[1]])
	st_local("last_var", newn[o[n]])
}

// tolong, step 1: find stub + yyyymmdd variables and read their values
void _wxprep_tolong_read(string scalar stub)
{
	pointer() scalar p
	real scalar      nv, L, k, dbl
	real rowvector   idx, ok, dates, o
	string rowvector names, sfx
	real matrix      X

	nv = st_nvar()
	L = strlen(stub)
	names = st_varname(1..nv)
	idx = selectindex((substr(names, 1, L) :== stub) :& (strlen(names) :== L + 8))
	if (cols(idx) > 0) {
		names = names[idx]
		sfx = substr(names, L + 1, 8)
		ok = J(1, cols(idx), 0)
		for (k = 1; k <= cols(idx); k++) ok[k] = (regexm(sfx[k], "^[0-9]+$") & st_isnumvar(idx[k]))
		dates = mdy(strtoreal(substr(sfx, 5, 2)), strtoreal(substr(sfx, 7, 2)), strtoreal(substr(sfx, 1, 4)))
		ok = ok :& (dates :< .)
		idx = select(idx, ok)
		dates = select(dates, ok)
	}
	if (cols(idx) == 0) {
		errprintf("No numeric daily variables found with prefix %s and yyyymmdd suffix\n", stub)
		exit(111)
	}
	o = order(dates', 1)'
	idx = idx[o]
	dates = dates[o]
	// non-integer values are stored as double if any daily variable is double
	// or long (float cannot hold every long exactly), otherwise as float
	dbl = 0
	for (k = 1; k <= cols(idx); k++) dbl = dbl | anyof(("double", "long"), st_vartype(idx[k]))
	X = st_data(., idx)
	p = findexternal("_wxprep_X")
	if (p == NULL) p = crexternal("_wxprep_X")
	*p = (dates \ X)
	st_local("n_days", strofreal(cols(idx)))
	st_local("n_units", strofreal(rows(X)))
	st_local("d1", strofreal(dates[1]))
	st_local("d2", strofreal(dates[cols(dates)]))
	st_local("vtype", (dbl ? "double" : "float"))
}

// tolong, step 2: one row per unit-day after -expand-
//   src: storage type for non-integer values (float or double)
void _wxprep_tolong_write(string scalar rowid, string scalar j, string scalar datev,
	string scalar valv, string scalar src)
{
	real matrix    A, X
	real rowvector dates
	real colvector ri, ji, lin, Xv

	A = *findexternal("_wxprep_X")
	rmexternal("_wxprep_X")
	dates = A[1, .]
	X = A[|2, 1 \ rows(A), cols(A)|]
	ri = st_data(., rowid)
	ji = st_data(., j)
	(void) st_addvar("long", datev)
	(void) st_addvar(_wxprep_type(X, src), valv)
	st_store(., datev, dates[ji]')
	Xv = vec(X)
	lin = (ji :- 1) :* rows(X) :+ ri
	st_store(., valv, Xv[lin])
}

end
