version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 2 3 4 5 6
end
datasignature
local before `r(datasignature)'
capture wxprep tolong x_, id(id) clear save("C:/Users/annal/Documents/Codex/2026-10-15/rea/outputs/wxsum_audit/verified_results/does_not_exist/out.dta", replace)
local rc=_rc
assert `rc'!=0
datasignature
assert "`before'"=="`r(datasignature)'"
