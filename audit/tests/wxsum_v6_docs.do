* project: wxsum
* task: the examples in the do-file, the help files, README.md, and
*       index.html are the same, and they run
* created on: 16 oct 2026
* created by: claude
* edited on: 26 oct 2026
* edited by: claude
* Stata v.15.1
*
* The example commands are read from each source:
*   examples/wxsum_examples.do: the commands between -log using- and
*     -log close-, with /// continuations joined (the do-file indents
*     with tabs and aligns its arguments)
*   wxsum.sthlp, wxprep.sthlp: the {phang2}{cmd:. command}{p_end} lines of
*     the Examples section, up to "hypothetical variable names" (examples
*     with variables that the sample data do not have)
*   README.md: the Stata blocks under "## Examples"
*   index.html: the <pre><code> blocks under <h2>Examples</h2>
* After whitespace is collapsed and comments and the setup commands
* (clear all, set maxvar) are dropped, all five must hold the same commands
* in the same order (audit/sync_docs.py copies the do-file's commands into
* the others).
* The README and help-file commands then run in a folder laid out like the
* one -net get wxsum- creates.

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

mata:
// a line with tabs made blanks and the blanks collapsed (strtrim() and
// stritrim() leave tabs)
string scalar _docs_clean(string scalar s)
{
	return(stritrim(strtrim(subinstr(s, char(9), " ", .))))
}

// whitespace collapsed; comments, blank lines, and setup commands dropped
string colvector _docs_norm(string colvector raw)
{
	string colvector out
	string scalar    s
	real scalar      i

	out = J(0, 1, "")
	for (i = 1; i <= rows(raw); i++) {
		s = _docs_clean(raw[i])
		if (s == "" | substr(s, 1, 1) == "*") continue
		if (s == "clear all" | s == "set maxvar 20000") continue
		out = out \ s
	}
	return(out)
}

// lines of a text file, without carriage returns
string colvector _docs_lines(string scalar fn)
{
	return(subinstr(cat(fn), char(13), ""))
}

// commands of examples/wxsum_examples.do, /// continuations joined
string colvector _docs_dofile()
{
	string colvector L, out
	string scalar    s, cur
	real scalar      i, on

	L = _docs_lines("examples/wxsum_examples.do")
	out = J(0, 1, "")
	on = 0
	cur = ""
	for (i = 1; i <= rows(L); i++) {
		s = _docs_clean(L[i])
		if (substr(s, 1, 9) == "log using") {
			on = 1
			continue
		}
		if (substr(s, 1, 9) == "log close") break
		if (!on) continue
		if (substr(s, -3, 3) == "///") {
			cur = cur + substr(s, 1, strlen(s) - 3) + " "
			continue
		}
		out = out \ (cur + s)
		cur = ""
	}
	return(out)
}

// {cmd:. command} lines of a help file's Examples section
string colvector _docs_help(string scalar fn)
{
	string colvector L, out
	string scalar    s
	real scalar      i, on

	L = _docs_lines(fn)
	out = J(0, 1, "")
	on = 0
	for (i = 1; i <= rows(L); i++) {
		s = L[i]
		if (strpos(s, "{marker examples}")) on = 1
		else if (strpos(s, "{marker results}") | strpos(s, "hypothetical variable names")) on = 0
		else if (on & regexm(s, "^\{phang2\}\{cmd:\. (.*)\}\{p_end\}$")) out = out \ regexs(1)
	}
	return(out)
}

// code lines under a heading, between an opening and a closing marker
string colvector _docs_blocks(string scalar fn, string scalar heading,
	string scalar nexthead, string scalar open, string scalar close)
{
	string colvector L, out
	string scalar    s
	real scalar      i, sect, code

	L = _docs_lines(fn)
	out = J(0, 1, "")
	sect = code = 0
	for (i = 1; i <= rows(L); i++) {
		s = L[i]
		if (!sect) {
			if (s == heading) sect = 1
			continue
		}
		if (!code & substr(s, 1, strlen(nexthead)) == nexthead) break
		if (!code & substr(s, 1, strlen(open)) == open) {
			code = 1
			s = substr(s, strlen(open) + 1, .)
			if (s == "") continue
		}
		if (!code) continue
		if (strpos(s, close)) {
			s = substr(s, 1, strpos(s, close) - 1)
			code = 0
			if (s == "") continue
		}
		out = out \ s
	}
	return(out)
}

// the same commands in the same order; Mata evaluates both sides of &&, so
// the lengths are compared before the commands
real scalar _docs_same(string colvector X, string colvector D)
{
	if (rows(X) != rows(D)) return(0)
	return(all(X :== D))
}

// where a source first differs from the do-file
void _docs_diff(string scalar name, string colvector X, string colvector D)
{
	real scalar i

	if (_docs_same(X, D)) return
	for (i = 1; i <= min((rows(X), rows(D))); i++) {
		if (X[i] != D[i]) {
			printf("%s: first difference at command %f:\n  do-file: %s\n  %s: %s\n", name, i, D[i], name, X[i])
			return
		}
	}
	printf("%s: %f commands, do-file: %f commands\n", name, rows(X), rows(D))
}

void _docs_collect(string scalar outfile)
{
	string colvector D, H, R, I, run
	real scalar      i, fh

	D = _docs_norm(_docs_dofile())
	H = _docs_norm(_docs_help("wxsum.sthlp") \ _docs_help("wxprep.sthlp"))
	R = _docs_norm(_docs_blocks("README.md", "## Examples", "## ", "```stata", "```"))
	I = _docs_blocks("index.html", "<h2>Examples</h2>", "<h2>", "<pre><code>", "</code></pre>")
	I = _docs_norm(subinstr(subinstr(subinstr(I, "&lt;", "<"), "&gt;", ">"), "&amp;", "&"))
	st_local("n_do", strofreal(rows(D)))
	st_local("n_help", strofreal(rows(H)))
	st_local("n_readme", strofreal(rows(R)))
	st_local("n_index", strofreal(rows(I)))
	st_local("same_help", strofreal(_docs_same(H, D)))
	st_local("same_readme", strofreal(_docs_same(R, D)))
	st_local("same_index", strofreal(_docs_same(I, D)))
	_docs_diff("help", H, D)
	_docs_diff("README", R, D)
	_docs_diff("index.html", I, D)
	// the README commands, then the help-file commands (with their setup)
	run = "version 15.1" \ "clear all" \ "set maxvar 20000" \
		_docs_blocks("README.md", "## Examples", "## ", "```stata", "```") \
		"clear all" \ "set maxvar 20000" \ _docs_help("wxsum.sthlp") \ _docs_help("wxprep.sthlp")
	if (fileexists(outfile)) unlink(outfile)
	fh = fopen(outfile, "w")
	for (i = 1; i <= rows(run); i++) fput(fh, run[i])
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
	foreach f in wxsum_rain.dta wxsum_temp.dta {
		copy            "`f'" "`work'/`f'"
	}
	local           exdata : dir "examples" files "*.dta"
	foreach f of local exdata {
		copy            "examples/`f'" "`work'/`f'"
	}

**********************************************************************
**# 1 - the same commands in the do-file, help files, README, and index.html
**********************************************************************

* the documentation is read in Mata: Markdown lines with backticks and
* quotes cannot pass through Stata macros
	mata: _docs_collect("`work'/doc_examples.do")
	di as text      "commands: do-file `n_do', help `n_help', README `n_readme', index.html `n_index'"
	assert          `n_do' >= 80
	assert          `same_help'
	assert          `same_readme'
	assert          `same_index'

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
	di as result    "The examples agree in all five places and they run."

/* END */
