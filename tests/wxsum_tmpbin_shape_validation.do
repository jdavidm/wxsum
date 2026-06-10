* wxsum tmp_bin() and shape() validation
* Tests for tmp_bin(), tmp_binlo(), tmp_binhi(), and shape(wide|long)
clear all
set more off
capture set maxvar 90000

capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this validation from the wxsum repository root."
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

display "wxsum tmp_bin and shape validation: Stata " c(stata_version)

* ============================================================================
* PART 1: tmp_bin() tests
* ============================================================================

display "--- Test 1: tmp_bin(5) basic bin counts ---"
* 2 locations, 1 season (2020, Jan 1-4), tmp_bin(5) tmp_binlo(0) tmp_binhi(30)
* J=5, width = (30-0)/(5-2) = 10
* Bins: tmpbin01 T<0, tmpbin02 [0,10), tmpbin03 [10,20), tmpbin04 [20,30), tmpbin05 T>=30
*
* Location 1: temps = -5, 5, 15, 35
*   tmpbin01=1 (T<0: -5)
*   tmpbin02=1 ([0,10): 5)
*   tmpbin03=1 ([10,20): 15)
*   tmpbin04=0 ([20,30): none)
*   tmpbin05=1 (T>=30: 35)
*
* Location 2: temps = 0, 10, 20, 30
*   tmpbin01=0 (T<0: none)
*   tmpbin02=1 ([0,10): 0)
*   tmpbin03=1 ([10,20): 10)
*   tmpbin04=1 ([20,30): 20)
*   tmpbin05=1 (T>=30: 30)
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, -5, 0)
gen tmp_20200102 = cond(hhid == 1, 5, 10)
gen tmp_20200103 = cond(hhid == 1, 15, 20)
gen tmp_20200104 = cond(hhid == 1, 35, 30)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2)

* Location 1
assert tmpbin01_2020 == 1 if hhid == 1
assert tmpbin02_2020 == 1 if hhid == 1
assert tmpbin03_2020 == 1 if hhid == 1
assert tmpbin04_2020 == 0 if hhid == 1
assert tmpbin05_2020 == 1 if hhid == 1

* Location 2 boundary tests: T==lo goes to first interior bin, T==hi goes to upper tail
assert tmpbin01_2020 == 0 if hhid == 2
assert tmpbin02_2020 == 1 if hhid == 2
assert tmpbin03_2020 == 1 if hhid == 2
assert tmpbin04_2020 == 1 if hhid == 2
assert tmpbin05_2020 == 1 if hhid == 2

* Sum equals nonmissing count
assert tmpbin01_2020 + tmpbin02_2020 + tmpbin03_2020 + tmpbin04_2020 + tmpbin05_2020 == 4

di as result "PASS: Test 1 - tmp_bin(5) basic bin counts and boundaries"


display "--- Test 2: tmp_bin(15) tmp_binlo(0) tmp_binhi(39) ---"
* width = 39 / (15-2) = 3
* Bins: tmpbin01 T<0, tmpbin02 [0,3), ... tmpbin14 [36,39), tmpbin15 T>=39
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = -1
gen tmp_20200102 = 0
gen tmp_20200103 = 2.9
gen tmp_20200104 = 3
gen tmp_20200105 = 39

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(05) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) lr_years(2)

