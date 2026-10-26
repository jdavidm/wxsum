* project: wxsum
* created on: oct 2026
* created by: jdm
* edited on: 26 oct 2026
* edited by: claude
* Stata v.15.1
*
* The examples in the article, for wxsum version 7 and wxprep version 1.
*
* Run it in the folder where -net get wxsum- copied the sample data
* (wxsum_rain.dta, wxsum_temp.dta) and the example datasets (hh_panel.dta,
* births.dta, weather_hourly.dta):
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
* creates them from wxsum_rain.dta and wxsum_temp.dta).
*
* wxsum_rain.dta and wxsum_temp.dta have one variable per day (about 7,700
* each), so the examples set maxvar above the default of 5,000. Stata/BE allows at most
* 2,048 variables and can run only example 11, which starts from hourly data
* for one year.

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	version         15.1
	clear           all
	set more        off
	set linesize    80
	set maxvar      20000

* confirm required sample files exist
	capture confirm file "hh_panel.dta"
	if _rc {
		di as error     "Run wxsum_examples.do in a folder with wxsum_rain.dta,"
		di as error     "wxsum_temp.dta, and the example datasets: type -net get wxsum-"
		di as error     "there first."
		exit            601
	}

* open log
	capture log     close wxsum_examples
	log using       wxsum_examples.log, text replace name(wxsum_examples) nomsg

**********************************************************************
**# 1 - rainfall in a growing season (15 may - 15 october)
**********************************************************************

* load rainfall data and inspect
	use             wxsum_rain, clear
	describe,       short

* calculate rainfall metrics for growing season
	wxsum           rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                keep(hhid)

* display summary table of results
	list            hhid year nobs total raindays dry_start dry dry_end in 1/5, noobs ///
	                abbreviate(9)

**********************************************************************
**# 2 - what wxsum created: stored results, labels, characteristics
**********************************************************************

* inspect return results
	return          list
	matrix          list r(missing)

* describe created variables
	describe        total dev_total z_total dry_start

* list dataset characteristics
	char            list _dta[]

**********************************************************************
**# 3 - growing degree days, killing degree days, and heat spells
**********************************************************************

* load temperature data
	use             wxsum_temp, clear

* calculate degree days and heat spells
	wxsum           tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                gdd_lo(10) gdd_hi(30) heat_threshold(29) keep(hhid)

* summarize temperature metrics
	summarize       gdd kdd heatdays heat_start heat heat_end

**********************************************************************
**# 4 - exposure bins and gdd categories
**********************************************************************

**## 4.1 - days in temperature bands
* days in temperature bands over the hot, dry season, november to april; the
* season crosses the end of the year and takes the year in which it starts
	use             wxsum_temp, clear
	wxsum           tmp_, type(temp) ini_month(11) fin_month(4) gdd_lo(10) gdd_hi(30) ///
	                heat_threshold(30) cuts(24 27 30) keep(hhid)
	describe        cut*
	summarize       cut*

**## 4.2 - equal-width temperature bins and categories of seasonal gdd
* equal-width temperature bins and categories of seasonal gdd
	use             wxsum_temp, clear
	quietly wxsum   tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) ///
	                fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) tmp_bin(8) ///
	                tmp_binlo(20) tmp_binhi(32) gdd_bin(100) gdd_binlo(2000) ///
	                gdd_binhi(2400) keep(hhid)
	summarize       tmpbin*
	tabulate        gddcat

**********************************************************************
**# 5 - deviations and z-scores against a fixed baseline
**********************************************************************

* calculate deviations against a 2003-2022 baseline
	use             wxsum_rain, clear
	wxsum           rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                baseline(2003 2022) keep(hhid)
	format          dev_total %7.1f
	format          z_total z_dry %5.2f
	list            year total dev_total z_total dry z_dry if hhid == 101 & year >= 2016, ///
	                noobs abbreviate(9)

**********************************************************************
**# 6 - missing days: minobs() and ref_min()
**********************************************************************

**## 6.1 - missing days with minobs()
* suppose that the rainfall of household 103 is missing in june and july 2015
	use             wxsum_rain, clear
	quietly recode  rf_201506* rf_201507* (nonmissing = .) if hhid == 103
	preserve
	wxsum           rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                minobs(140) keep(hhid)
	format          dev_total %7.1f
	list            year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), ///
	                noobs abbreviate(9)
	restore

**## 6.2 - deviations that need 9 of the 10 reference seasons
* deviations that need 9 of the 10 reference seasons, not all 10
	quietly wxsum   rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) ///
	                fin_day(15) minobs(140) ref_min(9) keep(hhid)
	format          dev_total %7.1f
	list            year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), ///
	                noobs abbreviate(9)

**********************************************************************
**# 7 - rain and temperature together; wide output
**********************************************************************

**## 7.1 - combining rain and temperature
* calculate rainfall metrics and save
	use             wxsum_rain, clear
	wxsum           rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                outstub(r_) keep(hhid) save(rain_season, replace)

* calculate temperature metrics
	use             wxsum_temp, clear
	quietly wxsum   tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) ///
	                fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) outstub(t_) ///
	                keep(hhid)

* merge rainfall and temperature datasets
	merge 1:1       hhid year using rain_season, nogenerate
	describe,       short
	format          t_gdd t_kdd %7.1f
	list            hhid year r_total r_dry t_gdd t_kdd in 1/3, noobs

