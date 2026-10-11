* make_v5_reference.do
* Freezes wxsum v5.0 output on the bundled sample data. The resulting files are
* the regression oracle for wxsum v6 (tests/wxsum_v6_regression.do).
*
* Run from the repository root:  do tests/reference/make_v5_reference.do
* Uses the frozen v5 program tests/reference/wxsum_v5.ado (program wxsum_v5).
* This only needs to be re-run if the bundled rain.dta or temp.dta change.

clear all
set more off
set maxvar 20000
adopath ++ "tests/reference"

capture confirm file "rain.dta"
if _rc {
	di as error "Run this do-file from the wxsum repository root."
	exit 601
}

* Each entry: output file | input data | v5 command (without the command name)
local n_ref = 4
local f1 "v5_rain"
local d1 "rain.dta"
local c1 `"rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_threshold(1) keep(hhid)"'
local f2 "v5_rain_xyear"
local d2 "rain.dta"
local c2 `"rf_, type(rain) ini_month(11) fin_month(02) lr_years(5) rain_threshold(0.5) keep(hhid)"'
local f3 "v5_temp"
local d3 "temp.dta"
local c3 `"tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) kdd_base(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid)"'
local f4 "v5_temp_xyear"
local d4 "temp.dta"
local c4 `"tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) kdd_base(30) keep(hhid)"'

forvalues i = 1/`n_ref' {
	use "`d`i''", clear
	di as text _n "=== `f`i'': wxsum_v5 `c`i''"
	timer clear 1
	timer on 1
	wxsum_v5 `c`i''
	timer off 1
	quietly timer list 1
	di as text "v5 run time: " %6.1f r(t1) " s"
	notes _dta: wxsum v5.0 reference output. Input: `d`i''. Command: wxsum `c`i''
	label data "wxsum v5.0 reference output (`f`i'')"
	save "tests/reference/`f`i''.dta", replace
}

di as result _n "v5 reference outputs written to tests/reference/"
