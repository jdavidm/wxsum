* project: wxsum
* task: test finday default window behavior
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
**# 1 - leap year 2000 test (february 29 days)
**********************************************************************

* set observations and identifier
	set obs         1
	gen             id = _n

* create daily temp data for jan 2000 through march 2000
	forvalues d = 14610/14700 {
		local           date_str = string(year(`d'), "%04.0f") + string(month(`d'), "%02.0f") + string(day(`d'), "%02.0f")
		gen             tmp_`date_str' = 10
	}

* run wxsum for february in leap year 2000
	wxsum           tmp_, ini_month(02) fin_month(02) type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(20) shape(wide)

* check that gdd is exactly 290
	assert          gdd_2000 == 290
	*** gdd with bounds 0 and 20 gives 10 gdd per day; feb 2000 has 29 days so gdd is 290

**********************************************************************
**# 2 - non-leap year 2001 test (february 28 days)
**********************************************************************

* clear and set observations for 2001
	clear
	set obs         1
	gen             id = _n

* create daily temp data for jan to mar 2001
	forvalues d = 14976/15065 {
		local           date_str = string(year(`d'), "%04.0f") + string(month(`d'), "%02.0f") + string(day(`d'), "%02.0f")
		gen             tmp_`date_str' = 10
	}

* run wxsum for february in non-leap year 2001
	wxsum           tmp_, ini_month(02) fin_month(02) type(temp) heat_threshold(0) gdd_lo(0) gdd_hi(20) shape(wide)

* check that gdd is 280
	assert          gdd_2001 == 280
	*** feb 2001 has 28 days so gdd is 280

**********************************************************************
**# 3 - end matter
**********************************************************************

* report test completion
	di as text      "fin_day default tests passed!"

/* END */
