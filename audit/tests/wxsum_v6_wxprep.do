* project: wxsum
* task: wxprep companion command validation checks
* created on: oct 2026
* created by: jdm
* edited on: 15 oct 2026
* edited by: alj
* Stata v.15.1

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	clear           all
	set more        off
	set maxvar      20000

* confirm repository root
	capture confirm file "wxprep.ado"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}
	adopath         ++ "."

* define assertion helper for return codes
capture program drop _assert_rc
program define _assert_rc
	args            actual expected msg
	if `actual' != `expected' {
		di as error     "FAIL: `msg'"
		di as error     "Expected rc `expected', got rc `actual'"
		exit            459
	}
	di as result    "PASS: `msg'"
end

**********************************************************************
**# 1 - towide functionality and validation
**********************************************************************

**## 1.1 - round trip on bundled data
* load and prepare bundled rain data
	use             rain.dta, clear
	sort            hhid
	tempfile        orig
	quietly save    `orig'
	local           v1 = rf_20030101[1]

* execute tolong followed by towide
	wxprep          tolong rf_, id(hhid)
	assert          r(n_units) == 10 & r(n_days) == 7670
	assert          _N == 76700
	confirm variable hhid date rf
	assert          "`: format date'" == "%td"
	assert          date == td(01jan2003) & rf == `v1' in 1
	wxprep          towide rf, id(hhid) date(date) stub(rf_) clear
	assert          r(N) == 10 & r(n_days) == 7670 & r(n_filled) == 0
	cf              _all using `orig'

**## 1.2 - towide with %td dates, if/in conditions, and calendar filling
* test calendar filling
	clear
	set obs         6
	gen             id = cond(_n <= 3, 1, 2)
	gen             date = td(01jan2020) + mod(_n - 1, 3) * 2
	format          date %td
	gen             rain = _n
	wxprep          towide rain, id(id) date(date) stub(rf_) clear
	assert          r(n_days) == 5 & r(n_filled) == 2
	confirm variable rf_20200101 rf_20200102 rf_20200103 rf_20200104 rf_20200105
	assert          missing(rf_20200102) & missing(rf_20200104)
	assert          rf_20200105 == 6 if id == 2

* test nofill option with if condition
	clear
	set obs         6
	gen             id = cond(_n <= 3, 1, 2)
	gen             date = td(01jan2020) + mod(_n - 1, 3) * 2
	format          date %td
	gen             rain = _n
	wxprep          towide rain if id == 2, id(id) date(date) stub(rf_) nofill clear
	assert          _N == 1 & r(n_days) == 3
	capture confirm variable rf_20200102
	assert          _rc != 0

**## 1.3 - towide with %tc datetimes and intraday aggregation
* create hourly datetime observations
	clear
	set obs         48
	gen             id = 1
	gen double      t = tc(01jan2020 00:00) + (_n - 1) * 3600000
	format          t %tc
	gen             temp = _n
	replace         temp = . if _n == 30

* test error without daily()
	capture noisily wxprep towide temp, id(id) date(t) stub(tmp_) clear
	_assert_rc      _rc 459 "several readings per day need daily()"

* execute towide with daily(mean)
	wxprep          towide temp, id(id) date(t) stub(tmp_) daily(mean) clear
	assert          tmp_20200101 == 12.5
	assert          reldif(tmp_20200102, (25 + 48) * 24 / 2 / 23 - 30 / 23) < 1e-6
	assert          r(n_combined) == 46

**## 1.4 - daily(sum), daily(max), and all-missing intraday observations
* test daily(sum) and missing day retention
	clear
	set obs         6
	gen             id = 1
	gen             date = cond(_n <= 3, td(01jan2020), td(02jan2020))
	format          date %td
	gen             rain = cond(_n <= 3, _n, .)
	wxprep          towide rain, id(id) date(date) stub(rf_) daily(sum) clear
	assert          rf_20200101 == 6
	assert          missing(rf_20200102)