**## 7.2 - rainfall statistics in wide form
* the rainfall statistics in wide form: one row per household
	use             wxsum_rain, clear
	quietly wxsum   rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) ///
	                fin_day(15) keep(hhid) shape(wide)
	describe,       short
	ds              *_2023, varwidth(21)

**********************************************************************
**# 8 - farm-specific growing seasons and an illustrative regression
**********************************************************************

* load household panel and merge weather data
	use             hh_panel, clear
	describe
	list            in 1/3, noobs
	merge m:1       hhid using wxsum_rain, nogenerate
	merge m:1       hhid using wxsum_temp, nogenerate

* calculate household-specific seasonal weather metrics
	wxsum           rf_, type(rain) start(plant) end(harvest) outstub(r_) ///
	                keep(hhid year plant harvest yield tmp_*)
	quietly wxsum   tmp_, type(temp) start(plant) end(harvest) gdd_lo(10) ///
	                gdd_hi(30) heat_threshold(29) outstub(t_) ///
	                keep(hhid year plant harvest yield r_*)
	format          t_gdd t_kdd %7.1f
	list            hhid year plant harvest r_total t_gdd t_kdd in 1/4, noobs

* run fixed-effects panel regression
	xtset           hhid year
	xtreg           yield r_total t_gdd t_kdd, fe vce(cluster hhid)

**********************************************************************
**# 9 - heat exposure in each trimester of pregnancy
**********************************************************************

* load births data and merge temperature data
	use             births, clear
	describe
	merge m:1       hhid using wxsum_temp, nogenerate

* third trimester: the 91 days before birth
	wxsum           tmp_, type(temp) event_date(birthdate) days(91) gdd_lo(10) ///
	                gdd_hi(30) heat_threshold(30) outstub(t3_) ///
	                keep(childid hhid birthdate bweight tmp_*)

* second and first trimesters: the same window moved 91 and 182 days earlier
	quietly wxsum   tmp_, type(temp) event_date(birthdate) days(91) lag(91) ///
	                gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t2_) ///
	                keep(childid hhid birthdate bweight t3_* tmp_*)
	quietly wxsum   tmp_, type(temp) event_date(birthdate) days(91) lag(182) ///
	                gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t1_) ///
	                keep(childid hhid birthdate bweight t3_* t2_*)

* summarize and regress birth weight on trimester heat exposure
	summarize       t1_heatdays t2_heatdays t3_heatdays
	regress         bweight t1_heatdays t2_heatdays t3_heatdays, vce(cluster hhid)

**********************************************************************
**# 10 - wxprep rename: daily variables with other names
**********************************************************************

* one year of rainfall in variables named day1, day2, ..., day365
	use             hhid rf_2023* using wxsum_rain, clear
	rename          rf_2023* day#, renumber
	describe,       short
	wxprep rename   day1-day365, stub(rf_) firstdate(01jan2023)
	describe        rf_20230101 rf_20231231

**********************************************************************
**# 11 - wxprep towide: hourly temperature and humidity
**********************************************************************

**## 11.1 - daily maximum temperature
* daily maximum temperature in degrees celsius
	use             weather_hourly, clear
	describe
	list            in 1/3, noobs
	generate        tempc = t2m - 273.15
	wxprep towide   tempc, id(hhid) date(time) stub(tmax_) daily(max) clear
	wxsum           tmax_, type(temp) ini_month(3) fin_month(5) gdd_lo(10) gdd_hi(30) ///
	                heat_threshold(38) keep(hhid)
	summarize       max heatdays heat

**## 11.2 - daily maximum wet-bulb temperature
* daily maximum wet-bulb temperature, from hourly temperature and relative
* humidity with the formula of stull (2011)
	use             weather_hourly, clear
	generate        tempc = t2m - 273.15
	generate        tw = tempc*atan(0.151977*sqrt(rh + 8.313659)) + atan(tempc + rh) ///
	                - atan(rh - 1.676331) + 0.00391838*rh^1.5*atan(0.023101*rh) - 4.686035
	wxprep towide   tw, id(hhid) date(time) stub(tw_) daily(max) clear
	wxsum           tw_, type(temp) ini_month(4) fin_month(9) gdd_lo(10) gdd_hi(30) ///
	                heat_threshold(26) keep(hhid)
	summarize       max heatdays heat_start heat heat_end

**********************************************************************
**# 12 - wxprep tolong: compound hot and dry days
**********************************************************************

* convert rainfall to long form and save
	use             wxsum_rain, clear
	wxprep tolong   rf_, id(hhid) generate(rain) clear save(rain_long, replace)

* convert temperature to long form and merge
	use             wxsum_temp, clear
	wxprep tolong   tmp_, id(hhid) generate(temp) clear
	merge 1:1       hhid date using rain_long, keep(match) nogenerate

* identify hot and dry days: < 1 mm rain and mean temperature >= 29 c
	generate byte   hotdry = rain < 1 & temp >= 29 if !missing(rain, temp)
	wxprep towide   hotdry, id(hhid) date(date) stub(hd_) clear
	wxsum           hd_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) ///
	                gdd_lo(0) gdd_hi(1) heat_threshold(1) keep(hhid)
	summarize       heatdays heat_start heat heat_end z_heatdays

**********************************************************************
**# 13 - end matter, clean up to save
**********************************************************************

* close the log
	log             close wxsum_examples

/* END */
