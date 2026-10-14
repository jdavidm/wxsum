* wxsum_v6_core.do
* Checks for the v6 correctness fixes and option rules (plan WS1):
*   P1  windows with no observed days give missing, not 0
*   P2  rolling baselines need ref_min() nonmissing reference windows
*   P3  monthly totals are grouped by calendar year-month
*   P6  options that do not apply to the data type are rejected
*   D6  heat_threshold() is required for type(temp); kdd_base() overrides KDD
*   D1  long output is the default
*   save(filename [, replace]) does not overwrite without replace
* and the calendar rules: days without a daily variable are missing days,
* a season with no daily variable is a window with no observed day, and
* 29 February in ini_day()/fin_day() is 28 February in common years.
* Run from the repository root.
clear all
set more off
capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this test from the wxsum repository root."
	exit 601
}
adopath ++ "."

capture program drop _assert_rc
program define _assert_rc
	args actual expected msg
	if `actual' != `expected' {
		di as error "FAIL: `msg'"
		di as error "Expected rc `expected', got rc `actual'"
		exit 459
	}
	di as result "PASS: `msg'"
end

display "wxsum v6 core checks: Stata " c(stata_version)

display "1. P1: a season with no observed days gives missing rainfall statistics"
clear
set obs 2
gen id = _n
gen rf_20200101 = cond(id == 1, ., 2)
gen rf_20200102 = cond(id == 1, ., 3)
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(2) keep(id) shape(wide)
foreach v in total mean_mo raindays norain pct_raindays mean median dry_start dry dry_end {
	assert missing(`v'_2020) if id == 1
}
assert total_2020 == 5 if id == 2
assert raindays_2020 == 2 if id == 2
assert norain_2020 == 0 if id == 2
di as result "PASS: 1"

display "2. P1: a season with no observed days gives missing GDD and KDD"
clear
set obs 2
gen id = _n
gen tmp_20200101 = cond(id == 1, ., 20)
gen tmp_20200102 = cond(id == 1, ., 30)
wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) gdd_lo(10) gdd_hi(25) heat_threshold(25) keep(id) shape(wide)
assert missing(gdd_2020) & missing(kdd_2020) & missing(max_2020) if id == 1
assert gdd_2020 == 25 if id == 2
assert kdd_2020 == 5 if id == 2
di as result "PASS: 2"

display "3. P1/P2: empty seasons do not enter the rolling baseline"
clear
set obs 1
gen rf_20200101 = .
gen rf_20210101 = 10
gen rf_20220101 = 20
gen rf_20230101 = 60
* default ref_min() = lr_years(): 2020 is empty, so 2023 has only 2 of 3
* reference seasons and gets no deviation (v5 counted 2020 as 0: dev = 50)
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) shape(wide)
assert missing(total_2020)
assert missing(dev_total_2023)
assert missing(z_total_2023)
clear
set obs 1
gen rf_20200101 = .
gen rf_20210101 = 10
gen rf_20220101 = 20
gen rf_20230101 = 60
* with ref_min(2), the two observed reference seasons are enough: 60 - 15
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(2) shape(wide)
assert abs(dev_total_2023 - 45) < 1e-6
assert abs(z_total_2023 - 45 / sqrt(50)) < 1e-6
di as result "PASS: 3"

display "4. P2: ref_min() validation"
capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(1)
_assert_rc _rc 198 "ref_min(1) is rejected"
capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) lr_years(3) ref_min(4)
_assert_rc _rc 198 "ref_min() above lr_years() is rejected"

display "5. P3: monthly totals are grouped by year-month"
clear
set obs 1
* window 15 May 2020 - 10 May 2021: May 2020 and May 2021 are different months
forvalues d = `=td(15may2020)'/`=td(10may2021)' {
	local y = year(`d')
	local m = string(month(`d'), "%02.0f")
	local dd = string(day(`d'), "%02.0f")
	local val = cond(`y' == 2020 & month(`d') == 5, 1, cond(`y' == 2021 & month(`d') == 5, 2, 0))
	gen rf_`y'`m'`dd' = `val'
}
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(5) fin_day(10) shape(wide)
* 13 year-months: May 2020 = 17, Jun 2020-Apr 2021 = 0 (11 months), May 2021 = 20
assert abs(mean_mo_2020 - 37 / 13) < 1e-6
di as result "PASS: 5"

display "6. P3: a month with no observed day is left out of mean_mo"
clear
set obs 1
forvalues d = `=td(01jan2020)'/`=td(31mar2020)' {
	local m = string(month(`d'), "%02.0f")
	local dd = string(day(`d'), "%02.0f")
	gen rf_2020`m'`dd' = cond(month(`d') == 2, ., 1)
}
wxsum rf_, type(rain) ini_month(1) fin_month(3) shape(wide)
* Jan = 31, Feb has no data, Mar = 31: mean over observed months = 31
assert abs(mean_mo_2020 - 31) < 1e-6
di as result "PASS: 6"

display "7. P6: options that do not apply to the data type are rejected"
clear
set obs 1
gen rf_20200101 = 1
gen tmp_20200101 = 20
foreach opt in "gdd_lo(0)" "gdd_hi(30)" "heat_threshold(30)" "kdd_base(30)" {
	capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) `opt'
	_assert_rc _rc 198 "`opt' with type(rain) is rejected"
}
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30) heat_threshold(30) rain_threshold(1)
_assert_rc _rc 198 "rain_threshold() with type(temp) is rejected"
capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) rain_threshold(abc)
_assert_rc _rc 198 "non-numeric rain_threshold() is rejected"
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30) heat_threshold(hot)
_assert_rc _rc 198 "non-numeric heat_threshold() is rejected"

display "8. D6: heat_threshold() is required for type(temp)"
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30)
_assert_rc _rc 198 "missing heat_threshold() is rejected"
* a v5-style command (kdd_base() but no heat_threshold()) gets the migration message
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) gdd_lo(0) gdd_hi(30) kdd_base(30)
_assert_rc _rc 198 "v5-style kdd_base() without heat_threshold() is rejected"
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) heat_threshold(30) gdd_hi(30)
_assert_rc _rc 198 "missing gdd_lo() is rejected"
capture noisily wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(1) heat_threshold(30) gdd_lo(0)
_assert_rc _rc 198 "missing gdd_hi() is rejected"

