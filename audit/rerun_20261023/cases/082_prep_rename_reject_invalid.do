version 15.1
set type double
clear
input double (id x_20200101 x_20200102)
1 1 2
end

datasignature
local before `r(datasignature)'
capture wxprep rename x_*, stub(r_) firstdate(30feb2020)
assert _rc==198
datasignature
assert "`before'"=="`r(datasignature)'"
