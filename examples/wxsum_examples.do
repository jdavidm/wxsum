* wxsum_examples.do
* The examples in the article, for wxsum and wxprep version 6.
*
* Run it in the folder where -net get wxsum- copied the sample data (rain.dta,
* temp.dta) and the example datasets (hh_panel.dta, births.dta,
* weather_hourly.dta):
*
*     net install wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/")
*     net get wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/")
*     do wxsum_examples.do
*
* The log is wxsum_examples.log in the same folder. Examples 7 and 12 also
* save rain_season.dta and rain_long.dta there.
*
* hh_panel.dta, births.dta, and weather_hourly.dta are SIMULATED: they
* illustrate the commands and are not observed data (make_example_data.do
* creates them from rain.dta and temp.dta).
*
* rain.dta and temp.dta have one variable per day (about 7,700 each), so the
* examples set maxvar above the default of 5,000. Stata/BE allows at most
* 2,048 variables and can run only example 11, which starts from hourly data
* for one year.

version 15.1
clear all
set more off
set linesize 80

capture confirm file "hh_panel.dta"
if _rc {
    display as error "Run wxsum_examples.do in a folder with rain.dta, temp.dta,"
    display as error "and the example datasets: type -net get wxsum- there first."
    exit 601
}
capture log close wxsum_examples
log using wxsum_examples.log, text replace name(wxsum_examples) nomsg

* ============================================================================
* Setup: one variable per day needs more than the default 5,000 variables
* ============================================================================
set maxvar 20000


* ============================================================================
* Example 1. Rainfall in a growing season (15 May - 15 October)
* ============================================================================
use rain, clear
describe, short
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    keep(hhid)
list hhid year nobs total raindays dry_start dry dry_end in 1/5, noobs ///
    abbreviate(9)


* ============================================================================
* Example 2. What wxsum created: stored results, labels, characteristics
* ============================================================================
return list
matrix list r(missing)
describe total dev_total z_total dry_start
char list _dta[]


* ============================================================================
* Example 3. Growing degree days, killing degree days, and heat spells
* ============================================================================
use temp, clear
wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    gdd_lo(10) gdd_hi(30) heat_threshold(29) keep(hhid)
summarize gdd kdd heatdays heat_start heat heat_end


* ============================================================================
* Example 4. Exposure bins and GDD categories
* ============================================================================
* days in temperature bands over the hot, dry season, November to April; the
* season crosses the end of the year and takes the year in which it starts
use temp, clear
wxsum tmp_, type(temp) ini_month(11) fin_month(4) gdd_lo(10) gdd_hi(30) ///
    heat_threshold(30) cuts(24 27 30) keep(hhid)
describe cut*
summarize cut*

* equal-width temperature bins and categories of seasonal GDD
use temp, clear
quietly wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) ///
    fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) tmp_bin(8) ///
    tmp_binlo(20) tmp_binhi(32) gdd_bin(100) gdd_binlo(2000) ///
    gdd_binhi(2400) keep(hhid)
summarize tmpbin*
tabulate gddcat


* ============================================================================
* Example 5. Deviations and z-scores against a fixed baseline
* ============================================================================
use rain, clear
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    baseline(2003 2012) keep(hhid)
format dev_total %7.1f
format z_total z_dry %5.2f
list year total dev_total z_total dry z_dry if hhid == 101 & year >= 2016, ///
    noobs abbreviate(9)


