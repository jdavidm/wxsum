version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 1 2 . 0 3
2 . . . . . .
3 1 1 1 1 1 1
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id) minobs(6) cuts(1 2)
assert nobs==5 & missing(total) & missing(cut01) if id==1
assert nobs==0 & missing(total) if id==2
assert nobs==6 & total==6 & cut02==6 if id==3
