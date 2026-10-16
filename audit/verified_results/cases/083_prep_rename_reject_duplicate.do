version 15.1
set type double
clear
input double (id x_20200101 x_20200102)
1 1 2
end
rename (x_20200101 x_20200102) (a_1jan2020 a_01jan2020)
datasignature
local before `r(datasignature)'
capture wxprep rename a_*, stub(r_) from(a_) dateformat(DMY)
assert _rc==198
datasignature
assert "`before'"=="`r(datasignature)'"
