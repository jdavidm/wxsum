* test_v6_output_rollback.do -- test rollback atomicity, long/wide layouts, keep(), outstub(), and save() (WS3)

clear all
set more off
adopath ++ "."

display as text "{hline 70}"
display as text "Test Suite: Output Layouts and Rollback Atomicity"
display as text "{hline 70}"

* Setup test dataset with a string identifier
clear
set obs 3
gen str10 farm_id = "farm_" + string(_n)
gen int region = 100 + _n
forvalues y = 2018/2020 {
	forvalues d = 1/3 {
		gen rf_`y'010`d' = 5 * _n
	}
}

datasignature set
local orig_sig = r(datasignature)
local orig_k = c(k)

* =============================================================================
* 1. ROLLBACK ATOMICITY
* =============================================================================

* 1.1 Name clash error (rc 110): dataset must be completely untouched
gen mean = 999
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain)
assert _rc == 110
drop mean

datasignature
assert r(datasignature) == "`orig_sig'"
assert c(k) == `orig_k'
di as result "PASS: Name clash rollback leaves data unchanged"

* 1.2 Forced failure via global WXSUM_TEST_FAIL: dataset must be untouched
global WXSUM_TEST_FAIL 1
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain)
assert _rc == 999
global WXSUM_TEST_FAIL ""

datasignature
assert r(datasignature) == "`orig_sig'"
assert c(k) == `orig_k'
di as result "PASS: Forced failure rollback leaves data unchanged"

* =============================================================================
* 2. OUTPUT SHAPES & KEEP WITH STRING VARIABLES
* =============================================================================

* 2.1 Default shape is long, preserves string keep variables
preserve
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) keep(farm_id region)
* 3 units x 3 seasons = 9 observations
assert _N == 9
confirm variable year
confirm string variable farm_id
confirm numeric variable region
assert farm_id[1] != ""
assert inlist(year[1], 2018, 2019, 2020)
* Characteristics
assert `"`: char _dta[wxsum_shape]'"' == "long"
assert `"`: char _dta[wxsum_type]'"' == "rain"
assert `"`: char _dta[wxsum_version]'"' == "6.0.0"
assert `"`: char total[wxsum_stat]'"' == "total"
restore

* 2.2 year in keep() with long mode is rejected
preserve
gen int year = 1
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) keep(farm_id year)
assert _rc == 198
restore

* 2.3 shape(wide) works and creates _YYYY suffixes
preserve
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) keep(farm_id region) shape(wide)
assert _N == 3
confirm variable total_2018
confirm variable total_2019
confirm variable total_2020
assert `"`: char _dta[wxsum_shape]'"' == "wide"
assert `"`: char total_2018[wxsum_stat]'"' == "total"
restore

* 2.4 outstub() works in both long and wide
preserve
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) keep(farm_id) outstub(my_)
confirm variable my_total
confirm variable my_mean
assert `"`: char my_total[wxsum_stat]'"' == "total"
restore

preserve
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) keep(farm_id) shape(wide) outstub(my_)
confirm variable my_total_2018
assert `"`: char my_total_2018[wxsum_stat]'"' == "total"
restore

* =============================================================================
* 3. SAVE OPTION (NO OVERWRITE WITHOUT REPLACE)
* =============================================================================

tempfile test_save
gen dummy = 1
save "`test_save'", replace
drop dummy

* Trying to save to existing file without replace must fail with rc 602
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) save("`test_save'")
assert _rc == 602

* Saving with replace succeeds
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) save("`test_save'", replace)
capture confirm file "`test_save'"
assert _rc == 0

di as result "PASS: All output, rollback, and save tests passed"
