* project: wxsum
* task: core validation checks
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
**# 1 - core functionality checks
**********************************************************************

**## 1.1 - same-month season bounds
* create single observation
	clear
	set obs         1
	gen             hhid = 1
	gen             rf_19930501 = 1
	gen             rf_19930502 = 100
	gen             rf_19930503 = 100

* execute wxsum
	wxsum           rf_, ini_month(05) fin_month(05) ini_day(01) fin_day(02) type(rain) shape(wide)
	assert          total_1993 == 101

**## 1.2 - dates outside historical hardcoded range
* create single observation with year 2050
	clear
	set obs         1
	gen             hhid = 1
	gen             rf_20500501 = 2
	gen             rf_20500601 = 3
	gen             rf_20500602 = 99

* execute wxsum
	wxsum           rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) type(rain) shape(wide)
	assert          total_2050 == 5

**## 1.3 - cross-year season start-year labeling
* create cross-year daily series
	clear
	set obs         1
	gen             hhid = 1
	quietly {
		forvalues d = `=td(01jan1993)'/`=td(28feb1994)' {
			local           y = year(`d')
			local           m = string(month(`d'), "%02.0f")
			local           day = string(day(`d'), "%02.0f")
			gen             tmp_`y'`m'`day' = .
			replace         tmp_`y'`m'`day' = 1 if `y' == 1993 & inlist(month(`d'), 1, 2)
			replace         tmp_`y'`m'`day' = 10 if `y' == 1993 & inlist(month(`d'), 11, 12)
			replace         tmp_`y'`m'`day' = 100 if `y' == 1994 & inlist(month(`d'), 1, 2)
		}
	}

* execute wxsum
	wxsum           tmp_, ini_month(11) fin_month(02) type(temp) heat_threshold(0) gdd_lo(8) gdd_hi(32) shape(wide)
	assert          abs(mean_1993 - ((61 * 10 + 59 * 100) / 120)) < .0001
	capture confirm variable mean_1994
	assert          _rc != 0

**## 1.4 - rainfall total deviations
* create three-year annual series
	clear
	set obs         1
	gen             hhid = 1
	forvalues y = 1993/1995 {
		gen             rf_`y'0501 = `y' - 1990
		gen             rf_`y'0601 = `y' - 1990
	}

* execute wxsum
	wxsum           rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(01) type(rain) lr_years(2) shape(wide)
	assert          total_1995 == 10
	assert          abs(dev_total_1995 - 3) < .0001
	capture confirm variable z_total_1995
	assert          _rc == 0

**## 1.5 - missing rainfall excluded from denominator
* create observation with interior missing day
	clear
	set obs         1
	gen             hhid = 1
	gen             rf_20000101 = 0
	gen             rf_20000102 = .
	gen             rf_20000103 = 2

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) type(rain) lr_years(2) shape(wide)
	assert          norain_2000 == 1
	assert          raindays_2000 == 1
	assert          pct_raindays_2000 == .5

**## 1.6 - all-dry season dry spell equals observed dry days
* create all-zero observation
	clear
	set obs         1
	gen             hhid = 1
	gen             rf_20000101 = 0
	gen             rf_20000102 = 0
	gen             rf_20000103 = 0

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(03) type(rain) lr_years(2) shape(wide)
	assert          dry_2000 == 3

**## 1.7 - missing rainfall breaks dry spells
* create observation with missing day interrupting dry run
	clear
	set obs         1
	gen             hhid = 1
	gen             rf_20000101 = 0
	gen             rf_20000102 = 0
	gen             rf_20000103 = .
	gen             rf_20000104 = 0
	gen             rf_20000105 = 0
	gen             rf_20000106 = 0

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(06) type(rain) lr_years(2) shape(wide)
	assert          dry_2000 == 3

**## 1.8 - helper cleanup preserves user aux variables
* create dataset with preexisting user variable
	clear
	set obs         1
	gen             aux_user = 42
	gen             rf_20000101 = 0
	gen             rf_20000102 = 2

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) type(rain) lr_years(2) shape(wide)
	confirm variable aux_user
	assert          aux_user == 42
	capture ds      hist_* ssn_* percentile*
	assert          _rc != 0

**## 1.9 - gdd_lo(0) allowed and gdd capped accumulation
* create temperature observation
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_20000101 = 10
	gen             tmp_20000102 = 20

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(15) lr_years(2) shape(wide)
	assert          gdd_2000 == 25