* ============================================================================
* Example 6. Missing days: minobs() and ref_min()
* ============================================================================
* suppose that the rainfall of household 103 is missing in June and July 2015
use rain, clear
foreach v of varlist rf_201506* rf_201507* {
    quietly replace `v' = . if hhid == 103
}
preserve
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    minobs(140) keep(hhid)
format dev_total %7.1f
list year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), ///
    noobs abbreviate(9)
restore

* deviations that need 9 of the 10 reference seasons, not all 10
quietly wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) ///
    fin_day(15) minobs(140) ref_min(9) keep(hhid)
format dev_total %7.1f
list year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), ///
    noobs abbreviate(9)


* ============================================================================
* Example 7. Rain and temperature together; wide output
* ============================================================================
use rain, clear
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    outstub(r_) keep(hhid) save(rain_season, replace)
use temp, clear
quietly wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) ///
    fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) outstub(t_) ///
    keep(hhid)
merge 1:1 hhid year using rain_season, nogenerate
describe, short
format t_gdd t_kdd %7.1f
list hhid year r_total r_dry t_gdd t_kdd in 1/3, noobs

* the rainfall statistics in wide form: one row per household
use rain, clear
quietly wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) ///
    fin_day(15) keep(hhid) shape(wide)
describe, short
ds *_2023, varwidth(21)


* ============================================================================
* Example 8. Farm-specific growing seasons and an illustrative regression
* ============================================================================
use hh_panel, clear
describe
list in 1/3, noobs
merge m:1 hhid using rain, nogenerate
merge m:1 hhid using temp, nogenerate
wxsum rf_, type(rain) start(plant) end(harvest) outstub(r_) ///
    keep(hhid year plant harvest yield tmp_*)
quietly wxsum tmp_, type(temp) start(plant) end(harvest) gdd_lo(10) ///
    gdd_hi(30) heat_threshold(29) outstub(t_) ///
    keep(hhid year plant harvest yield r_*)
format t_gdd t_kdd %7.1f
list hhid year plant harvest r_total t_gdd t_kdd in 1/4, noobs
xtset hhid year
xtreg yield r_total t_gdd t_kdd, fe vce(cluster hhid)


* ============================================================================
* Example 9. Heat exposure in each trimester of pregnancy
* ============================================================================
use births, clear
describe
merge m:1 hhid using temp, nogenerate
* third trimester: the 91 days before birth
wxsum tmp_, type(temp) event_date(birthdate) days(91) gdd_lo(10) ///
    gdd_hi(30) heat_threshold(30) outstub(t3_) ///
    keep(childid hhid birthdate bweight tmp_*)
* second and first trimesters: the same window moved 91 and 182 days earlier
quietly wxsum tmp_, type(temp) event_date(birthdate) days(91) lag(91) ///
    gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t2_) ///
    keep(childid hhid birthdate bweight t3_* tmp_*)
quietly wxsum tmp_, type(temp) event_date(birthdate) days(91) lag(182) ///
    gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t1_) ///
    keep(childid hhid birthdate bweight t3_* t2_*)
summarize t1_heatdays t2_heatdays t3_heatdays
regress bweight t1_heatdays t2_heatdays t3_heatdays, vce(cluster hhid)


* ============================================================================
* Example 10. wxprep rename: daily variables with other names
* ============================================================================
* one year of rainfall in variables named day1, day2, ..., day365
use hhid rf_2023* using rain, clear
rename rf_2023* day#, renumber
describe, short
wxprep rename day1-day365, stub(rf_) firstdate(01jan2023)
describe rf_20230101 rf_20231231


* ============================================================================
* Example 11. wxprep towide: hourly temperature and humidity
* ============================================================================
use weather_hourly, clear
describe
list in 1/3, noobs
* daily maximum temperature in degrees Celsius
generate tempc = t2m - 273.15
wxprep towide tempc, id(hhid) date(time) stub(tmax_) daily(max) clear
wxsum tmax_, type(temp) ini_month(3) fin_month(5) gdd_lo(10) gdd_hi(30) ///
    heat_threshold(38) keep(hhid)
summarize max heatdays heat

* daily maximum wet-bulb temperature, from hourly temperature and relative
* humidity with the formula of Stull (2011)
use weather_hourly, clear
generate tempc = t2m - 273.15
generate tw = tempc*atan(0.151977*sqrt(rh + 8.313659)) + atan(tempc + rh) ///
    - atan(rh - 1.676331) + 0.00391838*rh^1.5*atan(0.023101*rh) - 4.686035
wxprep towide tw, id(hhid) date(time) stub(tw_) daily(max) clear
wxsum tw_, type(temp) ini_month(4) fin_month(9) gdd_lo(10) gdd_hi(30) ///
    heat_threshold(26) keep(hhid)
summarize max heatdays heat_start heat heat_end


* ============================================================================
* Example 12. wxprep tolong: compound hot and dry days
* ============================================================================
use rain, clear
wxprep tolong rf_, id(hhid) generate(rain) clear save(rain_long, replace)
use temp, clear
wxprep tolong tmp_, id(hhid) generate(temp) clear
merge 1:1 hhid date using rain_long, keep(match) nogenerate
* a hot and dry day: less than 1 mm of rain and a mean temperature of 29
* degrees C or more
generate byte hotdry = rain < 1 & temp >= 29 if !missing(rain, temp)
wxprep towide hotdry, id(hhid) date(date) stub(hd_) clear
wxsum hd_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
    gdd_lo(0) gdd_hi(1) heat_threshold(1) keep(hhid)
summarize heatdays heat_start heat heat_end z_heatdays

log close wxsum_examples
