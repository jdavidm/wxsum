* project: wxsum
* task: v6 extended feature checks and error handling
* created on: oct 2026
* created by: jdm
* edited on: 15 oct 2026
* edited by: alj
* Stata v.15.1

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	clear           all
	set more        off

* confirm repository root
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}
	adopath         ++ "."

* define assertion helper for return codes
capture program drop _assert_rc
program define _assert_rc
	args            actual expected msg
	if `actual' != `expected' {
		di as error     "FAIL: `msg'"
		di as error     "Expected rc `expected', got rc `actual'"
		exit            459
	}
	di as result    "PASS: `msg'"
end

* define helper to create daily sequence from values
capture program drop _days
program define _days
	gettoken        stub 0 : 0
	gettoken        row 0 : 0
	local           d = 0
	foreach x of local 0 {
		local           ++d
		local           v = "`stub'202001" + string(`d', "%02.0f")
		capture confirm variable `v'
		if _rc quietly gen `v' = .
		quietly replace `v' = `x' if id == `row'
	}
end

**********************************************************************
**# 1 - feature functionality tests
**********************************************************************

**## 1.1 - heat days and heat spells (heat_threshold = 30)
* create synthetic temperature panel
	clear
	set obs         5
	gen             id = _n
	_days           tmp_ 1 31 32 25 33 34 35 20 31 .  30
	_days           tmp_ 2 31 31 31 31 31 31 31 31 31 31
	_days           tmp_ 3 31 31 31 20 31 31 31 31 31 31
	_days           tmp_ 4 .  .  .  .  .  .  .  .  .  .
	_days           tmp_ 5 .  .  31 31 20 31 31 31 .  .

* execute wxsum
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(10) ///
	                    gdd_lo(10) gdd_hi(40) heat_threshold(30) keep(id) shape(wide)

* verify row 1
	assert          nobs_2020 == 9 if id == 1
	assert          heatdays_2020 == 7 if id == 1
	assert          abs(pct_heatdays_2020 - 7/9) < 1e-6 if id == 1
	assert          heat_start_2020 == 2 if id == 1
	assert          heat_2020 == 3 if id == 1
	assert          heat_end_2020 == 1 if id == 1
	assert          kdd_2020 == 16 if id == 1

* verify row 2, 3, 4, 5
	assert          heat_start_2020 == 10 & heat_2020 == 10 & heat_end_2020 == 10 if id == 2
	assert          heat_start_2020 == 3 & heat_2020 == 6 & heat_end_2020 == 6 if id == 3
	assert          nobs_2020 == 0 if id == 4
	assert          missing(heatdays_2020) & missing(heat_2020) & missing(kdd_2020) if id == 4
	assert          heat_start_2020 == 2 & heat_2020 == 3 & heat_end_2020 == 3 if id == 5

* verify labels
	local           lab : variable label heatdays_2020
	assert          "`lab'" == "Days with temp >= 30, 2020"
	local           lab : variable label kdd_2020
	assert          "`lab'" == "Killing (extreme-heat) degree days above 30, 2020"

**## 1.2 - cuts() for rainfall and temperature
* test cuts() for rainfall
	clear
	set obs         1
	gen             id = 1
	_days           rf_ 1 0 0.5 1 5 10 50 .
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(7) cuts(1 10) keep(id) shape(wide)
	assert          cut01_2020 == 2 & cut02_2020 == 2 & cut03_2020 == 2
	local           lab : variable label cut02_2020
	assert          "`lab'" == "Days with 1 <= rain < 10, 2020"
	local           lab : variable label cut01_2020
	assert          "`lab'" == "Days with rain < 1, 2020"

* test cuts() for temperature
	clear
	set obs         1
	gen             id = 1
	_days           tmp_ 1 -5 0 0.5 25 29.9 30 41
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(7) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) cuts(0 30) keep(id) shape(wide)
	assert          cut01_2020 == 1 & cut02_2020 == 4 & cut03_2020 == 2
	local           lab : variable label cut01_2020
	assert          "`lab'" == "Days with temp < 0, 2020"

**## 1.3 - cuts() validation checks
* test non-increasing and duplicate cutpoints
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(7) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) cuts(30 0)
	_assert_rc      _rc 198 "cuts() must be increasing"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(7) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) cuts(5 5)
	_assert_rc      _rc 198 "cuts() must be strictly increasing"

