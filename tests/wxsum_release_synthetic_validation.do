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

wxsum tmp_, ini_month(11) fin_month(01) ini_day(30) fin_day(02) temp_data gdd_lo(8) gdd_hi(32) kdd_base(18) bins(4) lr_years(2)

confirm variable mean_2021
capture confirm variable mean_2022
assert _rc != 0
assert abs(mean_2021 - cond(hhid == 1, 360 / 34, 190 / 34)) < 1e-6
assert gdd_2021 == cond(hhid == 1, 88, 14)
assert kdd_2021 == cond(hhid == 1, 4, 0)

display "4. equal-temperature bins produce exact zero-padded outputs and bin summaries"
clear
set obs 2
gen hhid = _n
forvalues y = 2020/2021 {
	forvalues d = 1/4 {
		local day = string(`d', "%02.0f")
		gen tmp_`y'01`day' = cond(hhid == 1, 10, 20)
	}
}

wxsum tmp_, ini_month(01) fin_month(01) ini_day(01) fin_day(04) temp_data gdd_lo(0) gdd_hi(30) bins(4) lr_years(2)

confirm variable tempbin01_2020
confirm variable tempbin04_2021
capture confirm variable tempbin12020
assert _rc != 0
capture confirm variable mean_1
assert _rc != 0
assert tempbin01_2020 == 0
assert tempbin02_2020 == 0
assert tempbin03_2020 == 0
assert tempbin04_2020 == 1
assert tempbin04_2021 == 1
assert binmean_01 == 0
assert binmean_04 == 1
assert binsd_01 == 0
assert binsd_04 == 0

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
