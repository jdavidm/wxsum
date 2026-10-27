version 15.1
set type double
clear
input str2 id double day double v
"b" 20200103 3
"a" 20200101 1
"a" 20200103 .
"b" 20200101 2
end
datasignature
local before `r(datasignature)'
capture wxprep towide v, id(id) date(day) stub(x_)
assert _rc==4
datasignature
assert "`before'"=="`r(datasignature)'"
