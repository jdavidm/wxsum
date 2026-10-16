* project: wxsum
* task: run one test suite
* created on: 16 oct 2026
* created by: claude
* Stata v.15.1
*
* From audit/tests (batch mode keeps the batch log there) or the root:
*     do run_one.do wxsum_v6_core

	args            suite
	capture confirm file "wxsum.ado"
	if _rc {
		capture confirm file "../../wxsum.ado"
		if !_rc quietly cd "../.."
	}
	confirm file    "audit/tests/`suite'.do"
	do              "audit/tests/`suite'.do"

/* END */
