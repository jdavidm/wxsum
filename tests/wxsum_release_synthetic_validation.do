clear all
set more off
capture set maxvar 90000

capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this validation from the wxsum repository root."
	exit 601
}
adopath ++ "."

capture program drop _assert_rc
program define _assert_rc
	args actual expected msg
	if `actual' != `expected' {
		di as error "FAIL: `msg'"
		di as error "Expected rc `expected', got rc `actual'"
		exit 459
	}
	di as result "PASS: `msg'"
end

display "wxsum synthetic release validation: Stata " c(stata_version)

display "1. rainfall stats with missing values, threshold, monthly totals, and dry spells"
clear
set obs 2
gen hhid = _n
gen rf_20200101 = cond(hhid == 1, 0, 3)
gen rf_20200102 = cond(hhid == 1, 2, 0)
gen rf_20200201 = cond(hhid == 1, ., 0)
gen rf_20200202 = cond(hhid == 1, .5, 4)

wxsum rf_, ini_month(01) fin_month(02) ini_day(01) fin_day(02) rain_data rain_threshold(1) lr_years(2)

assert abs(total_2020 - cond(hhid == 1, 2.5, 7)) < 1e-6
assert abs(mean_2020 - cond(hhid == 1, 2.5 / 3, 7 / 4)) < 1e-6
assert norain_2020 == cond(hhid == 1, 2, 2)
assert raindays_2020 == cond(hhid == 1, 1, 2)
assert abs(pct_raindays_2020 - cond(hhid == 1, 1 / 3, .5)) < 1e-6
assert dry_2020 == cond(hhid == 1, 1, 2)
assert abs(mean_mo_total_2020 - cond(hhid == 1, 1.25, 3.5)) < 1e-6
assert abs(median_mo_total_2020 - cond(hhid == 1, 1.25, 3.5)) < 1e-6
assert abs(sd_mo_total_2020 - cond(hhid == 1, sqrt(1.125), sqrt(.5))) < 1e-6

