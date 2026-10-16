version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 2 3 4 5 6
end
gen double s=mdy(1,1,2020)+.5
gen e=s+1
datasignature
local before `r(datasignature)'
capture wxsum x_, type(rain) start(s) end(e) keep(id)
assert _rc==198
datasignature
assert "`before'"=="`r(datasignature)'"
