* project: wxsum
* task: gdd category validation tests
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
**# 1 - gdd category calculation tests
**********************************************************************

**## 1.1 - default lo=0, auto hi, width 500
* create synthetic panel with known gdd totals
	clear
	set obs         3
	gen             hhid = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = .
		gen             tmp_202101`dd' = .
	}

* season 2020 daily temperatures
	replace         tmp_20200101 = 0   if hhid == 1
	replace         tmp_20200102 = 0   if hhid == 1
	replace         tmp_20200103 = 0   if hhid == 1
	replace         tmp_20200104 = 0   if hhid == 1

	replace         tmp_20200101 = 100 if hhid == 2
	replace         tmp_20200102 = 150 if hhid == 2
	replace         tmp_20200103 = 200 if hhid == 2
	replace         tmp_20200104 = 50  if hhid == 2

	replace         tmp_20200101 = 500 if hhid == 3
	replace         tmp_20200102 = 600 if hhid == 3
	replace         tmp_20200103 = 700 if hhid == 3
	replace         tmp_20200104 = 950 if hhid == 3

* season 2021 daily temperatures
	replace         tmp_20210101 = 250 if hhid == 1
	replace         tmp_20210102 = 250 if hhid == 1
	replace         tmp_20210103 = 250 if hhid == 1
	replace         tmp_20210104 = 250 if hhid == 1

	replace         tmp_20210101 = 0   if hhid == 2
	replace         tmp_20210102 = 0   if hhid == 2
	replace         tmp_20210103 = 0   if hhid == 2
	replace         tmp_20210104 = 0   if hhid == 2

	replace         tmp_20210101 = 500 if hhid == 3
	replace         tmp_20210102 = 500 if hhid == 3
	replace         tmp_20210103 = 500 if hhid == 3
	replace         tmp_20210104 = 500 if hhid == 3

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) lr_years(2) shape(wide)

* verify underlying gdd totals
	assert          gdd_2020 == 0    if hhid == 1
	assert          gdd_2020 == 500  if hhid == 2
	assert          gdd_2020 == 2750 if hhid == 3
	assert          gdd_2021 == 1000 if hhid == 1
	assert          gdd_2021 == 0    if hhid == 2
	assert          gdd_2021 == 2000 if hhid == 3

* verify gdd categories
	confirm variable gddcat_2020
	confirm variable gddcat_2021
	assert          gddcat_2020 == 1 if hhid == 1
	assert          gddcat_2021 == 1 if hhid == 2
	assert          gddcat_2020 == 2 if hhid == 2
	assert          gddcat_2021 == 3 if hhid == 1
	assert          gddcat_2021 == 5 if hhid == 3
	assert          gddcat_2020 == 6 if hhid == 3

**## 1.2 - exact boundary on max pushes auto hi upward
* set up observation exactly on boundary
	clear
	set obs         1
	gen             hhid = 1
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = 625
	}

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) lr_years(2) shape(wide)

* verify gdd total and category assignment
	assert          gdd_2020 == 2500
	assert          gddcat_2020 == 6

**## 1.3 - gdd_binhi creates top-coded category
* set up observations above and below upper bound
	clear
	set obs         2
	gen             hhid = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = .
	}
	replace         tmp_20200101 = 500 if hhid == 1
	replace         tmp_20200102 = 500 if hhid == 1
	replace         tmp_20200103 = 500 if hhid == 1
	replace         tmp_20200104 = 500 if hhid == 1

	replace         tmp_20200101 = 1000 if hhid == 2
	replace         tmp_20200102 = 1000 if hhid == 2
	replace         tmp_20200103 = 1000 if hhid == 2
	replace         tmp_20200104 = 1000 if hhid == 2

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) gdd_binhi(3000) lr_years(2) shape(wide)

* verify category assignments
	assert          gddcat_2020 == 5 if hhid == 1
	assert          gddcat_2020 == 7 if hhid == 2

* verify exact boundary at gdd_binhi
	clear
	set obs         1
	gen             hhid = 1
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = 750
	}
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) gdd_binhi(3000) lr_years(2) shape(wide)
	assert          gdd_2020 == 3000
	assert          gddcat_2020 == 7

**## 1.4 - gdd_binlo creates bottom-coded category
* set up observations above and below lower bound
	clear
	set obs         2
	gen             hhid = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = .
	}
	replace         tmp_20200101 = 100 if hhid == 1
	replace         tmp_20200102 = 100 if hhid == 1
	replace         tmp_20200103 = 100 if hhid == 1
	replace         tmp_20200104 = 100 if hhid == 1

	replace         tmp_20200101 = 500 if hhid == 2
	replace         tmp_20200102 = 500 if hhid == 2
	replace         tmp_20200103 = 500 if hhid == 2
	replace         tmp_20200104 = 500 if hhid == 2

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) gdd_binlo(750) lr_years(2) shape(wide)

* verify category assignments
	assert          gddcat_2020 == 1 if hhid == 1
	assert          gddcat_2020 == 4 if hhid == 2

**## 1.5 - combined gdd_binlo and gdd_binhi
* set up observations across three intervals
	clear
	set obs         3
	gen             hhid = _n
	forvalues d = 1/4 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_202001`dd' = .
	}
	replace         tmp_20200101 = 50  if hhid == 1
	replace         tmp_20200102 = 50  if hhid == 1
	replace         tmp_20200103 = 50  if hhid == 1
	replace         tmp_20200104 = 50  if hhid == 1

	replace         tmp_20200101 = 200 if hhid == 2
	replace         tmp_20200102 = 200 if hhid == 2
	replace         tmp_20200103 = 200 if hhid == 2
	replace         tmp_20200104 = 200 if hhid == 2

	replace         tmp_20200101 = 1000 if hhid == 3
	replace         tmp_20200102 = 1000 if hhid == 3
	replace         tmp_20200103 = 1000 if hhid == 3
	replace         tmp_20200104 = 1000 if hhid == 3

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) gdd_binlo(500) gdd_binhi(3000) lr_years(2) shape(wide)

