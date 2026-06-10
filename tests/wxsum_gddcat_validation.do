* wxsum GDD category validation
* Tests for gdd_bin(), gdd_binlo(), gdd_binhi() and gddcat_YYYY output
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

display "wxsum GDD category validation: Stata " c(stata_version)

* ============================================================================
* Setup: create a reusable synthetic dataset with 3 locations and 2 seasons.
* Daily temps are set so that GDD totals (gdd_lo=0, gdd_hi=10000) are simple.
*
* Season 2020 (Jan 1-4):
*   Location 1: temps = 0, 0, 0, 0        => GDD = 0
*   Location 2: temps = 100, 150, 200, 50  => GDD = 500
*   Location 3: temps = 500, 600, 700, 950 => GDD = 2750
*
* Season 2021 (Jan 1-4):
*   Location 1: temps = 250, 250, 250, 250 => GDD = 1000
*   Location 2: temps = 0, 0, 0, 0         => GDD = 0
*   Location 3: temps = 500, 500, 500, 500 => GDD = 2000
* ============================================================================

display "--- Test 1: default lo=0, auto hi, width 500 ---"
display "Pooled min=0, max=2750. Auto hi=3000 (next boundary above 2750)."
clear
set obs 3
gen hhid = _n
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = .
	gen tmp_202101`dd' = .
}
* Season 2020
replace tmp_20200101 = 0   if hhid == 1
replace tmp_20200102 = 0   if hhid == 1
replace tmp_20200103 = 0   if hhid == 1
replace tmp_20200104 = 0   if hhid == 1

replace tmp_20200101 = 100 if hhid == 2
replace tmp_20200102 = 150 if hhid == 2
replace tmp_20200103 = 200 if hhid == 2
replace tmp_20200104 = 50  if hhid == 2

replace tmp_20200101 = 500 if hhid == 3
replace tmp_20200102 = 600 if hhid == 3
replace tmp_20200103 = 700 if hhid == 3
replace tmp_20200104 = 950 if hhid == 3

* Season 2021
replace tmp_20210101 = 250 if hhid == 1
replace tmp_20210102 = 250 if hhid == 1
replace tmp_20210103 = 250 if hhid == 1
replace tmp_20210104 = 250 if hhid == 1

replace tmp_20210101 = 0   if hhid == 2
replace tmp_20210102 = 0   if hhid == 2
replace tmp_20210103 = 0   if hhid == 2
replace tmp_20210104 = 0   if hhid == 2

replace tmp_20210101 = 500 if hhid == 3
replace tmp_20210102 = 500 if hhid == 3
replace tmp_20210103 = 500 if hhid == 3
replace tmp_20210104 = 500 if hhid == 3

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) lr_years(2)

* Verify GDD totals first
assert gdd_2020 == 0    if hhid == 1
assert gdd_2020 == 500  if hhid == 2
assert gdd_2020 == 2750 if hhid == 3
assert gdd_2021 == 1000 if hhid == 1
assert gdd_2021 == 0    if hhid == 2
assert gdd_2021 == 2000 if hhid == 3

* Categories: 1=[0,500), 2=[500,1000), 3=[1000,1500), 4=[1500,2000),
*             5=[2000,2500), 6=[2500,3000)
confirm variable gddcat_2020
confirm variable gddcat_2021

* GDD=0 => [0,500) => cat 1
assert gddcat_2020 == 1 if hhid == 1
assert gddcat_2021 == 1 if hhid == 2

* GDD=500 => [500,1000) => cat 2 (exact boundary test: 500 is IN [500,1000))
assert gddcat_2020 == 2 if hhid == 2

* GDD=1000 => [1000,1500) => cat 3
assert gddcat_2021 == 3 if hhid == 1

* GDD=2000 => [2000,2500) => cat 5
assert gddcat_2021 == 5 if hhid == 3

* GDD=2750 => [2500,3000) => cat 6
assert gddcat_2020 == 6 if hhid == 3

di as result "PASS: Test 1 - default lo, auto hi, width 500"


display "--- Test 2: exact boundary on max => auto hi pushes up ---"
display "Pooled max=2500 exactly. Auto hi should be 3000, not 2500."
clear
set obs 1
gen hhid = 1
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = 625
}
* GDD = 4 * 625 = 2500

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) lr_years(2)

assert gdd_2020 == 2500
* 2500 falls exactly on a boundary. Since intervals are [lo, hi),
* 2500 should NOT be in [2000,2500). It should be in [2500,3000).
* Categories: 1=[0,500), 2=[500,1000), 3=[1000,1500), 4=[1500,2000),
*             5=[2000,2500), 6=[2500,3000)
assert gddcat_2020 == 6

di as result "PASS: Test 2 - exact boundary max, auto hi pushes up"


display "--- Test 3: gdd_binhi() creates top-coded category ---"
clear
set obs 2
gen hhid = _n
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = .
}
replace tmp_20200101 = 500 if hhid == 1
replace tmp_20200102 = 500 if hhid == 1
replace tmp_20200103 = 500 if hhid == 1
replace tmp_20200104 = 500 if hhid == 1
* GDD loc1 = 2000

replace tmp_20200101 = 1000 if hhid == 2
replace tmp_20200102 = 1000 if hhid == 2
replace tmp_20200103 = 1000 if hhid == 2
replace tmp_20200104 = 1000 if hhid == 2
* GDD loc2 = 4000

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) gdd_binhi(3000) lr_years(2)

* Categories: 1=[0,500), 2=[500,1000), 3=[1000,1500), 4=[1500,2000),
*             5=[2000,2500), 6=[2500,3000), 7=GDD>=3000
* GDD=2000 => [2000,2500) => cat 5 (not top-coded since 2000<3000)
assert gddcat_2020 == 5 if hhid == 1
* GDD=4000 => GDD>=3000 => cat 7
assert gddcat_2020 == 7 if hhid == 2

* GDD=3000 exactly should go to top-coded
clear
set obs 1
gen hhid = 1
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = 750
}
* GDD = 3000
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) gdd_binhi(3000) lr_years(2)
assert gdd_2020 == 3000
assert gddcat_2020 == 7

di as result "PASS: Test 3 - gdd_binhi() creates top-coded category"


display "--- Test 4: gdd_binlo() creates bottom-coded category ---"
clear
set obs 2
gen hhid = _n
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = .
}
replace tmp_20200101 = 100 if hhid == 1
replace tmp_20200102 = 100 if hhid == 1
replace tmp_20200103 = 100 if hhid == 1
replace tmp_20200104 = 100 if hhid == 1
* GDD loc1 = 400 (below gdd_binlo(750))

replace tmp_20200101 = 500 if hhid == 2
replace tmp_20200102 = 500 if hhid == 2
replace tmp_20200103 = 500 if hhid == 2
replace tmp_20200104 = 500 if hhid == 2
* GDD loc2 = 2000

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) gdd_binlo(750) lr_years(2)

* Pooled min=400<750 so bottom-coded. Pooled max=2000.
* Auto hi from 750: ceil((2000-750)/500)=3, 750+3*500=2250, 2000<2250 => hi=2250
* Categories: 1=GDD<750, 2=[750,1250), 3=[1250,1750), 4=[1750,2250)
assert gddcat_2020 == 1 if hhid == 1
assert gddcat_2020 == 4 if hhid == 2

di as result "PASS: Test 4 - gdd_binlo() creates bottom-coded category"


display "--- Test 5: gdd_binlo() + gdd_binhi() together ---"
clear
set obs 3
gen hhid = _n
forvalues d = 1/4 {
	local dd = string(`d', "%02.0f")
	gen tmp_202001`dd' = .
}
replace tmp_20200101 = 50  if hhid == 1
replace tmp_20200102 = 50  if hhid == 1
replace tmp_20200103 = 50  if hhid == 1
replace tmp_20200104 = 50  if hhid == 1
* GDD loc1 = 200 (below lo=500)

replace tmp_20200101 = 200 if hhid == 2
replace tmp_20200102 = 200 if hhid == 2
replace tmp_20200103 = 200 if hhid == 2
replace tmp_20200104 = 200 if hhid == 2
* GDD loc2 = 800

replace tmp_20200101 = 1000 if hhid == 3
replace tmp_20200102 = 1000 if hhid == 3
replace tmp_20200103 = 1000 if hhid == 3
replace tmp_20200104 = 1000 if hhid == 3
* GDD loc3 = 4000 (above hi=3000)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) gdd_binlo(500) gdd_binhi(3000) lr_years(2)

* Categories: 1=GDD<500, 2=[500,1000), 3=[1000,1500), 4=[1500,2000),
*             5=[2000,2500), 6=[2500,3000), 7=GDD>=3000
assert gddcat_2020 == 1 if hhid == 1
assert gddcat_2020 == 2 if hhid == 2
assert gddcat_2020 == 7 if hhid == 3

di as result "PASS: Test 5 - gdd_binlo + gdd_binhi together"


display "--- Test 6: gddcat is missing when gdd is missing ---"
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = .
gen tmp_20200102 = .
gen tmp_20200103 = .
gen tmp_20200104 = .
* Also need a valid season for wxsum to not error entirely
gen tmp_20210101 = 10
gen tmp_20210102 = 10
gen tmp_20210103 = 10
gen tmp_20210104 = 10

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) lr_years(2)

* gdd_2020 uses rowtotal, which gives 0 for all-missing
* gddcat_2020 should therefore be assigned (it's not truly missing GDD)
* But gdd_2021 should be 40, gddcat_2021 should be 1=[0,500)
assert gddcat_2021 == 1

di as result "PASS: Test 6 - gddcat handles edge cases"


display "--- Test 7: max GDD = 0 creates one bin [0,width) ---"
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 0
gen tmp_20200102 = 0

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(500) lr_years(2)

assert gdd_2020 == 0
* Auto hi: max=0, ceil((0-0)/500)=0, gb_n<1 so gb_n=1, hi=500
* Categories: 1=[0,500)
assert gddcat_2020 == 1

di as result "PASS: Test 7 - max GDD=0 creates [0,width)"


display "--- Test 8: no gdd_bin() => no gddcat variables ---"
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 10
gen tmp_20200102 = 20

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(32) lr_years(2)

capture confirm variable gddcat_2020
assert _rc != 0

di as result "PASS: Test 8 - no gdd_bin => no gddcat"


display "--- Validation error tests ---"

display "--- Test 9: gdd_bin with rain_data errors ---"
clear
set obs 1
gen rf_20200101 = 1
capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) rain_data gdd_bin(500)
_assert_rc _rc 198 "gdd_bin with rain_data"

display "--- Test 10: gdd_binlo without gdd_bin errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_binlo(100)
_assert_rc _rc 198 "gdd_binlo without gdd_bin"

display "--- Test 11: gdd_binhi without gdd_bin errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_binhi(3000)
_assert_rc _rc 198 "gdd_binhi without gdd_bin"

display "--- Test 12: gdd_binhi <= gdd_binlo errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_bin(500) gdd_binlo(1000) gdd_binhi(500)
_assert_rc _rc 198 "gdd_binhi <= gdd_binlo"

display "--- Test 13: non-divisible (hi-lo)/width errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_bin(500) gdd_binlo(750) gdd_binhi(3000)
_assert_rc _rc 198 "non-divisible (hi-lo)/width"

display "--- Test 14: gdd_bin <= 0 errors ---"
clear
set obs 1
gen tmp_20200101 = 10
capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_bin(0)
_assert_rc _rc 198 "gdd_bin(0)"

capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_bin(-100)
_assert_rc _rc 198 "gdd_bin(-100)"

display "--- Test 15: divisible (hi-lo)/width passes ---"
clear
set obs 1
gen tmp_20200101 = 10
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) temp_data gdd_lo(0) gdd_hi(32) gdd_bin(500) gdd_binlo(500) gdd_binhi(3000)
confirm variable gddcat_2020
di as result "PASS: Test 15 - divisible (hi-lo)/width"

display "--- Test 16: non-integer gdd_bin works ---"
clear
set obs 1
gen hhid = 1
gen tmp_20200101 = 10
gen tmp_20200102 = 20
wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(10000) gdd_bin(12.5) lr_years(2)
* GDD = 30, bin width 12.5, lo=0
* auto hi: ceil(30/12.5) = 3, 0+3*12.5=37.5, 30<37.5 => hi=37.5
* Categories: 1=[0,12.5), 2=[12.5,25), 3=[25,37.5)
* GDD=30 => [25,37.5) => cat 3
confirm variable gddcat_2020
assert gddcat_2020 == 3

di as result "PASS: Test 16 - non-integer gdd_bin"

display as result "All GDD category validation tests passed."
exit, clear
