* tests/test_v6_unitwindows.do -- Unit-specific window test suite (WS4)
* Tests:
*   1. Varying-length start()/end() (%td dates)
*   2. event_date() days() [lag()] shortcut
*   3. partial vs non-partial outside data
*   4. Missing start/end dates
*   5. All-missing weather inside window
*   6. Feb 29 leap year window shift
*   7. Rolling reference (lr_years, ref_min, zero SD)
*   8. Fixed baseline reference (baseline(y1 y2), ref_min)
*   9. Temperature type (heatdays, heat spells, gddcat, tmpbin, cuts)
*  10. Stored r() results and characteristics

clear all
set more off
set seed 20261013

adopath ++ "."

di as text "=================================================================="
di as text "TEST: test_v6_unitwindows"
di as text "=================================================================="

* -----------------------------------------------------------------
* Test 1: Varying-length start()/end() and manual equivalence
* -----------------------------------------------------------------
clear
set obs 3
gen int id = _n
gen long start_d = .
gen long end_d   = .
format start_d end_d %td

* Unit 1: 5 days (10jan2020 - 14jan2020)
replace start_d = td(10jan2020) if id == 1
replace end_d   = td(14jan2020) if id == 1

* Unit 2: 10 days (05jan2020 - 14jan2020)
replace start_d = td(05jan2020) if id == 2
replace end_d   = td(14jan2020) if id == 2

* Unit 3: 7 days (01jan2020 - 07jan2020)
replace start_d = td(01jan2020) if id == 3
replace end_d   = td(07jan2020) if id == 3

