* project: wxsum
* task: generate simulated example datasets for wxsum
* created on: oct 2026
* created by: jdm
* edited on: 22 oct 2026
* edited by: alj
* Stata v.15.1
*
* Creates the three example datasets used by wxsum_examples.do from the
* sample data rain.dta and temp.dta. All three are SIMULATED for the examples;
* none of them are observed data.
*
*   hh_panel.dta         10 households, 2013-2023: planting and harvest dates
*                        and a simulated crop yield
*   births.dta           300 simulated births, 2014-2023, with birth weights
*   weather_hourly.dta   hourly 2-metre temperature (kelvin) and relative
*                        humidity for 2022, made by adding a daily cycle and
*                        noise to the daily data in temp.dta and rain.dta
*
* Run it in the folder with rain.dta and temp.dta (for example, the folder
* where you typed -net get wxsum-). It needs wxsum and wxprep, and about
* 16,000 variables (set maxvar). With the same seed it reproduces the
* datasets distributed with wxsum exactly.

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	version         15.1
	clear           all
	set more        off
	set maxvar      20000
	set seed        20261016

**********************************************************************
**# 1 - simulated household panel
**********************************************************************

* load rainfall data and reshape to long
	use             rain, clear
	quietly wxprep tolong rf_, id(hhid) generate(rain) clear
	generate        year = year(date)
	keep if         inrange(year, 2013, 2023)

* onset of the rains: first day from 1 may with >= 20 mm rain over 3 days
	sort            hhid date
	by hhid:        generate rain3 = rain + rain[_n + 1] + rain[_n + 2]
	generate        onset_day = date if rain3 >= 20 & !missing(rain3) & date >= mdy(5, 1, year)
	collapse        (min) onset = onset_day, by(hhid year)
	assert          !missing(onset)

* planting up to a week after onset; harvest 110-130 days after planting
	generate        plant = onset + floor(8 * runiform())
	generate        harvest = plant + 110 + floor(21 * runiform())
	format          plant harvest %td
	drop            onset

* weather of each household's own season
	merge m:1       hhid using rain, assert(match) nogenerate
	merge m:1       hhid using temp, assert(match) nogenerate
	quietly wxsum   rf_, type(rain) start(plant) end(harvest) outstub(r_) ///
	                keep(hhid year plant harvest tmp_*)
	quietly wxsum   tmp_, type(temp) start(plant) end(harvest) gdd_lo(10) gdd_hi(30) ///
	                heat_threshold(29) outstub(t_) keep(hhid year plant harvest r_total)

* yield (kg/ha): household effect, season rain, gdd, kdd, and noise
	sort            hhid year
	by hhid:        generate double hh_effect = rnormal(0, 150) if _n == 1
	by hhid:        replace hh_effect = hh_effect[1]
	generate int    yield = round(300 + hh_effect + 1.0 * r_total + 0.25 * t_gdd ///
	                - 15 * t_kdd + rnormal(0, 120))
	keep            hhid year plant harvest yield

* label variables and dataset
	label var       hhid "Household ID"
	label var       year "Year"
	label var       plant "Planting date"
	label var       harvest "Harvest date"
	label var       yield "Crop yield, kg/ha (simulated)"
	label data      "Simulated household panel for the wxsum examples"
	notes _dta:     Simulated for the wxsum examples by make_example_data.do; not observed data.
	notes _dta:     Planting is up to a week after the onset of the rains (20 mm in 3 days from 1 May); harvest is 110-130 days later.
	notes _dta:     yield = 300 + household effect + 1.0*rain + 0.25*GDD(10-30) - 15*KDD(29) + noise, with the weather of each household's season.

* save household panel dataset
	compress
	save            hh_panel, replace

**********************************************************************
**# 2 - simulated births
**********************************************************************

* initialize simulated birth observations
	clear
	set obs         300
	generate int    childid = _n
	generate int    hhid = 100 + ceil(10 * runiform())
	generate        birthdate = td(01jan2014) + floor((td(29nov2023) - td(01jan2014) + 1) * runiform())
	format          birthdate %td
	merge m:1       hhid using temp, keep(match) nogenerate

* heat days in trimesters 2 and 3
	quietly wxsum   tmp_, type(temp) event_date(birthdate) days(91) gdd_lo(10) ///
	                gdd_hi(30) heat_threshold(30) outstub(tri3_) keep(childid hhid birthdate tmp_*)
	quietly wxsum   tmp_, type(temp) event_date(birthdate) days(91) lag(91) gdd_lo(10) ///
	                gdd_hi(30) heat_threshold(30) outstub(tri2_) keep(childid hhid birthdate tri3_heatdays)

* simulate birth weight from heat exposure
	sort            childid
	generate int    bweight = round(3300 - 4 * tri2_heatdays - 9 * tri3_heatdays + rnormal(0, 420))
	keep            childid hhid birthdate bweight

* label variables and dataset
	label var       childid "Child ID"
	label var       hhid "Household ID (location of the weather data)"
	label var       birthdate "Date of birth"
	label var       bweight "Birth weight, grams (simulated)"
	label data      "Simulated births for the wxsum examples"
	notes _dta:     Simulated for the wxsum examples by make_example_data.do; not observed data.
	notes _dta:     bweight = 3300 - 4*(heat days in trimester 2) - 9*(heat days in trimester 3) + noise; a heat day has a daily mean temperature of 30 degrees C or more.

* save births dataset
	compress
	save            births, replace

**********************************************************************
**# 3 - synthetic hourly weather for 2022
**********************************************************************

* reshape 2022 rainfall and temperature data to long
	use             hhid rf_2022* using rain, clear
	quietly wxprep tolong rf_, id(hhid) generate(rain) clear
	tempfile        rain22
	save            `rain22'
	use             hhid tmp_2022* using temp, clear
	quietly wxprep tolong tmp_, id(hhid) generate(temp) clear
	merge 1:1       hhid date using `rain22', assert(match) nogenerate

* monthly wetness factor and daily relative humidity
	local           wet "0 0 .05 .15 .35 .6 .85 1 .8 .4 .1 0"
	generate double w = real(word("`wet'", month(date)))
	generate double rh_day = min(95, max(8, 30 + 50 * w + 10 * (rain >= 1) + rnormal(0, 5)))

* expand to 24 hours per day
	sort            hhid date
	expand          24
	bysort hhid date: generate byte hour = _n - 1

* daily temperature and humidity cycles
	generate double cycle = cos(2 * _pi * (hour - 15) / 24)
	generate float  t2m = temp + (7 - 3 * w) * cycle + rnormal(0, 0.3) + 273.15
	generate float  rh = min(100, max(5, rh_day - (10 + 5 * (1 - w)) * cycle + rnormal(0, 2)))
	generate double time = dhms(date, hour, 0, 0)
	format          time %tc
	keep            hhid time t2m rh
	order           hhid time t2m rh
	sort            hhid time

* label variables and dataset
	label var       hhid "Household ID"
	label var       time "Date and hour"
	label var       t2m "2-metre temperature, kelvin (synthetic)"
	label var       rh "Relative humidity, percent (synthetic)"
	label data      "Synthetic hourly weather for the wxsum examples, 2022"
	notes _dta:     Synthetic for the wxsum examples by make_example_data.do; not observed data.
	notes _dta:     Each day's hourly values add a daily cycle (warmest and driest at 15:00) and noise to the daily mean temperature in temp.dta; humidity is higher in the rainy months and on rainy days (rain.dta).

* save weather dataset
	compress
	save            weather_hourly, replace

**********************************************************************
**# 4 - end matter, clean up to save
**********************************************************************

/* END */
