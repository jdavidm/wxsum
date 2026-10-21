version 15.1
set type double
use "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_20261021/rain.dta", clear
assert _N>0
timer clear 1
timer on 1
wxsum rf_, type(rain) ini_month(11) fin_month(2) keep(hhid)
timer off 1
timer list 1
isid hhid year
assert nobs>=0 & nobs<=121
