*********************************************************************************
* wxsum pre-release validation
* Hand-calculated expected values for every output variable
* Run from the wxsum repo root: do tests/wxsum_prerelease_validation.do
*********************************************************************************

clear all
set more off
capture set maxvar 90000
adopath ++ "."

capture program drop _check
program define _check
	args actual expected tol msg
	if abs(`actual' - `expected') > `tol' {
		di as error "FAIL: `msg'"
		di as error "  expected = `expected', got = `actual'"
		exit 459
	}
	di as result "  PASS: `msg'"
end

capture program drop _check_missing
program define _check_missing
	args varname msg
	capture assert missing(`varname')
	if _rc != 0 {
		di as error "FAIL: `msg' (expected missing)"
		exit 459
	}
	di as result "  PASS: `msg'"
end


*===============================================================================
* TEST A: Rainfall — 3 years, 1 observation, hand-calculated
*===============================================================================
di _n as text "=== TEST A: Rainfall core statistics ==="
clear
set obs 1

* Year 2000: Jan 1-5, values = 0, 5, 0, 3, 0
gen rf_20000101 = 0
gen rf_20000102 = 5
gen rf_20000103 = 0
gen rf_20000104 = 3
gen rf_20000105 = 0

* Year 2001: Jan 1-5, values = 2, 2, 2, 2, 2
gen rf_20010101 = 2
gen rf_20010102 = 2
gen rf_20010103 = 2
gen rf_20010104 = 2
gen rf_20010105 = 2

* Year 2002: Jan 1-5, values = 0, 0, 10, 0, 0
gen rf_20020101 = 0
gen rf_20020102 = 0
gen rf_20020103 = 10
gen rf_20020104 = 0
gen rf_20020105 = 0

wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(05) rain_data lr_years(2) rain_threshold(1)

* --- Year 2000 ---
* mean = (0+5+0+3+0)/5 = 1.6
_check mean_2000[1]       1.6      0.001 "mean_2000"
* total = 0+5+0+3+0 = 8
_check total_2000[1]      8        0.001 "total_2000"
* norain (< 1): days 1,3,5 = 3
_check norain_2000[1]     3        0.001 "norain_2000"
* raindays (>= 1): days 2,4 = 2
_check raindays_2000[1]   2        0.001 "raindays_2000"
* pct_raindays = 2/5 = 0.4
_check pct_raindays_2000[1] 0.4    0.001 "pct_raindays_2000"
* dry spell: max consecutive < 1 = 1 (days 1, 3, 5 each isolated)
_check dry_2000[1]        1        0.001 "dry_2000"

* --- Year 2001 ---
* mean = 2, total = 10, all rain, no dry days
_check mean_2001[1]       2        0.001 "mean_2001"
_check total_2001[1]      10       0.001 "total_2001"
_check norain_2001[1]     0        0.001 "norain_2001"
_check raindays_2001[1]   5        0.001 "raindays_2001"
_check pct_raindays_2001[1] 1      0.001 "pct_raindays_2001"
_check dry_2001[1]        0        0.001 "dry_2001"

* --- Year 2002 ---
* mean = (0+0+10+0+0)/5 = 2, total = 10
_check mean_2002[1]       2        0.001 "mean_2002"
_check total_2002[1]      10       0.001 "total_2002"
* norain: days 1,2,4,5 = 4
_check norain_2002[1]     4        0.001 "norain_2002"
* raindays: day 3 = 1
_check raindays_2002[1]   1        0.001 "raindays_2002"
_check pct_raindays_2002[1] 0.2    0.001 "pct_raindays_2002"
* dry spell: days 1-2 = 2, then rain, then days 4-5 = 2
_check dry_2002[1]        2        0.001 "dry_2002"

* --- Deviations for year 2002 (lr_years=2, uses 2000 and 2001) ---
* total: mean(8,10)=9, sd=|8-10|/sqrt(2)=sqrt(2)
* dev = 10 - 9 = 1
_check dev_total_2002[1]  1        0.001 "dev_total_2002"
* z = 1/sqrt(2) ≈ 0.7071
_check z_total_2002[1]    0.7071   0.001 "z_total_2002"

* raindays: mean(2,5)=3.5, sd=3/sqrt(2)
* dev = 1 - 3.5 = -2.5
_check dev_raindays_2002[1] -2.5   0.001 "dev_raindays_2002"

* norain: mean(3,0)=1.5, sd=3/sqrt(2)
* dev = 4 - 1.5 = 2.5
_check dev_norain_2002[1] 2.5      0.001 "dev_norain_2002"

* pct_raindays: mean(0.4,1)=0.7, sd=0.6/sqrt(2)
* dev = 0.2 - 0.7 = -0.5
_check dev_pct_raindays_2002[1] -0.5 0.001 "dev_pct_raindays_2002"

* No deviations for 2000 or 2001 (not enough preceding years)
capture confirm variable dev_total_2000
assert _rc != 0
capture confirm variable dev_total_2001
assert _rc != 0
di as result "  PASS: no spurious deviations for early years"


*===============================================================================
* TEST B: Temperature — GDD, KDD, bins, deviations
*===============================================================================
di _n as text "=== TEST B: Temperature core statistics ==="
clear
set obs 1

* Year 2000: Jan 1-4, temps = 5, 15, 25, 40
gen tmp_20000101 = 5
gen tmp_20000102 = 15
gen tmp_20000103 = 25
gen tmp_20000104 = 40

* Year 2001: Jan 1-4, temps = 10, 20, 30, 30
gen tmp_20010101 = 10
gen tmp_20010102 = 20
gen tmp_20010103 = 30
gen tmp_20010104 = 30

* Year 2002: Jan 1-4, temps = 0, 10, 20, 35
gen tmp_20020101 = 0
gen tmp_20020102 = 10
gen tmp_20020103 = 20
gen tmp_20020104 = 35

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) ///
	temp_data gdd_lo(10) gdd_hi(30) kdd_base(35) bins(4) lr_years(2)

