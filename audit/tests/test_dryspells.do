* project: wxsum
* task: test dry-spell rules and adjusted fisher-pearson skewness
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

* confirm repository root
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}
	adopath         ++ "."

**********************************************************************
**# 1 - generate synthetic test sequences
**********************************************************************

* set observation count and unit id
	set obs         10
	gen             id = _n

* initialize 9 daily rainfall variables for 2020
	forvalues d = 1/9 {
		local           day = string(`d', "%02.0f")
		gen             rf_202001`day' = .
	}

* sequence 1: dry_start=2, dry=2, dry_end=3
	replace         rf_20200101 = 0 if id == 1
	replace         rf_20200102 = 0 if id == 1
	replace         rf_20200103 = 5 if id == 1
	replace         rf_20200104 = 0 if id == 1
	replace         rf_20200105 = 0 if id == 1
	replace         rf_20200106 = 2 if id == 1
	replace         rf_20200107 = 0 if id == 1
	replace         rf_20200108 = 0 if id == 1
	replace         rf_20200109 = 0 if id == 1

* sequence 2: no rainy days, trailing missing days skipped
	replace         rf_20200101 = 0 if id == 2
	replace         rf_20200102 = 0 if id == 2
	replace         rf_20200103 = 0 if id == 2
	replace         rf_20200104 = 0 if id == 2

* sequence 3: interior missing days
	replace         rf_20200101 = 5 if id == 3
	replace         rf_20200102 = 0 if id == 3
	replace         rf_20200104 = 0 if id == 3
	replace         rf_20200105 = 0 if id == 3
	replace         rf_20200106 = 5 if id == 3
	replace         rf_20200107 = 0 if id == 3

* sequence 4: all missing days (no replacement needed)

* sequence 5: all rainy days
	replace         rf_20200101 = 5 if id == 5
	replace         rf_20200102 = 5 if id == 5
	replace         rf_20200103 = 5 if id == 5

* sequence 6: alternating rain and dry days
	replace         rf_20200101 = 0 if id == 6
	replace         rf_20200102 = 5 if id == 6
	replace         rf_20200103 = 0 if id == 6
	replace         rf_20200104 = 5 if id == 6
	replace         rf_20200105 = 0 if id == 6

* sequence 7: rainfall threshold boundary matching
	replace         rf_20200101 = 1 if id == 7
	replace         rf_20200102 = 0 if id == 7
	replace         rf_20200103 = 0 if id == 7
	replace         rf_20200104 = 1 if id == 7
	replace         rf_20200105 = 0 if id == 7

* sequence 8: skewness test vector
	replace         rf_20200101 = 1 if id == 8
	replace         rf_20200102 = 2 if id == 8
	replace         rf_20200103 = 3 if id == 8
	replace         rf_20200104 = 4 if id == 8
	replace         rf_20200105 = 100 if id == 8

* sequence 9: single rainy day
	forvalues d = 1/9 {
		local           day = string(`d', "%02.0f")
		replace         rf_202001`day' = cond(`d' == 4, 5, 0) if id == 9
	}

* sequence 10: missing days at both edges
	replace         rf_20200103 = 0 if id == 10
	replace         rf_20200104 = 0 if id == 10
	replace         rf_20200105 = 5 if id == 10
	replace         rf_20200106 = 0 if id == 10
	replace         rf_20200107 = 0 if id == 10
	replace         rf_20200108 = 0 if id == 10

**********************************************************************
**# 2 - calculate expected skewness benchmark
**********************************************************************

* compute adjusted fisher-pearson sample skewness for row 8
	preserve
	keep            if id == 8
	keep            rf_*
	xpose,          clear
	drop            if v1 == .
	quietly sum     v1
	local           m = r(mean)
	local           s = r(sd)
	local           n = r(N)
	gen             dev3 = ((v1 - `m') / `s')^3
	quietly sum     dev3
	local           exp_skew = (`n' / ((`n' - 1) * (`n' - 2))) * r(sum)
	restore

**********************************************************************
**# 3 - execute wxsum and verify dry spell calculations
**********************************************************************

* execute wxsum calculation
	wxsum           rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(9) ///
	                    type(rain) rain_threshold(1) keep(id) shape(wide)

* sequence 1 assertions
	assert          dry_start_2020 == 2 if id == 1
	assert          dry_2020       == 2 if id == 1
	assert          dry_end_2020   == 3 if id == 1

* sequence 2 assertions
	assert          dry_start_2020 == 4 if id == 2
	assert          dry_2020       == 4 if id == 2
	assert          dry_end_2020   == 4 if id == 2

* sequence 3 assertions
	assert          dry_start_2020 == 0 if id == 3
	assert          dry_2020       == 2 if id == 3
	assert          dry_end_2020   == 1 if id == 3

* sequence 4 assertions
	assert          dry_start_2020 == . if id == 4
	assert          dry_2020       == . if id == 4
	assert          dry_end_2020   == . if id == 4

* sequence 5 assertions
	assert          dry_start_2020 == 0 if id == 5
	assert          dry_2020       == 0 if id == 5
	assert          dry_end_2020   == 0 if id == 5

* sequence 6 assertions
	assert          dry_start_2020 == 1 if id == 6
	assert          dry_2020       == 1 if id == 6
	assert          dry_end_2020   == 1 if id == 6

* sequence 7 assertions
	assert          dry_start_2020 == 0 if id == 7
	assert          dry_2020       == 2 if id == 7
	assert          dry_end_2020   == 1 if id == 7

* sequence 9 assertions
	assert          dry_start_2020 == 3 if id == 9
	assert          dry_2020       == 5 if id == 9
	assert          dry_end_2020   == 5 if id == 9

* sequence 10 assertions
	assert          dry_start_2020 == 2 if id == 10
	assert          dry_2020       == 3 if id == 10
	assert          dry_end_2020   == 3 if id == 10

* sequence 8 skewness assertion
	assert          abs(skew_2020 - `exp_skew') < 1e-6 if id == 8
	*** verifies sample skewness matches adjusted fisher-pearson formula

**********************************************************************
**# 4 - end matter
**********************************************************************

* report test completion
	di as text      "ALL TESTS PASSED!"

/* END */
