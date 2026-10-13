* tests/test_wxprep.do -- Test suite for wxprep companion command (WS5)
* Tests:
*   1. towide with %td date format
*   2. towide with %tc timestamp format
*   3. towide with YYYYMMDD integer format
*   4. towide with string date and dateformat()
*   5. towide duplicate rejection without daily()
*   6. towide duplicate aggregation with daily(mean)
*   7. towide calendar filling and nofill
*   8. rename with firstdate()
*   9. rename with from() and dateformat()
*  10. rename pre-checks leaving data unchanged on error
*  11. tolong wide to long
*  12. Exact round-trip: tolong -> towide reproduces original wide data exactly

clear all
set more off
set seed 20261013

adopath ++ "."

di as text "=================================================================="
di as text "TEST: test_wxprep"
di as text "=================================================================="

* -----------------------------------------------------------------
* Test 1: towide with %td date format
* -----------------------------------------------------------------
clear
set obs 4
gen int hhid = 1
gen long date = td(01jan2020) + _n - 1
format date %td
gen float rain = _n * 5

wxprep towide rain, id(hhid) date(date) stub(rf_) clear

assert _N == 1
assert rf_20200101 == 5
assert rf_20200102 == 10
assert rf_20200103 == 15
assert rf_20200104 == 20

di as text "  PASSED: towide with %td date"


* -----------------------------------------------------------------
* Test 2: towide with %tc timestamp format
* -----------------------------------------------------------------
clear
set obs 3
gen int hhid = 1
gen double time = clock("2020-01-01 12:00:00", "YMD hms") + (_n - 1) * 86400000
format time %tc
gen float rain = _n * 2

wxprep towide rain, id(hhid) date(time) stub(rf_) clear

assert _N == 1
assert rf_20200101 == 2
assert rf_20200102 == 4
assert rf_20200103 == 6

di as text "  PASSED: towide with %tc timestamp"


* -----------------------------------------------------------------
* Test 3: towide with YYYYMMDD integer format
* -----------------------------------------------------------------
clear
set obs 3
gen int hhid = 1
gen long date_num = 20200100 + _n
gen float rain = _n * 3

wxprep towide rain, id(hhid) date(date_num) stub(rf_) clear

assert _N == 1
assert rf_20200101 == 3
assert rf_20200102 == 6
assert rf_20200103 == 9

di as text "  PASSED: towide with YYYYMMDD integer"


* -----------------------------------------------------------------
* Test 4: towide with string date and dateformat()
* -----------------------------------------------------------------
clear
set obs 3
gen int hhid = 1
gen str10 d_str = "2020-01-0" + string(_n)
gen float rain = _n * 4

* Without dateformat -> error
capture wxprep towide rain, id(hhid) date(d_str) stub(rf_) clear
assert _rc == 198

* With dateformat
wxprep towide rain, id(hhid) date(d_str) stub(rf_) dateformat(YMD) clear
assert _N == 1
assert rf_20200101 == 4
assert rf_20200102 == 8
assert rf_20200103 == 12

di as text "  PASSED: towide with string date"


* -----------------------------------------------------------------
* Test 5: towide duplicate detection & daily() aggregation
* -----------------------------------------------------------------
clear
set obs 4
gen int hhid = 1
gen long date = td(01jan2020)
replace date = td(02jan2020) in 3/4
format date %td
* Readings: day 1 has 10 and 20; day 2 has 30 and 40
gen float rain = _n * 10

* Without daily() -> rejected with rc 459
capture wxprep towide rain, id(hhid) date(date) stub(rf_) clear
assert _rc == 459

* With daily(mean) -> day 1 mean is 15, day 2 mean is 35
wxprep towide rain, id(hhid) date(date) stub(rf_) daily(mean) clear
assert _N == 1
assert abs(rf_20200101 - 15) < 1e-6
assert abs(rf_20200102 - 35) < 1e-6

di as text "  PASSED: towide duplicate detection & daily aggregation"


* -----------------------------------------------------------------
* Test 6: towide calendar filling vs nofill
* -----------------------------------------------------------------
clear
set obs 2
gen int hhid = 1
gen long date = td(01jan2020) in 1
replace date = td(04jan2020) in 2
format date %td
gen float rain = 10