* test conflict with tmp_bin() and cutpoint quantity limit
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(7) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) cuts(0 30) ///
	                    tmp_bin(5) tmp_binlo(0) tmp_binhi(30)
	_assert_rc      _rc 198 "tmp_bin() and cuts() cannot be combined"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(7) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) cuts(1/42)
	_assert_rc      _rc 198 "cuts() takes at most 41 cutpoints"

**## 1.4 - nobs and minobs() threshold
* create synthetic rainfall panel
	clear
	set obs         2
	gen             id = _n
	_days           rf_ 1 1 2 3 4 5 6 7 8 9 10
	_days           rf_ 2 1 2 3 4 5 6 7 8 9 .

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(10) minobs(10) keep(id) shape(wide)
	assert          nobs_2020 == 10 & total_2020 == 55 if id == 1
	assert          nobs_2020 == 9 if id == 2
	foreach v in mean median total raindays dry {
		assert          missing(`v'_2020) if id == 2
	}
	matrix          M = r(missing)
	assert          M[1, colnumb(M, "days")] == 10
	assert          M[1, colnumb(M, "mean_nobs")] == 9.5
	assert          M[1, colnumb(M, "any_missing")] == 0.5
	assert          M[1, colnumb(M, "all_missing")] == 0
	assert          M[1, colnumb(M, "below_minobs")] == 1

* test invalid minobs(0)
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(10) minobs(0)
	_assert_rc      _rc 198 "minobs(0) is rejected"

**## 1.5 - baseline() fixed reference period
* create synthetic multi-year panel
	clear
	set obs         2
	gen             id = _n
	forvalues y = 2001/2006 {
		gen             rf_`y'0101 = cond(id == 1, (`y' - 2000) * 10, 7)
	}
	tempfile        base_in
	quietly save    `base_in'

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) ///
	                    baseline(2001 2003) keep(id) shape(wide)
	assert          abs(dev_total_2006 - 40) < 1e-6 if id == 1
	assert          abs(z_total_2006 - 4) < 1e-6 if id == 1
	assert          abs(dev_total_2002 - 0) < 1e-6 if id == 1
	assert          abs(dev_total_2001 + 10) < 1e-6 if id == 1
	assert          dev_total_2006 == 0 & missing(z_total_2006) if id == 2
	assert          r(baseline_first) == 2001 & r(baseline_last) == 2003
	assert          "`r(ref)'" == "baseline 2001-2003"
	assert          "`: char total_2006[wxsum_window]'" == "01jan-01jan 2006"
	assert          "`: char _dta[wxsum_ref]'" == "baseline 2001-2003, ref_min(3)"
	local           lab : variable label dev_total_2006
	assert          "`lab'" == "Deviation of total from 2001-2003 baseline, 2006"

**## 1.6 - baseline() validation checks
* test incompatible options and bounds
	use             `base_in', clear
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) baseline(2001 2003) lr_years(5)
	_assert_rc      _rc 198 "baseline() and lr_years() cannot be combined"
	use             `base_in', clear
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) baseline(1990 1995)
	_assert_rc      _rc 198 "baseline() outside the data is rejected"
	use             `base_in', clear
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) baseline(2003 2001)
	_assert_rc      _rc 198 "baseline() years must be increasing"
	use             `base_in', clear
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) baseline(2005 2010)
	_assert_rc      _rc 198 "baseline() with too few windows in the data is rejected"

* test ref_min() override with baseline
	use             `base_in', clear
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) ///
	                    baseline(2005 2010) ref_min(2) keep(id) shape(wide)
	assert          abs(dev_total_2001 - (10 - 55)) < 1e-6 if id == 1

**## 1.7 - deviations and z-scores for dry spells
* create 3-year panel
	clear
	set obs         1
	gen             id = 1
	foreach y in 2020 2021 2022 {
		local           k = cond(`y' == 2020, 1, cond(`y' == 2021, 3, 2))
		forvalues d = 1/5 {
			gen             rf_`y'01`=string(`d', "%02.0f")' = cond(`d' <= `k', 0, 5)
		}
	}

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(5) lr_years(2) keep(id) shape(wide)
	assert          dry_start_2022 == 2
	assert          abs(dev_dry_start_2022 - 0) < 1e-6
	assert          abs(z_dry_start_2022 - 0) < 1e-6
	confirm variable dev_dry_2022 z_dry_2022 dev_dry_end_2022 z_dry_end_2022

