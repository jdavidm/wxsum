* project: wxsum
* task: v6 core correctness and option validation checks
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

**********************************************************************
**# 1 - core functionality checks
**********************************************************************

**## 1.1 - empty rainfall season produces missing stats
* create panel with unobserved unit
	clear
	set obs         2
	gen             id = _n
	gen             rf_20200101 = cond(id == 1, ., 2)
	gen             rf_20200102 = cond(id == 1, ., 3)

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(2) keep(id) shape(wide)

* verify unobserved unit gets missing and observed unit gets statistics
	foreach v in total mean_mo raindays norain pct_raindays mean median dry_start dry dry_end {
		assert          missing(`v'_2020) if id == 1
	}
	assert          total_2020 == 5 if id == 2
	assert          raindays_2020 == 2 if id == 2
	assert          norain_2020 == 0 if id == 2

**## 1.2 - empty temperature season produces missing gdd and kdd
* create panel with unobserved unit
	clear
	set obs         2
	gen             id = _n
	gen             tmp_20200101 = cond(id == 1, ., 20)
	gen             tmp_20200102 = cond(id == 1, ., 30)

* execute wxsum
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) ///
	                    gdd_lo(10) gdd_hi(25) heat_threshold(25) keep(id) shape(wide)

* verify missing outputs
	assert          missing(gdd_2020) & missing(kdd_2020) & missing(max_2020) if id == 1
	assert          gdd_2020 == 25 if id == 2
	assert          kdd_2020 == 5 if id == 2

**## 1.3 - empty seasons excluded from rolling baseline
* create time series with empty base year
	clear
	set obs         1
	gen             rf_20200101 = .
	gen             rf_20210101 = 10
	gen             rf_20220101 = 20
	gen             rf_20230101 = 60

* execute wxsum with default ref_min()
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) shape(wide)
	assert          missing(total_2020)
	assert          missing(dev_total_2023)
	assert          missing(z_total_2023)

* execute wxsum with ref_min(2)
	clear
	set obs         1
	gen             rf_20200101 = .
	gen             rf_20210101 = 10
	gen             rf_20220101 = 20
	gen             rf_20230101 = 60
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(2) shape(wide)
	assert          abs(dev_total_2023 - 45) < 1e-6
	assert          abs(z_total_2023 - 45 / sqrt(50)) < 1e-6

**## 1.4 - ref_min() parameter validation
* test ref_min() rejection limits
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(1)
	_assert_rc      _rc 198 "ref_min(1) is rejected"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(4)
	_assert_rc      _rc 198 "ref_min() above lr_years() is rejected"

**## 1.5 - monthly totals grouped by calendar year-month
* create multi-month spanning window
	clear
	set obs         1
	forvalues d = `=td(15may2020)'/`=td(10may2021)' {
		local           y = year(`d')
		local           m = string(month(`d'), "%02.0f")
		local           dd = string(day(`d'), "%02.0f")
		local           val = cond(`y' == 2020 & month(`d') == 5, 1, cond(`y' == 2021 & month(`d') == 5, 2, 0))
		gen             rf_`y'`m'`dd' = `val'
	}

* execute wxsum
	wxsum           rf_, type(rain) ini_month(5) ini_day(15) fin_month(5) fin_day(10) shape(wide)
	assert          abs(mean_mo_2020 - 37 / 13) < 1e-6

**## 1.6 - unobserved month excluded from mean_mo
* create window with middle unobserved month
	clear
	set obs         1
	forvalues d = `=td(01jan2020)'/`=td(31mar2020)' {
		local           m = string(month(`d'), "%02.0f")
		local           dd = string(day(`d'), "%02.0f")
		gen             rf_2020`m'`dd' = cond(month(`d') == 2, ., 1)
	}

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(3) shape(wide)
	assert          abs(mean_mo_2020 - 31) < 1e-6

**## 1.7 - option and type compatibility checks
* test option mismatches
	clear
	set obs         1
	gen             rf_20200101 = 1
	gen             tmp_20200101 = 20
	foreach opt in "gdd_lo(0)" "gdd_hi(30)" "heat_threshold(30)" "kdd_base(30)" {
		capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) `opt'
		_assert_rc      _rc 198 "`opt' with type(rain) is rejected"
	}
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(30) rain_threshold(1)
	_assert_rc      _rc 198 "rain_threshold() with type(temp) is rejected"

* test non-numeric thresholds
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) rain_threshold(abc)
	_assert_rc      _rc 198 "non-numeric rain_threshold() is rejected"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) ///
	                    gdd_lo(0) gdd_hi(30) heat_threshold(hot)
	_assert_rc      _rc 198 "non-numeric heat_threshold() is rejected"

**## 1.8 - heat_threshold required for type(temp)
* test requirement of heat_threshold and gdd bounds
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30)
	_assert_rc      _rc 198 "missing heat_threshold() is rejected"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30) kdd_base(30)
	_assert_rc      _rc 198 "v5-style kdd_base() without heat_threshold() is rejected"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) heat_threshold(30) gdd_hi(30)
	_assert_rc      _rc 198 "missing gdd_lo() is rejected"
	capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) heat_threshold(30) gdd_lo(0)
	_assert_rc      _rc 198 "missing gdd_hi() is rejected"

