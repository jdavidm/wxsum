* wxsum_v6_performance.do
* Plan section 7: run times on the bundled data and on 1,000 and 10,000
* observations (the bundled data replicated), reported in the log. The plan
* target is under 2 seconds for each bundled example; the test fails if a
* bundled example takes longer. Larger runs are reported, not tested.
* Run from the repository root. Needs about 1 GB of memory.

clear all
set more off
set maxvar 20000
capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this test from the wxsum repository root."
	exit 601
}
adopath ++ "."

local n_cfg = 4
local d1 "rain.dta"
local c1 `"rf_, type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) keep(hhid)"'
local d2 "rain.dta"
local c2 `"rf_, type(rain) ini_month(11) fin_month(02) keep(hhid) shape(wide)"'
local d3 "temp.dta"
local c3 `"tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) heat_threshold(30) gdd_bin(100) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid)"'
local d4 "temp.dta"
local c4 `"tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) heat_threshold(27) keep(hhid) baseline(2003 2012)"'

* load the programs once, so that the timings exclude loading the ado-file
use rain.dta, clear
quietly wxsum rf_, type(rain) ini_month(1) fin_month(1) fin_day(2) keep(hhid)

local n_slow = 0
forvalues i = 1/`n_cfg' {
	foreach rep in 1 100 1000 {
		use "`d`i''", clear
		if `rep' > 1 {
			quietly expand `rep'
			quietly replace hhid = _n
		}
		local N = _N
		timer clear 1
		timer on 1
		quietly wxsum `c`i''
		timer off 1
		quietly timer list 1
		local t`i'_`rep' = r(t1)
		di as text "config `i', " %6.0fc `N' " obs: " %7.2f r(t1) " s"
	}
	if `t`i'_1' > 2 local ++n_slow
}

* wxprep on the long sample (76,700 observations): towide, tolong, and
* rename of all 7,670 daily variables
use examples/rain_long.dta, clear
timer clear 2
timer on 2
quietly wxprep towide rain, id(hhid) date(date) stub(rf_)
timer off 2
quietly timer list 2
local tp = r(t2)
timer clear 3
timer on 3
quietly wxprep tolong rf_, id(hhid) generate(rain) clear
timer off 3
quietly timer list 3
local tl = r(t3)
use rain.dta, clear
quietly ds rf_*
local old `r(varlist)'
local k : word count `old'
local new ""
forvalues i = 1/`k' {
	local new "`new' d`i'"
}
rename (`old') (`new')
timer clear 4
timer on 4
quietly wxprep rename d1-d`k', stub(rf_) firstdate(01jan2003)
timer off 4
quietly timer list 4
local tr = r(t4)

di as text _n "{hline 78}" _n "wxsum run times in seconds (Stata " c(stata_version) ", " c(processors) " processor(s))" _n "{hline 78}"
di as text %-62s "configuration" %8s "10 obs" %8s "1,000" %8s "10,000"
forvalues i = 1/`n_cfg' {
	local lab = substr(`"`c`i''"', 1, 60)
	di as text %-62s `"`lab'"' as result %8.2f `t`i'_1' %8.2f `t`i'_100' %8.2f `t`i'_1000'
}
di as text %-62s "wxprep towide, 76,700 daily observations" as result %8.2f `tp'
di as text %-62s "wxprep tolong, 10 x 7,670 daily variables" as result %8.2f `tl'
di as text %-62s "wxprep rename, 7,670 daily variables" as result %8.2f `tr'
di as text "{hline 78}"
if `n_slow' {
	di as error "`n_slow' bundled example(s) took more than 2 seconds"
	exit 9
}
di as result "All bundled examples ran in under 2 seconds."
