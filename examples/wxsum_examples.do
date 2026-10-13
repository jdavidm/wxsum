* examples/wxsum_examples.do
* Comprehensive demonstration of wxsum and wxprep (version 6.0)
*
* Sections:
*   1. Setup & Environment
*   2. Paper Example 1: Seasonal Rainfall Summaries (Wide Output)
*   3. Paper Example 2: Seasonal Temperature Summaries & Degree Days
*   4. Paper Example 3: Deschênes-Greenstone GDD Bins
*   5. Paper Example 4: Schlenker-Roberts Daily Temperature Bins
*   6. Paper Example 5: Custom Rolling Long-Run Benchmarks & Return Results
*   7. Paper Example 6: Long-Format Output
*   8. v6 Feature: Unit-Specific Exposure Windows (Planting Dates)
*   9. wxprep Companion Utility: tolong -> modification -> towide
*  10. End-to-End Pipeline: Merge with Household Data & Econometric Estimation

clear all
set more off
capture set maxvar 32000
set seed 20261013

* Add repository root to adopath
adopath ++ "."

di as text "=================================================================="
di as text "wxsum v6.0 Demonstration and Replication Examples"
di as text "=================================================================="


* -----------------------------------------------------------------------------
* SECTION 2: Seasonal Rainfall Summaries (Wide Output)
* -----------------------------------------------------------------------------
di _n as text "=== Section 2: Seasonal Rainfall Summaries (Wide) ==="
use "rain.dta", clear

* Calculate seasonal rainfall statistics for May 15 through October 15
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) ///
    rain_threshold(1) keep(hhid) shape(wide) save("examples/rainfall_stats.dta", replace)

describe, short
count
di as result "  Created rainfall_stats.dta with " r(N) " observations."


* -----------------------------------------------------------------------------
* SECTION 3: Seasonal Temperature Summaries (Cross-Calendar-Year Season)
* -----------------------------------------------------------------------------
di _n as text "=== Section 3: Seasonal Temperature Summaries (Cross-Year) ==="
use "temp.dta", clear

* November through February season (spanning calendar year boundary)
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) ///
    heat_threshold(32) keep(hhid) shape(wide)

describe, short
di as result "  Successfully computed cross-year temperature measures."


* -----------------------------------------------------------------------------
* SECTION 4: Deschênes-Greenstone GDD Bins
* -----------------------------------------------------------------------------
di _n as text "=== Section 4: Deschênes-Greenstone GDD Bins ==="
use "temp.dta", clear

wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) ///
    gdd_lo(18) gdd_hi(30) heat_threshold(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) ///
    keep(hhid) shape(wide)

* Inspect generated categorical GDD variable for 2010
tabulate gddcat_2010


* -----------------------------------------------------------------------------
* SECTION 5: Schlenker-Roberts Daily Temperature Bins
* -----------------------------------------------------------------------------
di _n as text "=== Section 5: Schlenker-Roberts Daily Temperature Bins ==="
use "temp.dta", clear

wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) ///
    gdd_lo(18) gdd_hi(30) heat_threshold(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) ///
    keep(hhid) shape(wide)

* Display counts in temperature bin intervals for 2010
summarize tmpbin01_2010 tmpbin08_2010 tmpbin15_2010


* -----------------------------------------------------------------------------
* SECTION 6: Custom Rolling Long-Run Benchmarks & Stored Matrix Results
* -----------------------------------------------------------------------------
di _n as text "=== Section 6: Rolling Long-Run Benchmarks & Matrix Returns ==="
use "rain.dta", clear

wxsum rf_, type(rain) ini_month(05) fin_month(10) lr_years(15) keep(hhid) shape(wide)

* Inspect stored results
return list
di _n as text "Inspection of r(missing) quality matrix:"
matrix list r(missing)


* -----------------------------------------------------------------------------
* SECTION 7: Long Output Format (Default shape(long))
* -----------------------------------------------------------------------------
di _n as text "=== Section 7: Long Output Format ==="
use "rain.dta", clear

wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) ///
    rain_threshold(1) keep(hhid) shape(long)

describe, short
list hhid year total dev_total raindays dry in 1/10


* -----------------------------------------------------------------------------
* SECTION 8: Unit-Specific Exposure Windows (Planting Dates)
* -----------------------------------------------------------------------------
di _n as text "=== Section 8: Unit-Specific Exposure Windows ==="
use "rain.dta", clear

* Suppose each household has an individual planting date
gen long plant_date = td(10may2015) + _n * 3
format plant_date %td

* Compute 90-day post-planting rainfall exposure with a 5-year rolling reference
wxsum rf_, type(rain) event_date(plant_date) days(90) lr_years(5) keep(hhid plant_date)

list hhid plant_date nobs total dev_total z_total in 1/10
matrix list r(missing)


* -----------------------------------------------------------------------------
* SECTION 9: wxprep Companion Utility (Round-Trip & Transformation)
* -----------------------------------------------------------------------------
di _n as text "=== Section 9: wxprep Companion Utility ==="
use "rain.dta", clear
keep in 1/5

* Step 9a: Reshape wide to long
wxprep tolong rf_, id(hhid) generate(rainfall) date(obsdate) clear
describe, short

* Step 9b: Construct custom non-linear daily indicator (e.g. torrential rainfall day >= 30mm)
gen byte torrential = (rainfall >= 30 & !missing(rainfall))

* Step 9c: Reshape indicator back to wide format
wxprep towide torrential, id(hhid) date(obsdate) stub(torr_) nofill clear
describe, short


* -----------------------------------------------------------------------------
* SECTION 10: End-to-End Pipeline: Merge with Household Data & Econometric Model
* -----------------------------------------------------------------------------
di _n as text "=== Section 10: End-to-End Pipeline & Econometric Estimation ==="

* Generate weather indicators for rain and temperature in long panel format
use "rain.dta", clear
quietly wxsum rf_, type(rain) ini_month(05) fin_month(10) keep(hhid) shape(long)
tempfile rain_long_stats
quietly save "`rain_long_stats'"

use "temp.dta", clear
quietly wxsum tmp_, type(temp) ini_month(05) fin_month(10) gdd_lo(10) gdd_hi(30) ///
    heat_threshold(32) keep(hhid) shape(long)

* Merge rain and temperature stats on (hhid, year)
quietly merge 1:1 hhid year using "`rain_long_stats'", keep(match) nogenerate

* Simulate a toy socioeconomic household panel dataset
* Outcome: Maize yield (kg/ha) influenced by total rain, rain anomalies, GDD, and heat shocks
gen double maize_yield = 2500 + 0.8 * total + 350 * dev_total + 1.2 * gdd - 25 * heatdays + rnormal(0, 200)
gen double fertilizer_input = 50 + runiform() * 40
gen double plot_area = 1.0 + runiform() * 1.5

label var maize_yield "Maize yield (kg/ha)"
label var fertilizer_input "Chemical fertilizer applied (kg/ha)"
label var plot_area "Cultivated plot area (ha)"

di _n as text "Estimation of Maize Yield on Weather Variables & Rainfall Shock:"
regress maize_yield total dev_total gdd heatdays fertilizer_input plot_area, vce(robust)

di _n as text "=================================================================="
di as result "WXSUM V6.0 DEMONSTRATION EXAMPLES COMPLETED SUCCESSFULLY!"
di as text "=================================================================="
