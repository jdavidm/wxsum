* project: wxsum
* task: synthetic release validation tests
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
**# 1 - rainfall stats with missing values, threshold, and dry spells
**********************************************************************

* create synthetic rainfall data
	clear
	set obs         2
	gen             hhid = _n
	gen             rf_20200101 = cond(hhid == 1, 0, 3)
	gen             rf_20200102 = cond(hhid == 1, 2, 0)
	gen             rf_20200201 = cond(hhid == 1, ., 0)
	gen             rf_20200202 = cond(hhid == 1, .5, 4)

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(02) ini_day(01) fin_day(02) ///
	                    type(rain) rain_threshold(1) lr_years(2) shape(wide)

* verify summary statistics
	assert          abs(total_2020 - cond(hhid == 1, 2.5, 7)) < 1e-6
	assert          abs(mean_2020 - cond(hhid == 1, 2.5 / 3, 7 / 4)) < 1e-6
	assert          norain_2020 == cond(hhid == 1, 2, 2)
	assert          raindays_2020 == cond(hhid == 1, 1, 2)
	assert          abs(pct_raindays_2020 - cond(hhid == 1, 1 / 3, .5)) < 1e-6

* verify dry spells
	assert          dry_2020 == 1
	assert          dry_start_2020 == cond(hhid == 1, 1, 0)
	assert          dry_end_2020 == cond(hhid == 1, 1, 0)
	assert          abs(mean_mo_2020 - cond(hhid == 1, 1.25, 3.5)) < 1e-6

**********************************************************************
**# 2 - rainfall rolling deviations and z-scores
**********************************************************************