* test daily(max)
	clear
	set obs         4
	gen             id = 1
	gen             date = td(01jan2020)
	format          date %td
	gen             temp = _n * 10
	wxprep          towide temp, id(id) date(date) stub(tmp_) daily(max) clear
	assert          tmp_20200101 == 40

**## 1.5 - yyyymmdd integer and string date parsing
* test integer date format
	clear
	set obs         2
	gen str3        site = cond(_n == 1, "a", "b")
	gen long        ymd = 20200131
	gen             rain = _n
	wxprep          towide rain, id(site) date(ymd) stub(rf_) clear
	confirm variable rf_20200131
	assert          rf_20200131 == 2 if site == "b"

* test string date parsing
	clear
	set obs         2
	gen             id = _n
	gen str10       sdate = "2020-02-29"
	gen             rain = _n
	capture noisily wxprep towide rain, id(id) date(sdate) stub(rf_) clear
	_assert_rc      _rc 198 "string dates need dateformat()"
	wxprep          towide rain, id(id) date(sdate) stub(rf_) dateformat(YMD) clear
	confirm variable rf_20200229

* test invalid integer date
	clear
	set obs         1
	gen             id = 1
	gen long        ymd = 123
	gen             rain = 1
	capture noisily wxprep towide rain, id(id) date(ymd) stub(rf_) clear
	_assert_rc      _rc 198 "an undated number is rejected"

**## 1.6 - towide option validations
* test clear, stub, and missing id validations
	clear
	set obs         2
	gen             id = _n
	gen             date = td(01jan2020)
	format          date %td
	gen             rain = 1
	capture noisily wxprep towide rain, id(id) date(date) stub(rf_)
	_assert_rc      _rc 4 "changed data in memory need clear"
	capture noisily wxprep towide rain, id(id) date(date) stub(1bad) clear
	_assert_rc      _rc 198 "an invalid stub() is rejected"
	capture noisily wxprep towide rain, id(id) date(date) stub(rf_) daily(median) clear
	_assert_rc      _rc 198 "daily() must be mean, sum, min, or max"
	replace         id = . in 1
	capture noisily wxprep towide rain, id(id) date(date) stub(rf_) clear
	_assert_rc      _rc 416 "missing id() values are rejected"

**## 1.7 - maxvar limit verification before reshaping
* test maxvar threshold handling
	clear           all
	set maxvar      2048
	set obs         3000
	gen             id = 1
	gen             date = td(01jan2000) + _n
	format          date %td
	gen             rain = 1
	capture noisily wxprep towide rain, id(id) date(date) stub(rf_) clear
	assert          _rc == 900
	assert          _N == 3000
	clear           all
	set maxvar      20000
	adopath         ++ "."
	capture program drop _assert_rc
	program define _assert_rc
		args            actual expected msg
		if `actual' != `expected' {
			di as error     "FAIL: `msg'"
			di as error     "Expected rc `expected', got rc `actual'"
			exit            459
		}
		di as result    "PASS: `msg'"
	end

**********************************************************************
**# 2 - rename functionality and validation
**********************************************************************

**## 2.1 - rename with firstdate()
* test sequential renaming
	clear
	set obs         2
	gen             id = _n
	forvalues k = 1/5 {
		gen             rain`k' = `k' * id
	}
	wxprep          rename rain1-rain5, stub(rf_) firstdate(30dec2019)
	confirm variable rf_20191230 rf_20191231 rf_20200101 rf_20200102 rf_20200103
	assert          rf_20200103 == 10 if id == 2
	assert          r(n_gaps) == 0

* test firstdate with yyyymmdd integer
	clear
	set obs         1
	gen             x1 = 1
	gen             x2 = 2
	wxprep          rename x1 x2, stub(t_) firstdate(19930101)
	confirm variable t_19930101 t_19930102

