* project: wxsum
* task: test runner for all wxsum test suites
* created on: oct 2026
* created by: jdm
* edited on: 15 oct 2026
* edited by: alj
* Stata v.15.1

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	clear           all
	set more        off

* move to the repository root when started from audit/tests, so that the
* batch log stays in audit/tests
	capture confirm file "wxsum.ado"
	if _rc {
		capture confirm file "../../wxsum.ado"
		if !_rc quietly cd "../.."
	}
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run audit/tests/run_all.do from the wxsum repository root or from audit/tests."
		exit            601
	}

**********************************************************************
**# 1 - define test suites list
**********************************************************************

* define all active test suites in execution order
	local           suites                                ///
	                test_dryspells                        ///
	                test_finday                           ///
	                wxsum_validation                      ///
	                wxsum_gddcat_validation               ///
	                wxsum_release_synthetic_validation    ///
	                wxsum_tmpbin_shape_validation         ///
	                wxsum_v6_core                         ///
	                wxsum_v6_features                     ///
	                wxsum_v6_unit                         ///
	                wxsum_v6_wxprep                       ///
	                wxsum_v6_docs                         ///
	                wxsum_v6_regression                   ///
	                wxsum_v6_equivalence                  ///
	                wxsum_v6_performance                  ///
	                wxsum_v6_install

**********************************************************************
**# 2 - execute test suites
**********************************************************************

* initialize tracking counters and error collector
	local           failed ""
	local           n_pass = 0
	local           n_fail = 0
	local           i = 0

* iterate over each test suite
	foreach s of local suites {
		local           ++i
		di as text      _n "{hline 78}" _n "SUITE: `s'" _n "{hline 78}"
		* suites run -clear all-, which resets timers, so time with the clock
		local           t0 = clock("`c(current_date)' `c(current_time)'", "DMYhms")
		capture noisily do "audit/tests/`s'.do"
		local           rc = _rc
		local           t`i' = (clock("`c(current_date)' `c(current_time)'", "DMYhms") - `t0') / 1000
		local           rc`i' = `rc'
		if `rc' {
			local           failed "`failed' `s'"
			local           ++n_fail
		}
		else {
			local           ++n_pass
		}
	}

**********************************************************************
**# 3 - display summary and evaluate exit code
**********************************************************************

* display formatted summary header
	di as text      _n "{hline 78}" _n "wxsum test summary (Stata " c(stata_version) ", " c(current_date) ")" _n "{hline 78}"
	local           i = 0
	foreach s of local suites {
		local           ++i
		if `rc`i'' == 0 di as result %-45s "`s'" "  PASS" as text "  (" %7.1f `t`i'' " s)"
		else            di as error  %-45s "`s'" "  FAIL r(`rc`i'')" as text "  (" %7.1f `t`i'' " s)"
	}
	di as text      "{hline 78}"
	di as text      "Passed: `n_pass'   Failed: `n_fail'"

* check whether any test failed
	if `n_fail' {
		di as error     "Failed suites:`failed'"
		exit            9
	}
	di as result    "All suites passed."

**********************************************************************
**# 4 - end matter
**********************************************************************

/* END */
