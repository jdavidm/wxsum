version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 3 3 3 3 3 3
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
assert !missing(nobs) & abs(nobs - (6)) <= 1e-9 * max(1,abs(6))
assert !missing(mean) & abs(mean - (3)) <= 1e-9 * max(1,abs(3))
assert !missing(median) & abs(median - (3)) <= 1e-9 * max(1,abs(3))
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0))
assert missing(skew)
assert !missing(mean_mo) & abs(mean_mo - (18)) <= 1e-9 * max(1,abs(18))
assert !missing(total) & abs(total - (18)) <= 1e-9 * max(1,abs(18))
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6))
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1))
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0))
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0))
