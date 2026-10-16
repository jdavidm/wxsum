version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 0 1 2 . 0 3
2 . . . . . .
3 1 1 1 1 1 1
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(total) & abs(total - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(mean) & abs(mean - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(var) & abs(var - (1.7)) <= 1e-9 * max(1,abs(1.7)) if id==1
assert !missing(sd) & abs(sd - (1.3038404810405297)) <= 1e-9 * max(1,abs(1.3038404810405297)) if id==1
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(mean_mo) & abs(mean_mo - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert nobs==0 & missing(total) & missing(dry) if id==2
assert var==0 & missing(skew) if id==3
