* wxsum_v6_equivalence.do
* Plan WS2: the Mata engine (wxsum) must reproduce the frozen v6 reference
* implementation (tests/reference/wxsum_ref.ado, the egen-based WS1 code) to
* 1e-10 on random data. Both run with -set type double- so that neither
* stores results in float precision.
*
* The random data have 10% missing daily values, some seasons with no data at
* all for some units, cross-year seasons, and leap years. Only variables that
* both implementations create are compared (the reference has no nobs, heat
* days or spells, and no deviations for dry spells).
* Run from the repository root. Takes a few minutes (the reference is slow).

clear all
set more off
set maxvar 20000
capture confirm file "wxsum.ado"
if _rc {
	di as error "Run this test from the wxsum repository root."
	exit 601
}
adopath ++ "."
adopath ++ "tests/reference"
set type double

* ---------------------------------------------------------------------------
* Random daily data, 2000-2024 (25 years, 9,132 days), 200 units (plan §7)
* ---------------------------------------------------------------------------
mata:
void _equiv_data(string scalar kind)
{
	real scalar    d1, d2, D, j, N, i, yr
	real rowvector dts, sel
	string rowvector names
	real matrix    X

	d1 = mdy(1, 1, 2000)
	d2 = mdy(12, 31, 2024)
	dts = d1..d2
	D = cols(dts)
	names = J(1, D, "")
	for (j = 1; j <= D; j++) {
		names[j] = kind + strofreal(year(dts[j])) +
			strofreal(month(dts[j]), "%02.0f") + strofreal(day(dts[j]), "%02.0f")
	}
	N = st_nobs()
	if (kind == "rf_") {
		// 65% dry days; wet days exponential with mean 8, rounded to 0.1
		X = (runiform(N, D) :> 0.65) :* round(-8 :* ln(runiform(N, D)), 0.1)
	}
	else {
		X = round(24 :+ 6 :* rnormal(N, D, 0, 1), 0.1)
	}
	// 10% missing days
	X = X :/ (runiform(N, D) :> 0.10)
	// units 1-15 have no data at all in one year and in Jan-Mar of the next
	for (i = 1; i <= 15; i++) {
		yr = 2001 + mod(i, 14)
		sel = selectindex((year(dts) :== yr) :| ((year(dts) :== yr + 1) :& (month(dts) :<= 3)))
		X[i, sel] = J(1, cols(sel), .)
	}
	(void) st_addvar("float", names)
	st_store(., names, X)
}
end

capture program drop _make_data
program define _make_data
	args kind
	clear
	set seed 20261011
	quietly set obs 200
	gen long id = _n
	mata: _equiv_data("`kind'")
end

capture program drop _compare
program define _compare
	* compares every variable in the reference output (prefix R_) with the
	* same variable in the wxsum output
	args label
	local n_cmp = 0
	local n_bad = 0
	foreach rv of varlist R_* {
		local v = substr("`rv'", 3, .)
		capture confirm variable `v'
		if _rc {
			di as error "`label': `v' is in the reference output but not in the wxsum output"
			local ++n_bad
			continue
		}
		quietly count if missing(`v') != missing(`rv')
		local nm = r(N)
		quietly count if !missing(`v') & !missing(`rv') & reldif(`v', `rv') > 1e-10
		local nd = r(N)
		if `nm' | `nd' {
			di as error "`label': `v' differs (missing pattern: `nm' obs, values: `nd' obs)"
			summarize `v' `rv'
			local ++n_bad
		}
		local ++n_cmp
	}
	if `n_bad' {
		di as error "`label': `n_bad' of `n_cmp' variables differ"
		exit 9
	}
	di as result "PASS `label': all `n_cmp' reference variables match to 1e-10"
end

capture program drop _run_pair
program define _run_pair
	args label stub opts
	tempfile ref
	preserve
	wxsum_ref `stub', `opts' keep(id) shape(wide)
	foreach v of varlist _all {
		if "`v'" != "id" rename `v' R_`v'
	}
	quietly save `ref'
	restore
	wxsum `stub', `opts' keep(id) shape(wide)
	quietly merge 1:1 id using `ref', assert(match) nogenerate
	_compare "`label'"
end

* ---------------------------------------------------------------------------
* Rainfall
* ---------------------------------------------------------------------------
_make_data rf_
tempfile rain
quietly save `rain'

use `rain', clear
_run_pair "rain May-Oct" rf_ "type(rain) ini_month(05) ini_day(15) fin_month(10) fin_day(15) rain_threshold(1) lr_years(5)"
use `rain', clear
_run_pair "rain Nov-Feb cross-year" rf_ "type(rain) ini_month(11) fin_month(02) rain_threshold(0.5) lr_years(3) ref_min(2)"
use `rain', clear
_run_pair "rain February (leap years)" rf_ "type(rain) ini_month(2) fin_month(2) rain_threshold(2) lr_years(4)"

* ---------------------------------------------------------------------------
* Temperature
* ---------------------------------------------------------------------------
_make_data tmp_
tempfile temp
quietly save `temp'

use `temp', clear
_run_pair "temp Apr-Sep" tmp_ "type(temp) ini_month(04) ini_day(01) fin_month(09) fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(28) kdd_base(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) gdd_bin(100) lr_years(5)"
use `temp', clear
_run_pair "temp Dec-Mar cross-year" tmp_ "type(temp) ini_month(12) ini_day(15) fin_month(03) fin_day(10) gdd_lo(5) gdd_hi(25) heat_threshold(20) tmp_bin(5) tmp_binlo(10) tmp_binhi(30) gdd_bin(50) gdd_binlo(100) gdd_binhi(800) lr_years(3) ref_min(2)"
use `temp', clear
_run_pair "temp July, small bins" tmp_ "type(temp) ini_month(07) fin_month(07) gdd_lo(8) gdd_hi(32) heat_threshold(30) tmp_bin(2) tmp_binlo(10) tmp_binhi(30) lr_years(2)"

di as result _n "All equivalence checks passed."
