version 15.1
set type double
clear
set obs 2
gen id=1
gen long d=mdy(1,1,1960)+(_n-1)*20001
format d %td
gen v=1
datasignature
local before `r(datasignature)'
capture wxprep towide v, id(id) date(d) stub(x_) clear
assert _rc==900
datasignature
assert "`before'"=="`r(datasignature)'"
