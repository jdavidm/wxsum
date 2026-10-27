"""Copies the example commands of examples/wxsum_examples.do into the documentation.

Run from the repository root after changing the examples or README.md:
    python audit/sync_docs.py

The do-file is the source of the commands. Each example starts with a
bookmark, "**# N - title", and its commands are the lines between -log using-
and -log close- that are not comments, with /// continuations joined and tabs
and repeated blanks collapsed to one blank, as wxsum_v6_docs.do reads them.

- wxsum.sthlp gets examples 1-9 and wxprep.sthlp examples 10-12 (those that
  start with wxprep), each command as a {phang2}{cmd:. command}{p_end} line;
- README.md gets all twelve under "## Examples", in ```stata blocks;
- index.html is rebuilt from README.md, keeping its <head>.

Only the commands are copied. The titles, introductions, and explanatory lines
of the documentation are kept, because the comments in the do-file are written
for the do-file. A changed command replaces the old one where it stands, a new
command goes where it falls among the others, and an example that the
documentation lacks gets the title of its bookmark. A title is replaced only
when the bookmark's title differs in more than capitalization. The script lists
what it changed, so that the explanatory lines next to changed commands can be
checked.

audit/tests/wxsum_v6_docs.do checks that the do-file, the help files,
README.md, and index.html hold the same commands and runs them.
"""
import difflib
import html
import re
import sys
from pathlib import Path

root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(".")
WXPREP_FIRST = 10          # examples from here on go to wxprep.sthlp
changes = []               # what the script changed, listed at the end