* --- Year 2000: GDD = min(max(T-10,0),20) summed ---
* Day1: 0, Day2: 5, Day3: 15, Day4: 20 → total = 40
_check gdd_2000[1]  40  0.001 "gdd_2000"
* KDD = max(T-35,0) summed: only Day4: 40-35=5
_check kdd_2000[1]  5   0.001 "kdd_2000"
* mean = (5+15+25+40)/4 = 21.25
_check mean_2000[1] 21.25 0.001 "mean_2000 (temp)"
* max = 40
_check max_2000[1]  40  0.001 "max_2000"

* --- Year 2001: GDD ---
* Day1: 0, Day2: 10, Day3: 20, Day4: 20 → total = 50
_check gdd_2001[1]  50  0.001 "gdd_2001"
* KDD: all <= 35, so 0
_check kdd_2001[1]  0   0.001 "kdd_2001"

* --- Year 2002: GDD ---
* Day1: 0, Day2: 0, Day3: 10, Day4: 20 → total = 30
_check gdd_2002[1]  30  0.001 "gdd_2002"
* KDD: Day4 = max(35-35,0) = 0
_check kdd_2002[1]  0   0.001 "kdd_2002"

* --- GDD deviations for 2002 ---
* mean(40,50)=45, sd=10/sqrt(2)≈7.0711
* dev = 30 - 45 = -15
_check dev_gdd_2002[1]  -15     0.001 "dev_gdd_2002"
* z = -15/7.0711 ≈ -2.1213
_check z_gdd_2002[1]    -2.1213 0.01  "z_gdd_2002"

* --- KDD deviations for 2002 ---
* mean(5,0)=2.5, sd=5/sqrt(2)≈3.5355
* dev = 0 - 2.5 = -2.5
_check dev_kdd_2002[1]  -2.5    0.001 "dev_kdd_2002"
* z = -2.5/3.5355 ≈ -0.7071
_check z_kdd_2002[1]    -0.7071 0.01  "z_kdd_2002"

* --- Temperature bins ---
* Verify zero-padded naming
confirm variable tempbin01_2000
confirm variable tempbin02_2000
confirm variable tempbin03_2000
confirm variable tempbin04_2000
di as result "  PASS: tempbin01–04 exist with correct naming"