**## 1.8 - r() results and long format layout
* create panel
	clear
	set obs         3
	gen             id = _n
	gen str5        region = cond(id == 1, "north", "south")
	forvalues y = 2010/2013 {
		gen             rf_`y'0601 = id + `y' - 2010
		gen             rf_`y'0602 = .
	}

* execute wxsum
	wxsum           rf_, type(rain) ini_month(6) fin_month(6) ini_day(1) fin_day(2) ///
	                    lr_years(2) keep(id region)

* verify returned scalars and macros
	assert          r(N) == 12
	assert          r(N_units) == 3
	assert          r(n_windows) == 4
	assert          r(first_year) == 2010 & r(last_year) == 2013
	assert          "`r(years)'" == "2010 2011 2012 2013"
	assert          "`r(mode)'" == "calendar" & "`r(shape)'" == "long" & "`r(type)'" == "rain"
	assert          "`r(window)'" == "01jun-02jun"
	assert          r(rain_threshold) == 1 & r(lr_years) == 2 & r(ref_min) == 2 & r(minobs) == 1
	assert          strpos("`r(cmdline)'", "wxsum rf_,") == 1
	matrix          M = r(missing)
	assert          rowsof(M) == 4 & colsof(M) == 5
	assert          M[1, colnumb(M, "any_missing")] == 1

* verify output dataset structure
	assert          _N == 12
	confirm string variable region
	assert          region == "north" if id == 1
	assert          year == 2012 & total == 3 if id == 1 & year == 2012
	assert          missing(dev_total) if year <= 2011
	assert          !missing(dev_total) if year >= 2012
	capture confirm variable dev_mean, exact
	assert          _rc != 0
	capture confirm variable z_mean, exact
	assert          _rc != 0
	local           t : type nobs
	assert          inlist("`t'", "byte", "int", "long")

* verify dataset and variable characteristics
	assert          "`: char total[wxsum_stat]'" == "total"
	assert          "`: char total[wxsum_window]'" == "01jun-02jun"
	assert          "`: char year[wxsum_window]'" == "01jun-02jun"
	assert          strpos(`"`: char _dta[wxsum_cmdline]'"', "wxsum rf_,") == 1
	assert          "`: char _dta[wxsum_version]'" == "6.0.0"
	assert          "`: char _dta[wxsum_type]'" == "rain"
	assert          "`: char _dta[wxsum_shape]'" == "long"
	assert          "`: char _dta[wxsum_window]'" == "01jun-02jun"
	assert          "`: char _dta[wxsum_ref]'" == "rolling 2, ref_min(2)"
	assert          "`: char _dta[wxsum_thresholds]'" == "rain_threshold(1)"
	assert          "`: char _dta[wxsum_minobs]'" == "1"

**## 1.9 - default storage type adherence
* test default float storage
	clear
	set obs         1
	gen             id = 1
	_days           rf_ 1 1 2 4
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) keep(id)
	local           t : type mean
	assert          "`t'" == "float"

* test default double storage
	clear
	set obs         1
	gen             id = 1
	_days           rf_ 1 1 2 4
	set type        double
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) keep(id)
	local           t : type mean
	assert          "`t'" == "double"
	set type        float

**## 1.10 - outstub() prefix naming
* test prefixing output names
	clear
	set obs         1
	gen             id = 1
	_days           rf_ 1 1 2 3
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) keep(id) outstub(r_)
	confirm variable year r_total r_nobs r_dry
	capture confirm variable total
	assert          _rc != 0
	assert          "`r(outstub)'" == "r_"

* test combined wide outputs with prefixes
	clear
	set obs         1
	gen             id = 1
	_days           rf_ 1 1 2 3
	gen             tmp_20200101 = 20
	gen             tmp_20200102 = 25
	gen             tmp_20200103 = 30
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) outstub(r_) shape(wide)
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(3) ///
	                    gdd_lo(10) gdd_hi(30) heat_threshold(25) outstub(t_) shape(wide)
	confirm variable r_total_2020 t_gdd_2020 t_mean_2020 r_mean_2020

* test outstub invalid lengths and characters
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) ///
	                    outstub(abcdefghijkl) shape(wide) lr_years(2)
	_assert_rc      _rc 198 "outstub() that makes names longer than 32 characters is rejected"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) outstub(1bad)
	_assert_rc      _rc 198 "outstub() must be a valid name start"

**## 1.11 - rollback on execution error
* set up initial state
	clear
	set obs         2
	gen             id = _n
	_days           rf_ 1 1 2 3
	_days           rf_ 2 0 0 5
	gen             total_2020 = 99
	quietly datasignature
	local           sig0 "`r(datasignature)'"
	local           k0 = c(k)