* Generate daily rain 01jan2020 to 20jan2020
forvalues d = 1/20 {
	local dstr = string(`d', "%02.0f")
	gen rf_202001`dstr' = `d'
}

* Run wxsum in unit mode (rolling 1 year, ref_min 1)
* Note: since data has only 2020, rolling 10 year ref windows fall outside data.
* With default ref_min, dev and z will be missing.
wxsum rf_, type(rain) start(start_d) end(end_d) keep(id) outstub(u_)

assert _N == 3
assert r(mode) == "unit"
assert r(shape) == "long"
assert r(n_windows) == 1

* Check observations
* Unit 1: 5 days, values 10, 11, 12, 13, 14 -> sum = 60, mean = 12
assert u_nobs[1] == 5
assert abs(u_total[1] - 60) < 1e-6
assert abs(u_mean[1] - 12) < 1e-6

* Unit 2: 10 days, values 5..14 -> sum = 95, mean = 9.5
assert u_nobs[2] == 10
assert abs(u_total[2] - 95) < 1e-6
assert abs(u_mean[2] - 9.5) < 1e-6

* Unit 3: 7 days, values 1..7 -> sum = 28, mean = 4
assert u_nobs[3] == 7
assert abs(u_total[3] - 28) < 1e-6
assert abs(u_mean[3] - 4) < 1e-6

di as text "  PASSED: Varying-length start()/end() basic calculations"


* -----------------------------------------------------------------
* Test 2: event_date() days() [lag()] shortcut
* -----------------------------------------------------------------
clear
set obs 2
gen int id = _n
gen long event_d = td(15jan2020)
format event_d %td

forvalues d = 1/20 {
	local dstr = string(`d', "%02.0f")
	gen rf_202001`dstr' = `d'
}

* Unit event: days(5), lag(0) -> window is event_date-5 to event_date-1 (10jan to 14jan)
wxsum rf_, type(rain) event_date(event_d) days(5) lag(0) keep(id) outstub(ev_)

assert ev_nobs[1] == 5
assert abs(ev_total[1] - 60) < 1e-6
assert abs(ev_mean[1] - 12) < 1e-6

* Unit event with lag(2): window is event_date-5-2 to event_date-1-2 (08jan to 12jan)
* Values 8, 9, 10, 11, 12 -> sum = 50, mean = 10
clear
set obs 2
gen int id = _n
gen long event_d = td(15jan2020)
format event_d %td

forvalues d = 1/20 {
	local dstr = string(`d', "%02.0f")
	gen rf_202001`dstr' = `d'
}

wxsum rf_, type(rain) event_date(event_d) days(5) lag(2) keep(id) outstub(evlag_)
assert evlag_nobs[1] == 5
assert abs(evlag_total[1] - 50) < 1e-6
assert abs(evlag_mean[1] - 10) < 1e-6

di as text "  PASSED: event_date() days() lag() shortcut"


* -----------------------------------------------------------------
* Test 3: partial vs non-partial outside data & missing dates
* -----------------------------------------------------------------
clear
set obs 4
gen int id = _n
gen long s_d = .
gen long e_d = .
format s_d e_d %td

* id 1: inside data (10jan2020 to 15jan2020)
replace s_d = td(10jan2020) if id == 1
replace e_d = td(15jan2020) if id == 1

* id 2: runs past data (15jan2020 to 25jan2020; data ends 20jan2020)
replace s_d = td(15jan2020) if id == 2
replace e_d = td(25jan2020) if id == 2

* id 3: missing start/end date
* s_d and e_d are .

* id 4: all-missing weather values inside window
replace s_d = td(10jan2020) if id == 4
replace e_d = td(15jan2020) if id == 4

forvalues d = 1/20 {
	local dstr = string(`d', "%02.0f")
	gen rf_202001`dstr' = 10
}
forvalues d = 10/15 {
	local dstr = string(`d', "%02.0f")
	replace rf_202001`dstr' = . if id == 4
}

* Without partial: id 2 should have all statistics missing
preserve
wxsum rf_, type(rain) start(s_d) end(e_d) keep(id) outstub(nop_)
* id 1 has complete window
assert nop_nobs[1] == 6
assert abs(nop_total[1] - 60) < 1e-6

* id 2 was outside data -> all missing
assert missing(nop_nobs[2])
assert missing(nop_total[2])

* id 3 had missing dates -> all missing
assert missing(nop_nobs[3])
assert missing(nop_total[3])

* id 4 had all missing inside window -> nobs == 0, total == .
assert nop_nobs[4] == 0
assert missing(nop_total[4])

* Check r(missing) matrix
matrix M_miss = r(missing)
assert rowsof(M_miss) == 1
assert colsof(M_miss) == 7
assert M_miss[1, 6] == 1  // n_outside = 1 (id 2)
assert M_miss[1, 7] == 1  // n_missing_dates = 1 (id 3)
restore

* With partial: id 2 should use available days (15jan to 20jan = 6 days)
wxsum rf_, type(rain) start(s_d) end(e_d) partial keep(id) outstub(part_)
assert part_nobs[1] == 6
assert abs(part_total[1] - 60) < 1e-6

* id 2 uses 6 available days -> total = 6 * 10 = 60
assert part_nobs[2] == 6
assert abs(part_total[2] - 60) < 1e-6

matrix M_miss_p = r(missing)
assert M_miss_p[1, 6] == 1  // n_outside still records id 2
assert M_miss_p[1, 7] == 1  // n_missing_dates records id 3

di as text "  PASSED: partial vs non-partial and edge/missing date rules"


* -----------------------------------------------------------------
* Test 4: Feb 29 leap year window shift & rolling reference
* -----------------------------------------------------------------
clear
set obs 1
gen int id = 1
gen long s_d = td(28feb2020)
gen long e_d = td(02mar2020)
format s_d e_d %td
* Window in 2020: 28feb2020, 29feb2020, 01mar2020, 02mar2020 = 4 days

* Create data for 2018, 2019, 2020
* 2018 (non-leap): Feb 27-28, Mar 01-03 (rain = 2 each day)
* 2019 (non-leap): Feb 27-28, Mar 01-03 (rain = 4 each day)
* 2020 (leap): Feb 27-29, Mar 01-03 (rain = 6 each day)
forvalues y = 2018/2020 {
	local val = (`y' - 2017) * 2
	forvalues d = 27/28 {
		gen rf_`y'02`d' = `val'
	}
	if `y' == 2020 gen rf_20200229 = `val'
	forvalues d = 1/3 {
		local dstr = string(`d', "%02.0f")
		gen rf_`y'03`dstr' = `val'
	}
}

* In 2020 active window: 4 days with rain = 6 -> total = 24
* Reference year 1 (2019, non-leap):
* 28feb2020 shifts to 28feb2019; 02mar2020 shifts to 02mar2019
* Days in 2019: 28feb, 01mar, 02mar (3 days) with rain = 4 -> total = 12
* Reference year 2 (2018, non-leap):
* Days in 2018: 28feb, 01mar, 02mar (3 days) with rain = 2 -> total = 6
* Mean ref total = (12 + 6) / 2 = 9
* Variance ref total = ((12-9)^2 + (6-9)^2) / 1 = 18; SD = sqrt(18) = 4.2426407
* dev_total = 24 - 9 = 15
* z_total = 15 / sqrt(18) = 3.5355339

preserve
wxsum rf_, type(rain) start(s_d) end(e_d) lr_years(2) ref_min(2) keep(id) outstub(leap_)
assert leap_nobs[1] == 4
assert abs(leap_total[1] - 24) < 1e-6
assert abs(leap_dev_total[1] - 15) < 1e-5
assert abs(leap_z_total[1] - (15 / sqrt(18))) < 1e-5
restore

di as text "  PASSED: Feb 29 leap year window shift & rolling reference"


* -----------------------------------------------------------------
* Test 5: Fixed baseline reference in unit mode
* -----------------------------------------------------------------
* Using the same data from 2018-2020:
* Baseline 2018 2019: ref_min(2)
preserve
wxsum rf_, type(rain) start(s_d) end(e_d) baseline(2018 2019) ref_min(2) keep(id) outstub(base_)
assert base_nobs[1] == 4
assert abs(base_total[1] - 24) < 1e-6
assert abs(base_dev_total[1] - 15) < 1e-5
assert abs(base_z_total[1] - (15 / sqrt(18))) < 1e-5
restore

* If baseline(2017 2019) with ref_min(3): 2017 is not in data, so valid years = 2 < 3 -> dev and z missing
wxsum rf_, type(rain) start(s_d) end(e_d) baseline(2017 2019) ref_min(3) keep(id) outstub(b3_)
assert b3_nobs[1] == 4
assert abs(b3_total[1] - 24) < 1e-6
assert missing(b3_dev_total[1])
assert missing(b3_z_total[1])

di as text "  PASSED: Fixed baseline in unit mode"


* -----------------------------------------------------------------
* Test 6: Temperature type in unit mode (heat, spells, gddcat, cuts)
* -----------------------------------------------------------------
clear
set obs 2
gen int id = _n
gen long s_d = td(01jan2020)
gen long e_d = td(10jan2020)
format s_d e_d %td

* 10 days in 2020:
* id 1: temp = 30 every day
* id 2: temp = 15 every day
forvalues d = 1/10 {
	local dstr = string(`d', "%02.0f")
	gen tmp_202001`dstr' = cond(id == 1, 30, 15)
}

wxsum tmp_, type(temp) start(s_d) end(e_d) heat_threshold(25) gdd_lo(10) gdd_hi(30) ///
	gdd_bin(50) cuts(10 20) keep(id) outstub(tm_)

assert tm_nobs[1] == 10
assert abs(tm_mean[1] - 30) < 1e-6
assert abs(tm_max[1] - 30) < 1e-6
* GDD: 10 days * (30 - 10) = 200
assert abs(tm_gdd[1] - 200) < 1e-6
* KDD: heat_threshold = 25 -> kdd_base = 25 -> 10 days * (30 - 25) = 50
assert abs(tm_kdd[1] - 50) < 1e-6
* Heat days: temp >= 25 -> 10 days
assert tm_heatdays[1] == 10
assert abs(tm_pct_heatdays[1] - 1.0) < 1e-6
* Spells: all 10 days >= 25
assert tm_heat_start[1] == 10
assert tm_heat[1] == 10
assert tm_heat_end[1] == 10

* id 2: temp = 15
assert tm_nobs[2] == 10
assert abs(tm_mean[2] - 15) < 1e-6
assert abs(tm_gdd[2] - 50) < 1e-6   // 10 days * (15 - 10) = 50
assert abs(tm_kdd[2] - 0) < 1e-6    // 15 < 25 -> 0
assert tm_heatdays[2] == 0
assert abs(tm_pct_heatdays[2] - 0.0) < 1e-6
assert tm_heat_start[2] == 0

* Cuts: cuts(10 20) -> 3 bins: (-inf, 10), [10, 20), [20, inf)
* id 1 (30): all 10 in bin 3
assert tm_cut01[1] == 0
assert tm_cut02[1] == 0
assert tm_cut03[1] == 10

* id 2 (15): all 10 in bin 2
assert tm_cut01[2] == 0
assert tm_cut02[2] == 10
assert tm_cut03[2] == 0

* GDD categories
assert !missing(tm_gddcat[1])
assert !missing(tm_gddcat[2])

di as text "  PASSED: Temperature type in unit mode"


* -----------------------------------------------------------------
* Test 7: Output characteristics and rclass metadata
* -----------------------------------------------------------------
assert "`r(mode)'" == "unit"
assert "`r(type)'" == "temp"
assert "`r(shape)'" == "long"
assert r(heat_threshold) == 25
assert r(gdd_lo) == 10
assert r(gdd_hi) == 30
assert r(minobs) == 1
assert "`r(window)'" == "s_d–e_d"

local dta_mode : char _dta[wxsum_mode]
assert "`dta_mode'" == "unit"
local dta_type : char _dta[wxsum_type]
assert "`dta_type'" == "temp"
local dta_win  : char _dta[wxsum_window]
assert "`dta_win'" == "s_d–e_d"

di as text "  PASSED: Output characteristics and rclass metadata"

di _n as text "=================================================================="
di as text "ALL TEST_V6_UNITWINDOWS ASSERTIONS PASSED!"
di as text "=================================================================="
