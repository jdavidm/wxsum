* wxsum_examples.do
* Examples for the wxsum package, version 6.0: the Stata examples in the
* article (in v6 syntax), followed by checks after a run, unit-specific
* windows, wxprep, and a merge with household data.
*
* Run from the wxsum repository root:      do examples/wxsum_examples.do
* or from a folder where you ran -net get wxsum-:   do wxsum_examples.do
* The plain-text log wxsum_examples.log is written next to the example files.
*
* The wide samples rain.dta and temp.dta have about 7,700 daily variables
* each (section 6 combines them), so Stata/SE and Stata/MP need -set maxvar-
* above the default of 5,000 (done below). Stata/BE allows at most 2,048 variables: BE users can run section 8,
* which starts from the long samples, after restricting the years with -if-
* (for example, if date >= td(01jan2018)).

version 15.1
clear all
set more off
set linesize 100
capture log close _all

* example files are in examples/ in the repository, or in the current folder
* after -net get wxsum-
local ex ""
capture confirm file "examples/hh_toy.dta"
if !_rc local ex "examples/"
log using "`ex'wxsum_examples.log", text replace name(wxsum_examples)

set maxvar 20000


* =============================================================================
* 1. Rainfall summaries (article section 5.1)
* =============================================================================
use rain.dta, clear
describe, short
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) ///
	rain_threshold(1) keep(hhid) save("`ex'rainfall_stats.dta", replace)

* checks after the run: what was created, for which windows, and missing data
return list
matrix list r(missing), format(%9.3g)

* the output has one row per household and season (long is the default)
describe, short
list hhid year nobs total raindays dry_start dry dry_end in 1/5, abbreviate(9) noobs
summarize total z_total pct_raindays


* =============================================================================
* 2. Temperature summaries (article section 5.2)
*    heat_threshold() sets the heat-day and heat-spell threshold and the KDD
*    base; kdd_base() is needed only if the KDD base should be different, as
*    here (heat days at 27 degrees, KDD above 28 degrees)
* =============================================================================
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) ///
	heat_threshold(27) kdd_base(28) keep(hhid)
summarize gdd kdd heatdays heat_start heat heat_end


* =============================================================================
* 3. GDD categories, temperature bins, and exposure bands (article section 5.3)
* =============================================================================
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) ///
	gdd_lo(18) gdd_hi(30) heat_threshold(30) gdd_bin(100) gdd_binlo(1100) ///
	gdd_binhi(1500) keep(hhid)
tabulate gddcat

* 10 bins: below 20, eight 2-degree bins from 20 to 36, and 36 or above
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) ///
	gdd_lo(18) gdd_hi(30) heat_threshold(30) tmp_bin(10) tmp_binlo(20)   ///
	tmp_binhi(36) keep(hhid)
describe tmpbin*
summarize tmpbin*

* bands with cutpoints chosen by the user: below 25, 25-30, 30-32, 32 and above
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) ///
	gdd_lo(18) gdd_hi(30) heat_threshold(30) cuts(25 30 32) keep(hhid)
describe cut*
summarize cut*


* =============================================================================
* 4. Changing the reference period (article section 5.4)
* =============================================================================
* rolling: the 20 seasons before each season
use rain.dta, clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) lr_years(20) keep(hhid)

* fixed baseline: every season is compared with 2003-2012
use rain.dta, clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) baseline(2003 2012) keep(hhid)
list hhid year total dev_total z_total dev_dry z_dry if hhid == 101 & year >= 2019, noobs


* =============================================================================
* 5. Wide output (article section 5.5; long is the default in v6)
* =============================================================================
use rain.dta, clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) ///
	keep(hhid) shape(wide)
describe *_2013


* =============================================================================
* 6. Rain and temperature statistics in one dataset with outstub()
* =============================================================================
use rain.dta, clear
merge 1:1 hhid using temp.dta, nogenerate
wxsum rf_, type(rain) ini_month(05) fin_month(10) outstub(r_) shape(wide)
wxsum tmp_, type(temp) ini_month(05) fin_month(10) gdd_lo(10) gdd_hi(30) ///
	heat_threshold(30) outstub(t_) keep(hhid r_*) shape(wide)
describe r_total_2015 t_gdd_2015 t_heatdays_2015


* =============================================================================
* 7. Unit-specific windows
* =============================================================================
* a growing season that differs by household (illustrative planting dates)
use rain.dta, clear
gen plant = mdy(5, 1, 2020) + 3 * (hhid - 101)
gen harvest = plant + 120
format plant harvest %td
wxsum rf_, type(rain) start(plant) end(harvest) keep(hhid plant harvest)
list hhid plant harvest nobs total dry z_total, noobs

* the 273 days before an event, such as a birth (illustrative dates)
use temp.dta, clear
gen birth = mdy(3, 15, 2021) + 20 * (hhid - 101)
format birth %td
wxsum tmp_, type(temp) event_date(birth) days(273) gdd_lo(10) gdd_hi(30) ///
	heat_threshold(30) keep(hhid birth)
list hhid birth nobs mean max heatdays heat, noobs


* =============================================================================
* 8. wxprep: from long data to wxsum
* =============================================================================
use "`ex'rain_long.dta", clear
describe
wxprep towide rain, id(hhid) date(date) stub(rf_)
wxsum rf_, type(rain) ini_month(05) fin_month(10) keep(hhid)

* daily transformations are easiest in long form: Celsius to Fahrenheit
use "`ex'temp_long.dta", clear
gen temp_f = temp * 9 / 5 + 32
wxprep towide temp_f, id(hhid) date(date) stub(tf_) clear
wxsum tf_, type(temp) ini_month(04) fin_month(09) gdd_lo(50) gdd_hi(86) ///
	heat_threshold(90) keep(hhid)
summarize gdd heatdays


* =============================================================================
* 9. Merging with household data and an illustrative regression
*    hh_toy.dta holds SIMULATED yields (see make_example_data.do)
* =============================================================================
use "`ex'rainfall_stats.dta", clear
merge 1:1 hhid year using "`ex'hh_toy.dta"
xtset hhid year
xtreg yield total raindays, fe vce(cluster hhid)
regress yield z_total i.hhid if !missing(z_total), vce(cluster hhid)

log close wxsum_examples
