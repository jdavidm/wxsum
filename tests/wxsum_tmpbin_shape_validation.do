* project: wxsum
* task: temperature binning and output shape validation
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
	capture set maxvar 90000

* confirm repository root
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run this validation from the wxsum repository root."
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
**# 1 - temperature binning functionality tests
**********************************************************************

**## 1.1 - basic bin counts and boundaries with tmp_bin(5)
* set up synthetic panel with known temperatures
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, -5, 0)
	gen             tmp_20200102 = cond(hhid == 1, 5, 10)
	gen             tmp_20200103 = cond(hhid == 1, 15, 20)
	gen             tmp_20200104 = cond(hhid == 1, 35, 30)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2) shape(wide)

* location 1 assertions
	assert          tmpbin01_2020 == 1 if hhid == 1
	assert          tmpbin02_2020 == 1 if hhid == 1
	assert          tmpbin03_2020 == 1 if hhid == 1
	assert          tmpbin04_2020 == 0 if hhid == 1
	assert          tmpbin05_2020 == 1 if hhid == 1

* location 2 boundary assertions
	assert          tmpbin01_2020 == 0 if hhid == 2
	assert          tmpbin02_2020 == 1 if hhid == 2
	assert          tmpbin03_2020 == 1 if hhid == 2
	assert          tmpbin04_2020 == 1 if hhid == 2
	assert          tmpbin05_2020 == 1 if hhid == 2

* sum equals nonmissing count
	assert          tmpbin01_2020 + tmpbin02_2020 + tmpbin03_2020 + tmpbin04_2020 + tmpbin05_2020 == 4

**## 1.2 - tmp_bin(15) with 13 interior bins
* set up synthetic observation
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = -1
	gen             tmp_20200102 = 0
	gen             tmp_20200103 = 2.9
	gen             tmp_20200104 = 3
	gen             tmp_20200105 = 39

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(05) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(15) tmp_binlo(0) tmp_binhi(39) lr_years(2) shape(wide)

* confirm created bin variables
	confirm variable tmpbin01_2020
	confirm variable tmpbin15_2020
	assert          tmpbin01_2020 == 1
	assert          tmpbin02_2020 == 2
	assert          tmpbin03_2020 == 1
	assert          tmpbin15_2020 == 1

* verify bin counts sum to nonmissing total
	local           binsum = 0
	forvalues b = 1/15 {
		local           bp = string(`b', "%02.0f")
		quietly summarize tmpbin`bp'_2020
		local           binsum = `binsum' + r(mean)
	}
	assert          `binsum' == 5

**## 1.3 - fine one-degree bins with tmp_bin(42)
* set up synthetic observation
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 0
	gen             tmp_20200102 = 1
	gen             tmp_20200103 = 20.5
	gen             tmp_20200104 = 41

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(42) tmp_binlo(1) tmp_binhi(41) lr_years(2) shape(wide)

* confirm extreme and interior bins
	confirm variable tmpbin01_2020
	confirm variable tmpbin42_2020
	assert          tmpbin01_2020 == 1
	assert          tmpbin02_2020 == 1
	assert          tmpbin21_2020 == 1
	assert          tmpbin42_2020 == 1

**## 1.4 - single bin counting all nonmissing with tmp_bin(1)
* set up synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 10, .)
	gen             tmp_20200102 = cond(hhid == 1, 20, .)
	gen             tmp_20200103 = cond(hhid == 1, 30, 5)
	gen             tmp_20200104 = cond(hhid == 1, 40, 15)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(1) tmp_binlo(0) tmp_binhi(30) lr_years(2) shape(wide)

* verify single bin equals valid count
	confirm variable tmpbin01_2020
	assert          tmpbin01_2020 == 4 if hhid == 1
	assert          tmpbin01_2020 == 2 if hhid == 2

**## 1.5 - midpoint split with tmp_bin(2)
* set up synthetic observation
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 5
	gen             tmp_20200102 = 14.9
	gen             tmp_20200103 = 15
	gen             tmp_20200104 = 25

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(2) tmp_binlo(0) tmp_binhi(30) lr_years(2) shape(wide)

* verify lower and upper halves
	confirm variable tmpbin01_2020
	confirm variable tmpbin02_2020
	assert          tmpbin01_2020 == 2
	assert          tmpbin02_2020 == 2

**## 1.6 - missing daily temperature handling
* set up synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 5, .)
	gen             tmp_20200102 = cond(hhid == 1, ., .)
	gen             tmp_20200103 = cond(hhid == 1, 15, .)
	gen             tmp_20200104 = cond(hhid == 1, 25, .)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2) shape(wide)

