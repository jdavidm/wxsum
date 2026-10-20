* project: wxsum
* task: unit-specific windows functionality and validation checks
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

* define assertion helper for return codes
capture program drop _assert_rc
program define _assert_rc
	args            actual expected msg
	if `actual' != `expected' {
		di as error     "FAIL: `msg'"
		di as error     "Expected rc `expected', got rc `actual'"
		exit            459
	}
	di as result    "PASS: `msg'"
end

* define mata routine to generate daily rain and temperature panel
mata:
void _unit_data()
{
	real scalar      D, j
	real rowvector   dts
	string rowvector rn, tn
	real matrix      R, T

	dts = mdy(1, 1, 2017)..mdy(12, 31, 2021)
	D = cols(dts)
	rn = tn = J(1, D, "")
	for (j = 1; j <= D; j++) {
		rn[j] = "rf_" + strofreal(year(dts[j])) + strofreal(month(dts[j]), "%02.0f") + strofreal(day(dts[j]), "%02.0f")
		tn[j] = "tmp_" + strofreal(year(dts[j])) + strofreal(month(dts[j]), "%02.0f") + strofreal(day(dts[j]), "%02.0f")
	}
	R = (runiform(st_nobs(), D) :> 0.6) :* round(-6 :* ln(runiform(st_nobs(), D)), 0.1)
	R = R :/ (runiform(st_nobs(), D) :> 0.1)
	T = round(22 :+ 7 :* rnormal(st_nobs(), D, 0, 1), 0.1)
	T = T :/ (runiform(st_nobs(), D) :> 0.1)
	(void) st_addvar("float", rn)
	st_store(., rn, R)
	(void) st_addvar("float", tn)
	st_store(., tn, T)
}
end

* create synthetic dataset with individual unit windows
	clear
	set seed        4242
	set obs         4
	gen             id = _n
	mata:           _unit_data()
	gen             s = cond(id == 1, td(01mar2021), cond(id == 2, td(15jun2021), cond(id == 3, td(29feb2020), td(01jan2021))))
	gen             e = cond(id == 1, td(10mar2021), cond(id == 2, td(14jul2021), cond(id == 3, td(05mar2020), td(01jan2021))))
	format          s e %td
	tempfile        udata
	quietly save    `udata'

* define comparison helper between unit-specific and calendar runs
capture program drop _cmp_unit
program define _cmp_unit
	args            id year stems
	foreach v of local stems {
		quietly summarize u_`v' if id == `id', meanonly
		local           a = r(mean)
		quietly summarize `v'_`year' if id == `id', meanonly
		local           b = r(mean)
		if missing(`a') != missing(`b') | (!missing(`a') & reldif(`a', `b') > 1e-6) {
			di as error     "id `id': `v' unit = `a', calendar = `b'"
			exit            9
		}
	}
end

* define comparison variable stems
	local           rstems "nobs mean median var sd skew mean_mo total raindays norain pct_raindays dry_start dry dry_end"
	local           rdev "dev_total z_total dev_raindays z_raindays dev_mean_mo z_mean_mo dev_dry z_dry"
	local           tstems "nobs mean median var sd skew max gdd kdd heatdays pct_heatdays heat_start heat heat_end"
	local           tdev "dev_gdd z_gdd dev_kdd z_kdd dev_heatdays z_heatdays dev_heat z_heat"

**********************************************************************
**# 1 - rainfall unit-specific windows vs calendar windows
**********************************************************************