confirm variable tmpbin01_2020
confirm variable tmpbin15_2020
assert tmpbin01_2020 == 1
assert tmpbin02_2020 == 2
assert tmpbin03_2020 == 1
assert tmpbin15_2020 == 1
* Sum must equal 5
local binsum = 0
forvalues b = 1/15 {
	local bp = string(`b', "%02.0f")
	local binsum = `binsum'
	quietly summarize tmpbin`bp'_2020
	local binsum = `binsum' + r(mean)
}
assert `binsum' == 5

di as result "PASS: Test 2 - tmp_bin(15) with 13 interior bins"


display "--- Test 3: tmp_bin(42) tmp_binlo(1) tmp_binhi(41) ---"
* width = (41-1)/(42-2) = 1
* tmpbin01 T<1, tmpbin02 [1,2), ... tmpbin41 [40,41), tmpbin42 T>=41
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 0
gen tmp_20200102 = 1
gen tmp_20200103 = 20.5
gen tmp_20200104 = 41

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(42) tmp_binlo(1) tmp_binhi(41) lr_years(2)

confirm variable tmpbin01_2020
confirm variable tmpbin42_2020
* T=0 -> tmpbin01 (T<1)
assert tmpbin01_2020 == 1
* T=1 -> tmpbin02 ([1,2))
assert tmpbin02_2020 == 1
* T=20.5 -> bin for [20,21) which is tmpbin21 (j=21, edge_lo=1+(21-2)*1=20, edge_hi=1+(21-1)*1=21)
assert tmpbin21_2020 == 1
* T=41 -> tmpbin42 (T>=41)
assert tmpbin42_2020 == 1

di as result "PASS: Test 3 - tmp_bin(42) fine one-degree bins"


display "--- Test 4: tmp_bin(1) counts all nonmissing ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 10, .)
gen tmp_20200102 = cond(hhid == 1, 20, .)
gen tmp_20200103 = cond(hhid == 1, 30, 5)
gen tmp_20200104 = cond(hhid == 1, 40, 15)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(1) tmp_binlo(0) tmp_binhi(30) lr_years(2)

confirm variable tmpbin01_2020
assert tmpbin01_2020 == 4 if hhid == 1
assert tmpbin01_2020 == 2 if hhid == 2

di as result "PASS: Test 4 - tmp_bin(1) counts all nonmissing"


display "--- Test 5: tmp_bin(2) midpoint split ---"
* lo=0, hi=30, midpoint=15
* tmpbin01 T<15, tmpbin02 T>=15
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 5
gen tmp_20200102 = 14.9
gen tmp_20200103 = 15
gen tmp_20200104 = 25

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(2) tmp_binlo(0) tmp_binhi(30) lr_years(2)

confirm variable tmpbin01_2020
confirm variable tmpbin02_2020
assert tmpbin01_2020 == 2
assert tmpbin02_2020 == 2

di as result "PASS: Test 5 - tmp_bin(2) midpoint split"


display "--- Test 6: missing daily temps not counted ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 5, .)
gen tmp_20200102 = cond(hhid == 1, ., .)
gen tmp_20200103 = cond(hhid == 1, 15, .)
gen tmp_20200104 = cond(hhid == 1, 25, .)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2)

* Location 1: 3 nonmissing, bins should sum to 3
assert tmpbin01_2020 + tmpbin02_2020 + tmpbin03_2020 + tmpbin04_2020 + tmpbin05_2020 == 3 if hhid == 1

* Location 2: all missing -> all tmpbin should be missing
assert missing(tmpbin01_2020) if hhid == 2
assert missing(tmpbin02_2020) if hhid == 2
assert missing(tmpbin03_2020) if hhid == 2
assert missing(tmpbin04_2020) if hhid == 2
assert missing(tmpbin05_2020) if hhid == 2

di as result "PASS: Test 6 - missing daily temps handling"


display "--- Test 7: tmp_bin with two seasons ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 5, 25)
gen tmp_20200102 = cond(hhid == 1, 15, 35)
gen tmp_20210101 = cond(hhid == 1, -5, 10)
gen tmp_20210102 = cond(hhid == 1, 45, 20)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2)

* Both seasons should have tmpbin vars
confirm variable tmpbin01_2020
confirm variable tmpbin01_2021
confirm variable tmpbin05_2020
confirm variable tmpbin05_2021

* 2020 loc1: 5 -> [0,10) = tmpbin02; 15 -> [10,20) = tmpbin03
assert tmpbin02_2020 == 1 if hhid == 1
assert tmpbin03_2020 == 1 if hhid == 1

* 2021 loc1: -5 -> T<0 = tmpbin01; 45 -> T>=30 = tmpbin05
assert tmpbin01_2021 == 1 if hhid == 1
assert tmpbin05_2021 == 1 if hhid == 1

di as result "PASS: Test 7 - tmp_bin with two seasons"


display "--- Test 8: tmp_bin vars in keep() ---"
clear
set obs 1
gen hhid = 1
gen extra = 999
gen tmp_20200101 = 10
gen tmp_20200102 = 20

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(3) tmp_binlo(0) tmp_binhi(30) keep(hhid) lr_years(2)

confirm variable hhid
confirm variable tmpbin01_2020
confirm variable tmpbin02_2020
confirm variable tmpbin03_2020
* extra should be dropped by keep()
capture confirm variable extra
assert _rc != 0

di as result "PASS: Test 8 - tmp_bin vars preserved by keep()"


* ============================================================================
* PART 2: tmp_bin() validation error tests
* ============================================================================

display "--- Test 9: tmp_bin(0) errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_bin(0) tmp_binlo(0) tmp_binhi(30)
_assert_rc _rc 198 "tmp_bin(0) is rejected"

display "--- Test 10: tmp_bin(43) errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_bin(43) tmp_binlo(0) tmp_binhi(30)
_assert_rc _rc 198 "tmp_bin(43) is rejected"

display "--- Test 11: tmp_bin with rain_data errors ---"
clear
set obs 1
gen rf_20200101 = 1
capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) rain_data tmp_bin(5) tmp_binlo(0) tmp_binhi(30)
_assert_rc _rc 198 "tmp_bin with rain_data is rejected"

display "--- Test 12: tmp_binlo without tmp_bin errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_binlo(0)
_assert_rc _rc 198 "tmp_binlo without tmp_bin is rejected"

display "--- Test 13: tmp_binhi without tmp_bin errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_binhi(30)
_assert_rc _rc 198 "tmp_binhi without tmp_bin is rejected"

display "--- Test 14: tmp_bin without tmp_binlo/tmp_binhi errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_bin(5)
_assert_rc _rc 198 "tmp_bin without tmp_binlo/tmp_binhi is rejected"

display "--- Test 15: tmp_binhi <= tmp_binlo errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_bin(5) tmp_binlo(30) tmp_binhi(10)
_assert_rc _rc 198 "tmp_binhi <= tmp_binlo is rejected"

capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) tmp_bin(5) tmp_binlo(10) tmp_binhi(10)
_assert_rc _rc 198 "tmp_binhi == tmp_binlo is rejected"


* ============================================================================
* PART 3: shape() tests
* ============================================================================

display "--- Test 16: default shape produces wide output ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 10, 20)
gen tmp_20200102 = cond(hhid == 1, 15, 25)
gen tmp_20210101 = cond(hhid == 1, 12, 22)
gen tmp_20210102 = cond(hhid == 1, 18, 28)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) keep(hhid) lr_years(2)

* Wide: should have year-suffixed vars and 2 rows
assert _N == 2
confirm variable mean_2020
confirm variable mean_2021
confirm variable gdd_2020
confirm variable gdd_2021
capture confirm variable year
assert _rc != 0

di as result "PASS: Test 16 - default shape is wide"


display "--- Test 17: shape(wide) matches default ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 10, 20)
gen tmp_20200102 = cond(hhid == 1, 15, 25)
gen tmp_20210101 = cond(hhid == 1, 12, 22)
gen tmp_20210102 = cond(hhid == 1, 18, 28)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) keep(hhid) shape(wide) lr_years(2)

assert _N == 2
confirm variable mean_2020
confirm variable mean_2021
capture confirm variable year
assert _rc != 0

di as result "PASS: Test 17 - shape(wide) matches default"


display "--- Test 18: shape(long) basic output ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 10, 20)
gen tmp_20200102 = cond(hhid == 1, 15, 25)
gen tmp_20210101 = cond(hhid == 1, 12, 22)
gen tmp_20210102 = cond(hhid == 1, 18, 28)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) keep(hhid) shape(long) lr_years(2)

* Long: should have 4 rows (2 units x 2 years)
assert _N == 4
confirm variable year
confirm variable hhid
confirm variable mean
confirm variable gdd

* No year-suffixed variables
capture confirm variable mean_2020
assert _rc != 0
capture confirm variable mean_2021
assert _rc != 0

* Check year values
quietly count if year == 2020
assert r(N) == 2
quietly count if year == 2021
assert r(N) == 2

* Check a known value: hhid 1, year 2020, mean should be (10+15)/2 = 12.5
assert abs(mean - 12.5) < 1e-6 if hhid == 1 & year == 2020

di as result "PASS: Test 18 - shape(long) basic output"


display "--- Test 19: shape(long) with tmp_bin ---"
clear
set obs 2
gen hhid = _n
gen tmp_20200101 = cond(hhid == 1, 5, 25)
gen tmp_20200102 = cond(hhid == 1, 15, 35)
gen tmp_20210101 = cond(hhid == 1, -5, 10)
gen tmp_20210102 = cond(hhid == 1, 45, 20)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) tmp_bin(5) tmp_binlo(0) tmp_binhi(30) keep(hhid) shape(long) lr_years(2)

assert _N == 4
confirm variable year
confirm variable tmpbin01
confirm variable tmpbin02
confirm variable tmpbin03
confirm variable tmpbin04
confirm variable tmpbin05

* No year-suffixed tmpbin variables
capture confirm variable tmpbin01_2020
assert _rc != 0

* Check: hhid 1, year 2020 -> 5 in [0,10)=tmpbin02, 15 in [10,20)=tmpbin03
assert tmpbin02 == 1 if hhid == 1 & year == 2020
assert tmpbin03 == 1 if hhid == 1 & year == 2020

di as result "PASS: Test 19 - shape(long) with tmp_bin"


display "--- Test 20: shape(long) without keep() prints note ---"
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 10
gen tmp_20200102 = 20

capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) shape(long) lr_years(2)
* Should succeed (rc == 0), just print a note
_assert_rc _rc 0 "shape(long) without keep() does not error"

di as result "PASS: Test 20 - shape(long) without keep() prints note"


display "--- Test 21: shape(long) with year in keep() errors ---"
clear
set obs 1
gen hhid = 1
gen year = 2020
gen tmp_20200101 = 10
gen tmp_20200102 = 20

capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(50) keep(hhid year) shape(long) lr_years(2)
_assert_rc _rc 198 "shape(long) with year in keep() is rejected"

di as result "PASS: Test 21 - shape(long) with year in keep() errors"


display "--- Test 22: invalid shape value errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) shape(panel)
_assert_rc _rc 198 "shape(panel) is rejected"

di as result "PASS: Test 22 - invalid shape value errors"


display "--- Test 23: shape(long) with gddcat preserves value labels ---"
clear
set obs 2
gen hhid = _n
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = cond(hhid == 1, `d' * 100, `d' * 50)
}

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) keep(hhid) shape(long) lr_years(2)

confirm variable gddcat
confirm variable year

* gddcat should have value labels
local lbl : value label gddcat
assert "`lbl'" == "_gddcat_lbl"

di as result "PASS: Test 23 - shape(long) with gddcat preserves value labels"


display "--- Test 24: shape(long) keep() vars repeated across years ---"
clear
set obs 2
gen hhid = _n
gen region = cond(hhid == 1, "north", "south")
gen tmp_20200101 = cond(hhid == 1, 10, 20)
gen tmp_20210101 = cond(hhid == 1, 15, 25)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(50) keep(hhid region) shape(long) lr_years(2)

assert _N == 4
* Both hhid values appear in both years
quietly count if hhid == 1
assert r(N) == 2
quietly count if hhid == 2
assert r(N) == 2
* region should be present
confirm variable region
assert region == "north" if hhid == 1

di as result "PASS: Test 24 - keep() vars repeated across years"


display as result "All tmp_bin and shape validation tests passed."
exit, clear
