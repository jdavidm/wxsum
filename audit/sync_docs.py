"""Copies the examples in examples/wxsum_examples.do into the documentation.

Run from the repository root after changing the examples or README.md:
    python audit/sync_docs.py

- wxsum.sthlp gets examples 1-9 and wxprep.sthlp examples 10-12 (those that
  start with wxprep), each as {phang2}{cmd:. command}{p_end} lines;
- README.md gets all twelve under "## Examples";
- index.html is rebuilt from README.md, keeping its <head>.

audit/tests/wxsum_v6_docs.do checks that the do-file, the help files,
README.md, and index.html hold the same commands and runs them.
"""
import html
import re
import sys
from pathlib import Path

root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(".")
WXPREP_FIRST = 10          # examples from here on go to wxprep.sthlp


def read(p):
    raw = (root / p).read_bytes().decode("utf-8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    return raw.replace("\r\n", "\n"), nl


def write(p, text, nl):
    (root / p).write_bytes(text.replace("\n", nl).encode("utf-8"))


# ---------------------------------------------------------------------------
# 1. the examples in the do-file
# ---------------------------------------------------------------------------
def parse_examples():
    text, _ = read("examples/wxsum_examples.do")
    lines = text.split("\n")
    start = next(i for i, l in enumerate(lines) if l.startswith("* Example 1."))
    end = next(i for i, l in enumerate(lines) if l.startswith("log close"))
    examples, cur, comment, cmd = [], None, [], []
    for l in lines[start - 1:end]:
        s = l.strip()
        m = re.match(r"\* Example (\d+)\. (.*)", s)
        if m:
            cur = dict(num=int(m.group(1)), title=m.group(2), items=[])
            examples.append(cur)
            continue
        if not s or s.startswith("* ===="):
            if comment:
                cur["items"].append(("comment", " ".join(comment)))
                comment = []
            continue
        if s.startswith("*"):
            comment.append(s.lstrip("* ").strip())
            continue
        if comment:
            cur["items"].append(("comment", " ".join(comment)))
            comment = []
        cmd.append(s[:-3].rstrip() if s.endswith("///") else s)
        if not s.endswith("///"):
            cur["items"].append(("cmd", " ".join(cmd)))
            cmd = []
    assert [e["num"] for e in examples] == list(range(1, 13)), [e["num"] for e in examples]
    for e in examples:
        for kind, t in e["items"]:
            assert "{" not in t and "}" not in t, ("braces cannot go in a help file", t)
    return examples


# ---------------------------------------------------------------------------
# 2. help files
# ---------------------------------------------------------------------------
def smcl(text):
    # Stata names and options in prose stay as typed
    return text


def help_block(examples):
    out = []
    for e in examples:
        out.append("{pstd}{bf:Example %d.} %s{p_end}" % (e["num"], smcl(e["title"])))
        for kind, t in e["items"]:
            if kind == "comment":
                out.append("{pstd}" + smcl(t[0].upper() + t[1:]) + "{p_end}")
            else:
                out.append("{phang2}{cmd:. " + t + "}{p_end}")
        out.append("")
    return out


SETUP = ["{pstd}Setup: the sample data have about 7,700 daily variables, more than",
         "the default {cmd:maxvar}{p_end}",
         "{phang2}{cmd:. clear all}{p_end}",
         "{phang2}{cmd:. set maxvar 20000}{p_end}",
         ""]

WXSUM_INTRO = """{pstd}
These are the examples of the article. The do-file {cmd:wxsum_examples.do}
runs all twelve and {cmd:wxsum_examples.log} shows their output;
{cmd:net get wxsum} copies them, the sample data, and the example datasets
into the current folder, where the examples run. Examples 1-9 are below;
examples 10-12, which start with {cmd:wxprep}, are in
{help wxprep##examples:help wxprep}. The example datasets
{cmd:hh_panel.dta}, {cmd:births.dta}, and {cmd:weather_hourly.dta} are
simulated: they illustrate the commands and are not observed data.
"""

WXPREP_INTRO = """{pstd}
These are examples 10-12 of the article; examples 1-9 are in
{help wxsum##examples:help wxsum}. The do-file {cmd:wxsum_examples.do} runs
all twelve; {cmd:net get wxsum} copies it, the sample data, and the example
datasets into the current folder. {cmd:weather_hourly.dta} is simulated.
"""

WXPREP_OTHER = """{pstd}Other uses, with hypothetical variable names{p_end}

{pstd}Rename variables {cmd:rain1}-{cmd:rain365} that start on 1 January 2020{p_end}
{phang2}{cmd:. wxprep rename rain1-rain365, stub(rf_) firstdate(01jan2020)}{p_end}

{pstd}Rename variables such as {cmd:rain_01jan2020}{p_end}
{phang2}{cmd:. wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)}{p_end}

{pstd}Daily rain from hourly readings, with the visit time (a {cmd:%tc} id()
variable) turned into a daily date{p_end}
{phang2}{cmd:. wxprep towide rain, id(site visit) date(time) stub(rf_) daily(sum) convert(visit) clear}{p_end}
"""


def replace_examples(path, body):
    text, nl = read(path)
    a = text.index("{marker examples}{...}\n{title:Examples}\n")
    b = text.index("{marker results}{...}")
    head = "{marker examples}{...}\n{title:Examples}\n\n"
    write(path, text[:a] + head + body.rstrip("\n") + "\n\n\n" + text[b:], nl)


def update_help(examples):
    wx = [e for e in examples if e["num"] < WXPREP_FIRST]
    wp = [e for e in examples if e["num"] >= WXPREP_FIRST]
    replace_examples("wxsum.sthlp", WXSUM_INTRO + "\n" + "\n".join(SETUP + help_block(wx)))
    replace_examples("wxprep.sthlp", WXPREP_INTRO + "\n" + "\n".join(SETUP + help_block(wp)) + "\n" + WXPREP_OTHER)


# ---------------------------------------------------------------------------
# 3. README.md
# ---------------------------------------------------------------------------
README_INTRO = """These are the examples of the article. `examples/wxsum_examples.do` runs all twelve, and `examples/wxsum_examples.log` shows their output. Run them in the folder where `net get wxsum` copied the files (help `wxsum` has examples 1-9 and help `wxprep` examples 10-12). Besides `rain.dta` and `temp.dta`, the examples use three datasets:

- `hh_panel.dta`: 10 households, 2013-2023, with planting and harvest dates and crop yields
- `births.dta`: 300 births, 2014-2023, with birth weights
- `weather_hourly.dta`: hourly temperature (kelvin) and relative humidity for 2022

These three datasets are simulated (`examples/make_example_data.do` creates them from `rain.dta` and `temp.dta`); they illustrate the commands and are not observed data.

```stata
clear all
set maxvar 20000
```
"""


def update_readme(examples):
    text, nl = read("README.md")
    a = text.index("## Examples\n")
    b = text.index("\n## ", a + 3)
    out = ["## Examples", "", README_INTRO]
    for e in examples:
        out.append("### Example %d. %s" % (e["num"], e["title"]))
        out.append("")
        out.append("```stata")
        for kind, t in e["items"]:
            out.append("* " + t if kind == "comment" else t)
        out.append("```")
        out.append("")
    write("README.md", text[:a] + "\n".join(out).rstrip("\n") + "\n" + text[b:], nl)


# ---------------------------------------------------------------------------
# 4. index.html from README.md (the Markdown used there: headings, paragraphs,
#    lists, tables, quotes, code blocks, inline code, links)
# ---------------------------------------------------------------------------
def inline(t):
    parts = re.split(r"(`[^`]*`)", t)
    out = []
    for p in parts:
        if p.startswith("`") and p.endswith("`") and len(p) > 1:
            out.append("<code>" + html.escape(p[1:-1].replace("\\|", "|"), quote=False) + "</code>")
        else:
            p = html.escape(p.replace("\\|", "|"), quote=False)
            p = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r'<a href="\2">\1</a>', p)
            p = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", p)
            out.append(p)
    return "".join(out)


