* test_v6_options.do -- test option validation, mutual exclusivity, and threshold logic (WS3)

clear all
set more off
adopath ++ "."

display as text "{hline 70}"
display as text "Test Suite: Options and Thresholds"
display as text "{hline 70}"

* Setup basic daily variables for testing
clear
set obs 5
gen id = _n
forvalues d = 1/5 {
	local day = string(`d', "%02.0f")
	gen rf_202001`day' = 0
	gen tmp_202001`day' = 25
}
replace tmp_20200101 = 35

* =============================================================================
* 1. TEMPERATURE THRESHOLDS & MIGRATION ERROR
* =============================================================================

* 1.1 Missing heat_threshold without kdd_base -> error
capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) gdd_lo(10) gdd_hi(30) shape(wide)
assert _rc == 198

* 1.2 kdd_base given without heat_threshold -> migration error
capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) gdd_lo(10) gdd_hi(30) kdd_base(32) shape(wide)
assert _rc == 198

* 1.3 Missing gdd_lo or gdd_hi -> error
capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_hi(30) shape(wide)
assert _rc == 198

capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(10) shape(wide)
assert _rc == 198

capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(30) gdd_hi(10) shape(wide)
assert _rc == 198

* 1.4 KDD uses heat_threshold by default when kdd_base is omitted
preserve
wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(10) gdd_hi(30) shape(wide)
* On day 1, tmp=35. heat_threshold=30 -> kdd should be 35 - 30 = 5
assert kdd_2020 == 5
assert r(kdd_base) == 30
assert r(heat_threshold) == 30
restore

* 1.5 KDD uses kdd_base when explicitly given
preserve
wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) kdd_base(32) gdd_lo(10) gdd_hi(30) shape(wide)
* On day 1, tmp=35. kdd_base=32 -> kdd should be 35 - 32 = 3
assert kdd_2020 == 3
assert r(kdd_base) == 32
assert r(heat_threshold) == 30
restore

di as result "PASS: Temperature threshold checks passed"

* =============================================================================
* 2. OPTION RESTRICTIONS BY TYPE
* =============================================================================

* 2.1 rain_threshold with type(temp) -> error
capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(10) gdd_hi(30) rain_threshold(2) shape(wide)
assert _rc == 198

* 2.2 temp options with type(rain) -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) heat_threshold(30) shape(wide)
assert _rc == 198

capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) kdd_base(30) shape(wide)
assert _rc == 198

capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) gdd_lo(10) shape(wide)
assert _rc == 198

capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) gdd_hi(30) shape(wide)
assert _rc == 198

capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) tmp_bin(5) tmp_binlo(0) tmp_binhi(20) shape(wide)
assert _rc == 198

di as result "PASS: Option type restrictions verified"

* =============================================================================
* 3. MUTUAL EXCLUSIVITY & PARAMETER BOUNDS
* =============================================================================

* 3.1 tmp_bin and cuts together -> error
capture wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(10) gdd_hi(30) tmp_bin(5) tmp_binlo(0) tmp_binhi(40) cuts(10 20 30) shape(wide)
assert _rc == 198

* 3.2 lr_years and baseline together -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) lr_years(5) baseline(2010 2015) shape(wide)
assert _rc == 198

* 3.3 baseline y1 > y2 -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) baseline(2020 2010) shape(wide)
assert _rc == 198

* 3.4 non-ascending cuts -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) cuts(20 10 30) shape(wide)
assert _rc == 198

* 3.5 outstub > 11 chars -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) outstub(thisiswaytoolong_) shape(wide)
assert _rc == 198

* 3.6 invalid shape -> error
capture wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) shape(other)
assert _rc == 198

* 3.7 cuts works with rain
preserve
wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(rain) cuts(1 5 10) shape(wide)
* Cuts creates cut01_2020, cut02_2020, cut03_2020, cut04_2020
confirm variable cut01_2020
confirm variable cut02_2020
confirm variable cut03_2020
confirm variable cut04_2020
* All values are 0: 0 < 1, so all 5 days are in cut01
assert cut01_2020 == 5
assert cut02_2020 == 0
assert cut03_2020 == 0
assert cut04_2020 == 0
restore

* 3.8 cuts works with temp
preserve
wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(5) type(temp) heat_threshold(30) gdd_lo(10) gdd_hi(30) cuts(20 30) shape(wide)
confirm variable cut01_2020
confirm variable cut02_2020
confirm variable cut03_2020
* 1 day at 35 (>= 30 -> cut03), 4 days at 25 ([20, 30) -> cut02)
assert cut01_2020 == 0
assert cut02_2020 == 4
assert cut03_2020 == 1
restore

di as result "PASS: All mutual exclusivity and options tests passed"
