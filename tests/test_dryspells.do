* test_dryspells.do
* Dry-spell rules (plan D3/D4) and adjusted Fisher-Pearson skewness.
*   D3: leading/trailing spells skip missing days at the window edges and count
*       from the first/last observed day; a missing day inside a run ends it.
*   D4: with >= 2 rainy days, dry = longest dry run strictly between the first
*       and last rainy day; with 0-1 rainy days, dry = longest observed dry run
*       anywhere in the window. Missing days end runs.
* Run from the repository root.
clear all
set more off
capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this test from the wxsum repository root."
	exit 601
}
adopath ++ "."

set obs 10

* Create some dummy data
gen id = _n

* Sequence 1: 0, 0, 5, 0, 0, 2, 0, 0, 0 (dry_start=2, dry=2, dry_end=3)
* Sequence 2: 0, 0, 0, 0, ., ., ., ., . (dry_start=4, dry=4, dry_end=4)
*             no rainy day, so dry = longest dry run anywhere (D4);
*             trailing missing days are skipped (D3)
* Sequence 3: 5, 0, ., 0, 0, 5, 0, ., . (dry_start=0, dry=2, dry_end=1)
* Sequence 4: ., ., ., ., ., ., ., ., . (dry_start=., dry=., dry_end=.)
* Sequence 5: 5, 5, 5, ., ., ., ., ., . (dry_start=0, dry=0, dry_end=0)
* Sequence 6: 0, 5, 0, 5, 0, ., ., ., . (dry_start=1, dry=1, dry_end=1)
* Sequence 7: 1, 0, 0, 1, 0, ., ., ., . (dry_start=0, dry=2, dry_end=1)
* Sequence 8: Skewness test vector. Values: 1, 2, 3, 4, 100
* Sequence 9: 0, 0, 0, 5, 0, 0, 0, 0, 0 (dry_start=3, dry=5, dry_end=5)
*             exactly one rainy day, so dry = longest dry run anywhere (D4)
* Sequence 10: ., ., 0, 0, 5, 0, 0, 0, . (dry_start=2, dry=3, dry_end=3)
*             leading and trailing missing days are skipped (D3)

* Create dates for 9 days in 2020: 20200101 to 20200109
forvalues d = 1/9 {
	local day = string(`d', "%02.0f")
	gen rf_202001`day' = .
}

* Seq 1
replace rf_20200101 = 0 if id == 1
replace rf_20200102 = 0 if id == 1
replace rf_20200103 = 5 if id == 1
replace rf_20200104 = 0 if id == 1
replace rf_20200105 = 0 if id == 1
replace rf_20200106 = 2 if id == 1
replace rf_20200107 = 0 if id == 1
replace rf_20200108 = 0 if id == 1
replace rf_20200109 = 0 if id == 1

* Seq 2
replace rf_20200101 = 0 if id == 2
replace rf_20200102 = 0 if id == 2
replace rf_20200103 = 0 if id == 2
replace rf_20200104 = 0 if id == 2

* Seq 3
replace rf_20200101 = 5 if id == 3
replace rf_20200102 = 0 if id == 3
replace rf_20200104 = 0 if id == 3
replace rf_20200105 = 0 if id == 3
replace rf_20200106 = 5 if id == 3
replace rf_20200107 = 0 if id == 3

* Seq 4 (all missing)

* Seq 5
replace rf_20200101 = 5 if id == 5
replace rf_20200102 = 5 if id == 5
replace rf_20200103 = 5 if id == 5

* Seq 6
replace rf_20200101 = 0 if id == 6
replace rf_20200102 = 5 if id == 6
replace rf_20200103 = 0 if id == 6
replace rf_20200104 = 5 if id == 6
replace rf_20200105 = 0 if id == 6

* Seq 7 (Threshold match)
replace rf_20200101 = 1 if id == 7
replace rf_20200102 = 0 if id == 7
replace rf_20200103 = 0 if id == 7
replace rf_20200104 = 1 if id == 7
replace rf_20200105 = 0 if id == 7

* Seq 8 (Skewness test vector)
replace rf_20200101 = 1 if id == 8
replace rf_20200102 = 2 if id == 8
replace rf_20200103 = 3 if id == 8
replace rf_20200104 = 4 if id == 8
replace rf_20200105 = 100 if id == 8

* Seq 9 (single rainy day)
forvalues d = 1/9 {
	local day = string(`d', "%02.0f")
	replace rf_202001`day' = cond(`d' == 4, 5, 0) if id == 9
}

* Seq 10 (missing days at both edges)
replace rf_20200103 = 0 if id == 10
replace rf_20200104 = 0 if id == 10
replace rf_20200105 = 5 if id == 10
replace rf_20200106 = 0 if id == 10
replace rf_20200107 = 0 if id == 10
replace rf_20200108 = 0 if id == 10

* Expected skewness for row 8, computed from the raw daily values before wxsum
* replaces the data (adjusted Fisher-Pearson sample skewness)
preserve
keep if id == 8
keep rf_*
xpose, clear
drop if v1 == .
quietly sum v1
local m = r(mean)
local s = r(sd)
local n = r(N)
gen dev3 = ((v1 - `m') / `s')^3
quietly sum dev3
local exp_skew = (`n' / ((`n' - 1) * (`n' - 2))) * r(sum)
restore

* Run wxsum
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(9) type(rain) rain_threshold(1) keep(id) shape(wide)

* Check values
assert dry_start_2020 == 2 if id == 1
assert dry_2020       == 2 if id == 1
assert dry_end_2020   == 3 if id == 1

assert dry_start_2020 == 4 if id == 2
assert dry_2020       == 4 if id == 2
assert dry_end_2020   == 4 if id == 2

assert dry_start_2020 == 0 if id == 3
assert dry_2020       == 2 if id == 3
assert dry_end_2020   == 1 if id == 3

assert dry_start_2020 == . if id == 4
assert dry_2020       == . if id == 4
assert dry_end_2020   == . if id == 4

assert dry_start_2020 == 0 if id == 5
assert dry_2020       == 0 if id == 5
assert dry_end_2020   == 0 if id == 5

assert dry_start_2020 == 1 if id == 6
assert dry_2020       == 1 if id == 6
assert dry_end_2020   == 1 if id == 6

assert dry_start_2020 == 0 if id == 7
assert dry_2020       == 2 if id == 7
assert dry_end_2020   == 1 if id == 7

assert dry_start_2020 == 3 if id == 9
assert dry_2020       == 5 if id == 9
assert dry_end_2020   == 5 if id == 9

assert dry_start_2020 == 2 if id == 10
assert dry_2020       == 3 if id == 10
assert dry_end_2020   == 3 if id == 10

* Check skewness on row 8
* Because floating point arithmetic, use abs(diff) < 1e-6
assert abs(skew_2020 - `exp_skew') < 1e-6 if id == 8

di "ALL TESTS PASSED!"