* verify nonmissing sums and all-missing assignment
	assert          tmpbin01_2020 + tmpbin02_2020 + tmpbin03_2020 + tmpbin04_2020 + tmpbin05_2020 == 3 if hhid == 1
	assert          missing(tmpbin01_2020) if hhid == 2
	assert          missing(tmpbin02_2020) if hhid == 2
	assert          missing(tmpbin03_2020) if hhid == 2
	assert          missing(tmpbin04_2020) if hhid == 2
	assert          missing(tmpbin05_2020) if hhid == 2

**## 1.7 - multiple seasons binning
* set up multi-season synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 5, 25)
	gen             tmp_20200102 = cond(hhid == 1, 15, 35)
	gen             tmp_20210101 = cond(hhid == 1, -5, 10)
	gen             tmp_20210102 = cond(hhid == 1, 45, 20)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(5) tmp_binlo(0) tmp_binhi(30) lr_years(2) shape(wide)

* verify bins generated for each season
	confirm variable tmpbin01_2020
	confirm variable tmpbin01_2021
	confirm variable tmpbin05_2020
	confirm variable tmpbin05_2021
	assert          tmpbin02_2020 == 1 if hhid == 1
	assert          tmpbin03_2020 == 1 if hhid == 1
	assert          tmpbin01_2021 == 1 if hhid == 1
	assert          tmpbin05_2021 == 1 if hhid == 1

**## 1.8 - tmp_bin variables preserved in keep()
* set up synthetic observation with extraneous column
	clear
	set obs         1
	gen             hhid = 1
	gen             extra = 999
	gen             tmp_20200101 = 10
	gen             tmp_20200102 = 20

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(3) tmp_binlo(0) tmp_binhi(30) keep(hhid) lr_years(2) shape(wide)

* verify keep retention and drop
	confirm variable hhid
	confirm variable tmpbin01_2020
	confirm variable tmpbin02_2020
	confirm variable tmpbin03_2020
	capture confirm variable extra
	assert          _rc != 0

**********************************************************************
**# 2 - temperature binning validation error tests
**********************************************************************

* test tmp_bin(0) error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_bin(0) tmp_binlo(0) tmp_binhi(30)
	_assert_rc      _rc 198 "tmp_bin(0) is rejected"

* test tmp_bin(43) error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_bin(43) tmp_binlo(0) tmp_binhi(30)
	_assert_rc      _rc 198 "tmp_bin(43) is rejected"

* test tmp_bin with type(rain) error
	clear
	set obs         1
	gen             rf_20200101 = 1
	capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(rain) tmp_bin(5) tmp_binlo(0) tmp_binhi(30)
	_assert_rc      _rc 198 "tmp_bin with type(rain) is rejected"

* test tmp_binlo without tmp_bin error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_binlo(0)
	_assert_rc      _rc 198 "tmp_binlo without tmp_bin is rejected"

* test tmp_binhi without tmp_bin error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_binhi(30)
	_assert_rc      _rc 198 "tmp_binhi without tmp_bin is rejected"

* test tmp_bin without limits error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_bin(5)
	_assert_rc      _rc 198 "tmp_bin without tmp_binlo/tmp_binhi is rejected"

* test tmp_binhi <= tmp_binlo error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_bin(5) tmp_binlo(30) tmp_binhi(10)
	_assert_rc      _rc 198 "tmp_binhi <= tmp_binlo is rejected"

	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) tmp_bin(5) tmp_binlo(10) tmp_binhi(10)
	_assert_rc      _rc 198 "tmp_binhi == tmp_binlo is rejected"

**********************************************************************
**# 3 - output shape functionality tests
**********************************************************************

**## 3.1 - default shape produces long format
* set up multi-season synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 10, 20)
	gen             tmp_20200102 = cond(hhid == 1, 15, 25)
	gen             tmp_20210101 = cond(hhid == 1, 12, 22)
	gen             tmp_20210102 = cond(hhid == 1, 18, 28)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) keep(hhid) lr_years(2)

* verify long layout
	assert          _N == 4
	confirm variable year
	confirm variable mean
	confirm variable gdd
	capture confirm variable mean_2020
	assert          _rc != 0

