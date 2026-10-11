* run_all.do
* Runs every wxsum test suite and reports pass/fail for each.
*
* Usage, from the repository root (interactive or batch):
*     do tests/run_all.do
*     StataMP-64.exe /e do tests/run_all.do        (Windows batch mode)
*
* Each suite is self-contained: it starts with -clear all-, puts the
* repository root first on the adopath, and stops with an error at the
* first failed assertion. This runner catches that error, records it, and
* moves on to the next suite. It exits with r(9) if any suite failed.

clear all
set more off

capture confirm file "wxsum.ado"
if _rc {
	di as error "Run tests/run_all.do from the wxsum repository root."
	exit 601
}

local suites                              ///
	test_dryspells                        ///
	test_finday                           ///
	wxsum_validation                      ///
	wxsum_gddcat_validation               ///
	wxsum_release_synthetic_validation    ///
	wxsum_tmpbin_shape_validation         ///
	wxsum_v6_core

local failed ""
local n_pass = 0
local n_fail = 0
local i = 0
foreach s of local suites {
	local ++i
	di as text _n "{hline 78}" _n "SUITE: `s'" _n "{hline 78}"
	* suites run -clear all-, which resets timers, so time with the clock
	local t0 = clock("`c(current_date)' `c(current_time)'", "DMYhms")
	capture noisily do "tests/`s'.do"
	local rc = _rc
	local t`i' = (clock("`c(current_date)' `c(current_time)'", "DMYhms") - `t0') / 1000
	local rc`i' = `rc'
	if `rc' {
		local failed "`failed' `s'"
		local ++n_fail
	}
	else local ++n_pass
}

di as text _n "{hline 78}" _n "wxsum test summary (Stata " c(stata_version) ", " c(current_date) ")" _n "{hline 78}"
local i = 0
foreach s of local suites {
	local ++i
	if `rc`i'' == 0 di as result %-45s "`s'" "  PASS" as text "  (" %7.1f `t`i'' " s)"
	else            di as error  %-45s "`s'" "  FAIL r(`rc`i'')" as text "  (" %7.1f `t`i'' " s)"
}
di as text "{hline 78}"
di as text "Passed: `n_pass'   Failed: `n_fail'"
if `n_fail' {
	di as error "Failed suites:`failed'"
	exit 9
}
di as result "All suites passed."
