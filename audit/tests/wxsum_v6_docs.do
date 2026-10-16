* project: wxsum
* task: run the examples in README.md and the help files
* created on: 16 oct 2026
* created by: claude
* Stata v.15.1
*
* The example commands are read from the documentation itself: the Stata
* block under "## Examples" in README.md, and the {cmd:. ...} lines in the
* Examples sections of wxsum.sthlp and wxprep.sthlp. They run in a folder laid
* out like the one -net get wxsum- creates, so that the example datasets are
* found as the documentation says.

**********************************************************************
**# 0 - setup
**********************************************************************

* clear and initialize environment
	clear           all
	set more        off

* confirm repository root
	capture confirm file "wxsum.ado"
	if _rc {
		di as error     "Run this test from the wxsum repository root."
		exit            601
	}
	local           root "`c(pwd)'"
* the absolute path: "." would follow the -cd- to the example folder below
	adopath         ++ "`root'"
	discard

* collect the example commands into a do-file:
*   README.md: the Stata block under "## Examples"
*   help files: the {phang2}{cmd:. command}{p_end} lines of the Examples
*   section; the -wxprep rename- examples name variables (rain1-rain365,
*   rain_*) that the sample data do not have, so they are skipped
mata:
void _docs_collect(string scalar outfile)
{
	string colvector L, cmd, help
	string scalar    s, c
	real scalar      i, h, state, n, fh

	cmd = "version 15.1"
	L = subinstr(cat("README.md"), char(13), "")
	state = n = 0
	for (i = 1; i <= rows(L); i++) {
		s = L[i]
		if (state == 0 & s == "## Examples") state = 1
		else if (state == 1 & s == "```stata") state = 2
		else if (state == 2) {
			if (s == "```") state = 3
			else {
				cmd = cmd \ s
				n++
			}
		}
	}
	st_local("n_readme", strofreal(n))
	help = ("wxsum" \ "wxprep")
	for (h = 1; h <= rows(help); h++) {
		L = subinstr(cat(help[h] + ".sthlp"), char(13), "")
		state = n = 0
		for (i = 1; i <= rows(L); i++) {
			s = L[i]
			if (strpos(s, "{marker examples}")) state = 1
			else if (strpos(s, "{marker results}")) state = 2
			else if (state == 1 & regexm(s, "^\{phang2\}\{cmd:\. (.*)\}\{p_end\}$")) {
				c = regexs(1)
				if (!strpos(c, "rain1-rain365") & !strpos(c, "rain_*")) {
					cmd = cmd \ c
					n++
				}
			}
		}
		st_local("n_" + help[h], strofreal(n))
	}
	if (fileexists(outfile)) unlink(outfile)
	fh = fopen(outfile, "w")
	for (i = 1; i <= rows(cmd); i++) fput(fh, cmd[i])
	fclose(fh)
}
end

* folder with the files that -net get wxsum- copies
	local           work "`c(tmpdir)'/wxsum_docs_test"
	capture mkdir   "`work'"
	local           old : dir "`work'" files "*"
	foreach f of local old {
		erase           "`work'/`f'"
	}
	foreach f in rain.dta temp.dta {
		copy            "`f'" "`work'/`f'"
	}
	local           exdata : dir "examples" files "*.dta"
	foreach f of local exdata {
		copy            "examples/`f'" "`work'/`f'"
	}

**********************************************************************
**# 1 - collect the example commands
**********************************************************************

* the documentation is read in Mata: Markdown lines with backticks and
* quotes cannot pass through Stata macros
	mata: _docs_collect("`work'/doc_examples.do")

* the parser found the examples
	di as text      "commands: README `n_readme', wxsum help `n_wxsum', wxprep help `n_wxprep'"
	assert          `n_readme' >= 20
	assert          `n_wxsum' >= 15
	assert          `n_wxprep' >= 8

**********************************************************************
**# 2 - run the examples
**********************************************************************

	quietly cd      "`work'"
	capture noisily do doc_examples.do
	local           rc = _rc
	quietly cd      "`root'"
	if `rc' {
		di as error     "a documented example failed with r(`rc')"
		exit            `rc'
	}

**********************************************************************
**# 3 - end matter
**********************************************************************

* report test completion
	di as result    "All documented examples ran."

/* END */
