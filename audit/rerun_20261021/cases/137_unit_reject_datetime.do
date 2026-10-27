version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 2 3 4 5 6
end
gen double s=clock("01jan2020 00:00:00","DMYhms")
gen double e=s+86400000
format s e %tc
datasignature
local before `r(datasignature)'
capture wxsum x_, type(rain) start(s) end(e) keep(id)
assert _rc==198
datasignature
assert "`before'"=="`r(datasignature)'"
