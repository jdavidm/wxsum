version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1 1 1 1 1 1
2 2 2 2 2 2 2
end
gen str5 name="site"+string(id)
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id name) outstub(r_)
assert r_total==6*id
assert name=="site"+string(id)
confirm variable year
confirm variable r_dry_start