display "9. D6: kdd_base() overrides the KDD base only"
clear
set obs 1
gen tmp_20200101 = 28
gen tmp_20200102 = 33
wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) gdd_lo(10) gdd_hi(30) heat_threshold(30) shape(wide)
* KDD base = heat_threshold(30): 0 + 3
assert kdd_2020 == 3
clear
set obs 1
gen tmp_20200101 = 28
gen tmp_20200102 = 33
wxsum tmp_, type(temp) ini_month(1) fin_month(1) fin_day(2) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(25) shape(wide)
* KDD base = kdd_base(25): 3 + 8
assert kdd_2020 == 11
di as result "PASS: 9"

display "10. D1: long output is the default"
clear
set obs 2
gen id = _n
gen rf_20200101 = 1
gen rf_20210101 = 2
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id)
assert _N == 4
confirm variable year
confirm variable total
assert total == 1 if year == 2020
assert total == 2 if year == 2021
di as result "PASS: 10"

display "11. save() does not overwrite an existing file without replace"
clear
set obs 1
gen id = 1
gen rf_20200101 = 1
tempfile out
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'")
clear
set obs 1
gen id = 1
gen rf_20200101 = 1
capture noisily wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'")
_assert_rc _rc 602 "save() to an existing file without replace is rejected"
* the check happens before anything is computed, so the data are unchanged
confirm variable rf_20200101
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id) save("`out'", replace)
use "`out'", clear
confirm variable total
di as result "PASS: 11"

display "12. calendar days without a daily variable are missing days"
* rain on 1 and 10 Jan, dry otherwise; there is no variable for 5 Jan
clear
set obs 1
gen id = 1
forvalues d = 1/10 {
	gen rf_202001`=string(`d', "%02.0f")' = cond(inlist(`d', 1, 10), 5, 0)
}
drop rf_20200105
tempfile gap
quietly save `gap'
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(10) keep(id)
* the missing day ends the dry run: runs of 3 (2-4 Jan) and 4 (6-9 Jan)
assert nobs == 9 & dry == 4
matrix M = r(missing)
assert M[1, colnumb(M, "days")] == 10 & M[1, colnumb(M, "any_missing")] == 1
* the same with a unit-specific window
use `gap', clear
gen s = td(01jan2020)
gen e = td(10jan2020)
wxsum rf_, type(rain) start(s) end(e) keep(id)
assert nobs == 9 & dry == 4
di as result "PASS: 12"

display "13. a season without any daily variable is a window with no observed day"
clear
set obs 2
gen id = _n
foreach y in 2017 2018 2019 2021 2022 {
	forvalues d = 1/3 {
		gen rf_`y'010`d' = id * (`y' - 2015)
	}
}
* no variables for 2020: it is a window with nobs = 0, not a missing window
wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(3) lr_years(3) ref_min(2) keep(id)
assert r(n_windows) == 6
assert "`r(years)'" == "2017 2018 2019 2020 2021 2022"
assert nobs == 0 & missing(total) & missing(mean) & missing(dry) if year == 2020
matrix M = r(missing)
assert M[4, colnumb(M, "mean_nobs")] == 0 & M[4, colnumb(M, "all_missing")] == 1
* 2021 is compared with 2018 and 2019 only: id 1 totals 9 and 12
assert abs(dev_total - (18 - 10.5)) < 1e-6 if year == 2021 & id == 1
di as result "PASS: 13"

display "14. 29 February in ini_day() or fin_day() is 28 February in common years"
clear
set obs 1
gen id = 1
foreach y in 2019 2020 2021 {
	forvalues d = `=mdy(2, 25, `y')'/`=mdy(3, 2, `y')' {
		gen rf_`y'`=string(month(`d'), "%02.0f")'`=string(day(`d'), "%02.0f")' = 1
	}
}
tempfile feb
quietly save `feb'
wxsum rf_, type(rain) ini_month(2) ini_day(27) fin_month(2) fin_day(29) keep(id)
* every year has a window: 27-28 Feb in 2019 and 2021, 27-29 Feb in 2020
assert r(n_windows) == 3
assert nobs == cond(year == 2020, 3, 2)
use `feb', clear
wxsum rf_, type(rain) ini_month(2) ini_day(29) fin_month(3) fin_day(2) keep(id)
* 29 Feb - 2 Mar in 2020, 28 Feb - 2 Mar in common years
assert r(n_windows) == 3
assert nobs == 3
di as result "PASS: 14"

display as result "All wxsum v6 core checks passed."
