version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 1 2 3 4 5
2 1 2 3 4 5 6
3 2 3 4 5 6 7
4 3 4 5 6 7 8
5 4 5 6 7 8 9
6 5 6 7 8 9 10
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
tempfile stats
save "`stats'"
clear
set obs 6
gen id=_n
gen year=2020
gen double outcome=5+18*id
merge 1:1 id year using "`stats'"
assert _merge==3
regress outcome total
assert abs(_b[total]-3)<1e-9 & e(N)==6
