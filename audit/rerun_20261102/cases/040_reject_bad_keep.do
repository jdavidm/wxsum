version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 1 2 . 0 3
2 . . . . . .
3 1 1 1 1 1 1
end
datasignature
local before `r(datasignature)'
capture wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(absent)
assert _rc==111
datasignature
assert "`before'"=="`r(datasignature)'"
