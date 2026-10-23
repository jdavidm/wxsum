version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 10 10 10 10 10 10
2 20 10 10 10 10 10
3 30 10 10 10 10 10
4 40 40 40 40 40 40
5 . . . . . .
end
wxsum x_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id) gdd_bin(10) gdd_binlo(10) gdd_binhi(30)
assert gddcat==1 if id==1
assert gddcat==2 if id==2
assert gddcat==3 if id==3
assert gddcat==4 if id==4
assert missing(gddcat) if id==5
local lab : value label gddcat
assert "`lab'"=="gddcat"
