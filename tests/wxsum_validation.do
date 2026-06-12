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
wxsum rf_, ini_month(05) fin_month(05) ini_day(01) fin_day(02) type(rain)
assert total_1993 == 101

display "2. dates outside historical hardcoded range"
clear
set obs 1
gen hhid = 1
gen rf_20500501 = 2
gen rf_20500601 = 3
gen rf_20500602 = 99
wxsum rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) type(rain)
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
wxsum tmp_, ini_month(11) fin_month(02) type(temp) kdd_base(0) gdd_lo(8) gdd_hi(32)
assert abs(mean_1993 - ((61 * 10 + 32 * 100) / 93)) < .0001

display "4. rainfall total deviations"
clear
set obs 1
gen hhid = 1
forvalues y = 1993/1995 {
	gen rf_`y'0501 = `y' - 1990
	gen rf_`y'0601 = `y' - 1990
}
wxsum rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) type(rain) lr_years(2)
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
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) type(rain) lr_years(2)
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
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) type(rain) lr_years(2)
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
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(06) type(rain) lr_years(2)
assert dry_2000 == 3

display "8. helper cleanup preserves user aux variables"
clear
set obs 1
gen aux_user = 42
gen rf_20000101 = 0
gen rf_20000102 = 2
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) type(rain) lr_years(2)
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
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(15) lr_years(2)
assert gdd_2000 == 25

display "10. capped GDD and KDD"
clear
set obs 1
gen hhid = 1
gen tmp_19930501 = 9
gen tmp_19930502 = 31
gen tmp_19930503 = 40
gen tmp_19930504 = 20
wxsum tmp_, ini_month(05) fin_month(05) ini_day(01) fin_day(04) type(temp) gdd_lo(8) gdd_hi(32) kdd_base(30)
assert gdd_1993 == 60
assert kdd_1993 == 11

display "11. invalid GDD bounds are rejected"
clear
set obs 1
gen tmp_20000101 = 10
gen tmp_20000102 = 20
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) type(temp) kdd_base(0) gdd_lo(32) gdd_hi(8) lr_years(2)
_assert_rc _rc 198 "gdd_hi must be greater than gdd_lo"

display "12. GDD categories with gdd_bin()"
clear
set obs 2
gen hhid = _n
* Create 10 days with known temps, gdd_lo(0) gdd_hi(20)
forvalues d = 1/10 {
	local dd = string(`d', "%02.0f")
	gen tmp_200001`dd' = `d'
}
* GDD = sum of min(max(T-0,0),20) = 1+2+3+...+10 = 55
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(10) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(20) gdd_bin(20) lr_years(2)
confirm variable gddcat_2000
* GDD=55, gdd_bin(20), default lo=0
* auto hi: ceil(55/20)=3, 0+3*20=60, 55<60 => hi=60
* Categories: 1=[0,20), 2=[20,40), 3=[40,60)
* GDD=55 => [40,60) => cat 3
assert gddcat_2000 == 3

* No old tempbin or binmean variables
capture confirm variable tempbin01_2000
assert _rc != 0
capture confirm variable binmean_01
assert _rc != 0

display "13. keep() works without optional KDD or deviation variables"
clear
set obs 1
gen hhid = 101
gen tmp_20000101 = 10
gen tmp_20000102 = 20
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) keep(hhid) lr_years(2)
confirm variable hhid
confirm variable gdd_2000
capture confirm variable kdd_2000
assert _rc != 0

display "14. bundled rainfall sample runs and total deviations exist"
use rain.dta, clear
tempfile rainout
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) type(rain) save("`rainout'")
confirm variable dev_total_2003
confirm variable z_total_2003
capture ds hist_* ssn_* percentile* aux*
assert _rc != 0

display "15. bundled temperature sample runs without old bin variables"
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) type(temp) kdd_base(0) gdd_lo(8) gdd_hi(32) keep(hhid)
* Old bin variables should not exist
capture confirm variable tempbin01_1993
assert _rc != 0
capture confirm variable binmean_01
assert _rc != 0
* GDD should exist
confirm variable gdd_1993

display "16. gdd_bin() with type(rain) errors"
clear
set obs 1
gen rf_20200101 = 1
capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(rain) gdd_bin(500)
_assert_rc _rc 198 "gdd_bin with type(rain) is rejected"

display "17. gdd_binlo() without gdd_bin() errors"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_binlo(100)
_assert_rc _rc 198 "gdd_binlo without gdd_bin is rejected"

display "18. gdd_binhi() without gdd_bin() errors"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_binhi(3000)
_assert_rc _rc 198 "gdd_binhi without gdd_bin is rejected"

display "19. gdd_binhi <= gdd_binlo errors"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) gdd_binlo(1000) gdd_binhi(500)
_assert_rc _rc 198 "gdd_binhi <= gdd_binlo is rejected"

display "20. non-divisible (hi-lo)/width errors"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) gdd_binlo(750) gdd_binhi(3000)
_assert_rc _rc 198 "non-divisible hi-lo range is rejected"

display "21. gdd_bin() <= 0 errors"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_bin(0)
_assert_rc _rc 198 "gdd_bin(0) is rejected"

capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(32) gdd_bin(-100)
_assert_rc _rc 198 "gdd_bin(-100) is rejected"

display as result "All wxsum validation tests passed."
exit, clear
