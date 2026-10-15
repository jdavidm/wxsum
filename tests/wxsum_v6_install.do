* project: wxsum
* task: test package installation and ancillary file workflow
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

* confirm repository root
	capture confirm file "wxsum.pkg"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}

* define test directories
	local           src "`c(pwd)'"
	local           plus0 "`c(sysdir_plus)'"
	local           root "`c(tmpdir)'/wxsum_install_test"
	capture mkdir   "`root'"
	capture mkdir   "`root'/plus"
	capture mkdir   "`root'/get"

**********************************************************************
**# 1 - isolate environment and install package
**********************************************************************

* take repository off adopath to use only installed copy
	capture adopath - "."
	capture adopath - "`src'"
	capture adopath - "tests/reference"
	sysdir set      PLUS "`root'/plus"

* install package from local repository source
	net from        "`src'"
	net describe    wxsum
	capture ado uninstall wxsum
	net install     wxsum, replace

* confirm installed files exist in isolated directory
	findfile        wxsum.ado
	assert          strpos(`"`r(fn)'"', "wxsum_install_test") > 0
	findfile        wxprep.ado
	assert          strpos(`"`r(fn)'"', "wxsum_install_test") > 0

**********************************************************************
**# 2 - validate help file rendering
**********************************************************************

* verify wxsum help file renders
	findfile        wxsum.sthlp
	type            `"`r(fn)'"', smcl

* verify wxprep help file renders
	findfile        wxprep.sthlp
	type            `"`r(fn)'"', smcl

**********************************************************************
**# 3 - verify ancillary files and example do-file execution
**********************************************************************

* fetch ancillary files into isolated get folder
	quietly cd      "`root'/get"
	net get         wxsum, replace
	foreach f in rain.dta temp.dta rain_long.dta temp_long.dta hh_toy.dta wxsum_examples.do {
		confirm file    "`f'"
	}

* execute example do-file using installed commands
	capture noisily do wxsum_examples.do
	local           rc = _rc

* restore environment paths
	quietly cd      "`src'"
	sysdir set      PLUS "`plus0'"
	adopath         ++ "."

* check execution results
	if `rc' {
		di as error     "the example do-file failed with r(`rc') in the net get folder"
		exit            `rc'
	}
	confirm file    "`root'/get/wxsum_examples.log"

**********************************************************************
**# 4 - end matter
**********************************************************************

* report test completion
	di as result    "PASS: net install, net get, help files, and examples from the installed package"

/* END */