* test error on existing variable name
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) shape(wide)
	_assert_rc      _rc 110 "existing output name is rejected"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig0'"
	assert          c(k) == `k0'

* test forced failure before storing results
	global          WXSUM_TEST_FAIL "store"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) keep(id) outstub(n_)
	local           rc = _rc
	global          WXSUM_TEST_FAIL ""
	_assert_rc      `rc' 9 "forced failure before writing the output"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig0'"
	assert          c(k) == `k0'
	capture confirm variable n_total
	assert          _rc != 0

* test forced failure in wide form
	global          WXSUM_TEST_FAIL "store"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) outstub(w_) shape(wide)
	local           rc = _rc
	global          WXSUM_TEST_FAIL ""
	_assert_rc      `rc' 9 "forced failure in wide form"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig0'"
	assert          c(k) == `k0'

* test existing value label conflict
	clear
	set obs         1
	gen             tmp_20200101 = 20
	label define    gddcat 1 "mine"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) gdd_bin(5)
	_assert_rc      _rc 110 "existing gddcat value label is rejected"

* test keep variable name collision preserves sort and data
	clear
	set obs         2
	gen             id = 3 - _n
	_days           rf_ 1 1 2 3
	_days           rf_ 2 0 0 5
	gen             mean = 1
	sort            id
	quietly datasignature
	local           sig1 "`r(datasignature)'"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) keep(id mean)
	_assert_rc      _rc 110 "a keep() variable with the name of an output is rejected"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig1'"
	assert          "`: sortedby'" == "id"

**## 1.12 - gdd categories value labels preservation
* create synthetic observation
	clear
	set obs         2
	gen             id = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = cond(id == 1, `d' * 100, `d' * 50)
	}

* execute wxsum
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(4) ///
	                    gdd_lo(0) gdd_hi(10000) heat_threshold(0) gdd_bin(500) ///
	                    gdd_binlo(0) outstub(g_) keep(id)
	local           lbl : value label g_gddcat
	assert          "`lbl'" == "g_gddcat"
	local           t1 : label g_gddcat 3
	assert          "`t1'" == "GDD [1000,1500)"
	assert          g_gddcat == 3 if id == 1
	assert          g_gddcat == 2 if id == 2

**## 1.13 - exact alignment between stored results and help file
* extract documented return names from help file
	local           doc ""
	tempname        fh
	file open       `fh' using "wxsum.sthlp", read text
	file read       `fh' line
	while r(eof) == 0 {
		while regexm(`"`macval(line)'"', "[{]cmd:r[(]([A-Za-z_0-9]+)[)][}]") {
			local           nm = regexs(1)
			local           doc : list doc | nm
			local           line : subinstr local line "{cmd:r(`nm')}" "", all
		}
		file read       `fh' line
	}
	file close      `fh'

* gather all return values across representative runs
	local           got ""
	clear
	set obs         2
	gen             id = _n
	_days           rf_ 1 1 2 3
	_days           rf_ 2 0 0 5
	gen             rf_20190101 = 1
	gen             rf_20190102 = 0
	gen             rf_20190103 = 2
	quietly wxsum   rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) lr_years(2) keep(id) outstub(o_)
	foreach t in scalars macros matrices {
		local           n : r(`t')
		local           got : list got | n
	}

	clear
	set obs         1
	gen             id = 1
	forvalues y = 2018/2020 {
		gen             tmp_`y'0101 = 20 + `y' - 2018
	}
	quietly wxsum   tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) ///
	                    gdd_lo(10) gdd_hi(30) heat_threshold(21) baseline(2018 2019) keep(id)
	foreach t in scalars macros matrices {
		local           n : r(`t')
		local           got : list got | n
	}

	clear
	set obs         1
	gen             id = 1
	forvalues y = 2018/2020 {
		gen             rf_`y'0101 = `y' - 2017
	}
	gen             s = td(01jan2020)
	gen             e = td(01jan2020)
	quietly wxsum   rf_, type(rain) start(s) end(e) lr_years(2) keep(id)
	foreach t in scalars macros matrices {
		local           n : r(`t')
		local           got : list got | n
	}

* compare documented vs returned items
	local           undocumented : list got - doc
	local           notreturned : list doc - got
	di as text      "documented: `doc'"
	di as text      "returned:   `got'"
	assert          "`undocumented'" == ""
	assert          "`notreturned'" == ""

**********************************************************************
**# 2 - end matter
**********************************************************************

* report test completion
	di as result    "All wxsum v6 feature checks passed."

/* END */
