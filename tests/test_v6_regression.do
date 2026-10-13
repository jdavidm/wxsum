* test_v6_regression.do -- compare v6 output against frozen v5 output (WS2)
* Stored output matches frozen v5 (frozen_v5_rain.dta, frozen_v5_temp.dta, frozen_v5_temp_bins.dta)
* for statistics whose meaning didn't change.

clear all
set more off
capture set maxvar 15000
adopath ++ "."

display as text "{hline 70}"
display as text "Regression Test: Rain against frozen_v5_rain.dta"
display as text "{hline 70}"

use "tests/frozen_v5_rain.dta", clear
preserve
use rain.dta, clear
timer clear 1
timer on 1
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) keep(hhid) shape(wide) outstub(v6_)
timer off 1
tempfile rain_v6
save "`rain_v6'"
restore

merge 1:1 hhid using "`rain_v6'", assert(match) nogen

local unchanged_rain mean median var sd skew total raindays norain pct_raindays
local max_rain_diff = 0

forvalues y = 2003/2023 {
    foreach s of local unchanged_rain {
        capture confirm variable `s'_`y'
        if _rc == 0 {
            quietly gen double diff = reldif(`s'_`y', v6_`s'_`y')
            quietly summarize diff
            if r(max) > `max_rain_diff' local max_rain_diff = r(max)
            assert diff < 1e-6 | (missing(`s'_`y') & missing(v6_`s'_`y'))
            drop diff
        }
    }
}
di as result "Rain max relative difference: `max_rain_diff' (PASS, < 1e-6)"

display as text "{hline 70}"
display as text "Regression Test: Temp against frozen_v5_temp.dta"
display as text "{hline 70}"

use "tests/frozen_v5_temp.dta", clear
preserve
use temp.dta, clear
timer clear 2
timer on 2
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) heat_threshold(32) keep(hhid) shape(wide) outstub(v6_)
timer off 2
tempfile temp_v6
save "`temp_v6'"
restore

merge 1:1 hhid using "`temp_v6'", assert(match) nogen

local unchanged_temp mean median var sd skew max gdd kdd dev_gdd z_gdd dev_kdd z_kdd
local max_temp_diff = 0

forvalues y = 2003/2023 {
    foreach s of local unchanged_temp {
        capture confirm variable `s'_`y'
        if _rc == 0 {
            quietly gen double diff = reldif(`s'_`y', v6_`s'_`y')
            quietly summarize diff
            if r(max) > `max_temp_diff' local max_temp_diff = r(max)
            assert diff < 1e-4 | (missing(`s'_`y') & missing(v6_`s'_`y'))
            drop diff
        }
    }
}
di as result "Temp max relative difference: `max_temp_diff' (PASS, < 1e-4)"

display as text "{hline 70}"
display as text "Regression Test: Temp bins against frozen_v5_temp_bins.dta"
display as text "{hline 70}"

use "tests/frozen_v5_temp_bins.dta", clear
preserve
use temp.dta, clear
timer clear 3
timer on 3
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) heat_threshold(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid) shape(wide) outstub(v6_)
timer off 3
tempfile temp_bins_v6
save "`temp_bins_v6'"
restore

merge 1:1 hhid using "`temp_bins_v6'", assert(match) nogen

local max_bins_diff = 0
forvalues y = 2003/2023 {
    foreach s of local unchanged_temp {
        capture confirm variable `s'_`y'
        if _rc == 0 {
            quietly gen double diff = reldif(`s'_`y', v6_`s'_`y')
            quietly summarize diff
            if r(max) > `max_bins_diff' local max_bins_diff = r(max)
            assert diff < 1e-4 | (missing(`s'_`y') & missing(v6_`s'_`y'))
            drop diff
        }
    }
    capture confirm variable gddcat_`y'
    if _rc == 0 {
        assert gddcat_`y' == v6_gddcat_`y' | (missing(gddcat_`y') & missing(v6_gddcat_`y'))
    }
    forvalues b = 1/15 {
        local bpad = string(`b', "%02.0f")
        capture confirm variable tmpbin`bpad'_`y'
        if _rc == 0 {
            assert tmpbin`bpad'_`y' == v6_tmpbin`bpad'_`y' | (missing(tmpbin`bpad'_`y') & missing(v6_tmpbin`bpad'_`y'))
        }
    }
}
di as result "Temp bins max relative difference: `max_bins_diff' (PASS, < 1e-4)"

display as result "Timing results:"
timer list 1
timer list 2
timer list 3

display as result "ALL V6 REGRESSION TESTS PASSED!"
