version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 10 20 30 40 .
end
wxsum x_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id)
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5))
assert !missing(mean) & abs(mean - (20)) <= 1e-9 * max(1,abs(20))
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20))
assert !missing(var) & abs(var - (250)) <= 1e-9 * max(1,abs(250))
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40))
assert !missing(gdd) & abs(gdd - (50)) <= 1e-9 * max(1,abs(50))
assert !missing(kdd) & abs(kdd - (10)) <= 1e-9 * max(1,abs(10))
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2))
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002))
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2))
