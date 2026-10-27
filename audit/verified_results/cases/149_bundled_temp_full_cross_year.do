version 15.1
set type double
use "C:/Users/annal/Downloads/wxsum/temp_full.dta", clear
assert _N>0
timer clear 1
timer on 1
wxsum tmp_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) ini_month(11) fin_month(2) keep(hhid)
timer off 1
timer list 1
isid hhid year
assert nobs>=0 & nobs<=121