def read(p):
    raw = (root / p).read_bytes().decode("utf-8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    return raw.replace("\r\n", "\n"), nl


def write(p, text, nl):
    data = text.replace("\n", nl).encode("utf-8")
    if (root / p).read_bytes() != data:
        (root / p).write_bytes(data)


def clean(line):
    # tabs and repeated blanks collapse to one blank
    return " ".join(line.split())


# ---------------------------------------------------------------------------
# 1. the examples in the do-file
# ---------------------------------------------------------------------------
BOOKMARK = re.compile(r"\*\*# +(\d+) +- +(.*\S)$")


def parse_examples():
    text, _ = read("examples/wxsum_examples.do")
    lines = [clean(l) for l in text.split("\n")]
    start = next(i for i, l in enumerate(lines) if l.startswith("log using")) + 1
    end = next(i for i in range(start, len(lines)) if lines[i].startswith("log close"))
    examples, cur, cmd = [], None, []
    for l in lines[start:end]:
        m = BOOKMARK.match(l)
        if m:
            assert not cmd, ("a /// continuation runs into a bookmark", l)
            cur = dict(num=int(m.group(1)), title=m.group(2), cmds=[])
            examples.append(cur)
            continue
        if not l or l.startswith("*"):
            continue
        assert cur is not None, ("a command before the first example bookmark", l)
        if l.endswith("///"):
            cmd.append(l[:-3].rstrip())
            continue
        cur["cmds"].append(" ".join(cmd + [l]))
        cmd = []
    # sections without commands, such as the end matter, are not examples
    examples = [e for e in examples if e["cmds"]]
    nums = [e["num"] for e in examples]
    assert nums == list(range(1, len(nums) + 1)), nums
    for e in examples:
        for c in e["cmds"]:
            assert "{" not in c and "}" not in c, ("braces cannot go in a help file", c)
    return examples


# ---------------------------------------------------------------------------
# 2. one example: the do-file's commands in place of the old ones
# ---------------------------------------------------------------------------
def sync_items(items, cmds):
    """items are the lines of an example after its title, as ("cmd", command)
    or ("text", line). Returns the items with cmds as the commands, the text
    lines kept before the commands they preceded, and what changed (None if
    the commands are the same)."""
    pos = [i for i, (kind, _) in enumerate(items) if kind == "cmd"]
    old = [items[i][1] for i in pos]
    if old == cmds:
        return items, None
    before, prev = [], 0
    for i in pos:
        before.append(items[prev:i])
        prev = i + 1
    after = items[prev:]
    out, done = [], set()

    def text_before(j):
        if j not in done:
            out.extend(before[j])
            done.add(j)

    n = dict(replaced=0, inserted=0, deleted=0)
    for tag, i1, i2, j1, j2 in difflib.SequenceMatcher(None, old, cmds, autojunk=False).get_opcodes():
        if tag == "insert":
            if i1 < len(old):
                text_before(i1)
            out.extend(("cmd", c) for c in cmds[j1:j2])
            n["inserted"] += j2 - j1
            continue
        for k in range(max(i2 - i1, j2 - j1)):
            if i1 + k < i2:
                text_before(i1 + k)
            if j1 + k < j2:
                out.append(("cmd", cmds[j1 + k]))
        if tag == "replace":
            n["replaced"] += min(i2 - i1, j2 - j1)
            n["inserted"] += max(0, (j2 - j1) - (i2 - i1))
            n["deleted"] += max(0, (i2 - i1) - (j2 - j1))
        elif tag == "delete":
            n["deleted"] += i2 - i1
    assert len(done) == len(old)
    out.extend(after)
    return out, ", ".join("%d %s" % (v, k) for k, v in n.items() if v)


def sync_examples(doc, blocks, examples):
    """blocks: {number: (title, items)} of the examples in doc; examples: the
    do-file's examples that belong there. Returns the synced blocks in order."""
    new = {}
    for e in examples:
        num, title = e["num"], e["title"][:1].upper() + e["title"][1:]
        if num not in blocks:
            new[num] = (title, [("cmd", c) for c in e["cmds"]])
            changes.append("%s, example %d: new" % (doc, num))
            continue
        old_title, items = blocks[num]
        if clean(old_title).lower() == clean(title).lower():
            title = old_title
        else:
            changes.append("%s, example %d: title from the do-file" % (doc, num))
        items, what = sync_items(items, e["cmds"])
        if what:
            changes.append("%s, example %d: commands %s" % (doc, num, what))
        new[num] = (title, items)
    for num in sorted(set(blocks) - set(new)):
        changes.append("%s, example %d: removed" % (doc, num))
    return new


def splice(doc, lines, spans, out):
    """replaces the lines from the first example to the end of the last with
    out; the examples must be one blank line apart"""
    for (_, _, _, j), (_, _, i, _) in zip(spans, spans[1:]):
        assert lines[j:i] == [""], ("%s: the examples are not one blank line apart" % doc, lines[j:i])
    return lines[:spans[0][2]] + out + lines[spans[-1][3]:]


# ---------------------------------------------------------------------------
# 3. help files
# ---------------------------------------------------------------------------
HELP_TITLE = re.compile(r"\{pstd\}\{bf:Example (\d+)\.\} (.*)\{p_end\}$")
HELP_CMD = re.compile(r"\{phang2\}\{cmd:\. (.*)\}\{p_end\}$")


def update_help(examples):
    for doc, mine in (("wxsum.sthlp", lambda n: n < WXPREP_FIRST),
                      ("wxprep.sthlp", lambda n: n >= WXPREP_FIRST)):
        text, nl = read(doc)
        lines = text.split("\n")
        a = lines.index("{marker examples}{...}")
        b = lines.index("{marker results}{...}")
        # an example runs from its title to the next blank line
        spans, blocks = [], {}
        for i in range(a, b):
            m = HELP_TITLE.match(lines[i])
            if not m:
                continue
            j = i + 1
            while lines[j].strip():
                j += 1
            spans.append((int(m.group(1)), m.group(2), i, j))
            items = []
            for l in lines[i + 1:j]:
                c = HELP_CMD.match(l)
                items.append(("cmd", c.group(1)) if c else ("text", l))
            blocks[int(m.group(1))] = (m.group(2), items)
        assert spans, "%s: no examples" % doc
        out = []
        for num, (title, items) in sync_examples(doc, blocks, [e for e in examples if mine(e["num"])]).items():
            if out:
                out.append("")
            out.append("{pstd}{bf:Example %d.} %s{p_end}" % (num, title))
            out += ["{phang2}{cmd:. %s}{p_end}" % v if kind == "cmd" else v for kind, v in items]
        write(doc, "\n".join(splice(doc, lines, spans, out)), nl)


# ---------------------------------------------------------------------------
# 4. README.md
# ---------------------------------------------------------------------------
README_TITLE = re.compile(r"### Example (\d+)\. (.*)$")


def update_readme(examples):
    text, nl = read("README.md")
    lines = text.split("\n")
    a = lines.index("## Examples")
    b = next(i for i in range(a + 1, len(lines)) if lines[i].startswith("## "))
    # an example is its title, a blank line, and a ```stata block
    spans, blocks = [], {}
    for i in range(a, b):
        m = README_TITLE.match(lines[i])
        if not m:
            continue
        assert lines[i + 1:i + 3] == ["", "```stata"], ("README.md: no ```stata block under", lines[i])
        j = i + 3
        while lines[j] != "```":
            j += 1
        spans.append((int(m.group(1)), m.group(2), i, j + 1))
        items = [("text", l) if l.startswith("*") else ("cmd", l) for l in lines[i + 3:j]]
        blocks[int(m.group(1))] = (m.group(2), items)
    assert spans, "README.md: no examples"
    out = []
    for num, (title, items) in sync_examples("README.md", blocks, examples).items():
        if out:
            out.append("")
        out += ["### Example %d. %s" % (num, title), "", "```stata"] + [v for _, v in items] + ["```"]
    write("README.md", "\n".join(splice("README.md", lines, spans, out)), nl)


# ---------------------------------------------------------------------------
# 5. index.html from README.md (the Markdown used there: headings, paragraphs,
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
index_before = (root / "index.html").read_bytes()
update_index()
if (root / "index.html").read_bytes() != index_before:
    changes.append("index.html: rebuilt from README.md")
if changes:
    print("\n".join(changes))
    print("Check the explanatory lines next to any changed commands.")
else:
    print("The documentation has the commands of all %d examples; nothing changed." % len(examples))
