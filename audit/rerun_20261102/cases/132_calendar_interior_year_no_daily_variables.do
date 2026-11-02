version 15.1
set type double
clear
set obs 1
gen id=1
gen x_20000101=10
gen x_20020101=30
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(1) keep(id)
assert _N==3
assert nobs==0 & missing(total) if year==2001
