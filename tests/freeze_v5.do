* freeze_v5.do -- freeze wxsum v5.0 output on the bundled data (WS0)
*
* The frozen files are the oracle for tests/test_v6_regression.do.
* They were produced on 13oct2026 (StataNow 19.5 MP) with the UNMODIFIED
* v5.0 wxsum.ado (git commit 341f9b1). To regenerate them, first restore
* that version of the ado-file in a scratch directory, e.g.
*     git show 341f9b1:wxsum.ado > scratch/wxsum.ado
* put that directory first on the adopath, and run this file from the
* repository root. Do NOT run it against wxsum v6: v6 output differs by design.
*
* v5 defaults that matter here: shape(wide), lr_years(10), kdd_base() is the
* KDD base (in v6 the same base is set with heat_threshold()).

clear all
set more off
capture set maxvar 15000
adopath ++ "."

* Freeze rain v5 output
use rain.dta, clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) keep(hhid)
save "tests/frozen_v5_rain.dta", replace

* Freeze temp v5 output
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) kdd_base(32) keep(hhid)
save "tests/frozen_v5_temp.dta", replace

* Freeze temp with bins v5 output
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(18) gdd_hi(30) kdd_base(32) gdd_bin(100) gdd_binlo(50) gdd_binhi(950) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid)
save "tests/frozen_v5_temp_bins.dta", replace

display as result "v5 outputs frozen successfully."
