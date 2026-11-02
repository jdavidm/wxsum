version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 2 3 4 5 6
end
local target=c(maxvar)-12
forvalues j=1/`target' {
 quietly gen byte z`j'=0
}
datasignature
local before `r(datasignature)'
capture wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) shape(wide)
assert _rc==900
datasignature
assert "`before'"=="`r(datasignature)'"
