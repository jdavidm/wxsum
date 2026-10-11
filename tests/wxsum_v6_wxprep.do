* wxsum_v6_wxprep.do
* Plan WS5: the wxprep companion command (towide, rename, tolong).
* Run from the repository root.
clear all
set more off
set maxvar 20000
capture confirm file "wxprep.ado"
if _rc {
	di as error "Run this test from the wxsum repository root."
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

display "wxprep checks: Stata " c(stata_version)

* ---------------------------------------------------------------------------
display "1. round trip on the bundled data: tolong then towide reproduces rain.dta"
use rain.dta, clear
sort hhid
tempfile orig
quietly save `orig'
local v1 = rf_20030101[1]
wxprep tolong rf_, id(hhid)
assert r(n_units) == 10 & r(n_days) == 7670
assert _N == 76700
confirm variable hhid date rf
assert "`: format date'" == "%td"
assert date == td(01jan2003) & rf == `v1' in 1
wxprep towide rf, id(hhid) date(date) stub(rf_) clear
assert r(N) == 10 & r(n_days) == 7670 & r(n_filled) == 0
cf _all using `orig'
di as result "PASS: 1"

display "2. towide with %td dates, if/in, and calendar filling"
clear
set obs 6
gen id = cond(_n <= 3, 1, 2)
gen date = td(01jan2020) + mod(_n - 1, 3) * 2
format date %td
gen rain = _n
* dates 01jan, 03jan, 05jan: 02jan and 04jan have no data for any unit
wxprep towide rain, id(id) date(date) stub(rf_) clear
assert r(n_days) == 5 & r(n_filled) == 2
confirm variable rf_20200101 rf_20200102 rf_20200103 rf_20200104 rf_20200105
assert missing(rf_20200102) & missing(rf_20200104)
assert rf_20200105 == 6 if id == 2
clear
set obs 6
gen id = cond(_n <= 3, 1, 2)
gen date = td(01jan2020) + mod(_n - 1, 3) * 2
format date %td
gen rain = _n
wxprep towide rain if id == 2, id(id) date(date) stub(rf_) nofill clear
assert _N == 1 & r(n_days) == 3
capture confirm variable rf_20200102
assert _rc != 0
di as result "PASS: 2"

display "3. towide with %tc datetimes and daily() (hourly readings)"
clear
set obs 48
gen id = 1
gen double t = tc(01jan2020 00:00) + (_n - 1) * 3600000
format t %tc
gen temp = _n
replace temp = . if _n == 30
capture noisily wxprep towide temp, id(id) date(t) stub(tmp_) clear
_assert_rc _rc 459 "several readings per day need daily()"
wxprep towide temp, id(id) date(t) stub(tmp_) daily(mean) clear
* day 1: mean of 1..24 = 12.5; day 2: mean of 25..48 without 30
assert tmp_20200101 == 12.5
assert reldif(tmp_20200102, (25 + 48) * 24 / 2 / 23 - 30 / 23) < 1e-6
assert r(n_combined) == 46
di as result "PASS: 3"

display "4. daily(sum), daily(max), and days whose readings are all missing"
clear
set obs 6
gen id = 1
gen date = cond(_n <= 3, td(01jan2020), td(02jan2020))
format date %td
gen rain = cond(_n <= 3, _n, .)
wxprep towide rain, id(id) date(date) stub(rf_) daily(sum) clear
assert rf_20200101 == 6
* all readings on 02jan are missing: the day stays missing, not 0
assert missing(rf_20200102)
clear
set obs 4
gen id = 1
gen date = td(01jan2020)
format date %td
gen temp = _n * 10
wxprep towide temp, id(id) date(date) stub(tmp_) daily(max) clear
assert tmp_20200101 == 40
di as result "PASS: 4"

display "5. YYYYMMDD integer dates and string dates"
clear
set obs 2
gen str3 site = cond(_n == 1, "a", "b")
gen long ymd = 20200131
gen rain = _n
wxprep towide rain, id(site) date(ymd) stub(rf_) clear
confirm variable rf_20200131
assert rf_20200131 == 2 if site == "b"
clear
set obs 2
gen id = _n
gen str10 sdate = "2020-02-29"
gen rain = _n
capture noisily wxprep towide rain, id(id) date(sdate) stub(rf_) clear
_assert_rc _rc 198 "string dates need dateformat()"
wxprep towide rain, id(id) date(sdate) stub(rf_) dateformat(YMD) clear
confirm variable rf_20200229
clear
set obs 1
gen id = 1
gen long ymd = 123
gen rain = 1
capture noisily wxprep towide rain, id(id) date(ymd) stub(rf_) clear
_assert_rc _rc 198 "an undated number is rejected"
di as result "PASS: 5"

display "6. towide option checks"
clear
set obs 2
gen id = _n
gen date = td(01jan2020)
format date %td
gen rain = 1
capture noisily wxprep towide rain, id(id) date(date) stub(rf_)
_assert_rc _rc 4 "changed data in memory need clear"
capture noisily wxprep towide rain, id(id) date(date) stub(1bad) clear
_assert_rc _rc 198 "an invalid stub() is rejected"
capture noisily wxprep towide rain, id(id) date(date) stub(rf_) daily(median) clear
_assert_rc _rc 198 "daily() must be mean, sum, min, or max"
replace id = . in 1
capture noisily wxprep towide rain, id(id) date(date) stub(rf_) clear
_assert_rc _rc 416 "missing id() values are rejected"
di as result "PASS: 6"

display "7. towide checks maxvar before reshaping"
clear all
set maxvar 2048
set obs 3000
gen id = 1
gen date = td(01jan2000) + _n
format date %td
gen rain = 1
capture noisily wxprep towide rain, id(id) date(date) stub(rf_) clear
* (-clear all- above also dropped _assert_rc, so check the code directly)
assert _rc == 900
assert _N == 3000
clear all
set maxvar 20000
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
di as result "PASS: 7"

* ---------------------------------------------------------------------------
display "8. rename with firstdate()"
clear
set obs 2
gen id = _n
forvalues k = 1/5 {
	gen rain`k' = `k' * id
}
wxprep rename rain1-rain5, stub(rf_) firstdate(30dec2019)
confirm variable rf_20191230 rf_20191231 rf_20200101 rf_20200102 rf_20200103
assert rf_20200103 == 10 if id == 2
assert r(n_gaps) == 0
clear
set obs 1
gen x1 = 1
gen x2 = 2
wxprep rename x1 x2, stub(t_) firstdate(19930101)
confirm variable t_19930101 t_19930102
di as result "PASS: 8"

display "9. rename with from() and dateformat(), and its safety checks"
clear
set obs 1
gen rain_01jan2020 = 1
gen rain_02jan2020 = 2
gen rain_05jan2020 = 5
wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
confirm variable rf_20200101 rf_20200102 rf_20200105
assert r(n_gaps) == 2
* a name that is not a date: nothing is renamed
clear
set obs 1
gen rain_01jan2020 = 1
gen rain_total = 2
capture noisily wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
_assert_rc _rc 198 "a name that is not a date is rejected"
confirm variable rain_01jan2020 rain_total
* two names with the same date
clear
set obs 1
gen rain_01jan2020 = 1
gen rain_1jan2020 = 2
capture noisily wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
_assert_rc _rc 198 "duplicate dates are rejected"
confirm variable rain_01jan2020 rain_1jan2020
* a new name that already exists
clear
set obs 1
gen rain_01jan2020 = 1
gen rf_20200101 = 9
capture noisily wxprep rename rain_01jan2020, stub(rf_) from(rain_) dateformat(DMY)
_assert_rc _rc 110 "an existing new name is rejected"
confirm variable rain_01jan2020
capture noisily wxprep rename rain_01jan2020, stub(rf_)
_assert_rc _rc 198 "rename needs firstdate() or from()"
di as result "PASS: 9"

* ---------------------------------------------------------------------------
display "10. tolong options"
use temp.dta, clear
wxprep tolong tmp_, id(hhid) generate(temp) date(day)
confirm variable hhid day temp
assert r(n_days) == 7639
use temp.dta, clear
expand 2
capture noisily wxprep tolong tmp_, id(hhid) clear
_assert_rc _rc 459 "id() must identify the observations"
use temp.dta, clear
capture noisily wxprep tolong tmp_, id(hhid) generate(hhid)
_assert_rc _rc 198 "generate() must not be an id() variable"
capture noisily wxprep tolong nosuch_, id(hhid)
_assert_rc _rc 111 "a stub without daily variables is rejected"
gen x = 1
capture noisily wxprep tolong tmp_, id(hhid)
_assert_rc _rc 4 "changed data in memory need clear"
di as result "PASS: 10"

* ---------------------------------------------------------------------------
display "11. end-to-end: long data -> wxprep towide -> wxsum, as for wide input"
use rain.dta, clear
quietly wxsum rf_, type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) keep(hhid) shape(wide)
tempfile direct
quietly save `direct'
use rain.dta, clear
wxprep tolong rf_, id(hhid)
* a daily transformation in long form (mm to cm and back) before going wide
replace rf = rf / 10
replace rf = rf * 10
wxprep towide rf, id(hhid) date(date) stub(rf_) clear
quietly wxsum rf_, type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) keep(hhid) shape(wide)
foreach v of varlist total_* mean_* dry_* raindays_* {
	rename `v' L_`v'
}
quietly merge 1:1 hhid using `direct', nogenerate
foreach v of varlist L_* {
	local o = substr("`v'", 3, .)
	assert reldif(`v', `o') < 1e-6
}
di as result "PASS: 11"

display as result "All wxprep checks passed."
