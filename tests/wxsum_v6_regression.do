* project: wxsum
* task: regression tests against frozen v5.0 reference outputs
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
	set maxvar      20000

* confirm repository root
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}
	adopath         ++ "."

**********************************************************************
**# 1 - define reference configurations
**********************************************************************

* define test configurations
	local           n_ref = 4
	local           f1 "v5_rain"
	local           d1 "rain.dta"
	local           c1 `"rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_threshold(1) keep(hhid) shape(wide)"'
	local           f2 "v5_rain_xyear"
	local           d2 "rain.dta"
	local           c2 `"rf_, type(rain) ini_month(11) fin_month(02) lr_years(5) rain_threshold(0.5) keep(hhid) shape(wide)"'
	local           f3 "v5_temp"
	local           d3 "temp.dta"
	local           c3 `"tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) heat_threshold(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid) shape(wide)"'
	local           f4 "v5_temp_xyear"
	local           d4 "temp.dta"
	local           c4 `"tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) heat_threshold(30) keep(hhid) shape(wide)"'

**********************************************************************
**# 2 - execute regression comparisons against v5 references
**********************************************************************

* loop over test configurations
	local           n_fail = 0
	local           timings ""
	forvalues i = 1/`n_ref' {
		di as text      _n "{hline 78}" _n "`f`i'': wxsum `c`i''" _n "{hline 78}"
		use             "tests/reference/`f`i''.dta", clear
		foreach v of varlist _all {
			if "`v'" != "hhid" rename `v' V5_`v'
		}
		tempfile        v5
		quietly save    `v5'

		use             "`d`i''", clear
		timer clear     1
		timer on        1
		quietly wxsum   `c`i''
		timer off       1
		quietly timer list 1
		local           t : di %5.2f r(t1)
		local           timings "`timings' `f`i''=`=trim("`t'")'s"
		di as text      "v6 run time: `t' s"
		quietly merge   1:1 hhid using `v5', assert(match) nogenerate

		local           n_cmp = 0
		local           n_bad = 0
		local           n_d4 = 0
		foreach rv of varlist V5_* {
			local           v = substr("`rv'", 4, .)
			capture confirm variable `v'
			if _rc {
				di as error     "`v' is in the v5 output but not in the v6 output"
				local           ++n_bad
				continue
			}
			local           ++n_cmp
			* mid-window dry spell: compare with v5 only where the window has at
			* least 2 rainy days; otherwise check rule D4 directly
			if regexm("`v'", "^dry_([0-9][0-9][0-9][0-9])$") {
				local           y = regexs(1)
				quietly count   if raindays_`y' >= 2 & `v' != `rv'
				local           nd = r(N)
				quietly count   if raindays_`y' == 0 & `v' != nobs_`y'
				local           nd = `nd' + r(N)
				quietly count   if raindays_`y' == 1 & `v' != max(dry_start_`y', dry_end_`y')
				local           nd = `nd' + r(N)
				quietly count   if raindays_`y' < 2 & `v' != `rv'
				local           n_d4 = `n_d4' + r(N)
				if `nd' {
					di as error     "`v' differs from v5 (or from rule D4) in `nd' observations"
					local           ++n_bad
				}
				continue
			}
			* tolerance check
			tempvar         bad
			if regexm("`v'", "^dev_(.+)_([0-9][0-9][0-9][0-9])$") {
				local           base = regexs(1) + "_" + regexs(2)
				quietly gen byte `bad' = abs(`v' - `rv') > 1e-6 * (abs(`base') + 1)
			}
			else if regexm("`v'", "^z_(.+)_([0-9][0-9][0-9][0-9])$") {
				local           base = regexs(1) + "_" + regexs(2)
				local           dvar = "dev_" + regexs(1) + "_" + regexs(2)
				quietly gen byte `bad' = cond(`v' != 0, abs(`v' - `rv') * abs(`dvar' / `v') > 1e-6 * (abs(`base') + 1), abs(`rv') > 1e-4)
			}
			else if regexm("`v'", "^skew_([0-9][0-9][0-9][0-9])$") {
				local           y = regexs(1)
				quietly gen byte `bad' = abs(`v' - `rv') > 1e-5 * (1 + abs(mean_`y') / sd_`y')
			}
			else {
				quietly gen byte `bad' = reldif(`v', `rv') > 1e-6
			}
			quietly count   if missing(`v') != missing(`rv')
			local           nm = r(N)
			quietly count   if !missing(`v') & !missing(`rv') & `bad'
			local           nd = r(N)
			if `nm' | `nd' {
				di as error     "`v' differs from v5 (missing pattern: `nm' obs, values: `nd' obs)"
				list            hhid `v' `rv' if missing(`v') != missing(`rv') | (!missing(`v') & `bad'), noobs
				local           ++n_bad
			}
			drop            `bad'
		}
		if `n_bad' {
			di as error     "FAIL `f`i'': `n_bad' of `n_cmp' variables differ"
			local           ++n_fail
		}
		else {
			di as result    "PASS `f`i'': all `n_cmp' v5 variables reproduced"
			if `n_d4' di as result "     (`n_d4' unit-windows with 0-1 rainy days use the D4 mid-window dry spell)"
		}
	}

**********************************************************************
**# 3 - end matter
**********************************************************************

* display timings and check failure count
	di as text      _n "v6 run times:`timings'"
	if `n_fail' {
		di as error     "`n_fail' regression comparison(s) failed"
		exit            9
	}
	di as result    "All v5 regression checks passed."

/* END */