**## 2.2 - rename with from() and dateformat()
* test pattern-based renaming
	clear
	set obs         1
	gen             rain_01jan2020 = 1
	gen             rain_02jan2020 = 2
	gen             rain_05jan2020 = 5
	wxprep          rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
	confirm variable rf_20200101 rf_20200102 rf_20200105
	assert          r(n_gaps) == 2

* test unparseable date rejection
	clear
	set obs         1
	gen             rain_01jan2020 = 1
	gen             rain_total = 2
	capture noisily wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
	_assert_rc      _rc 198 "a name that is not a date is rejected"
	confirm variable rain_01jan2020 rain_total

* test duplicate date rejection
	clear
	set obs         1
	gen             rain_01jan2020 = 1
	gen             rain_1jan2020 = 2
	capture noisily wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)
	_assert_rc      _rc 198 "duplicate dates are rejected"
	confirm variable rain_01jan2020 rain_1jan2020

* test target name collision rejection
	clear
	set obs         1
	gen             rain_01jan2020 = 1
	gen             rf_20200101 = 9
	capture noisily wxprep rename rain_01jan2020, stub(rf_) from(rain_) dateformat(DMY)
	_assert_rc      _rc 110 "an existing new name is rejected"
	confirm variable rain_01jan2020
	capture noisily wxprep rename rain_01jan2020, stub(rf_)
	_assert_rc      _rc 198 "rename needs firstdate() or from()"

**********************************************************************
**# 3 - tolong functionality and validation
**********************************************************************

**## 3.1 - tolong options and safety checks
* test basic tolong execution
	use             temp.dta, clear
	wxprep          tolong tmp_, id(hhid) generate(temp) date(day)
	confirm variable hhid day temp
	assert          r(n_days) == 7639

* test unique id check failure
	use             temp.dta, clear
	expand          2
	capture noisily wxprep tolong tmp_, id(hhid) clear
	_assert_rc      _rc 459 "id() must identify the observations"

* test variable name conflict
	use             temp.dta, clear
	capture noisily wxprep tolong tmp_, id(hhid) generate(hhid)
	_assert_rc      _rc 198 "generate() must not be an id() variable"

* test missing stub rejection
	capture noisily wxprep tolong nosuch_, id(hhid)
	_assert_rc      _rc 111 "a stub without daily variables is rejected"

* test unsaved data safety check
	gen             x = 1
	capture noisily wxprep tolong tmp_, id(hhid)
	_assert_rc      _rc 4 "changed data in memory need clear"

**## 3.2 - unsorted ids and out-of-order daily variables
* test unsorted wide variables handling
	clear
	set obs         3
	gen             hhid = 4 - _n
	gen float       rf_20200103 = 100 * hhid + 3
	gen float       rf_20200101 = 100 * hhid + 1
	gen float       rf_20200102 = 100 * hhid + 2
	wxprep          tolong rf_, id(hhid) generate(rain) date(d) clear
	assert          _N == 9
	assert          rain == 100 * hhid + day(d)

**********************************************************************
**# 4 - end-to-end workflows and storage types
**********************************************************************

**## 4.1 - end-to-end long to wide to wxsum workflow
* execute direct wxsum on wide data
	use             rain.dta, clear
	quietly wxsum   rf_, type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) keep(hhid) shape(wide)
	tempfile        direct
	quietly save    `direct'

* execute round-trip via long with transformations
	use             rain.dta, clear
	wxprep          tolong rf_, id(hhid)
	replace         rf = rf / 10
	replace         rf = rf * 10
	wxprep          towide rf, id(hhid) date(date) stub(rf_) clear
	quietly wxsum   rf_, type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) keep(hhid) shape(wide)
	foreach v of varlist total_* mean_* dry_* raindays_* {
		rename          `v' L_`v'
	}
	quietly merge   1:1 hhid using `direct', nogenerate
	foreach v of varlist L_* {
		local           o = substr("`v'", 3, .)
		assert          reldif(`v', `o') < 1e-6
	}

