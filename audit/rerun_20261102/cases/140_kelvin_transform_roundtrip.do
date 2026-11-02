version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 273.15 283.15 303.15 313.15 . .
end
wxprep tolong x_, id(id) generate(kelvin) clear
gen double celsius=kelvin-273.15
wxprep towide celsius, id(id) date(date) stub(c_) clear
wxsum c_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id)
assert abs(gdd-40)<1e-9 & abs(kdd-10)<1e-9 & heatdays==2 & nobs==4
