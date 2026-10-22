* project: wxsum
* task: rebuild the example datasets and the example log
* created on: 16 oct 2026
* created by: claude
* edited on: 22 oct 2026
* edited by: alj
* Stata v.15.1
*
* The examples run in a folder laid out like the one -net get wxsum- creates:
* rain.dta, temp.dta, and the files in examples/ side by side. This do-file
* copies those files into a temporary folder, runs the examples there with the
* repository's ado-files, and copies the results back to examples/.
*
* Run from the repository root or from audit/ (batch mode from audit/ keeps
* the batch log out of the repository root):
*     do audit/run_examples.do         runs wxsum_examples.do, copies the log
*     do audit/run_examples.do data    also rebuilds the example datasets
*                                      with make_example_data.do first

**********************************************************************
**# 0 - setup
**********************************************************************

	args            what
	clear           all
	set more        off

* find the repository root
	capture confirm file "wxsum.ado"
	if _rc {
		capture confirm file "../wxsum.ado"
		if !_rc quietly cd ..
	}
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run audit/run_examples.do from the wxsum repository root or from audit/."
		exit            601
	}
	local           root "`c(pwd)'"
	adopath         ++ "`root'"
	discard

**********************************************************************
**# 1 - copy the package files into a net get style folder
**********************************************************************

	local           work "`c(tmpdir)'/wxsum_examples_run"
	capture mkdir   "`work'"
	local           old : dir "`work'" files "*"
	foreach f of local old {
		erase           "`work'/`f'"
	}
	foreach f in rain.dta temp.dta {
		copy            "`root'/`f'" "`work'/`f'"
	}
	local           exfiles : dir "`root'/examples" files "*"
	foreach f of local exfiles {
		copy            "`root'/examples/`f'" "`work'/`f'"
	}

**********************************************************************
**# 2 - run the examples
**********************************************************************

	quietly cd      "`work'"
	local           rc = 0
	if "`what'" == "data" {
		capture noisily do make_example_data.do
		local           rc = _rc
		if !`rc' {
			foreach f in hh_panel.dta births.dta weather_hourly.dta {
				copy            "`f'" "`root'/examples/`f'", replace
			}
		}
	}
	if !`rc' {
		capture noisily do wxsum_examples.do
		local           rc = _rc
	}
	capture log close wxsum_examples
	if !`rc' copy   "wxsum_examples.log" "`root'/examples/wxsum_examples.log", replace
	quietly cd      "`root'"
	if `rc' {
		di as error     "the examples failed with r(`rc')"
		exit            `rc'
	}
	di as result    "examples/wxsum_examples.log rebuilt"

/* END */