**## 3.2 - explicit shape(wide)
* set up multi-season synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 10, 20)
	gen             tmp_20200102 = cond(hhid == 1, 15, 25)
	gen             tmp_20210101 = cond(hhid == 1, 12, 22)
	gen             tmp_20210102 = cond(hhid == 1, 18, 28)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) keep(hhid) shape(wide) lr_years(2)

* verify wide layout
	assert          _N == 2
	confirm variable mean_2020
	confirm variable mean_2021
	capture confirm variable year
	assert          _rc != 0

**## 3.3 - explicit shape(long) basic output
* set up multi-season synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 10, 20)
	gen             tmp_20200102 = cond(hhid == 1, 15, 25)
	gen             tmp_20210101 = cond(hhid == 1, 12, 22)
	gen             tmp_20210102 = cond(hhid == 1, 18, 28)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) keep(hhid) shape(long) lr_years(2)

* verify observations and variables
	assert          _N == 4
	confirm variable year
	confirm variable hhid
	confirm variable mean
	confirm variable gdd
	capture confirm variable mean_2020
	assert          _rc != 0
	capture confirm variable mean_2021
	assert          _rc != 0
	quietly count   if year == 2020
	assert          r(N) == 2
	quietly count   if year == 2021
	assert          r(N) == 2
	assert          abs(mean - 12.5) < 1e-6 if hhid == 1 & year == 2020

**## 3.4 - shape(long) with tmp_bin
* set up multi-season synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	gen             tmp_20200101 = cond(hhid == 1, 5, 25)
	gen             tmp_20200102 = cond(hhid == 1, 15, 35)
	gen             tmp_20210101 = cond(hhid == 1, -5, 10)
	gen             tmp_20210102 = cond(hhid == 1, 45, 20)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) ///
	                    tmp_bin(5) tmp_binlo(0) tmp_binhi(30) keep(hhid) shape(long) lr_years(2)

* verify long bin columns
	assert          _N == 4
	confirm variable year
	confirm variable tmpbin01
	confirm variable tmpbin02
	confirm variable tmpbin03
	confirm variable tmpbin04
	confirm variable tmpbin05
	capture confirm variable tmpbin01_2020
	assert          _rc != 0
	assert          tmpbin02 == 1 if hhid == 1 & year == 2020
	assert          tmpbin03 == 1 if hhid == 1 & year == 2020

**## 3.5 - shape(long) without keep() prints note
* set up synthetic observation
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 10
	gen             tmp_20200102 = 20

* execute wxsum
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) shape(long) lr_years(2)
	_assert_rc      _rc 0 "shape(long) without keep() does not error"

**## 3.6 - shape(long) with year in keep() errors
* set up observation with preexisting year variable
	clear
	set obs         1
	gen             hhid = 1
	gen             year = 2020
	gen             tmp_20200101 = 10
	gen             tmp_20200102 = 20

* execute wxsum
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) keep(hhid year) shape(long) lr_years(2)
	_assert_rc      _rc 198 "shape(long) with year in keep() is rejected"

**## 3.7 - invalid shape argument errors
* set up synthetic observation
	clear
	set obs         1
	gen             tmp_20200101 = 10

* execute wxsum
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) shape(panel)
	_assert_rc      _rc 198 "shape(panel) is rejected"

**## 3.8 - shape(long) with gddcat preserves value labels
* set up multi-observation data
	clear
	set obs         2
	gen             hhid = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = cond(hhid == 1, `d' * 100, `d' * 50)
	}

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) gdd_bin(500) ///
	                    keep(hhid) shape(long) lr_years(2)

* verify label attachment
	confirm variable gddcat
	confirm variable year
	local           lbl : value label gddcat
	assert          "`lbl'" != ""
	local           t1 : label `lbl' 1
	assert          "`t1'" == "GDD [0,500)"

**## 3.9 - shape(long) preserves id and attributes
* set up panel with string attribute
	clear
	set obs         2
	gen             hhid = _n
	gen             region = cond(hhid == 1, "north", "south")
	gen             tmp_20200101 = cond(hhid == 1, 10, 20)
	gen             tmp_20210101 = cond(hhid == 1, 15, 25)

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(50) keep(hhid region) shape(long) lr_years(2)

* verify layout
	assert          _N == 4
	quietly count   if hhid == 1
	assert          r(N) == 2
	quietly count   if hhid == 2
	assert          r(N) == 2
	confirm variable region
	assert          region == "north" if hhid == 1

**********************************************************************
**# 4 - end matter
**********************************************************************

* report test completion
	di as result    "All tmp_bin and shape validation tests passed."
	exit,           clear

/* END */