* verify bottom, interior, and top categories
	assert          gddcat_2020 == 1 if hhid == 1
	assert          gddcat_2020 == 2 if hhid == 2
	assert          gddcat_2020 == 7 if hhid == 3

**## 1.6 - missing values propagation
* set up observation with all missing daily observations
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = .
	gen             tmp_20200102 = .
	gen             tmp_20200103 = .
	gen             tmp_20200104 = .
	gen             tmp_20210101 = 10
	gen             tmp_20210102 = 10
	gen             tmp_20210103 = 10
	gen             tmp_20210104 = 10

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) lr_years(2) shape(wide)

* verify missing gdd creates missing gddcat
	assert          missing(gdd_2020)
	assert          missing(gddcat_2020)
	assert          gdd_2021 == 40
	assert          gddcat_2021 == 1

**## 1.7 - zero max gdd creates single category
* set up observation with zero temperatures
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 0
	gen             tmp_20200102 = 0

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(500) lr_years(2) shape(wide)

* verify category
	assert          gdd_2020 == 0
	assert          gddcat_2020 == 1

**## 1.8 - absence of gdd_bin option
* execute wxsum without gdd_bin
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 10
	gen             tmp_20200102 = 20

	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) lr_years(2) shape(wide)

* verify gddcat variable is not generated
	capture confirm variable gddcat_2020
	assert          _rc != 0

**********************************************************************
**# 2 - gdd category input validation errors
**********************************************************************

* test gdd_bin with type(rain) error
	clear
	set obs         1
	gen             rf_20200101 = 1
	capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(rain) gdd_bin(500)
	_assert_rc      _rc 198 "gdd_bin with type(rain)"

* test gdd_binlo without gdd_bin error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_binlo(100)
	_assert_rc      _rc 198 "gdd_binlo without gdd_bin"

* test gdd_binhi without gdd_bin error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_binhi(3000)
	_assert_rc      _rc 198 "gdd_binhi without gdd_bin"

* test gdd_binhi <= gdd_binlo error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) ///
	                    gdd_binlo(1000) gdd_binhi(500)
	_assert_rc      _rc 198 "gdd_binhi <= gdd_binlo"

* test non-divisible width interval error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) ///
	                    gdd_binlo(750) gdd_binhi(3000)
	_assert_rc      _rc 198 "non-divisible (hi-lo)/width"

* test non-positive width error
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(0)
	_assert_rc      _rc 198 "gdd_bin(0)"

	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(-100)
	_assert_rc      _rc 198 "gdd_bin(-100)"

* test divisible width interval succeeds
	clear
	set obs         1
	gen             tmp_20200101 = 10
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) ///
	                    gdd_binlo(500) gdd_binhi(3000) shape(wide)
	confirm variable gddcat_2020

* test non-integer bin width succeeds
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20200101 = 10
	gen             tmp_20200102 = 20
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10000) ///
	                    gdd_bin(12.5) lr_years(2) shape(wide)
	confirm variable gddcat_2020
	assert          gddcat_2020 == 3

**********************************************************************
**# 3 - end matter
**********************************************************************

* report test completion
	di as result    "All GDD category validation tests passed."
	exit,           clear

/* END */
