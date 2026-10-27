version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 2 3 4 5 6
end
datasignature
local before `r(datasignature)'
capture wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id) save("C:/Users/aljos/git/wxsum/audit/rerun_20261021/does_not_exist/out.dta", replace)
local rc=_rc
assert `rc'!=0
datasignature
assert "`before'"=="`r(datasignature)'"
