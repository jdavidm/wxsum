version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 . 2 . . . .
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
assert !missing(nobs) & abs(nobs - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2))
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2))
assert missing(var)
assert missing(sd)
assert missing(skew)
assert !missing(mean_mo) & abs(mean_mo - (2)) <= 1e-9 * max(1,abs(2))
assert !missing(total) & abs(total - (2)) <= 1e-9 * max(1,abs(2))
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0))
