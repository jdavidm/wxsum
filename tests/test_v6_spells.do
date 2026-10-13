* test_v6_spells.do -- test spell calculations for rain and temp (WS3)
* Covers: edge missing (D3), 0 break days, 1 break day, >= 2 break days (D4),
* missing inside a run, and all-missing windows.

clear all
set more off
adopath ++ "."

display as text "{hline 70}"
display as text "Test Suite: Spells (Dry Spells and Heat Spells, D3/D4 rules)"
display as text "{hline 70}"

* =============================================================================
* 1. RAIN SPELLS (DRY SPELLS)
* =============================================================================

clear
set obs 6
gen id = _n

forvalues d = 1/10 {
	local day = string(`d', "%02.0f")
	gen rf_202001`day' = .
}

* Row 1: Edge missing (. . 0 0 5 0 0 0 . .)
replace rf_20200103 = 0 if id == 1
replace rf_20200104 = 0 if id == 1
replace rf_20200105 = 5 if id == 1
replace rf_20200106 = 0 if id == 1
replace rf_20200107 = 0 if id == 1
replace rf_20200108 = 0 if id == 1

* Row 2: Two break days (0 0 5 0 0 0 5 0 0 .)
replace rf_20200101 = 0 if id == 2
replace rf_20200102 = 0 if id == 2
replace rf_20200103 = 5 if id == 2
replace rf_20200104 = 0 if id == 2
replace rf_20200105 = 0 if id == 2
replace rf_20200106 = 0 if id == 2
replace rf_20200107 = 5 if id == 2
replace rf_20200108 = 0 if id == 2
replace rf_20200109 = 0 if id == 2

* Row 3: Single break day (0 0 0 5 0 0 . . . .)
replace rf_20200101 = 0 if id == 3
replace rf_20200102 = 0 if id == 3
replace rf_20200103 = 0 if id == 3
replace rf_20200104 = 5 if id == 3
replace rf_20200105 = 0 if id == 3
replace rf_20200106 = 0 if id == 3

* Row 4: Zero break days (0 0 0 0 0 . . . . .)
replace rf_20200101 = 0 if id == 4
replace rf_20200102 = 0 if id == 4
replace rf_20200103 = 0 if id == 4
replace rf_20200104 = 0 if id == 4
replace rf_20200105 = 0 if id == 4

* Row 5: Missing inside run (0 0 . 0 0 0 5 0 . .)
replace rf_20200101 = 0 if id == 5
replace rf_20200102 = 0 if id == 5
replace rf_20200104 = 0 if id == 5
replace rf_20200105 = 0 if id == 5
replace rf_20200106 = 0 if id == 5
replace rf_20200107 = 5 if id == 5
replace rf_20200108 = 0 if id == 5

* Row 6: All missing (. . . . . . . . . .)

wxsum rf_, ini_month(1) fin_month(1) ini_day(1) fin_day(10) type(rain) rain_threshold(1) keep(id) shape(wide)

* Check Row 1: Edge missing
assert dry_start_2020 == 2 if id == 1
assert dry_end_2020   == 3 if id == 1
assert dry_2020       == 3 if id == 1

* Check Row 2: Two break days
assert dry_start_2020 == 2 if id == 2
assert dry_end_2020   == 2 if id == 2
assert dry_2020       == 3 if id == 2

* Check Row 3: Single break day (D4 rule (ii) applies -> longest run anywhere is 3)
assert dry_start_2020 == 3 if id == 3
assert dry_end_2020   == 2 if id == 3
assert dry_2020       == 3 if id == 3

* Check Row 4: Zero break days (all 5 observed are spell days)
assert dry_start_2020 == 5 if id == 4
assert dry_end_2020   == 5 if id == 4
assert dry_2020       == 5 if id == 4

* Check Row 5: Missing inside run
assert dry_start_2020 == 2 if id == 5
assert dry_end_2020   == 1 if id == 5
assert dry_2020       == 3 if id == 5

* Check Row 6: All missing
assert missing(dry_start_2020) if id == 6
assert missing(dry_end_2020)   if id == 6
assert missing(dry_2020)       if id == 6

di as result "PASS: Rain dry spells verified"

* =============================================================================
* 2. TEMP SPELLS (HEAT SPELLS)
* =============================================================================

clear
set obs 6
gen id = _n

forvalues d = 1/10 {
	local day = string(`d', "%02.0f")
	gen tmp_202001`day' = .
}

* Row 1: Edge missing (. . 35 35 20 35 35 35 . .)
replace tmp_20200103 = 35 if id == 1
replace tmp_20200104 = 35 if id == 1
replace tmp_20200105 = 20 if id == 1
replace tmp_20200106 = 35 if id == 1
replace tmp_20200107 = 35 if id == 1
replace tmp_20200108 = 35 if id == 1

* Row 2: Two break days (32 32 20 35 35 35 20 31 31 .)
replace tmp_20200101 = 32 if id == 2
replace tmp_20200102 = 32 if id == 2
replace tmp_20200103 = 20 if id == 2
replace tmp_20200104 = 35 if id == 2
replace tmp_20200105 = 35 if id == 2
replace tmp_20200106 = 35 if id == 2
replace tmp_20200107 = 20 if id == 2
replace tmp_20200108 = 31 if id == 2
replace tmp_20200109 = 31 if id == 2

* Row 3: Single break day (35 35 35 20 35 35 . . . .)
replace tmp_20200101 = 35 if id == 3
replace tmp_20200102 = 35 if id == 3
replace tmp_20200103 = 35 if id == 3
replace tmp_20200104 = 20 if id == 3
replace tmp_20200105 = 35 if id == 3
replace tmp_20200106 = 35 if id == 3

* Row 4: Zero break days (35 35 35 35 35 . . . . .)
replace tmp_20200101 = 35 if id == 4
replace tmp_20200102 = 35 if id == 4
replace tmp_20200103 = 35 if id == 4
replace tmp_20200104 = 35 if id == 4
replace tmp_20200105 = 35 if id == 4

* Row 5: Missing inside run (32 32 . 35 35 35 20 32 . .)
replace tmp_20200101 = 32 if id == 5
replace tmp_20200102 = 32 if id == 5
replace tmp_20200104 = 35 if id == 5
replace tmp_20200105 = 35 if id == 5
replace tmp_20200106 = 35 if id == 5
replace tmp_20200107 = 20 if id == 5
replace tmp_20200108 = 32 if id == 5

* Row 6: All missing (. . . . . . . . . .)

wxsum tmp_, ini_month(1) fin_month(1) ini_day(1) fin_day(10) type(temp) heat_threshold(30) gdd_lo(10) gdd_hi(30) keep(id) shape(wide)

* Check Row 1: Edge missing
assert heat_start_2020 == 2 if id == 1
assert heat_end_2020   == 3 if id == 1
assert heat_2020       == 3 if id == 1
assert heatdays_2020   == 5 if id == 1
assert abs(pct_heatdays_2020 - 5/6) < 1e-6 if id == 1

* Check Row 2: Two break days
assert heat_start_2020 == 2 if id == 2
assert heat_end_2020   == 2 if id == 2
assert heat_2020       == 3 if id == 2
assert heatdays_2020   == 7 if id == 2
assert abs(pct_heatdays_2020 - 7/9) < 1e-6 if id == 2

* Check Row 3: Single break day (D4 rule (ii) applies -> longest run anywhere is 3)
assert heat_start_2020 == 3 if id == 3
assert heat_end_2020   == 2 if id == 3
assert heat_2020       == 3 if id == 3
assert heatdays_2020   == 5 if id == 3
assert abs(pct_heatdays_2020 - 5/6) < 1e-6 if id == 3

* Check Row 4: Zero break days
assert heat_start_2020 == 5 if id == 4
assert heat_end_2020   == 5 if id == 4
assert heat_2020       == 5 if id == 4
assert heatdays_2020   == 5 if id == 4
assert abs(pct_heatdays_2020 - 1.0) < 1e-6 if id == 4

* Check Row 5: Missing inside run
assert heat_start_2020 == 2 if id == 5
assert heat_end_2020   == 1 if id == 5
assert heat_2020       == 3 if id == 5
assert heatdays_2020   == 6 if id == 5
assert abs(pct_heatdays_2020 - 6/7) < 1e-6 if id == 5

* Check Row 6: All missing
assert missing(heat_start_2020) if id == 6
assert missing(heat_end_2020)   if id == 6
assert missing(heat_2020)       if id == 6
assert missing(heatdays_2020)   if id == 6
assert missing(pct_heatdays_2020) if id == 6

di as result "PASS: Temperature heat spells and heatdays verified"
