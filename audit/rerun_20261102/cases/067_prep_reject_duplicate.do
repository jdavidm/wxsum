version 15.1
set type double
clear
input id long d double v
1 20200101 2
1 20200101 6
1 20200102 .
1 20200102 .
2 20200101 7
end
datasignature
local before `r(datasignature)'
capture wxprep towide v, id(id) date(d) stub(x_) clear
assert _rc==459
datasignature
assert "`before'"=="`r(datasignature)'"
