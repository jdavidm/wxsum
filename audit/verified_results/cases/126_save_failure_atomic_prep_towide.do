version 15.1
set type double
clear
input id long d v
1 20200101 5
1 20200102 6
end
datasignature
local before `r(datasignature)'
capture wxprep towide v, id(id) date(d) stub(x_) clear save("C:/Users/annal/Documents/Codex/2026-10-15/rea/outputs/wxsum_audit/verified_results/does_not_exist/out.dta", replace)
local rc=_rc
assert `rc'!=0
datasignature
assert "`before'"=="`r(datasignature)'"
