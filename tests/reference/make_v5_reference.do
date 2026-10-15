* project: wxsum
* task: freeze wxsum v5.0 reference output for regression testing
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
	adopath         ++ "tests/reference"

* confirm repository root
	capture confirm file "rain.dta"
	if _rc {
		di as error     "Run this do-file from the wxsum repository root."
		exit            601
	}

**********************************************************************
**# 1 - define reference configurations
**********************************************************************

* configure reference dataset entries
	local           n_ref = 4
	local           f1 "v5_rain"
	local           d1 "rain.dta"
	local           c1 `"rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_threshold(1) keep(hhid)"'
	local           f2 "v5_rain_xyear"
	local           d2 "rain.dta"
	local           c2 `"rf_, type(rain) ini_month(11) fin_month(02) lr_years(5) rain_threshold(0.5) keep(hhid)"'
	local           f3 "v5_temp"
	local           d3 "temp.dta"
	local           c3 `"tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) kdd_base(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid)"'
	local           f4 "v5_temp_xyear"
	local           d4 "temp.dta"
	local           c4 `"tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) kdd_base(30) keep(hhid)"'

**********************************************************************
**# 2 - generate reference datasets
**********************************************************************

* loop over configurations and write reference datasets
	forvalues i = 1/`n_ref' {
		use             "`d`i''", clear
		di as text      _n "=== `f`i'': wxsum_v5 `c`i''"
		timer clear     1
		timer on        1
		wxsum_v5        `c`i''
		timer off       1
		quietly timer list 1
		di as text      "v5 run time: " %6.1f r(t1) " s"
		notes _dta:     wxsum v5.0 reference output. Input: `d`i''. Command: wxsum `c`i''
		label data      "wxsum v5.0 reference output (`f`i'')"
		save            "tests/reference/`f`i''.dta", replace
	}

**********************************************************************
**# 3 - end matter
**********************************************************************

* report completion
	di as result    _n "v5 reference outputs written to tests/reference/"

/* END */
