version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 1 1 1 1 1
end
expand 1000
replace id=_n
timer clear 1
timer on 1
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
timer off 1
timer list 1
assert _N==1000
assert nobs==6