**## 1.10 - capped gdd and kdd calculation
* create temperature series
	clear
	set obs         1
	gen             hhid = 1
	gen             tmp_19930501 = 9
	gen             tmp_19930502 = 31
	gen             tmp_19930503 = 40
	gen             tmp_19930504 = 20

* execute wxsum
	wxsum           tmp_, ini_month(05) fin_month(05) ini_day(01) fin_day(04) ///
	                    type(temp) gdd_lo(8) gdd_hi(32) heat_threshold(30) shape(wide)
	assert          gdd_1993 == 60
	assert          kdd_1993 == 11

**## 1.11 - gdd categories with gdd_bin
* create multi-day series
	clear
	set obs         2
	gen             hhid = _n
	forvalues d = 1/10 {
		local           dd = string(`d', "%02.0f")
		gen             tmp_200001`dd' = `d'
	}

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(10) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(20) gdd_bin(20) lr_years(2) shape(wide)
	confirm variable gddcat_2000
	assert          gddcat_2000 == 3
	capture confirm variable tempbin01_2000
	assert          _rc != 0
	capture confirm variable binmean_01
	assert          _rc != 0

**## 1.12 - keep() option preserves id and core outputs
* create observation
	clear
	set obs         1
	gen             hhid = 101
	gen             tmp_20000101 = 10
	gen             tmp_20000102 = 20

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) keep(hhid) lr_years(2) shape(wide)
	confirm variable hhid
	confirm variable gdd_2000
	confirm variable kdd_2000
	assert          kdd_2000 == 30
	capture confirm variable dev_gdd_2000
	assert          _rc != 0

**## 1.13 - bundled rainfall sample execution
* load bundled rain dataset
	use             rain.dta, clear
	tempfile        rainout
	wxsum           rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) ///
	                    type(rain) shape(wide) save("`rainout'")
	confirm variable dev_total_2013
	confirm variable z_total_2013
	capture confirm variable dev_total_2012
	assert          _rc != 0
	capture ds      hist_* ssn_* percentile* aux*
	assert          _rc != 0

**## 1.14 - bundled temperature sample execution
* load bundled temperature dataset
	use             temp.dta, clear
	wxsum           tmp_, ini_month(11) fin_month(02) type(temp) heat_threshold(0) ///
	                    gdd_lo(8) gdd_hi(32) keep(hhid) shape(wide)
	capture confirm variable tempbin01_2003
	assert          _rc != 0
	capture confirm variable binmean_01
	assert          _rc != 0
	confirm variable gdd_2003

**********************************************************************
**# 2 - input validation error checks
**********************************************************************

* test invalid gdd bounds (gdd_hi <= gdd_lo)
	clear
	set obs         1
	gen             tmp_20000101 = 10
	gen             tmp_20000102 = 20
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(32) gdd_hi(8) lr_years(2)
	_assert_rc      _rc 198 "gdd_hi must be greater than gdd_lo"

* test gdd_bin with type(rain)
	clear
	set obs         1
	gen             rf_20200101 = 1
	capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(rain) gdd_bin(500)
	_assert_rc      _rc 198 "gdd_bin with type(rain) is rejected"

* test gdd_binlo without gdd_bin
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_binlo(100)
	_assert_rc      _rc 198 "gdd_binlo without gdd_bin is rejected"

* test gdd_binhi without gdd_bin
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_binhi(3000)
	_assert_rc      _rc 198 "gdd_binhi without gdd_bin is rejected"

* test gdd_binhi <= gdd_binlo
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) ///
	                    gdd_binlo(1000) gdd_binhi(500)
	_assert_rc      _rc 198 "gdd_binhi <= gdd_binlo is rejected"

* test non-divisible hi-lo range
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(500) ///
	                    gdd_binlo(750) gdd_binhi(3000)
	_assert_rc      _rc 198 "non-divisible hi-lo range is rejected"

* test non-positive gdd_bin
	clear
	set obs         1
	gen             tmp_20200101 = 10
	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(0)
	_assert_rc      _rc 198 "gdd_bin(0) is rejected"

	capture noisily wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) gdd_bin(-100)
	_assert_rc      _rc 198 "gdd_bin(-100) is rejected"

**********************************************************************
**# 3 - end matter
**********************************************************************

* report test completion
	di as result    "All wxsum validation tests passed."
	exit,           clear

/* END */
