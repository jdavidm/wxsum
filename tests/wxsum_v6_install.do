* wxsum_v6_install.do
* Plan WS6: the package installs with -net install- and -net get- from the
* repository, the installed help files render, and the example do-file runs
* from a folder filled by -net get- (where the example files are not in
* examples/). Installs into a temporary PLUS directory; the real Stata
* installation is not changed.
* Run from the repository root.
clear all
set more off
capture confirm file "wxsum.pkg"
if _rc {
	di as error "Run this test from the wxsum repository root."
	exit 601
}
local src "`c(pwd)'"
local plus0 "`c(sysdir_plus)'"
local root "`c(tmpdir)'/wxsum_install_test"
capture mkdir "`root'"
capture mkdir "`root'/plus"
capture mkdir "`root'/get"

* use only the installed copy: take the repository off the adopath
capture adopath - "."
capture adopath - "`src'"
capture adopath - "tests/reference"
sysdir set PLUS "`root'/plus"

net from "`src'"
net describe wxsum
capture ado uninstall wxsum
net install wxsum, replace
findfile wxsum.ado
assert strpos(`"`r(fn)'"', "wxsum_install_test") > 0
findfile wxprep.ado
assert strpos(`"`r(fn)'"', "wxsum_install_test") > 0

* the help files render (SMCL is interpreted, not shown raw)
findfile wxsum.sthlp
type `"`r(fn)'"', smcl
findfile wxprep.sthlp
type `"`r(fn)'"', smcl

* ancillary files are copied to the current folder
quietly cd "`root'/get"
net get wxsum, replace
foreach f in rain.dta temp.dta rain_long.dta temp_long.dta hh_toy.dta wxsum_examples.do {
	confirm file "`f'"
}

* the example do-file runs from this folder with the installed commands
capture noisily do wxsum_examples.do
local rc = _rc
quietly cd "`src'"
sysdir set PLUS "`plus0'"
adopath ++ "."
if `rc' {
	di as error "the example do-file failed with r(`rc') in the net get folder"
	exit `rc'
}
confirm file "`root'/get/wxsum_examples.log"
di as result "PASS: net install, net get, help files, and examples from the installed package"