* execute unit-specific wxsum
	use             `udata', clear
	set type        double
	wxsum           rf_, type(rain) start(s) end(e) lr_years(2) keep(id s e) outstub(u_)
	assert          _N == 4
	assert          "`r(mode)'" == "unit" & "`r(shape)'" == "unit"
	assert          "`: char u_total[wxsum_window]'" == "start(s) to end(e)"
	assert          "`: char _dta[wxsum_shape]'" == "unit"
	tempfile        uout
	quietly save    `uout'

* verify results against matching calendar window runs
	foreach spec in "1 3 1 3 10" "2 6 15 7 14" "4 1 1 1 1" {
		tokenize        `spec'
		use             `udata', clear
		quietly wxsum   rf_, type(rain) ini_month(`2') ini_day(`3') fin_month(`4') fin_day(`5') ///
		                    lr_years(2) keep(id) shape(wide)
		quietly merge   1:1 id using `uout', nogenerate keepusing(u_*)
		_cmp_unit       `1' 2021 "`rstems' `rdev'"
	}

**********************************************************************
**# 2 - leap year 29 february handling in reference windows
**********************************************************************

* verify leap year calculations
	use             `uout', clear
	quietly keep    if id == 3
	local           u_total = u_total[1]
	local           u_dev = u_dev_total[1]
	use             `udata', clear
	quietly keep    if id == 3
	egen            t2020 = rowtotal(rf_20200229 rf_20200301 rf_20200302 rf_20200303 rf_20200304 rf_20200305), missing
	egen            t2019 = rowtotal(rf_20190228 rf_20190301 rf_20190302 rf_20190303 rf_20190304 rf_20190305), missing
	egen            t2018 = rowtotal(rf_20180228 rf_20180301 rf_20180302 rf_20180303 rf_20180304 rf_20180305), missing
	assert          reldif(`u_total', t2020) < 1e-9
	assert          reldif(`u_dev', t2020 - (t2019 + t2018) / 2) < 1e-9

**********************************************************************
**# 3 - temperature unit-specific windows vs calendar windows
**********************************************************************

* execute unit-specific wxsum
	use             `udata', clear
	wxsum           tmp_, type(temp) start(s) end(e) gdd_lo(10) gdd_hi(30) ///
	                    heat_threshold(28) kdd_base(32) lr_years(3) ref_min(2) keep(id) outstub(u_)
	quietly save    `uout', replace

* verify results against matching calendar window runs
	foreach spec in "1 3 1 3 10" "2 6 15 7 14" {
		tokenize        `spec'
		use             `udata', clear
		quietly wxsum   tmp_, type(temp) ini_month(`2') ini_day(`3') fin_month(`4') fin_day(`5') ///
		                    gdd_lo(10) gdd_hi(30) heat_threshold(28) kdd_base(32) lr_years(3) ref_min(2) keep(id) shape(wide)
		quietly merge   1:1 id using `uout', nogenerate keepusing(u_*)
		_cmp_unit       `1' 2021 "`tstems' `tdev'"
	}

**********************************************************************
**# 4 - baseline() with unit-specific windows
**********************************************************************

* execute unit-specific run with baseline
	use             `udata', clear
	wxsum           rf_, type(rain) start(s) end(e) baseline(2018 2020) keep(id) outstub(u_)
	quietly save    `uout', replace

* verify against calendar run
	use             `udata', clear
	quietly wxsum   rf_, type(rain) ini_month(3) ini_day(1) fin_month(3) fin_day(10) ///
	                    baseline(2018 2020) keep(id) shape(wide)
	quietly merge   1:1 id using `uout', nogenerate keepusing(u_*)
	_cmp_unit       1 2021 "`rstems' `rdev'"

* test out-of-range and insufficient baseline years
	use             `udata', clear
	capture noisily wxsum rf_, type(rain) start(s) end(e) baseline(1990 1999) keep(id)
	_assert_rc      _rc 198 "baseline() outside the data is rejected"
	use             `udata', clear
	capture noisily wxsum rf_, type(rain) start(s) end(e) baseline(2014 2018) keep(id)
	_assert_rc      _rc 198 "baseline() with fewer than ref_min() years in the data is rejected"

* test ref_min override with baseline
	use             `udata', clear
	quietly wxsum   rf_, type(rain) start(s) end(e) baseline(2014 2018) ref_min(2) keep(id)
	assert          r(ref_min) == 2

**********************************************************************
**# 5 - event_date(), days(), and lag() options
**********************************************************************

* test event_date with days
	use             `udata', clear
	gen             ev = e + 1
	format          ev %td
	wxsum           rf_, type(rain) event_date(ev) days(10) keep(id) outstub(a_)
	quietly save    `uout', replace

* compare against equivalent start/end
	use             `udata', clear
	quietly wxsum   rf_, type(rain) start(s) end(e) keep(id) outstub(b_)
	quietly merge   1:1 id using `uout', nogenerate keepusing(a_*)
	foreach v in total nobs dry mean_mo {
		assert          reldif(a_`v', b_`v') < 1e-9 | (missing(a_`v') & missing(b_`v')) if id == 1
	}

* test event_date with days and lag
	use             `udata', clear
	gen             ev = td(16mar2021)
	wxsum           rf_, type(rain) event_date(ev) days(10) lag(5) keep(id) outstub(c_)
	quietly save    `uout', replace
	use             `udata', clear
	quietly wxsum   rf_, type(rain) ini_month(3) ini_day(1) fin_month(3) fin_day(10) keep(id) shape(wide)
	quietly merge   1:1 id using `uout', nogenerate keepusing(c_*)
	assert          reldif(c_total, total_2021) < 1e-9 | (missing(c_total) & missing(total_2021))
	assert          c_nobs == nobs_2021

**********************************************************************
**# 6 - windows outside data, partial, and missing dates
**********************************************************************

* test default handling of windows extending outside data bounds
	use             `udata', clear
	replace         s = td(20dec2016) if id == 1
	replace         e = td(10jan2017) if id == 1
	replace         s = . if id == 2
	wxsum           rf_, type(rain) start(s) end(e) keep(id s e) lr_years(2)
	assert          missing(nobs) & missing(total) if id == 1
	assert          missing(nobs) & missing(total) if id == 2
	matrix          M = r(missing)
	assert          M[1, colnumb(M, "outside")] == 1
	assert          M[1, colnumb(M, "missing_dates")] == 1

* test partial option
	use             `udata', clear
	replace         s = td(20dec2016) if id == 1
	replace         e = td(10jan2017) if id == 1
	wxsum           rf_, type(rain) start(s) end(e) keep(id) partial outstub(p_)
	matrix          M = r(missing)
	assert          M[1, colnumb(M, "outside")] == 1
	quietly save    `uout', replace
	use             `udata', clear
	quietly wxsum   rf_, type(rain) ini_month(1) ini_day(1) fin_month(1) fin_day(10) keep(id) shape(wide)
	quietly merge   1:1 id using `uout', nogenerate keepusing(p_*)
	assert          p_nobs == nobs_2017 if id == 1
	assert          reldif(p_total, total_2017) < 1e-9 if id == 1 & !missing(total_2017)
	assert          reldif(p_mean, mean_2017) < 1e-9 if id == 1 & !missing(mean_2017)

**********************************************************************
**# 7 - retention of all input variables without keep()
**********************************************************************

* execute wxsum without keep
	use             `udata', clear
	local           k0 = c(k)
	wxsum           rf_, type(rain) start(s) end(e) lr_years(2)
	confirm variable rf_20170101 tmp_20210101 id s e total nobs
	assert          c(k) > `k0'

**********************************************************************
**# 8 - unit-specific option validation rules
**********************************************************************

* test invalid option specifications
	use             `udata', clear
	capture noisily wxsum rf_, type(rain) start(s)
	_assert_rc      _rc 198 "start() without end() is rejected"
	capture noisily wxsum rf_, type(rain) start(s) end(e) ini_month(3) fin_month(4)
	_assert_rc      _rc 198 "calendar and unit-specific windows cannot be combined"
	capture noisily wxsum rf_, type(rain) ini_month(3) fin_month(4) partial
	_assert_rc      _rc 198 "partial requires a unit-specific window"

* test event_date options validation
	gen             ev = e + 1
	capture noisily wxsum rf_, type(rain) event_date(ev)
	_assert_rc      _rc 198 "event_date() without days() is rejected"
	capture noisily wxsum rf_, type(rain) event_date(ev) days(0)
	_assert_rc      _rc 198 "days(0) is rejected"
	capture noisily wxsum rf_, type(rain) event_date(ev) days(10) start(s) end(e)
	_assert_rc      _rc 198 "event_date() and start() cannot be combined"

* test chronological and type validation
	gen             e2 = s - 1
	capture noisily wxsum rf_, type(rain) start(s) end(e2)
	_assert_rc      _rc 198 "end() before start() is rejected"
	gen double      tc = cofd(s)
	format          tc %tc
	capture noisily wxsum rf_, type(rain) start(tc) end(e)
	_assert_rc      _rc 198 "a %tc datetime is rejected"

* test shape option ignored in unit mode
	wxsum           rf_, type(rain) start(s) end(e) shape(long) keep(id)
	assert          _N == 4

**********************************************************************
**# 9 - end matter
**********************************************************************

* reset default storage type and report completion
	set type        float
	di as result    "All wxsum v6 unit-specific window checks passed."

/* END */
