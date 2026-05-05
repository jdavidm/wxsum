clear all
set more off

cd "C:/Users/jdmic/git/wxsum"
adopath ++ "C:/Users/jdmic/git/wxsum"

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

di as text "Test 1: missing rainfall is excluded from rain-day denominator"
clear
set obs 1
gen id = 1
gen rf_20000101 = 0
gen rf_20000102 = .
gen rf_20000103 = 2
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) rain_data lr_years(2)
assert norain_2000 == 1
assert raindays_2000 == 1
assert pct_raindays_2000 == .5

di as text "Test 2: all-dry season dry spell equals observed dry days"
clear
set obs 1
gen id = 1
gen rf_20000101 = 0
gen rf_20000102 = 0
gen rf_20000103 = 0
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) rain_data lr_years(2)
assert dry_2000 == 3

di as text "Test 3: missing rainfall breaks dry spells"
clear
set obs 1
gen id = 1
gen rf_20000101 = 0
gen rf_20000102 = 0
gen rf_20000103 = .
gen rf_20000104 = 0
gen rf_20000105 = 0
gen rf_20000106 = 0
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(06) rain_data lr_years(2)
assert dry_2000 == 3

di as text "Test 4: helper cleanup preserves user aux variables"
clear
set obs 1
gen aux_user = 42
gen rf_20000101 = 0
gen rf_20000102 = 2
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) rain_data lr_years(2)
confirm variable aux_user
assert aux_user == 42
capture ds hist_* ssn_* percentile*
assert _rc != 0

di as text "Test 5: gdd_lo(0) is allowed and GDD is capped degree accumulation"
clear
set obs 1
gen id = 1
gen tmp_20000101 = 10
gen tmp_20000102 = 20
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(15) lr_years(2)
assert gdd_2000 == 25

di as text "Test 6: invalid GDD bounds are rejected"
clear
set obs 1
gen tmp_20000101 = 10
gen tmp_20000102 = 20
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(32) gdd_hi(8) lr_years(2)
_assert_rc _rc 198 "gdd_hi must be greater than gdd_lo"

di as text "Test 7: temp bins are zero-padded and bin 1 does not match bin 10"
clear
set obs 1
gen id = 1
forvalues d = 1/10 {
	local dd = string(`d', "%02.0f")
	gen tmp_200001`dd' = `d'
}
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(10) temp_data gdd_lo(0) gdd_hi(20) bins(10) lr_years(2)
confirm variable tempbin01_2000
confirm variable tempbin10_2000
capture confirm variable tempbin12000
assert _rc != 0
assert mean_1 == tempbin01_2000
assert mean_10 == tempbin10_2000

di as text "Test 8: keep() works without optional KDD or deviation variables"
clear
set obs 1
gen hhid = 101
gen tmp_20000101 = 10
gen tmp_20000102 = 20
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(32) keep(hhid) lr_years(2)
confirm variable hhid
confirm variable gdd_2000
capture confirm variable kdd_2000
assert _rc != 0

di as text "Test 9: documented rain sample runs and total deviations exist"
use rain.dta, clear
tempfile rainout
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save("`rainout'")
confirm variable dev_total_2003
confirm variable z_total_2003
capture ds hist_* ssn_* percentile* aux*
assert _rc != 0

di as text "Test 10: documented temp sample runs with zero-padded temp bins"
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(hhid)
confirm variable tempbin01_1993
confirm variable tempbin04_1993
capture confirm variable tempbin11993
assert _rc != 0

di as result "All wxsum validation tests passed."