**## 4.2 - exact round trips for double and long storage types
* test precision preservation
	foreach t in double long {
		clear
		set obs         3
		gen             hhid = _n
		if "`t'" == "double" {
			gen double      rf_20200101 = hhid / 3
			gen double      rf_20200102 = 2 / 3 + hhid
		}
		else {
			gen long        rf_20200101 = 20000001 + hhid
			gen long        rf_20200102 = 30000003
		}
		tempfile        orig
		quietly save    `orig'
		wxprep          tolong rf_, id(hhid) generate(v) date(d) clear
		assert          "`: type v'" == "`t'"
		wxprep          towide v, id(hhid) date(d) stub(rf_) nofill clear
		cf              _all using `orig'
		assert          "`: type rf_20200101'" == "`t'"
	}

* test automatic narrowest integer storage type selection
	clear
	set obs         4
	gen             id = 1 + (_n > 2)
	gen             date = td(01jan2020) + mod(_n - 1, 2)
	format          date %td
	gen float       rain = cond(_n == 4, 300, _n)
	wxprep          towide rain, id(id) date(date) stub(rf_) clear
	assert          "`: type rf_20200101'" == "int" & "`: type rf_20200102'" == "int"
	assert          rf_20200102 == 300 if id == 2

	clear
	set obs         2
	gen             id = _n
	gen             date = td(01jan2020)
	format          date %td
	gen float       rain = _n / 2
	wxprep          towide rain, id(id) date(date) stub(rf_) clear
	assert          "`: type rf_20200101'" == "float"
	assert          rf_20200101 == 0.5 if id == 1

**## 4.3 - dataset rollback on failed towide execution
* test failure preserves input signature
	clear
	input id date rain
	1 21915 1
	1 21915 2
	2 21915 3
	end
	format          date %td
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep towide rain if id == 1, id(id) date(date) stub(rf_) clear
	_assert_rc      _rc 459 "two readings on one day need daily()"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"

* test long stub failure
	capture noisily wxprep towide rain, id(id) date(date) stub(this_is_a_very_long_stub_x_) clear
	_assert_rc      _rc 198 "a stub longer than 24 characters is rejected"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"

* test empty string id failure
	clear
	input str5 site date rain
	"a" 21915 1
	""  21915 99
	"b" 21915 3
	end
	format          date %td
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep towide rain, id(site) date(date) stub(rf_) clear
	_assert_rc      _rc 416 "an empty string id() is rejected"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"

**## 4.4 - a failed save() leaves the data unchanged (audit B1)
* test towide with a save to a folder that does not exist
	clear
	input           id date rain
	1 21915 5
	1 21916 6
	end
	format          date %td
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep towide rain, id(id) date(date) stub(rf_) clear ///
	    save("no_such_folder_wxprep/out.dta", replace)
	assert          _rc != 0
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"

* test tolong with a save to a folder that does not exist
	clear
	set obs         2
	gen             id = _n
	forvalues d = 1/6 {
		gen             rf_2020010`d' = id * `d'
	}
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep tolong rf_, id(id) clear ///
	    save("no_such_folder_wxprep/out.dta", replace)
	assert          _rc != 0
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"

* test that a successful tolong save() writes the long data
	tempfile        longout
	wxprep          tolong rf_, id(id) clear save(`"`longout'"')
	assert          _N == 12
	use             `"`longout'"', clear
	assert          _N == 12 & rf == id * day(date)

**## 4.5 - years before 1000 keep a four-digit year in the names (audit B2)
* test towide and a round trip for 1 January 0999
	clear
	set obs         1
	gen             id = 1
	gen             date = mdy(1, 1, 999)
	format          date %td
	gen             rain = 7
	wxprep          towide rain, id(id) date(date) stub(rf_) clear
	confirm         variable rf_09990101
	wxprep          tolong rf_, id(id) clear
	assert          rf == 7 & date == mdy(1, 1, 999)

* test rename with a first date in year 999
	clear
	set obs         1
	gen             a = 7
	gen             b = 8
	wxprep          rename a b, stub(rf_) firstdate(09990101)
	confirm         variable rf_09990101 rf_09990102

