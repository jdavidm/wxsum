version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 35 . 35 35 20 20
end
wxsum x_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id)
* Help says max(heat_start,heat,heat_end) is the longest heat run.
* The two consecutive 35s on days 3 and 4 are the longest run.
assert max(heat_start,heat,heat_end)==2