**## 1.9 - kdd_base overrides kdd base only
* execute wxsum using default base
	clear
	set obs         1
	gen             tmp_20200101 = 28
	gen             tmp_20200102 = 33
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) ///
	                    gdd_lo(10) gdd_hi(30) heat_threshold(30) shape(wide)
	assert          kdd_2020 == 3

* execute wxsum overriding with kdd_base(25)
	clear
	set obs         1
	gen             tmp_20200101 = 28
	gen             tmp_20200102 = 33
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) ///
	                    gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(25) shape(wide)
	assert          kdd_2020 == 11

**## 1.10 - default output shape is long
* execute wxsum without shape option
	clear
	set obs         2
	gen             id = _n
	gen             rf_20200101 = 1
	gen             rf_20210101 = 2
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id)
	assert          _N == 4
	confirm variable year
	confirm variable total
	assert          total == 1 if year == 2020
	assert          total == 2 if year == 2021

**## 1.11 - save option behavior without replace
* test save without replace
	clear
	set obs         1
	gen             id = 1
	gen             rf_20200101 = 1
	tempfile        out
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'")
	clear
	set obs         1
	gen             id = 1
	gen             rf_20200101 = 1
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'")
	_assert_rc      _rc 602 "save() to an existing file without replace is rejected"
	confirm variable rf_20200101

* test save with replace
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'", replace)
	use             "`out'", clear
	confirm variable total

