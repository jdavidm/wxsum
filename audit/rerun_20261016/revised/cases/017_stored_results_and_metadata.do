version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 1 2 . 0 3
2 . . . . . .
3 1 1 1 1 1 1
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
local vv `r(varlist)'
local n : word count `vv'
assert r(k_created)==`n'
assert r(N)==3 & r(N_units)==3 & r(n_windows)==1
matrix M=r(missing)
assert M[1,1]==6 & abs(M[1,2]-11/3)<1e-12
assert abs(M[1,3]-2/3)<1e-12 & abs(M[1,4]-1/3)<1e-12 & M[1,5]==1
local stat : char total[wxsum_stat]
assert "`stat'"=="total"
local ver : char _dta[wxsum_version]
assert "`ver'"=="6.0.0"
local shape : char _dta[wxsum_shape]
assert "`shape'"=="long"