* All 4 bins should sum to ~1.0 for each year
tempvar binsum
egen `binsum' = rowtotal(tempbin01_2000 tempbin02_2000 tempbin03_2000 tempbin04_2000)
_check `binsum'[1] 1.0 0.01 "temp bins sum to 1 (2000)"
drop `binsum'

* Cross-season summaries should exist
confirm variable binmean_01
confirm variable binmean_04
confirm variable binsd_01
confirm variable binsd_04
di as result "  PASS: binmean and binsd cross-season summaries exist"

* No legacy variable names
capture confirm variable mean_1
assert _rc != 0
capture confirm variable sd_1
assert _rc != 0
di as result "  PASS: no legacy mean_k/sd_k variables"


*===============================================================================
* TEST C: Cross-year season (Nov–Feb)
*===============================================================================
di _n as text "=== TEST C: Cross-year season ==="
clear
set obs 1

* Create 4 specific dates per season, 2 seasons
* Season 2000: Nov 1 2000 → Feb 1 2001
gen tmp_20001101 = 10
gen tmp_20001201 = 20
gen tmp_20010101 = 30
gen tmp_20010201 = 40

* Season 2001: Nov 1 2001 → Feb 1 2002
gen tmp_20011101 = 15
gen tmp_20011201 = 25
gen tmp_20020101 = 35
gen tmp_20020201 = 45

wxsum tmp_, ini_month(11) fin_month(02) ini_day(01) fin_day(01) ///
	temp_data gdd_lo(8) gdd_hi(32) bins(4) lr_years(2)

* Season labeled by start year
confirm variable mean_2000
confirm variable mean_2001
di as result "  PASS: cross-year seasons labeled by start year"

* mean_2000 = (10+20+30+40)/4 = 25
_check mean_2000[1] 25 0.001 "cross-year mean_2000"

* GDD lo=8, hi=32, range=24
* Day1(10): min(max(2,0),24)=2
* Day2(20): min(max(12,0),24)=12
* Day3(30): min(max(22,0),24)=22
* Day4(40): min(max(32,0),24)=24
* total = 60
_check gdd_2000[1] 60 0.001 "cross-year gdd_2000"

* mean_2001 = (15+25+35+45)/4 = 30
_check mean_2001[1] 30 0.001 "cross-year mean_2001"

* GDD 2001: 7+17+24+24 = 72
_check gdd_2001[1] 72 0.001 "cross-year gdd_2001"


*===============================================================================
* TEST D: Multi-row — verify row independence
*===============================================================================
di _n as text "=== TEST D: Multi-row independence ==="
clear
set obs 2
gen hhid = _n

* Row 1: all rain
gen rf_20000501 = 10
gen rf_20000502 = 20

* Row 2: no rain
replace rf_20000501 = 0 in 2
replace rf_20000502 = 0 in 2

wxsum rf_, ini_month(05) fin_month(05) ini_day(01) fin_day(02) rain_data

_check total_2000[1]    30  0.001 "row1 total"
_check total_2000[2]    0   0.001 "row2 total"
_check raindays_2000[1] 2   0.001 "row1 raindays"
_check raindays_2000[2] 0   0.001 "row2 raindays"
_check dry_2000[1]      0   0.001 "row1 dry"
_check dry_2000[2]      2   0.001 "row2 dry"


*===============================================================================
* TEST E: Missing data handling
*===============================================================================
di _n as text "=== TEST E: Missing data handling ==="
clear
set obs 1

* 5 days, 2 missing
gen rf_20000101 = .
gen rf_20000102 = 0
gen rf_20000103 = 5
gen rf_20000104 = .
gen rf_20000105 = 0

wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(05) rain_data

* rowmean ignores missing: (0+5+0)/3 ≈ 1.6667
_check mean_2000[1] 1.6667 0.001 "mean with missing"
* rowtotal treats missing as 0: 0+0+5+0+0 = 5
_check total_2000[1] 5 0.001 "total with missing"
* observed (non-missing) = 3
* norain: 0<1 twice = 2
_check norain_2000[1] 2 0.001 "norain excludes missing"
* raindays: 5>=1 once = 1
_check raindays_2000[1] 1 0.001 "raindays excludes missing"
* pct = 1/3
_check pct_raindays_2000[1] 0.3333 0.001 "pct_raindays with missing"
* dry spell: missing breaks runs
* Day1(.): dry_run=0
* Day2(0): dry_run=1, dry=1
* Day3(5): dry_run=0, dry=1
* Day4(.): dry_run=0, dry=1
* Day5(0): dry_run=1, dry=1
_check dry_2000[1] 1 0.001 "dry spell broken by missing"


*===============================================================================
* TEST F: keep() and save() options
*===============================================================================
di _n as text "=== TEST F: keep() and save() ==="
clear
set obs 1
gen hhid = 99
gen extra_var = 42
gen rf_20000101 = 3
gen rf_20000102 = 7

tempfile keeptest
wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) ///
	rain_data keep(hhid) save("`keeptest'")

