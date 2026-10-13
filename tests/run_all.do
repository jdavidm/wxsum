* run_all.do -- run every wxsum test suite and report pass/fail
* Run from the repository root:
*     do tests/run_all.do
* or in batch mode:
*     StataMP-64.exe /e do tests/run_all.do
*
* Each suite is run with -capture noisily do-, so one failure does not stop
* the others. The run fails (exit 9) if any suite fails.

clear all
set more off
capture set maxvar 32000

capture confirm file "wxsum.ado"
if _rc {
	di as error "Run tests/run_all.do from the wxsum repository root."
	exit 601
}
adopath ++ "."

* Legacy (repaired v5) suites, then v6 suites. Suites that do not exist yet
* are skipped with a note so the runner can be used while v6 is built.
global WXSUM_SUITES ///
	wxsum_validation ///
	wxsum_release_synthetic_validation ///
	wxsum_gddcat_validation ///
	wxsum_tmpbin_shape_validation ///
	test_dryspells ///
	test_finday ///
	test_v6_regression ///
	test_v6_equivalence ///
	test_v6_spells ///
	test_v6_options ///
	test_v6_missing_reference ///
	test_v6_output_rollback ///
	test_v6_unitwindows ///
	test_wxprep ///
	test_v6_performance

global WXSUM_PASSED ""
global WXSUM_FAILED ""
global WXSUM_SKIPPED ""

foreach s of global WXSUM_SUITES {
	capture confirm file "tests/`s'.do"
	if _rc {
		global WXSUM_SKIPPED "$WXSUM_SKIPPED `s'"
		continue
	}
	di _n as text "{hline 78}"
	di as text "SUITE: `s'"
	di as text "{hline 78}"
	global WXSUM_T0 = clock(c(current_time), "hms")
	capture noisily do "tests/`s'.do"
	local rc = _rc
	* suites call -clear all-; restore the runner's state
	set more off
	global WXSUM_T1 = clock(c(current_time), "hms")
	local secs = ($WXSUM_T1 - $WXSUM_T0) / 1000
	if `rc' {
		global WXSUM_FAILED "$WXSUM_FAILED `s'(rc=`rc')"
		di as error "SUITE FAILED: `s' (rc = `rc', `secs' s)"
	}
	else {
		global WXSUM_PASSED "$WXSUM_PASSED `s'"
		di as result "SUITE PASSED: `s' (`secs' s)"
	}
}

di _n as text "{hline 78}"
di as text "wxsum test summary (Stata " c(stata_version) ", " c(current_date) ")"
di as text "{hline 78}"
di as result "Passed : $WXSUM_PASSED"
if "$WXSUM_SKIPPED" != "" di as text   "Skipped (not present): $WXSUM_SKIPPED"
if "$WXSUM_FAILED" != "" {
	di as error "Failed : $WXSUM_FAILED"
	exit 9
}
di as result "ALL SUITES PASSED"