**## 1.12 - calendar days without variables are missing days
* create series with gap on 5 Jan
	clear
	set obs         1
	gen             id = 1
	forvalues d = 1/10 {
		gen             rf_202001`=string(`d', "%02.0f")' = cond(inlist(`d', 1, 10), 5, 0)
	}
	drop            rf_20200105
	tempfile        gap
	quietly save    `gap'

* execute wxsum calendar mode
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(10) keep(id)
	assert          nobs == 9 & dry == 4
	matrix          M = r(missing)
	assert          M[1, colnumb(M, "days")] == 10 & M[1, colnumb(M, "any_missing")] == 1

* execute wxsum unit-specific mode
	use             `gap', clear
	gen             s = td(01jan2020)
	gen             e = td(10jan2020)
	wxsum           rf_, type(rain) start(s) end(e) keep(id)
	assert          nobs == 9 & dry == 4

**## 1.13 - season without daily variables treated as unobserved
* create series with unobserved 2020
	clear
	set obs         2
	gen             id = _n
	foreach y in 2017 2018 2019 2021 2022 {
		forvalues d = 1/3 {
			gen             rf_`y'010`d' = id * (`y' - 2015)
		}
	}

* execute wxsum
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) lr_years(3) ref_min(2) keep(id)
	assert          r(n_windows) == 6
	assert          "`r(years)'" == "2017 2018 2019 2020 2021 2022"
	assert          nobs == 0 & missing(total) & missing(mean) & missing(dry) if year == 2020
	matrix          M = r(missing)
	assert          M[4, colnumb(M, "mean_nobs")] == 0 & M[4, colnumb(M, "all_missing")] == 1
	assert          abs(dev_total - (18 - 10.5)) < 1e-6 if year == 2021 & id == 1

**## 1.14 - leap day 29 february mapped in common years
* create series around late february
	clear
	set obs         1
	gen             id = 1
	foreach y in 2019 2020 2021 {
		forvalues d = `=mdy(2, 25, `y')'/`=mdy(3, 2, `y')' {
			gen             rf_`y'`=string(month(`d'), "%02.0f")'`=string(day(`d'), "%02.0f")' = 1
		}
	}
	tempfile        feb
	quietly save    `feb'

* test fin_day(29)
	wxsum           rf_, type(rain) ini_month(2) ini_day(27) fin_month(2) fin_day(29) keep(id)
	assert          r(n_windows) == 3
	assert          nobs == cond(year == 2020, 3, 2)

* test ini_day(29)
	use             `feb', clear
	wxsum           rf_, type(rain) ini_month(2) ini_day(29) fin_month(3) fin_day(2) keep(id)
	assert          r(n_windows) == 3
	assert          nobs == 3

**## 1.15 - calendar options range validations
* test out-of-range inputs
	clear
	set obs         1
	gen             id = 1
	forvalues d = 1/31 {
		gen             rf_202001`=string(`d', "%02.0f")' = 1
	}
	foreach opt in "ini_month(13) fin_month(1)" "ini_month(1) fin_month(0)" ///
	    "ini_month(abc) fin_month(1)" "ini_month(1.5) fin_month(1)" ///
	    "ini_month(1) fin_month(1) ini_day(32)" "ini_month(1) fin_month(1) fin_day(0)" ///
	    "ini_month(1) fin_month(1) ini_day(x)" {
		capture noisily wxsum rf_, type(rain) `opt'
		_assert_rc      _rc 198 "`opt' is rejected"
	}

* verify leading zeros and default fin_day
	wxsum           rf_, type(rain) ini_month(01) fin_month(01) ini_day(01) keep(id)
	assert          "`r(window)'" == "01jan-31jan"
	assert          nobs == 31

**## 1.16 - mid-window spells after a missing day (audit B3)
* test the audit pattern 35 . 35 35 20 20 and its mirror image
	clear
	set obs         2
	gen             id = _n
	local           v1 "35 . 35 35 20 20"
	local           v2 "20 20 35 35 . 35"
	forvalues d = 1/6 {
		gen             tmp_2020010`d' = real(word("`v1'", `d')) if id == 1
		replace         tmp_2020010`d' = real(word("`v2'", `d')) if id == 2
	}
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) ///
	    gdd_hi(30) heat_threshold(30) keep(id)
	assert          heat_start == 1 & heat == 2 & heat_end == 0 if id == 1
	assert          heat_start == 0 & heat == 2 & heat_end == 1 if id == 2

* test the same rule for dry spells: rain 0 . 0 0 5 5
	clear
	set obs         1
	local           v "0 . 0 0 5 5"
	forvalues d = 1/6 {
		gen             rf_2020010`d' = real(word("`v'", `d'))
	}
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(6)
	assert          dry_start == 1 & dry == 2 & dry_end == 0

* test max(heat_start, heat, heat_end) = longest run on random windows
	clear
	set seed        20261016
	set obs         3000
	gen             id = _n
	forvalues d = 1/9 {
		gen             tmp_2020010`d' = cond(runiform() < 0.25, ., cond(runiform() < 0.5, 35, 20))
	}
	tempfile        rnd
	quietly save    `rnd'
	gen             run = 0
	gen             longest = 0
	gen             nobs_chk = 0
	forvalues d = 1/9 {
		replace         run = cond(tmp_2020010`d' >= 30 & !missing(tmp_2020010`d'), run + 1, 0)
		replace         longest = max(longest, run)
		replace         nobs_chk = nobs_chk + !missing(tmp_2020010`d')
	}
	keep            id longest nobs_chk
	tempfile        chk
	quietly save    `chk'
	use             `rnd', clear
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(9) gdd_lo(10) ///
	    gdd_hi(30) heat_threshold(30) keep(id)
	merge           1:1 id using `chk', assert(match) nogenerate
	assert          max(heat_start, heat, heat_end) == longest if nobs_chk > 0
	assert          missing(heat_start, heat, heat_end) if nobs_chk == 0

**## 1.17 - a failed save() leaves the data unchanged (audit B1)
* test a save to a folder that does not exist
	clear
	set obs         2
	gen             id = _n
	forvalues d = 1/6 {
		gen             rf_2020010`d' = id * `d'
	}
	datasignature
	local           before "`r(datasignature)'"
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id) ///
	    save("no_such_folder_wxsum/out.dta", replace)
	assert          _rc != 0
	datasignature
	assert          "`r(datasignature)'" == "`before'"
	confirm         variable rf_20200101

**## 1.18 - keep() with thousands of variables
* test a keep() list longer than a characteristic can hold (more than 67,784
* characters), as when the daily variables of a second data type are kept for
* a later run with outstub(); -egen tag()- failed here with r(1004)
	clear
	set obs         3
	gen             id = _n
	forvalues k = 1/4000 {
		quietly gen byte keepvariable_`k' = mod(`k', 2)
	}
	forvalues d = 1/6 {
		gen             rf_2020010`d' = id * `d'
	}
	wxsum           rf_, type(rain) ini_month(1) fin_month(1) fin_day(6) ///
	    keep(id keepvariable_*)
	assert          r(N_units) == 3
	assert          _N == 3
	confirm         variable keepvariable_4000 total

**## 1.19 - GDD and KDD: degrees between the bounds and above the base, summed
* temperatures below gdd_lo, at gdd_lo, between, at gdd_hi, above gdd_hi, and
* a missing day, with gdd_lo(10) gdd_hi(30)
	clear
	set obs         1
	gen             id = 1
	local           v "5 10 15 30 35 ."
	forvalues d = 1/6 {
		gen double      tmp_2020010`d' = real(word("`v'", `d'))
	}
	tempfile        gk
	quietly save    `gk'
* GDD per day: 0, 0, 5, 20, 20 (none for the missing day) = 45
* KDD per day above heat_threshold(30): 0, 0, 0, 0, 5 = 5
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) ///
	    gdd_hi(30) heat_threshold(30) keep(id)
	assert          nobs == 5 & gdd == 45 & kdd == 5
* KDD above kdd_base(32): 0, 0, 0, 0, 3 = 3 (heat days still use 30)
	use             `gk', clear
	wxsum           tmp_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) ///
	    gdd_hi(30) heat_threshold(30) kdd_base(32) keep(id)
	assert          gdd == 45 & kdd == 3 & heatdays == 2

**## 1.20 - no deviations for the leading and trailing spells in unit windows
	clear
	set obs         2
	gen             id = _n
	forvalues y = 2018/2020 {
		forvalues d = 1/6 {
			gen             rf_`y'010`d' = mod(`d' + id + `y', 3)
		}
	}
	gen             s = mdy(1, 1, 2020)
	gen             e = mdy(1, 6, 2020)
	wxsum           rf_, type(rain) start(s) end(e) lr_years(2) keep(id)
	confirm         variable dev_dry z_dry
	foreach v in dev_dry_start z_dry_start dev_dry_end z_dry_end {
		capture confirm variable `v'
		_assert_rc      _rc 111 "no `v' with unit-specific windows"
	}

**********************************************************************
**# 2 - end matter
**********************************************************************

* report test completion
	di as result    "All wxsum v6 core checks passed."

/* END */
