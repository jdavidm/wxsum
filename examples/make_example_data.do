* make_example_data.do
* Builds the example datasets in examples/ from the bundled wide samples:
*   rain_long.dta  rain.dta in long form (one row per household-day)
*   temp_long.dta  temp.dta in long form (one row per household-day)
*   hh_toy.dta     a SIMULATED household panel (yields) used only to show how
*                  wxsum output is merged with survey data and used in a
*                  regression; the yields are not real data
* Run from the repository root:  do examples/make_example_data.do

version 15.1
clear all
set more off
set maxvar 10000
adopath ++ "."

* ---------------------------------------------------------------------------
* Long-form samples
* ---------------------------------------------------------------------------
use rain.dta, clear
wxprep tolong rf_, id(hhid) generate(rain)
label variable rain "Daily rainfall"
label data "wxsum example data: rain.dta in long form (one row per household-day)"
save examples/rain_long.dta, replace

use temp.dta, clear
wxprep tolong tmp_, id(hhid) generate(temp)
label variable temp "Daily temperature"
label data "wxsum example data: temp.dta in long form (one row per household-day)"
save examples/temp_long.dta, replace

* ---------------------------------------------------------------------------
* Simulated household panel, 2003-2023. Yield depends on rainfall from 15 May
* to 15 October, computed here directly from the daily variables (not with
* wxsum), plus a household effect and noise.
* ---------------------------------------------------------------------------
use rain.dta, clear
forvalues y = 2003/2023 {
	local vl ""
	forvalues d = `=mdy(5, 15, `y')'/`=mdy(10, 15, `y')' {
		local vl "`vl' rf_`=year(`d')'`=string(month(`d'), "%02.0f")'`=string(day(`d'), "%02.0f")'"
	}
	egen season_rain`y' = rowtotal(`vl')
}
keep hhid season_rain*
reshape long season_rain, i(hhid) j(year)
set seed 20261011
bysort hhid: gen double u = rnormal(0, 0.20) if _n == 1
bysort hhid: replace u = u[1]
gen yield = round(1.2 + 0.0015 * season_rain + u + rnormal(0, 0.15), 0.01)
keep hhid year yield
label variable year "Year"
label variable yield "Maize yield, t/ha (SIMULATED)"
label data "wxsum example data: SIMULATED household yields for illustration only"
notes: Simulated by examples/make_example_data.do for the wxsum examples. Yield = 1.2 + 0.0015 x rainfall from 15 May to 15 October + household effect + noise. Not real data.
compress
save examples/hh_toy.dta, replace
