clear all
set more off
capture set maxvar 90000
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

display "wxsum validation: Stata " c(stata_version)

display "1. same-month season bounds"
clear
set obs 1
gen hhid = 1
gen rf_19930501 = 1
gen rf_19930502 = 100
gen rf_19930503 = 100
wxsum rf_, ini_month(05) fin_month(05) ini_day(01) fin_day(02) rain_data
assert total_1993 == 101

display "2. dates outside historical hardcoded range"
clear
set obs 1
gen hhid = 1
gen rf_20500501 = 2
gen rf_20500601 = 3
gen rf_20500602 = 99
wxsum rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) rain_data
assert total_2050 == 5

display "3. cross-year season start-year labeling"
clear
set obs 1
gen hhid = 1
quietly {
	forvalues d = `=td(01jan1993)'/`=td(28feb1994)' {
		local y = year(`d')
		local m = string(month(`d'), "%02.0f")
		local day = string(day(`d'), "%02.0f")
		gen tmp_`y'`m'`day' = .
		replace tmp_`y'`m'`day' = 1 if `y' == 1993 & inlist(month(`d'), 1, 2)
		replace tmp_`y'`m'`day' = 10 if `y' == 1993 & inlist(month(`d'), 11, 12)
		replace tmp_`y'`m'`day' = 100 if `y' == 1994 & inlist(month(`d'), 1, 2)
	}
}
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) bins(4)
assert abs(mean_1993 - ((61 * 10 + 32 * 100) / 93)) < .0001

display "4. rainfall total deviations"
clear
set obs 1
gen hhid = 1
forvalues y = 1993/1995 {
	gen rf_`y'0501 = `y' - 1990
	gen rf_`y'0601 = `y' - 1990
}
wxsum rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) rain_data lr_years(2)
assert total_1995 == 10
assert abs(dev_total_1995 - 3) < .0001
capture confirm variable z_total_1995
assert _rc == 0

display "5. missing rainfall excluded from denominator"
clear
set obs 1
gen hhid = 1
gen rf_20000101 = 0
gen rf_20000102 = .
gen rf_20000103 = 2
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) rain_data lr_years(2)
assert norain_2000 == 1
assert raindays_2000 == 1
assert pct_raindays_2000 == .5

display "6. all-dry season dry spell equals observed dry days"
clear
set obs 1
gen hhid = 1
gen rf_20000101 = 0
gen rf_20000102 = 0
gen rf_20000103 = 0
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) rain_data lr_years(2)
assert dry_2000 == 3

display "7. missing rainfall breaks dry spells"
clear
set obs 1
gen hhid = 1
gen rf_20000101 = 0
gen rf_20000102 = 0
gen rf_20000103 = .
gen rf_20000104 = 0
gen rf_20000105 = 0
gen rf_20000106 = 0
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(06) rain_data lr_years(2)
assert dry_2000 == 3

display "8. helper cleanup preserves user aux variables"
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

display "9. gdd_lo(0) is allowed and GDD is capped degree accumulation"
clear
set obs 1
gen hhid = 1
gen tmp_20000101 = 10
gen tmp_20000102 = 20
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(15) lr_years(2)
assert gdd_2000 == 25

display "10. capped GDD and KDD"
clear
set obs 1
gen hhid = 1
gen tmp_19930501 = 9
gen tmp_19930502 = 31
gen tmp_19930503 = 40
gen tmp_19930504 = 20
wxsum tmp_, ini_month(05) fin_month(05) ini_day(01) fin_day(04) temp_data gdd_lo(8) gdd_hi(32) kdd_base(30) bins(4)
assert gdd_1993 == 60
assert kdd_1993 == 11

display "11. invalid GDD bounds are rejected"
clear
set obs 1
gen tmp_20000101 = 10
gen tmp_20000102 = 20
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(32) gdd_hi(8) lr_years(2)
_assert_rc _rc 198 "gdd_hi must be greater than gdd_lo"

display "12. temp bins are zero-padded: tempbin01_YYYY through tempbin10_YYYY"
clear
set obs 1
gen hhid = 1
forvalues d = 1/10 {
	local dd = string(`d', "%02.0f")
	gen tmp_200001`dd' = `d'
}
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(10) temp_data gdd_lo(0) gdd_hi(20) bins(10) lr_years(2)
confirm variable tempbin01_2000
confirm variable tempbin10_2000
capture confirm variable tempbin12000
assert _rc != 0
assert binmean_01 == tempbin01_2000
assert binmean_10 == tempbin10_2000

display "13. keep() works without optional KDD or deviation variables"
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

display "14. bundled rainfall sample runs and total deviations exist"
use rain.dta, clear
tempfile rainout
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save("`rainout'")
confirm variable dev_total_2003
confirm variable z_total_2003
capture ds hist_* ssn_* percentile* aux*
assert _rc != 0

display "15. bundled temperature sample runs with zero-padded temp bins"
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(hhid)
confirm variable tempbin01_1993
confirm variable tempbin04_1993
capture confirm variable tempbin11993
assert _rc != 0

display as result "All wxsum validation tests passed."
exit, clear