**## 4.6 - convert(): datetime variables to daily dates
* rename: any variable other than the renamed daily variables
	clear
	set obs         2
	gen             id = _n
	gen double      stamp = clock("15mar2021 14:30:00", "DMYhms") + (id - 1) * msofhours(30)
	format          stamp %tc
	label variable  stamp "Interview time"
	gen double      stampC = Clock("15mar2021 23:59:59", "DMYhms")
	format          stampC %tC
	gen             a = 1
	gen             b = 2
	wxprep          rename a b, stub(rf_) firstdate(01jan2021) convert(stamp stampC)
	assert          "`r(converted)'" == "stamp stampC"
	assert          stamp == mdy(3, 15, 2021) if id == 1
	assert          stamp == mdy(3, 16, 2021) if id == 2
	assert          stampC == mdy(3, 15, 2021)
	assert          "`: format stamp'" == "%td" & "`: variable label stamp'" == "Interview time"
	local           t : type stamp
	assert          inlist("`t'", "byte", "int", "long")
	confirm         variable rf_20210101 rf_20210102

* rename: a variable that is not a datetime, or one being renamed, is an
* error and nothing changes
	clear
	set obs         1
	gen             d = mdy(1, 1, 2021)
	format          d %td
	gen             a = 1
	gen double      t = clock("01jan2021 08:00:00", "DMYhms")
	format          t %tc
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep rename a, stub(rf_) firstdate(01jan2021) convert(d)
	_assert_rc      _rc 198 "convert() rejects a %td variable"
	capture noisily wxprep rename a t, stub(rf_) firstdate(01jan2021) convert(t)
	_assert_rc      _rc 198 "convert() rejects a variable being renamed"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"
	confirm         variable a t

* towide: a %tc id() variable; two readings on the same day become one unit
	clear
	input           site str16 visit rain
	1 "15mar2021 08:00" 4
	1 "15mar2021 17:00" 6
	2 "15mar2021 09:00" 1
	end
	gen double      vtime = clock(visit, "DMYhm")
	format          vtime %tc
	gen             date = mdy(1, 1, 2021)
	format          date %td
	drop            visit
	quietly save    `"`c(tmpdir)'/wxprep_conv.dta"', replace
	capture noisily wxprep towide rain, id(site vtime) date(date) stub(rf_) clear convert(date)
	_assert_rc      _rc 198 "towide convert() must name id() variables"
	capture noisily wxprep towide rain, id(site vtime) date(date) stub(rf_) clear convert(vtime)
	_assert_rc      _rc 459 "converted ids on the same day need daily()"
	wxprep          towide rain, id(site vtime) date(date) stub(rf_) clear convert(vtime) daily(sum)
	assert          _N == 2 & "`r(converted)'" == "vtime"
	assert          vtime == mdy(3, 15, 2021) & "`: format vtime'" == "%td"
	assert          rf_20210101 == 10 if site == 1

* tolong: a %tc id() variable must still identify the observations
	clear
	set obs         2
	gen             site = _n
	gen double      vtime = clock("15mar2021 08:00:00", "DMYhms") + (site - 1) * msofhours(2)
	format          vtime %tc
	forvalues d = 1/3 {
		gen             rf_2021010`d' = site * `d'
	}
	quietly datasignature
	local           sig "`r(datasignature)'"
	capture noisily wxprep tolong rf_, id(vtime) clear convert(vtime)
	_assert_rc      _rc 459 "two datetimes on the same day no longer identify the observations"
	quietly datasignature
	assert          "`r(datasignature)'" == "`sig'"
	wxprep          tolong rf_, id(site vtime) clear convert(vtime)
	assert          _N == 6 & vtime == mdy(3, 15, 2021) & "`r(converted)'" == "vtime"

**********************************************************************
**# 5 - end matter
**********************************************************************

* report test completion
	di as result    "All wxprep checks passed."

/* END */
