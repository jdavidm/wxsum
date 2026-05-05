clear all
set more off
capture set maxvar 90000
adopath ++ "."

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

display "5. missing rainfall, threshold, and dry spell"
clear
set obs 1
gen hhid = 1
gen rf_19930501 = .
gen rf_19930502 = .5
gen rf_19930503 = 2
gen rf_19930504 = 0
gen rf_19930505 = .3
wxsum rf_, ini_month(05) fin_month(05) ini_day(01) fin_day(05) rain_data rain_threshold(1)
assert norain_1993 == 3
assert raindays_1993 == 1
assert abs(pct_raindays_1993 - .25) < .0001
assert dry_1993 == 2
capture confirm variable hist_1993
assert _rc != 0
capture confirm variable ssn_1993
assert _rc != 0

display "6. capped GDD and KDD"
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
capture confirm variable percentile11993
assert _rc != 0

display "7. bundled rainfall sample command"
use rain.dta, clear
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data keep(hhid)
capture confirm variable total_1993
assert _rc == 0
capture confirm variable dev_total_2003
assert _rc == 0
capture confirm variable hist_1993
assert _rc != 0

display "8. bundled temperature sample command"
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(hhid)
capture confirm variable mean_1993
assert _rc == 0
capture confirm variable gdd_1993
assert _rc == 0

display "All wxsum validation tests passed."
exit, clear