def cells(row):
    row = row.strip().strip("|")
    return [c.strip() for c in re.split(r"(?<!\\)\|", row)]


def md_to_html(md):
    lines = md.split("\n")
    out, i = [], 0
    while i < len(lines):
        l = lines[i]
        if l.startswith("```"):
            j = i + 1
            while not lines[j].startswith("```"):
                j += 1
            code = [html.escape(x, quote=False) for x in lines[i + 1:j]]
            out.append("<pre><code>" + "\n".join(code) + "</code></pre>")
            i = j + 1
        elif l.startswith("#"):
            level = len(l) - len(l.lstrip("#"))
            out.append("<h%d>%s</h%d>" % (level, inline(l[level:].strip()), level))
            i += 1
        elif l.startswith("|"):
            rows = []
            while i < len(lines) and lines[i].startswith("|"):
                rows.append(lines[i])
                i += 1
            head, body = cells(rows[0]), [cells(r) for r in rows[2:]]
            t = ["<table>", "<tr>" + "".join("<th>%s</th>" % inline(c) for c in head) + "</tr>"]
            t += ["<tr>" + "".join("<td>%s</td>" % inline(c) for c in r) + "</tr>" for r in body]
            out.append("\n".join(t + ["</table>"]))
        elif l.startswith("- "):
            items = []
            while i < len(lines) and lines[i].startswith("- "):
                items.append("<li>%s</li>" % inline(lines[i][2:]))
                i += 1
            out.append("<ul>\n" + "\n".join(items) + "\n</ul>")
        elif l.startswith("> "):
            out.append("<blockquote>%s</blockquote>" % inline(l[2:]))
            i += 1
        elif not l.strip():
            i += 1
        else:
            para = []
            while i < len(lines) and lines[i].strip() and not lines[i].startswith(("#", "|", "- ", "> ", "```")):
                para.append(lines[i])
                i += 1
            out.append("<p>%s</p>" % inline(" ".join(para)))
    return "\n".join(out)


def update_index():
    md, _ = read("README.md")
    page, nl = read("index.html")
    head = page[:page.index("<body>")]
    if "table {" not in head:
        head = head.replace("    </style>", "        table {\n            border-collapse: collapse;\n"
                            "            margin: 16px 0;\n        }\n\n        th,\n        td {\n"
                            "            border: 1px solid #dfe2e5;\n            padding: 6px 10px;\n"
                            "            text-align: left;\n            vertical-align: top;\n        }\n\n"
                            "        blockquote {\n            color: #586069;\n            border-left: 4px solid #dfe2e5;\n"
                            "            margin: 0;\n            padding: 0 16px;\n        }\n    </style>")
    title_line, rest = md.split("\n", 1)
    body = ["<body>", '    <div class="header">', "        " + md_to_html(title_line), "    </div>", "",
            md_to_html(rest), "</body>", "", "</html>", ""]
    write("index.html", head + "\n".join(body), nl)


examples = parse_examples()
update_help(examples)
update_readme(examples)
update_index()
print("synced %d examples into wxsum.sthlp, wxprep.sthlp, README.md, and index.html" % len(examples))