* With nofill: only 01jan and 04jan are created
preserve
wxprep towide rain, id(hhid) date(date) stub(rf_) nofill clear
capture confirm variable rf_20200101
assert _rc == 0
capture confirm variable rf_20200102
assert _rc != 0
capture confirm variable rf_20200103
assert _rc != 0
capture confirm variable rf_20200104
assert _rc == 0
restore

* Default (filling): 02jan and 03jan are created and filled with missing
wxprep towide rain, id(hhid) date(date) stub(rf_) clear
capture confirm variable rf_20200101
assert _rc == 0
capture confirm variable rf_20200102
assert _rc == 0
capture confirm variable rf_20200103
assert _rc == 0
capture confirm variable rf_20200104
assert _rc == 0

assert rf_20200101 == 10
assert missing(rf_20200102)
assert missing(rf_20200103)
assert rf_20200104 == 10

di as text "  PASSED: towide calendar filling and nofill"


* -----------------------------------------------------------------
* Test 7: rename with firstdate() and date gaps
* -----------------------------------------------------------------
clear
set obs 5
gen int id = _n
gen day1 = 1
gen day2 = 2
gen day3 = 3

wxprep rename day1-day3, stub(prcp_) firstdate("2020-05-10")
capture confirm variable prcp_20200510
assert _rc == 0
capture confirm variable prcp_20200511
assert _rc == 0
capture confirm variable prcp_20200512
assert _rc == 0
assert r(n_renamed) == 3
assert r(n_gaps) == 0

di as text "  PASSED: rename with firstdate()"


* -----------------------------------------------------------------
* Test 8: rename with from() and dateformat()
* -----------------------------------------------------------------
clear
set obs 5
gen int id = _n
gen rain_2020_05_10 = 1
gen rain_2020_05_12 = 2

* Gap between 10th and 12th (May 11 missing)
wxprep rename rain_*, stub(rf_) from(rain_) dateformat(Y_M_D)
capture confirm variable rf_20200510
assert _rc == 0
capture confirm variable rf_20200512
assert _rc == 0
assert r(n_renamed) == 2
assert r(n_gaps) == 1

di as text "  PASSED: rename with from() dateformat() and gap detection"


* -----------------------------------------------------------------
* Test 9: rename pre-checks (atomic rollback on error)
* -----------------------------------------------------------------
clear
set obs 5
gen int id = _n
gen bad_name = "text"
gen rain_2020_05_10 = 1
datasignature
local sig_before = r(datasignature)

* Attempt to rename including string variable -> fails pre-check
capture wxprep rename bad_name rain_*, stub(rf_) from(rain_) dateformat(Y_M_D)
assert _rc != 0

datasignature
assert "`r(datasignature)'" == "`sig_before'"

di as text "  PASSED: rename pre-checks protect dataset on failure"


* -----------------------------------------------------------------
* Test 10: tolong wide to long
* -----------------------------------------------------------------
clear
set obs 3
gen int hhid = _n
gen float rf_20200101 = 10 * _n
gen float rf_20200102 = 20 * _n

wxprep tolong rf_, id(hhid) generate(rain) date(obsdate) clear

assert _N == 6
capture confirm variable obsdate
assert _rc == 0
capture confirm variable rain
assert _rc == 0
assert obsdate[1] == td(01jan2020)
assert obsdate[2] == td(02jan2020)
assert rain[1] == 10
assert rain[2] == 20

di as text "  PASSED: tolong wide to long"


* -----------------------------------------------------------------
* Test 11: Exact round-trip (wide -> tolong -> towide)
* -----------------------------------------------------------------
clear
set obs 10
gen int hhid = _n
forvalues d = 1/5 {
	local dstr = string(`d', "%02.0f")
	gen float rf_202001`dstr' = runiform() * 25
}

* Store original signature and tempfile
datasignature
local orig_sig = r(datasignature)
tempfile orig_data
quietly save "`orig_data'"

* Step 1: tolong
wxprep tolong rf_, id(hhid) generate(rainfall) date(mydate) clear
assert _N == 50

* Step 2: towide (with nofill since wide had exact consecutive days)
wxprep towide rainfall, id(hhid) date(mydate) stub(rf_) nofill clear

* Compare with original dataset
datasignature
assert "`r(datasignature)'" == "`orig_sig'"
cf _all using "`orig_data'"
assert "`r(Nsum)'" == "0"

di as text "  PASSED: Exact round-trip (wide -> tolong -> towide)"

di _n as text "=================================================================="
di as text "ALL TEST_WXPREP ASSERTIONS PASSED!"
di as text "=================================================================="