display "2. rainfall rolling deviations and z-scores use exactly preceding lr_years"
clear
set obs 2
gen hhid = _n
foreach y in 2020 2021 2022 {
	gen rf_`y'0101 = .
}
replace rf_20200101 = 10 if hhid == 1
replace rf_20210101 = 20 if hhid == 1
replace rf_20220101 = 50 if hhid == 1
replace rf_20200101 = 5 if hhid == 2
replace rf_20210101 = 5 if hhid == 2
replace rf_20220101 = 5 if hhid == 2

wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) rain_data lr_years(2)

assert total_2022 == cond(hhid == 1, 50, 5)
assert abs(dev_total_2022 - cond(hhid == 1, 35, 0)) < 1e-6
assert abs(z_total_2022 - (35 / sqrt(50))) < 1e-6 if hhid == 1
assert missing(z_total_2022) if hhid == 2
capture confirm variable dev_total_2021
assert _rc != 0

display "3. cross-year temperature season is labeled by start year and uses next-year days"
clear
set obs 2
gen hhid = _n
forvalues d = `=td(30nov2021)'/`=td(02jan2022)' {
	local y = year(`d')
	local m = string(month(`d'), "%02.0f")
	local day = string(day(`d'), "%02.0f")
	gen tmp_`y'`m'`day' = cond(hhid == 1, 10, 5)
	if `y' == 2022 {
		replace tmp_`y'`m'`day' = cond(hhid == 1, 20, 15)
	}
}

wxsum tmp_, ini_month(11) fin_month(01) ini_day(30) fin_day(02) temp_data gdd_lo(8) gdd_hi(32) kdd_base(18) lr_years(2)

confirm variable mean_2021
capture confirm variable mean_2022
assert _rc != 0
assert abs(mean_2021 - cond(hhid == 1, 360 / 34, 190 / 34)) < 1e-6
assert gdd_2021 == cond(hhid == 1, 88, 14)
assert kdd_2021 == cond(hhid == 1, 4, 0)

display "4. GDD categories with default lo, auto hi, known GDD totals"
clear
set obs 3
gen hhid = _n
* Create two seasons with hand-calculable GDD totals
* Season 2020: 4 days, temps such that gdd_lo=0, gdd_hi=100
* Location 1: temps = 10, 20, 30, 40 => GDD = 10+20+30+40 = 100
* Location 2: temps = 50, 60, 70, 80 => GDD = capped at 100 each = 400
* Location 3: temps = 5, 5, 5, 5 => GDD = 20
forvalues d = 1/4 {
	local day = string(`d', "%02.0f")
	gen tmp_202001`day' = .
}
replace tmp_20200101 = 10 if hhid == 1
replace tmp_20200102 = 20 if hhid == 1
replace tmp_20200103 = 30 if hhid == 1
replace tmp_20200104 = 40 if hhid == 1

replace tmp_20200101 = 50 if hhid == 2
replace tmp_20200102 = 60 if hhid == 2
replace tmp_20200103 = 70 if hhid == 2
replace tmp_20200104 = 80 if hhid == 2

replace tmp_20200101 = 5 if hhid == 3
replace tmp_20200102 = 5 if hhid == 3
replace tmp_20200103 = 5 if hhid == 3
replace tmp_20200104 = 5 if hhid == 3

* Season 2021: same structure
forvalues d = 1/4 {
	local day = string(`d', "%02.0f")
	gen tmp_202101`day' = .
}
replace tmp_20210101 = 25 if hhid == 1
replace tmp_20210102 = 25 if hhid == 1
replace tmp_20210103 = 25 if hhid == 1
replace tmp_20210104 = 25 if hhid == 1

replace tmp_20210101 = 50 if hhid == 2
replace tmp_20210102 = 50 if hhid == 2
replace tmp_20210103 = 50 if hhid == 2
replace tmp_20210104 = 50 if hhid == 2

replace tmp_20210101 = 0 if hhid == 3
replace tmp_20210102 = 0 if hhid == 3
replace tmp_20210103 = 0 if hhid == 3
replace tmp_20210104 = 0 if hhid == 3

* gdd_lo=0 gdd_hi=100 => GDD capped at 100 per day
* 2020: loc1 GDD=100, loc2 GDD=400, loc3 GDD=20
* 2021: loc1 GDD=100, loc2 GDD=400, loc3 GDD=0
* Pool max=400, pool min=0. gdd_bin(100), default lo=0
* auto hi: ceil(400/100)=4, 0+4*100=400, but 400>=400 so push to 5*100=500
* Categories: 1=[0,100), 2=[100,200), 3=[200,300), 4=[300,400), 5=[400,500)

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(100) gdd_bin(100) lr_years(2)

confirm variable gddcat_2020
confirm variable gddcat_2021
* Location 3, 2020: GDD=20 => [0,100) => cat 1
assert gddcat_2020 == 1 if hhid == 3
* Location 1, 2020: GDD=100 => [100,200) => cat 2
assert gddcat_2020 == 2 if hhid == 1
* Location 2, 2020: GDD=400 => [400,500) => cat 5
assert gddcat_2020 == 5 if hhid == 2
* Location 3, 2021: GDD=0 => [0,100) => cat 1
assert gddcat_2021 == 1 if hhid == 3
* Location 1, 2021: GDD=100 => [100,200) => cat 2
assert gddcat_2021 == 2 if hhid == 1

* Verify no tempbin/binmean/binsd variables exist
capture confirm variable tempbin01_2020
assert _rc != 0
capture confirm variable binmean_01
assert _rc != 0
capture confirm variable binsd_01
assert _rc != 0

display "5. keep() keeps requested ids plus generated variables and drops unrelated source columns"
clear
set obs 1
gen hhid = 101
gen source_note = 999
gen tmp_20300101 = 12
gen tmp_20300102 = 18

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(02) temp_data gdd_lo(0) gdd_hi(32) keep(hhid) lr_years(2)

confirm variable hhid
confirm variable gdd_2030
capture confirm variable source_note
assert _rc != 0
capture confirm variable kdd_2030
assert _rc != 0

display "6. invalid option combinations fail before generating outputs"
clear
set obs 1
gen rf_20200101 = 1
capture noisily wxsum rf_, ini_month(01) fin_month(01) ini_day(01) fin_day(01) rain_data temp_data gdd_lo(0) gdd_hi(10)
_assert_rc _rc 198 "rain_data and temp_data cannot be used together"

clear
set obs 1
gen tmp_20200101 = 1
capture noisily wxsum tmp_, ini_month(02) fin_month(02) ini_day(30) fin_day(30) temp_data gdd_lo(0) gdd_hi(10)
_assert_rc _rc 198 "invalid calendar day is rejected"

display as result "All synthetic release validation checks passed."
exit, clear
