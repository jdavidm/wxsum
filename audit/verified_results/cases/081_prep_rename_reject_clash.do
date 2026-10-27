version 15.1
set type double
clear
input double (id x_20200101 x_20200102)
1 1 2
end
gen r_20200101=4
datasignature
local before `r(datasignature)'
capture wxprep rename x_*, stub(r_) firstdate(01jan2020)
assert _rc==110
datasignature
assert "`before'"=="`r(datasignature)'"
