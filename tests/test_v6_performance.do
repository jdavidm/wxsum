* tests/test_v6_performance.do -- Benchmark performance of v6 Mata engine
* Benchmarks:
*   1. Bundled dataset (rain_sample.dta)
*   2. 1,000 observations (multi-year daily panel)
*   3. 10,000 observations (multi-year daily panel)

clear all
set more off
capture set maxvar 32000
set seed 20261013
adopath ++ "."

di as text "=================================================================="
di as text "PERFORMANCE BENCHMARK: tests/test_v6_performance.do"
di as text "=================================================================="

* -----------------------------------------------------------------
* Benchmark 1: Bundled data (rain_sample.dta)
* -----------------------------------------------------------------
di _n as text "--- Benchmark 1: Bundled dataset (rain.dta) ---"
use "rain.dta", clear
count
local n_bundled = r(N)

timer clear 1
timer on 1
quietly wxsum rf_, type(rain) ini_month(5) fin_month(10) shape(long)
timer off 1
timer list 1
local t1 = r(t1)
di as result "  Bundled dataset (`n_bundled' rows): `t1' seconds"
assert _N > 0


* -----------------------------------------------------------------
* Benchmark 2: 1,000 rows synthetic panel
* -----------------------------------------------------------------
di _n as text "--- Benchmark 2: 1,000 observations panel ---"
clear
set obs 1000
gen long hhid = _n
* Generate 5 years (2015-2019) of May-Oct daily rain (approx 184 days/yr)
forvalues yr = 2015/2019 {
	forvalues d = 1/30 {
		local dstr = string(`d', "%02.0f")
		gen float rf_`yr'05`dstr' = cond(runiform() > 0.7, rgamma(2, 5), 0)
		gen float rf_`yr'06`dstr' = cond(runiform() > 0.7, rgamma(2, 5), 0)
	}
}

timer clear 2
timer on 2
quietly wxsum rf_, type(rain) ini_month(5) fin_month(6) shape(long)
timer off 2
timer list 2
local t2 = r(t2)
di as result "  1,000 rows (5 years, 300 daily columns): `t2' seconds"
assert _N == 5000


* -----------------------------------------------------------------
* Benchmark 3: 10,000 rows synthetic panel
* -----------------------------------------------------------------
di _n as text "--- Benchmark 3: 10,000 observations panel ---"
clear
set obs 10000
gen long hhid = _n
* 3 years (2018-2020) of June daily rain (30 days/yr = 90 daily columns)
forvalues yr = 2018/2020 {
	forvalues d = 1/30 {
		local dstr = string(`d', "%02.0f")
		gen float rf_`yr'06`dstr' = cond(runiform() > 0.7, rgamma(2, 5), 0)
	}
}

timer clear 3
timer on 3
quietly wxsum rf_, type(rain) ini_month(6) fin_month(6) shape(long)
timer off 3
timer list 3
local t3 = r(t3)
di as result "  10,000 rows (3 years, 90 daily columns): `t3' seconds"
assert _N == 30000


* -----------------------------------------------------------------
* Benchmark 4: Unit-specific window mode (1,000 units)
* -----------------------------------------------------------------
di _n as text "--- Benchmark 4: Unit-specific window mode (1,000 units) ---"
clear
set obs 1000
gen long hhid = _n
* Daily temperature for 2018-2020
forvalues yr = 2018/2020 {
	forvalues m = 6/7 {
		local mstr = string(`m', "%02.0f")
		forvalues d = 1/30 {
			local dstr = string(`d', "%02.0f")
			gen float tmp_`yr'`mstr'`dstr' = 15 + runiform() * 20
		}
	}
}
* Plant dates varying across units in June 2020
gen long plant_date = td(01jun2020) + mod(_n, 20)
format plant_date %td

timer clear 4
timer on 4
quietly wxsum tmp_, type(temp) event_date(plant_date) days(30) gdd_lo(10) gdd_hi(30) heat_threshold(32) shape(long)
timer off 4
timer list 4
local t4 = r(t4)
di as result "  Unit-specific windows (1,000 units): `t4' seconds"
assert _N == 1000

di _n as text "=================================================================="
di as text "PERFORMANCE BENCHMARK SUMMARY:"
di as text "  Bundled (10 rows):               " as result %6.3f `t1' " s"
di as text "  1,000 rows (calendar long):      " as result %6.3f `t2' " s"
di as text "  10,000 rows (calendar long):     " as result %6.3f `t3' " s"
di as text "  1,000 rows (unit-specific):      " as result %6.3f `t4' " s"
di as text "=================================================================="
di as result "ALL PERFORMANCE BENCHMARKS PASSED!"
di as text "=================================================================="