* create 3-year synthetic panel
	clear
	set obs         2
	gen             hhid = _n
	foreach y in 2020 2021 2022 {
		gen             rf_`y'0101 = .
	}
	replace         rf_20200101 = 10 if hhid == 1
	replace         rf_20210101 = 20 if hhid == 1
	replace         rf_20220101 = 50 if hhid == 1
	replace         rf_20200101 = 5 if hhid == 2
	replace         rf_20210101 = 5 if hhid == 2
	replace         rf_20220101 = 5 if hhid == 2

* execute wxsum
	wxsum           rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(rain) lr_years(2) shape(wide)

* verify rolling calculations
	assert          total_2022 == cond(hhid == 1, 50, 5)
	assert          abs(dev_total_2022 - cond(hhid == 1, 35, 0)) < 1e-6
	assert          abs(z_total_2022 - (35 / sqrt(50))) < 1e-6 if hhid == 1
	assert          missing(z_total_2022) if hhid == 2
	capture confirm variable dev_total_2021
	assert          _rc != 0

**********************************************************************
**# 3 - cross-year temperature season labeling
**********************************************************************

* create cross-year synthetic data
	clear
	set obs         2
	gen             hhid = _n
	forvalues d = `=td(30nov2021)'/`=td(02jan2022)' {
		local           y = year(`d')
		local           m = string(month(`d'), "%02.0f")
		local           day = string(day(`d'), "%02.0f")
		gen             tmp_`y'`m'`day' = cond(hhid == 1, 10, 5)
		if `y' == 2022 {
			replace         tmp_`y'`m'`day' = cond(hhid == 1, 20, 15)
		}
	}

* execute wxsum
	wxsum           tmp_, ini_month(11) fin_month(01) ini_day(30) fin_day(02) ///
	                    type(temp) gdd_lo(8) gdd_hi(32) heat_threshold(18) lr_years(2) shape(wide)

* verify cross-year outputs
	confirm variable mean_2021
	capture confirm variable mean_2022
	assert          _rc != 0
	assert          abs(mean_2021 - cond(hhid == 1, 360 / 34, 190 / 34)) < 1e-6
	assert          gdd_2021 == cond(hhid == 1, 88, 14)
	assert          kdd_2021 == cond(hhid == 1, 4, 0)

**********************************************************************
**# 4 - gdd categories validation
**********************************************************************

* create multi-season synthetic dataset
	clear
	set obs         3
	gen             hhid = _n

* generate season 2020 daily variables
	forvalues d = 1/4 {
		local           day = string(`d', "%02.0f")
		gen             tmp_202001`day' = .
	}
	replace         tmp_20200101 = 10 if hhid == 1
	replace         tmp_20200102 = 20 if hhid == 1
	replace         tmp_20200103 = 30 if hhid == 1
	replace         tmp_20200104 = 40 if hhid == 1

	replace         tmp_20200101 = 50 if hhid == 2
	replace         tmp_20200102 = 60 if hhid == 2
	replace         tmp_20200103 = 70 if hhid == 2
	replace         tmp_20200104 = 80 if hhid == 2

	replace         tmp_20200101 = 5 if hhid == 3
	replace         tmp_20200102 = 5 if hhid == 3
	replace         tmp_20200103 = 5 if hhid == 3
	replace         tmp_20200104 = 5 if hhid == 3

* generate season 2021 daily variables
	forvalues d = 1/4 {
		local           day = string(`d', "%02.0f")
		gen             tmp_202101`day' = .
	}
	replace         tmp_20210101 = 25 if hhid == 1
	replace         tmp_20210102 = 25 if hhid == 1
	replace         tmp_20210103 = 25 if hhid == 1
	replace         tmp_20210104 = 25 if hhid == 1

	replace         tmp_20210101 = 50 if hhid == 2
	replace         tmp_20210102 = 50 if hhid == 2
	replace         tmp_20210103 = 50 if hhid == 2
	replace         tmp_20210104 = 50 if hhid == 2

	replace         tmp_20210101 = 0 if hhid == 3
	replace         tmp_20210102 = 0 if hhid == 3
	replace         tmp_20210103 = 0 if hhid == 3
	replace         tmp_20210104 = 0 if hhid == 3

* execute wxsum with gdd_bin(100)
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(100) gdd_bin(100) lr_years(2) shape(wide)

* verify bin category assignments
	confirm variable gddcat_2020
	confirm variable gddcat_2021
	assert          gddcat_2020 == 1 if hhid == 3
	assert          gddcat_2020 == 2 if hhid == 1
	assert          gdd_2020 == 260 if hhid == 2
	assert          gddcat_2020 == 3 if hhid == 2
	assert          gddcat_2021 == 1 if hhid == 3
	assert          gddcat_2021 == 2 if hhid == 1

* verify obsolete variables do not exist
	capture confirm variable tempbin01_2020
	assert          _rc != 0
	capture confirm variable binmean_01
	assert          _rc != 0
	capture confirm variable binsd_01
	assert          _rc != 0

**********************************************************************
**# 5 - verify keep() option behavior and core kdd
**********************************************************************

* create single observation with extraneous source column
	clear
	set obs         1
	gen             hhid = 101
	gen             source_note = 999
	gen             tmp_20300101 = 12
	gen             tmp_20300102 = 18

* execute wxsum
	wxsum           tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(32) keep(hhid) lr_years(2) shape(wide)

* verify retained variables and dropped source note
	confirm variable hhid
	confirm variable gdd_2030
	capture confirm variable source_note
	assert          _rc != 0
	confirm variable kdd_2030
	assert          kdd_2030 == 30

**********************************************************************
**# 6 - rejection of invalid option combinations
**********************************************************************

* test conflict between type(rain) and type(temp)
	clear
	set obs         1
	gen             rf_20200101 = 1
	capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) ///
	                    type(rain) type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10)
	_assert_rc      _rc 198 "type(rain) and type(temp) cannot be used together"

* test rejection of invalid calendar date (Feb 30)
	clear
	set obs         1
	gen             tmp_20200101 = 1
	capture noisily wxsum tmp_, ini_month(02) fin_month(02) ini_day(30) fin_day(30) ///
	                    type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(10)
	_assert_rc      _rc 198 "invalid calendar day is rejected"

**********************************************************************
**# 7 - end matter
**********************************************************************

* report test completion
	di as result    "All synthetic release validation checks passed."
	exit,           clear

/* END */
