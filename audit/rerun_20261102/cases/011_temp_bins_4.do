version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 -5 0 10 20 30 40
end
wxsum x_, type(temp) ini_month(1) fin_month(1) fin_day(6) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(id) tmp_bin(4) tmp_binlo(0) tmp_binhi(30)
assert !missing(tmpbin01) & abs(tmpbin01 - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(tmpbin02) & abs(tmpbin02 - (2)) <= 1e-9 * max(1,abs(2))
assert !missing(tmpbin03) & abs(tmpbin03 - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(tmpbin04) & abs(tmpbin04 - (2)) <= 1e-9 * max(1,abs(2))
egen binsum=rowtotal(tmpbin*)
assert binsum==nobs