* hhid should survive
confirm variable hhid
assert hhid[1] == 99
di as result "  PASS: keep() retained hhid"

* extra_var should be gone
capture confirm variable extra_var
assert _rc != 0
di as result "  PASS: keep() dropped extra_var"

* wxsum output should survive
confirm variable total_2000
di as result "  PASS: keep() retained wxsum output"

* Verify save created a file we can reload
use "`keeptest'", clear
confirm variable hhid
confirm variable total_2000
di as result "  PASS: save() produced loadable dataset"


*===============================================================================
* TEST G: Rainfall with 2-month season (monthly totals)
*===============================================================================
di _n as text "=== TEST G: Multi-month season (monthly totals) ==="
clear
set obs 1

* May: 10, 20  June: 30, 40
gen rf_20000501 = 10
gen rf_20000502 = 20
gen rf_20000601 = 30
gen rf_20000602 = 40

wxsum rf_, ini_month(05) fin_month(06) ini_day(01) fin_day(02) rain_data

* total = 10+20+30+40 = 100
_check total_2000[1] 100 0.001 "2-month total"
* May total = 30, June total = 70
* mean_mo_total = (30+70)/2 = 50
_check mean_mo_total_2000[1] 50 0.001 "mean monthly total"
* median_mo_total = (30+70)/2 = 50
_check median_mo_total_2000[1] 50 0.001 "median monthly total"
* sd_mo_total: sd of {30, 70} = |30-70|/sqrt(2) = 40/sqrt(2) ≈ 28.2843
_check sd_mo_total_2000[1] 28.2843 0.01 "sd monthly total"
* skew_mo_total = (50-50)/28.28 = 0
_check skew_mo_total_2000[1] 0 0.001 "skew monthly total"


*===============================================================================
* TEST H: User variables not clobbered
*===============================================================================
di _n as text "=== TEST H: User variable safety ==="
clear
set obs 1
gen aux_income = 50000
gen mean_income = 75000
gen rf_20000101 = 1
gen rf_20000102 = 2

wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) rain_data

* aux_ variables must survive (tempvar prevents clobbering)
confirm variable aux_income
assert aux_income[1] == 50000
di as result "  PASS: aux_income not clobbered"

* mean_income should survive (wxsum creates mean_2000, not mean_income)
confirm variable mean_income
assert mean_income[1] == 75000
di as result "  PASS: mean_income not clobbered"


*===============================================================================
* TEST I: Bundled sample datasets
*===============================================================================
di _n as text "=== TEST I: Bundled rainfall dataset ==="
use rain.dta, clear
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data

* Verify core variable families exist
confirm variable mean_1993
confirm variable total_1993
confirm variable raindays_1993
confirm variable dry_1993
di as result "  PASS: rain base variables exist"

* Deviations should exist for later years
confirm variable dev_total_2003
confirm variable z_total_2003
di as result "  PASS: rain deviation variables exist"

* No legacy/helper variables leaked
capture ds hist_* ssn_* percentile* aux_mean_* aux_sd_*
assert _rc != 0
di as result "  PASS: no helper variables leaked"

di _n as text "=== TEST I (cont): Bundled temperature dataset ==="
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(hhid)

confirm variable mean_1993
confirm variable gdd_1993
confirm variable tempbin01_1993
confirm variable tempbin04_1993
confirm variable binmean_01
confirm variable binsd_01
di as result "  PASS: temp base + bin variables exist"

* Verify no un-padded bin names
capture confirm variable tempbin11993
assert _rc != 0
di as result "  PASS: no unpadded tempbin names"


*===============================================================================
di _n(2) as result "=============================================="
di as result "  ALL PRE-RELEASE VALIDATION TESTS PASSED"
di as result "=============================================="
exit, clear
