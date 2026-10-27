version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 . . . . . .
end
wxsum x_, type(rain) ini_month(1) fin_month(1) fin_day(6) keep(id)
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0))
assert missing(mean)
assert missing(median)
assert missing(var)
assert missing(sd)
assert missing(skew)
assert missing(mean_mo)
assert missing(total)
assert missing(raindays)
assert missing(norain)
assert missing(pct_raindays)
assert missing(dry_start)
assert missing(dry)
assert missing(dry_end)
