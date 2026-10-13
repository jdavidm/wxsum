* test_v6_missing_reference.do -- test missing data handling, minobs, ref_min, r(missing), and baselines (WS3)

clear all
set more off
adopath ++ "."

display as text "{hline 70}"
display as text "Test Suite: Missing Data & Reference Periods"
display as text "{hline 70}"

* =============================================================================
* 1. P1 FIX: ALL-MISSING WINDOWS GIVE MISSING (NOT ZERO)
* =============================================================================

clear
set obs 2
gen id = _n
* 3 years: 2018, 2019, 2020. 3 days per year.
forvalues y = 2018/2020 {
	forvalues d = 1/3 {
		gen rf_`y'010`d' = 10
	}
}
* Row 2 in 2019 is all missing
replace rf_20190101 = . if id == 2
replace rf_20190102 = . if id == 2
replace rf_20190103 = . if id == 2

wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(3) type(rain) lr_years(2) ref_min(1) keep(id) shape(wide)

* In 2019, row 2 must have missing for total, mean_mo, raindays, norain, etc.
assert missing(total_2019) if id == 2
assert missing(mean_mo_2019) if id == 2
assert missing(raindays_2019) if id == 2
assert missing(norain_2019) if id == 2
assert missing(pct_raindays_2019) if id == 2
assert missing(mean_2019) if id == 2
assert nobs_2019 == 0 if id == 2

* In 2020:
* Row 1 has prior years 2018 (total=30) and 2019 (total=30) -> baseline mean=30 -> dev_total_2020 = 30 - 30 = 0
assert dev_total_2020 == 0 if id == 1

* Row 2 has prior year 2018 (total=30) and 2019 (total=.).
* Because 2019 is missing (not 0!), baseline mean is 30 (from 2018 only), so dev_total_2020 = 30 - 30 = 0!
* In v5, 2019 was treated as 0, giving baseline mean = (30+0)/2 = 15, and dev_total_2020 = 30 - 15 = 15 (P1 bug).
assert dev_total_2020 == 0 if id == 2

di as result "PASS: P1 all-missing window fix verified"

* =============================================================================
* 2. MINOBS THRESHOLD
* =============================================================================

clear
set obs 3
gen id = _n
forvalues d = 1/5 {
	gen rf_2020010`d' = 10
}
* Row 1: 5 observed days
* Row 2: 3 observed days (days 4 and 5 missing)
replace rf_20200104 = . if id == 2
replace rf_20200105 = . if id == 2

* Row 3: 1 observed day (days 2-5 missing)
replace rf_20200102 = . if id == 3
replace rf_20200103 = . if id == 3
replace rf_20200104 = . if id == 3
replace rf_20200105 = . if id == 3

* Run with minobs(4)
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) minobs(4) keep(id) shape(wide)

* Row 1: 5 >= 4 -> statistics computed
assert nobs_2020 == 5 if id == 1
assert total_2020 == 50 if id == 1
assert raindays_2020 == 5 if id == 1

* Row 2: 3 < 4 -> nobs is 3, but statistics are missing
assert nobs_2020 == 3 if id == 2
assert missing(total_2020) if id == 2
assert missing(mean_2020) if id == 2
assert missing(raindays_2020) if id == 2

* Row 3: 1 < 4 -> nobs is 1, but statistics are missing
assert nobs_2020 == 1 if id == 3
assert missing(total_2020) if id == 3
assert missing(mean_2020) if id == 3

di as result "PASS: minobs() verified"

* =============================================================================
* 3. r(missing) MATRIX CONTENTS
* =============================================================================

matrix miss = r(missing)
assert rowsof(miss) == 1
assert colsof(miss) == 5

* Col 1: days in window (5)
assert miss[1, 1] == 5
* Col 2: mean nobs = (5 + 3 + 1) / 3 = 3
assert abs(miss[1, 2] - 3) < 1e-6
* Col 3: share with any missing day: rows 2 and 3 have missing days -> 2/3
assert abs(miss[1, 3] - 2/3) < 1e-6
* Col 4: share with all days missing: 0
assert miss[1, 4] == 0
* Col 5: number set to missing by minobs: rows 2 and 3 had nobs < 4 -> 2
assert miss[1, 5] == 2

di as result "PASS: r(missing) matrix contents verified"

* =============================================================================
* 4. FIXED BASELINE vs ROLLING & ZERO SD Z-SCORE
* =============================================================================

clear
set obs 1
gen id = 1
* Years 2010 to 2015 (6 years), 2 days each
forvalues y = 2010/2015 {
	gen rf_`y'0101 = 10
	gen rf_`y'0102 = 10
}
* In 2015, total is 20. In all years 2010-2014, total is 20.
* Fixed baseline 2010-2012:
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(2) type(rain) baseline(2010 2012) keep(id) shape(wide)

* Mean total in baseline is 20. SD across baseline years is 0.
* dev_total_2015 = 20 - 20 = 0
assert dev_total_2015 == 0
* Zero SD must give missing z-score (not division by zero or NaN)
assert missing(z_total_2015)
assert r(ref) == "baseline 2010–2012"

di as result "PASS: baseline() and zero-SD z-score verified"
