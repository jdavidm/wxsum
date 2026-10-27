version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023_v7/oracle_rain.csv", clear varnames(1) asdouble
wxsum x_, type(rain) ini_month(1) ini_day(1) fin_month(1) fin_day(12) lr_years(2) ref_min(2) minobs(2) shape(long) keep(id) cuts(1 2 5)
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==1 & year==2000
assert !missing(mean) & abs(mean - (4.6545454545454543)) <= 1e-9 * max(1,abs(4.6545454545454543)) if id==1 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(var) & abs(var - (41.672727272727272)) <= 1e-9 * max(1,abs(41.672727272727272)) if id==1 & year==2000
assert !missing(sd) & abs(sd - (6.4554416791360811)) <= 1e-9 * max(1,abs(6.4554416791360811)) if id==1 & year==2000
assert !missing(skew) & abs(skew - (1.4878167490094529)) <= 1e-9 * max(1,abs(1.4878167490094529)) if id==1 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (51.200000000000003)) <= 1e-9 * max(1,abs(51.200000000000003)) if id==1 & year==2000
assert !missing(total) & abs(total - (51.200000000000003)) <= 1e-9 * max(1,abs(51.200000000000003)) if id==1 & year==2000
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.63636363636363635)) <= 1e-9 * max(1,abs(0.63636363636363635)) if id==1 & year==2000
assert !missing(dry_start) & abs(dry_start - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2000
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2000
assert missing(dev_mean_mo) if id==1 & year==2000
assert missing(z_mean_mo) if id==1 & year==2000
assert missing(dev_total) if id==1 & year==2000
assert missing(z_total) if id==1 & year==2000
assert missing(dev_raindays) if id==1 & year==2000
assert missing(z_raindays) if id==1 & year==2000
assert missing(dev_norain) if id==1 & year==2000
assert missing(z_norain) if id==1 & year==2000
assert missing(dev_pct_raindays) if id==1 & year==2000
assert missing(z_pct_raindays) if id==1 & year==2000
assert missing(dev_dry) if id==1 & year==2000
assert missing(z_dry) if id==1 & year==2000
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2001
assert missing(mean) if id==1 & year==2001
assert missing(median) if id==1 & year==2001
assert missing(var) if id==1 & year==2001
assert missing(sd) if id==1 & year==2001
assert missing(skew) if id==1 & year==2001
assert missing(mean_mo) if id==1 & year==2001
assert missing(total) if id==1 & year==2001
assert missing(raindays) if id==1 & year==2001
assert missing(norain) if id==1 & year==2001
assert missing(pct_raindays) if id==1 & year==2001
assert missing(dry_start) if id==1 & year==2001
assert missing(dry) if id==1 & year==2001
assert missing(dry_end) if id==1 & year==2001
assert missing(cut01) if id==1 & year==2001
assert missing(cut02) if id==1 & year==2001
assert missing(cut03) if id==1 & year==2001
assert missing(cut04) if id==1 & year==2001
assert missing(dev_mean_mo) if id==1 & year==2001
assert missing(z_mean_mo) if id==1 & year==2001
assert missing(dev_total) if id==1 & year==2001
assert missing(z_total) if id==1 & year==2001
assert missing(dev_raindays) if id==1 & year==2001
assert missing(z_raindays) if id==1 & year==2001
assert missing(dev_norain) if id==1 & year==2001
assert missing(z_norain) if id==1 & year==2001
assert missing(dev_pct_raindays) if id==1 & year==2001
assert missing(z_pct_raindays) if id==1 & year==2001
assert missing(dev_dry) if id==1 & year==2001
assert missing(z_dry) if id==1 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2002
assert !missing(mean) & abs(mean - (4.0800000000000001)) <= 1e-9 * max(1,abs(4.0800000000000001)) if id==1 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(var) & abs(var - (46.683999999999997)) <= 1e-9 * max(1,abs(46.683999999999997)) if id==1 & year==2002
assert !missing(sd) & abs(sd - (6.8325690629513582)) <= 1e-9 * max(1,abs(6.8325690629513582)) if id==1 & year==2002
assert !missing(skew) & abs(skew - (1.7489256263636757)) <= 1e-9 * max(1,abs(1.7489256263636757)) if id==1 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (40.799999999999997)) <= 1e-9 * max(1,abs(40.799999999999997)) if id==1 & year==2002
assert !missing(total) & abs(total - (40.799999999999997)) <= 1e-9 * max(1,abs(40.799999999999997)) if id==1 & year==2002
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2002
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert missing(dev_mean_mo) if id==1 & year==2002
assert missing(z_mean_mo) if id==1 & year==2002
assert missing(dev_total) if id==1 & year==2002
assert missing(z_total) if id==1 & year==2002
assert missing(dev_raindays) if id==1 & year==2002
assert missing(z_raindays) if id==1 & year==2002
assert missing(dev_norain) if id==1 & year==2002
assert missing(z_norain) if id==1 & year==2002
assert missing(dev_pct_raindays) if id==1 & year==2002
assert missing(z_pct_raindays) if id==1 & year==2002
assert missing(dev_dry) if id==1 & year==2002
assert missing(z_dry) if id==1 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2003
assert !missing(mean) & abs(mean - (5.0999999999999996)) <= 1e-9 * max(1,abs(5.0999999999999996)) if id==1 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(var) & abs(var - (42.100000000000001)) <= 1e-9 * max(1,abs(42.100000000000001)) if id==1 & year==2003
assert !missing(sd) & abs(sd - (6.4884512790033337)) <= 1e-9 * max(1,abs(6.4884512790033337)) if id==1 & year==2003
assert !missing(skew) & abs(skew - (1.5107541155771105)) <= 1e-9 * max(1,abs(1.5107541155771105)) if id==1 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (51)) <= 1e-9 * max(1,abs(51)) if id==1 & year==2003
assert !missing(total) & abs(total - (51)) <= 1e-9 * max(1,abs(51)) if id==1 & year==2003
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==1 & year==2003
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2003
assert missing(dev_mean_mo) if id==1 & year==2003
assert missing(z_mean_mo) if id==1 & year==2003
assert missing(dev_total) if id==1 & year==2003
assert missing(z_total) if id==1 & year==2003
assert missing(dev_raindays) if id==1 & year==2003
assert missing(z_raindays) if id==1 & year==2003
assert missing(dev_norain) if id==1 & year==2003
assert missing(z_norain) if id==1 & year==2003
assert missing(dev_pct_raindays) if id==1 & year==2003
assert missing(z_pct_raindays) if id==1 & year==2003
assert missing(dev_dry) if id==1 & year==2003
assert missing(z_dry) if id==1 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==1 & year==2004
assert !missing(mean) & abs(mean - (2.6363636363636362)) <= 1e-9 * max(1,abs(2.6363636363636362)) if id==1 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1 & year==2004
assert !missing(var) & abs(var - (24.586545454545455)) <= 1e-9 * max(1,abs(24.586545454545455)) if id==1 & year==2004
assert !missing(sd) & abs(sd - (4.9584821724541328)) <= 1e-9 * max(1,abs(4.9584821724541328)) if id==1 & year==2004
assert !missing(skew) & abs(skew - (2.911188164801624)) <= 1e-9 * max(1,abs(2.911188164801624)) if id==1 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (29)) <= 1e-9 * max(1,abs(29)) if id==1 & year==2004
assert !missing(total) & abs(total - (29)) <= 1e-9 * max(1,abs(29)) if id==1 & year==2004
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==1 & year==2004
assert !missing(dry_start) & abs(dry_start - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-16.899999999999999)) <= 1e-9 * max(1,abs(-16.899999999999999)) if id==1 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.3431577651083626)) <= 1e-9 * max(1,abs(-2.3431577651083626)) if id==1 & year==2004
assert !missing(dev_total) & abs(dev_total - (-16.899999999999999)) <= 1e-9 * max(1,abs(-16.899999999999999)) if id==1 & year==2004
assert !missing(z_total) & abs(z_total - (-2.3431577651083626)) <= 1e-9 * max(1,abs(-2.3431577651083626)) if id==1 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==1 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==1 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (4.5)) <= 1e-9 * max(1,abs(4.5)) if id==1 & year==2004
assert !missing(z_norain) & abs(z_norain - (2.1213203435596428)) <= 1e-9 * max(1,abs(2.1213203435596428)) if id==1 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.38636363636363635)) <= 1e-9 * max(1,abs(-0.38636363636363635)) if id==1 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.8213356485108039)) <= 1e-9 * max(1,abs(-1.8213356485108039)) if id==1 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(nobs) & abs(nobs - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2005
assert !missing(mean) & abs(mean - (1.1428571428571428)) <= 1e-9 * max(1,abs(1.1428571428571428)) if id==1 & year==2005
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1 & year==2005
assert !missing(var) & abs(var - (3.0861904761904762)) <= 1e-9 * max(1,abs(3.0861904761904762)) if id==1 & year==2005
assert !missing(sd) & abs(sd - (1.7567556677553302)) <= 1e-9 * max(1,abs(1.7567556677553302)) if id==1 & year==2005
assert !missing(skew) & abs(skew - (2.303760297205546)) <= 1e-9 * max(1,abs(2.303760297205546)) if id==1 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (8)) <= 1e-9 * max(1,abs(8)) if id==1 & year==2005
assert !missing(total) & abs(total - (8)) <= 1e-9 * max(1,abs(8)) if id==1 & year==2005
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2005
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.2857142857142857)) <= 1e-9 * max(1,abs(0.2857142857142857)) if id==1 & year==2005
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2005
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-32)) <= 1e-9 * max(1,abs(-32)) if id==1 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.0570379089063202)) <= 1e-9 * max(1,abs(-2.0570379089063202)) if id==1 & year==2005
assert !missing(dev_total) & abs(dev_total - (-32)) <= 1e-9 * max(1,abs(-32)) if id==1 & year==2005
assert !missing(z_total) & abs(z_total - (-2.0570379089063202)) <= 1e-9 * max(1,abs(-2.0570379089063202)) if id==1 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-4.5)) <= 1e-9 * max(1,abs(-4.5)) if id==1 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-1.2727922061357855)) <= 1e-9 * max(1,abs(-1.2727922061357855)) if id==1 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(z_norain) & abs(z_norain - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==1 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.34610389610389614)) <= 1e-9 * max(1,abs(-0.34610389610389614)) if id==1 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.91256153601072609)) <= 1e-9 * max(1,abs(-0.91256153601072609)) if id==1 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1 & year==2005
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1 & year==2005
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(skew) if id==2 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2000
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2000
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(dev_mean_mo) if id==2 & year==2000
assert missing(z_mean_mo) if id==2 & year==2000
assert missing(dev_total) if id==2 & year==2000
assert missing(z_total) if id==2 & year==2000
assert missing(dev_raindays) if id==2 & year==2000
assert missing(z_raindays) if id==2 & year==2000
assert missing(dev_norain) if id==2 & year==2000
assert missing(z_norain) if id==2 & year==2000
assert missing(dev_pct_raindays) if id==2 & year==2000
assert missing(z_pct_raindays) if id==2 & year==2000
assert missing(dev_dry) if id==2 & year==2000
assert missing(z_dry) if id==2 & year==2000
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(skew) if id==2 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2001
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2001
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(dev_mean_mo) if id==2 & year==2001
assert missing(z_mean_mo) if id==2 & year==2001
assert missing(dev_total) if id==2 & year==2001
assert missing(z_total) if id==2 & year==2001
assert missing(dev_raindays) if id==2 & year==2001
assert missing(z_raindays) if id==2 & year==2001
assert missing(dev_norain) if id==2 & year==2001
assert missing(z_norain) if id==2 & year==2001
assert missing(dev_pct_raindays) if id==2 & year==2001
assert missing(z_pct_raindays) if id==2 & year==2001
assert missing(dev_dry) if id==2 & year==2001
assert missing(z_dry) if id==2 & year==2001
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(skew) if id==2 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2002
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2002
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_mean_mo) if id==2 & year==2002
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_total) if id==2 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_raindays) if id==2 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_norain) if id==2 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_pct_raindays) if id==2 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_dry) if id==2 & year==2002
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(skew) if id==2 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2003
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2003
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_mean_mo) if id==2 & year==2003
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_total) if id==2 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_raindays) if id==2 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_norain) if id==2 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_pct_raindays) if id==2 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry) if id==2 & year==2003
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(skew) if id==2 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2004
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2004
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_mean_mo) if id==2 & year==2004
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_total) if id==2 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_raindays) if id==2 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_norain) if id==2 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_pct_raindays) if id==2 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry) if id==2 & year==2004
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2005
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2005
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(skew) if id==2 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2005
assert !missing(total) & abs(total - (24)) <= 1e-9 * max(1,abs(24)) if id==2 & year==2005
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut03) & abs(cut03 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_mean_mo) if id==2 & year==2005
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_total) if id==2 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_raindays) if id==2 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_norain) if id==2 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_pct_raindays) if id==2 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_dry) if id==2 & year==2005
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2000
assert missing(mean) if id==3 & year==2000
assert missing(median) if id==3 & year==2000
assert missing(var) if id==3 & year==2000
assert missing(sd) if id==3 & year==2000
assert missing(skew) if id==3 & year==2000
assert missing(mean_mo) if id==3 & year==2000
assert missing(total) if id==3 & year==2000
assert missing(raindays) if id==3 & year==2000
assert missing(norain) if id==3 & year==2000
assert missing(pct_raindays) if id==3 & year==2000
assert missing(dry_start) if id==3 & year==2000
assert missing(dry) if id==3 & year==2000
assert missing(dry_end) if id==3 & year==2000
assert missing(cut01) if id==3 & year==2000
assert missing(cut02) if id==3 & year==2000
assert missing(cut03) if id==3 & year==2000
assert missing(cut04) if id==3 & year==2000
assert missing(dev_mean_mo) if id==3 & year==2000
assert missing(z_mean_mo) if id==3 & year==2000
assert missing(dev_total) if id==3 & year==2000
assert missing(z_total) if id==3 & year==2000
assert missing(dev_raindays) if id==3 & year==2000
assert missing(z_raindays) if id==3 & year==2000
assert missing(dev_norain) if id==3 & year==2000
assert missing(z_norain) if id==3 & year==2000
assert missing(dev_pct_raindays) if id==3 & year==2000
assert missing(z_pct_raindays) if id==3 & year==2000
assert missing(dev_dry) if id==3 & year==2000
assert missing(z_dry) if id==3 & year==2000
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2001
assert missing(mean) if id==3 & year==2001
assert missing(median) if id==3 & year==2001
assert missing(var) if id==3 & year==2001
assert missing(sd) if id==3 & year==2001
assert missing(skew) if id==3 & year==2001
assert missing(mean_mo) if id==3 & year==2001
assert missing(total) if id==3 & year==2001
assert missing(raindays) if id==3 & year==2001
assert missing(norain) if id==3 & year==2001
assert missing(pct_raindays) if id==3 & year==2001
assert missing(dry_start) if id==3 & year==2001
assert missing(dry) if id==3 & year==2001
assert missing(dry_end) if id==3 & year==2001
assert missing(cut01) if id==3 & year==2001
assert missing(cut02) if id==3 & year==2001
assert missing(cut03) if id==3 & year==2001
assert missing(cut04) if id==3 & year==2001
assert missing(dev_mean_mo) if id==3 & year==2001
assert missing(z_mean_mo) if id==3 & year==2001
assert missing(dev_total) if id==3 & year==2001
assert missing(z_total) if id==3 & year==2001
assert missing(dev_raindays) if id==3 & year==2001
assert missing(z_raindays) if id==3 & year==2001
assert missing(dev_norain) if id==3 & year==2001
assert missing(z_norain) if id==3 & year==2001
assert missing(dev_pct_raindays) if id==3 & year==2001
assert missing(z_pct_raindays) if id==3 & year==2001
assert missing(dev_dry) if id==3 & year==2001
assert missing(z_dry) if id==3 & year==2001
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2002
assert missing(mean) if id==3 & year==2002
assert missing(median) if id==3 & year==2002
assert missing(var) if id==3 & year==2002
assert missing(sd) if id==3 & year==2002
assert missing(skew) if id==3 & year==2002
assert missing(mean_mo) if id==3 & year==2002
assert missing(total) if id==3 & year==2002
assert missing(raindays) if id==3 & year==2002
assert missing(norain) if id==3 & year==2002
assert missing(pct_raindays) if id==3 & year==2002
assert missing(dry_start) if id==3 & year==2002
assert missing(dry) if id==3 & year==2002
assert missing(dry_end) if id==3 & year==2002
assert missing(cut01) if id==3 & year==2002
assert missing(cut02) if id==3 & year==2002
assert missing(cut03) if id==3 & year==2002
assert missing(cut04) if id==3 & year==2002
assert missing(dev_mean_mo) if id==3 & year==2002
assert missing(z_mean_mo) if id==3 & year==2002
assert missing(dev_total) if id==3 & year==2002
assert missing(z_total) if id==3 & year==2002
assert missing(dev_raindays) if id==3 & year==2002
assert missing(z_raindays) if id==3 & year==2002
assert missing(dev_norain) if id==3 & year==2002
assert missing(z_norain) if id==3 & year==2002
assert missing(dev_pct_raindays) if id==3 & year==2002
assert missing(z_pct_raindays) if id==3 & year==2002
assert missing(dev_dry) if id==3 & year==2002
assert missing(z_dry) if id==3 & year==2002
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2003
assert missing(mean) if id==3 & year==2003
assert missing(median) if id==3 & year==2003
assert missing(var) if id==3 & year==2003
assert missing(sd) if id==3 & year==2003
assert missing(skew) if id==3 & year==2003
assert missing(mean_mo) if id==3 & year==2003
assert missing(total) if id==3 & year==2003
assert missing(raindays) if id==3 & year==2003
assert missing(norain) if id==3 & year==2003
assert missing(pct_raindays) if id==3 & year==2003
assert missing(dry_start) if id==3 & year==2003
assert missing(dry) if id==3 & year==2003
assert missing(dry_end) if id==3 & year==2003
assert missing(cut01) if id==3 & year==2003
assert missing(cut02) if id==3 & year==2003
assert missing(cut03) if id==3 & year==2003
assert missing(cut04) if id==3 & year==2003
assert missing(dev_mean_mo) if id==3 & year==2003
assert missing(z_mean_mo) if id==3 & year==2003
assert missing(dev_total) if id==3 & year==2003
assert missing(z_total) if id==3 & year==2003
assert missing(dev_raindays) if id==3 & year==2003
assert missing(z_raindays) if id==3 & year==2003
assert missing(dev_norain) if id==3 & year==2003
assert missing(z_norain) if id==3 & year==2003
assert missing(dev_pct_raindays) if id==3 & year==2003
assert missing(z_pct_raindays) if id==3 & year==2003
assert missing(dev_dry) if id==3 & year==2003
assert missing(z_dry) if id==3 & year==2003
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2004
assert missing(mean) if id==3 & year==2004
assert missing(median) if id==3 & year==2004
assert missing(var) if id==3 & year==2004
assert missing(sd) if id==3 & year==2004
assert missing(skew) if id==3 & year==2004
assert missing(mean_mo) if id==3 & year==2004
assert missing(total) if id==3 & year==2004
assert missing(raindays) if id==3 & year==2004
assert missing(norain) if id==3 & year==2004
assert missing(pct_raindays) if id==3 & year==2004
assert missing(dry_start) if id==3 & year==2004
assert missing(dry) if id==3 & year==2004
assert missing(dry_end) if id==3 & year==2004
assert missing(cut01) if id==3 & year==2004
assert missing(cut02) if id==3 & year==2004
assert missing(cut03) if id==3 & year==2004
assert missing(cut04) if id==3 & year==2004
assert missing(dev_mean_mo) if id==3 & year==2004
assert missing(z_mean_mo) if id==3 & year==2004
assert missing(dev_total) if id==3 & year==2004
assert missing(z_total) if id==3 & year==2004
assert missing(dev_raindays) if id==3 & year==2004
assert missing(z_raindays) if id==3 & year==2004
assert missing(dev_norain) if id==3 & year==2004
assert missing(z_norain) if id==3 & year==2004
assert missing(dev_pct_raindays) if id==3 & year==2004
assert missing(z_pct_raindays) if id==3 & year==2004
assert missing(dev_dry) if id==3 & year==2004
assert missing(z_dry) if id==3 & year==2004
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2005
assert missing(mean) if id==3 & year==2005
assert missing(median) if id==3 & year==2005
assert missing(var) if id==3 & year==2005
assert missing(sd) if id==3 & year==2005
assert missing(skew) if id==3 & year==2005
assert missing(mean_mo) if id==3 & year==2005
assert missing(total) if id==3 & year==2005
assert missing(raindays) if id==3 & year==2005
assert missing(norain) if id==3 & year==2005
assert missing(pct_raindays) if id==3 & year==2005
assert missing(dry_start) if id==3 & year==2005
assert missing(dry) if id==3 & year==2005
assert missing(dry_end) if id==3 & year==2005
assert missing(cut01) if id==3 & year==2005
assert missing(cut02) if id==3 & year==2005
assert missing(cut03) if id==3 & year==2005
assert missing(cut04) if id==3 & year==2005
assert missing(dev_mean_mo) if id==3 & year==2005
assert missing(z_mean_mo) if id==3 & year==2005
assert missing(dev_total) if id==3 & year==2005
assert missing(z_total) if id==3 & year==2005
assert missing(dev_raindays) if id==3 & year==2005
assert missing(z_raindays) if id==3 & year==2005
assert missing(dev_norain) if id==3 & year==2005
assert missing(z_norain) if id==3 & year==2005
assert missing(dev_pct_raindays) if id==3 & year==2005
assert missing(z_pct_raindays) if id==3 & year==2005
assert missing(dev_dry) if id==3 & year==2005
assert missing(z_dry) if id==3 & year==2005
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2000
assert !missing(mean) & abs(mean - (4.5666666666666664)) <= 1e-9 * max(1,abs(4.5666666666666664)) if id==4 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4 & year==2000
assert !missing(var) & abs(var - (52.145000000000003)) <= 1e-9 * max(1,abs(52.145000000000003)) if id==4 & year==2000
assert !missing(sd) & abs(sd - (7.2211494929824021)) <= 1e-9 * max(1,abs(7.2211494929824021)) if id==4 & year==2000
assert !missing(skew) & abs(skew - (1.4428458230183052)) <= 1e-9 * max(1,abs(1.4428458230183052)) if id==4 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (41.100000000000001)) <= 1e-9 * max(1,abs(41.100000000000001)) if id==4 & year==2000
assert !missing(total) & abs(total - (41.100000000000001)) <= 1e-9 * max(1,abs(41.100000000000001)) if id==4 & year==2000
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==4 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2000
assert missing(dev_mean_mo) if id==4 & year==2000
assert missing(z_mean_mo) if id==4 & year==2000
assert missing(dev_total) if id==4 & year==2000
assert missing(z_total) if id==4 & year==2000
assert missing(dev_raindays) if id==4 & year==2000
assert missing(z_raindays) if id==4 & year==2000
assert missing(dev_norain) if id==4 & year==2000
assert missing(z_norain) if id==4 & year==2000
assert missing(dev_pct_raindays) if id==4 & year==2000
assert missing(z_pct_raindays) if id==4 & year==2000
assert missing(dev_dry) if id==4 & year==2000
assert missing(z_dry) if id==4 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2001
assert !missing(mean) & abs(mean - (3.1899999999999999)) <= 1e-9 * max(1,abs(3.1899999999999999)) if id==4 & year==2001
assert !missing(median) & abs(median - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==4 & year==2001
assert !missing(var) & abs(var - (4.0054444444444446)) <= 1e-9 * max(1,abs(4.0054444444444446)) if id==4 & year==2001
assert !missing(sd) & abs(sd - (2.0013606482701825)) <= 1e-9 * max(1,abs(2.0013606482701825)) if id==4 & year==2001
assert !missing(skew) & abs(skew - (-0.34439245952164471)) <= 1e-9 * max(1,abs(-0.34439245952164471)) if id==4 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (31.899999999999999)) <= 1e-9 * max(1,abs(31.899999999999999)) if id==4 & year==2001
assert !missing(total) & abs(total - (31.899999999999999)) <= 1e-9 * max(1,abs(31.899999999999999)) if id==4 & year==2001
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2001
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==4 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2001
assert missing(dev_mean_mo) if id==4 & year==2001
assert missing(z_mean_mo) if id==4 & year==2001
assert missing(dev_total) if id==4 & year==2001
assert missing(z_total) if id==4 & year==2001
assert missing(dev_raindays) if id==4 & year==2001
assert missing(z_raindays) if id==4 & year==2001
assert missing(dev_norain) if id==4 & year==2001
assert missing(z_norain) if id==4 & year==2001
assert missing(dev_pct_raindays) if id==4 & year==2001
assert missing(z_pct_raindays) if id==4 & year==2001
assert missing(dev_dry) if id==4 & year==2001
assert missing(z_dry) if id==4 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2002
assert !missing(mean) & abs(mean - (1.1799999999999999)) <= 1e-9 * max(1,abs(1.1799999999999999)) if id==4 & year==2002
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==4 & year==2002
assert !missing(var) & abs(var - (2.1884444444444444)) <= 1e-9 * max(1,abs(2.1884444444444444)) if id==4 & year==2002
assert !missing(sd) & abs(sd - (1.4793391918165504)) <= 1e-9 * max(1,abs(1.4793391918165504)) if id==4 & year==2002
assert !missing(skew) & abs(skew - (2.2009698166863507)) <= 1e-9 * max(1,abs(2.2009698166863507)) if id==4 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (11.800000000000001)) <= 1e-9 * max(1,abs(11.800000000000001)) if id==4 & year==2002
assert !missing(total) & abs(total - (11.800000000000001)) <= 1e-9 * max(1,abs(11.800000000000001)) if id==4 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2002
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-24.699999999999999)) <= 1e-9 * max(1,abs(-24.699999999999999)) if id==4 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.7968559772408081)) <= 1e-9 * max(1,abs(-3.7968559772408081)) if id==4 & year==2002
assert !missing(dev_total) & abs(dev_total - (-24.699999999999999)) <= 1e-9 * max(1,abs(-24.699999999999999)) if id==4 & year==2002
assert !missing(z_total) & abs(z_total - (-3.7968559772408081)) <= 1e-9 * max(1,abs(-3.7968559772408081)) if id==4 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.35355339059327373)) <= 1e-9 * max(1,abs(-0.35355339059327373)) if id==4 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==4 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.12222222222222223)) <= 1e-9 * max(1,abs(-0.12222222222222223)) if id==4 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.4861359120657513)) <= 1e-9 * max(1,abs(-0.4861359120657513)) if id==4 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4 & year==2002
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(mean) & abs(mean - (5.7666666666666666)) <= 1e-9 * max(1,abs(5.7666666666666666)) if id==4 & year==2003
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2003
assert !missing(var) & abs(var - (44.814999999999998)) <= 1e-9 * max(1,abs(44.814999999999998)) if id==4 & year==2003
assert !missing(sd) & abs(sd - (6.6944006453154561)) <= 1e-9 * max(1,abs(6.6944006453154561)) if id==4 & year==2003
assert !missing(skew) & abs(skew - (1.2221542482611061)) <= 1e-9 * max(1,abs(1.2221542482611061)) if id==4 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (51.899999999999999)) <= 1e-9 * max(1,abs(51.899999999999999)) if id==4 & year==2003
assert !missing(total) & abs(total - (51.899999999999999)) <= 1e-9 * max(1,abs(51.899999999999999)) if id==4 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2003
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==4 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (30.049999999999997)) <= 1e-9 * max(1,abs(30.049999999999997)) if id==4 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.1142844551896274)) <= 1e-9 * max(1,abs(2.1142844551896274)) if id==4 & year==2003
assert !missing(dev_total) & abs(dev_total - (30.049999999999997)) <= 1e-9 * max(1,abs(30.049999999999997)) if id==4 & year==2003
assert !missing(z_total) & abs(z_total - (2.1142844551896274)) <= 1e-9 * max(1,abs(2.1142844551896274)) if id==4 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==4 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==4 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.016666666666666607)) <= 1e-9 * max(1,abs(0.016666666666666607)) if id==4 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.078567420131838331)) <= 1e-9 * max(1,abs(0.078567420131838331)) if id==4 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==4 & year==2004
assert !missing(mean) & abs(mean - (4.2272727272727275)) <= 1e-9 * max(1,abs(4.2272727272727275)) if id==4 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4 & year==2004
assert !missing(var) & abs(var - (41.548181818181817)) <= 1e-9 * max(1,abs(41.548181818181817)) if id==4 & year==2004
assert !missing(sd) & abs(sd - (6.4457879129072975)) <= 1e-9 * max(1,abs(6.4457879129072975)) if id==4 & year==2004
assert !missing(skew) & abs(skew - (1.7632666196023874)) <= 1e-9 * max(1,abs(1.7632666196023874)) if id==4 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (46.5)) <= 1e-9 * max(1,abs(46.5)) if id==4 & year==2004
assert !missing(total) & abs(total - (46.5)) <= 1e-9 * max(1,abs(46.5)) if id==4 & year==2004
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2004
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==4 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.649999999999999)) <= 1e-9 * max(1,abs(14.649999999999999)) if id==4 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.51666405707645491)) <= 1e-9 * max(1,abs(0.51666405707645491)) if id==4 & year==2004
assert !missing(dev_total) & abs(dev_total - (14.649999999999999)) <= 1e-9 * max(1,abs(14.649999999999999)) if id==4 & year==2004
assert !missing(z_total) & abs(z_total - (0.51666405707645491)) <= 1e-9 * max(1,abs(0.51666405707645491)) if id==4 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(z_norain) & abs(z_norain - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==4 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.12878787878787873)) <= 1e-9 * max(1,abs(-0.12878787878787873)) if id==4 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0928013891064823)) <= 1e-9 * max(1,abs(-1.0928013891064823)) if id==4 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2004
assert missing(z_dry) if id==4 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2005
assert !missing(mean) & abs(mean - (7.8099999999999996)) <= 1e-9 * max(1,abs(7.8099999999999996)) if id==4 & year==2005
assert !missing(median) & abs(median - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==4 & year==2005
assert !missing(var) & abs(var - (64.209888888888884)) <= 1e-9 * max(1,abs(64.209888888888884)) if id==4 & year==2005
assert !missing(sd) & abs(sd - (8.0131073179440744)) <= 1e-9 * max(1,abs(8.0131073179440744)) if id==4 & year==2005
assert !missing(skew) & abs(skew - (0.40058917182412229)) <= 1e-9 * max(1,abs(0.40058917182412229)) if id==4 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (78.099999999999994)) <= 1e-9 * max(1,abs(78.099999999999994)) if id==4 & year==2005
assert !missing(total) & abs(total - (78.099999999999994)) <= 1e-9 * max(1,abs(78.099999999999994)) if id==4 & year==2005
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2005
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==4 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2005
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2005
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2005
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2005
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (28.899999999999991)) <= 1e-9 * max(1,abs(28.899999999999991)) if id==4 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (7.5686614727004526)) <= 1e-9 * max(1,abs(7.5686614727004526)) if id==4 & year==2005
assert !missing(dev_total) & abs(dev_total - (28.899999999999991)) <= 1e-9 * max(1,abs(28.899999999999991)) if id==4 & year==2005
assert !missing(z_total) & abs(z_total - (7.5686614727004526)) <= 1e-9 * max(1,abs(7.5686614727004526)) if id==4 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==4 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==4 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==4 & year==2005
assert !missing(z_norain) & abs(z_norain - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==4 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.23939393939393949)) <= 1e-9 * max(1,abs(0.23939393939393949)) if id==4 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.596041020392494)) <= 1e-9 * max(1,abs(1.596041020392494)) if id==4 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==4 & year==2005
assert !missing(z_dry) & abs(z_dry - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==4 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2000
assert !missing(mean) & abs(mean - (1.3500000000000001)) <= 1e-9 * max(1,abs(1.3500000000000001)) if id==5 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2000
assert !missing(var) & abs(var - (2.0916666666666668)) <= 1e-9 * max(1,abs(2.0916666666666668)) if id==5 & year==2000
assert !missing(sd) & abs(sd - (1.4462595433277758)) <= 1e-9 * max(1,abs(1.4462595433277758)) if id==5 & year==2000
assert !missing(skew) & abs(skew - (2.0109575402852835)) <= 1e-9 * max(1,abs(2.0109575402852835)) if id==5 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (13.5)) <= 1e-9 * max(1,abs(13.5)) if id==5 & year==2000
assert !missing(total) & abs(total - (13.5)) <= 1e-9 * max(1,abs(13.5)) if id==5 & year==2000
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==5 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2000
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2000
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert missing(dev_mean_mo) if id==5 & year==2000
assert missing(z_mean_mo) if id==5 & year==2000
assert missing(dev_total) if id==5 & year==2000
assert missing(z_total) if id==5 & year==2000
assert missing(dev_raindays) if id==5 & year==2000
assert missing(z_raindays) if id==5 & year==2000
assert missing(dev_norain) if id==5 & year==2000
assert missing(z_norain) if id==5 & year==2000
assert missing(dev_pct_raindays) if id==5 & year==2000
assert missing(z_pct_raindays) if id==5 & year==2000
assert missing(dev_dry) if id==5 & year==2000
assert missing(z_dry) if id==5 & year==2000
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==5 & year==2001
assert !missing(mean) & abs(mean - (2.8363636363636364)) <= 1e-9 * max(1,abs(2.8363636363636364)) if id==5 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2001
assert !missing(var) & abs(var - (25.620545454545454)) <= 1e-9 * max(1,abs(25.620545454545454)) if id==5 & year==2001
assert !missing(sd) & abs(sd - (5.0616741750675196)) <= 1e-9 * max(1,abs(5.0616741750675196)) if id==5 & year==2001
assert !missing(skew) & abs(skew - (2.5836837822279044)) <= 1e-9 * max(1,abs(2.5836837822279044)) if id==5 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (31.199999999999999)) <= 1e-9 * max(1,abs(31.199999999999999)) if id==5 & year==2001
assert !missing(total) & abs(total - (31.199999999999999)) <= 1e-9 * max(1,abs(31.199999999999999)) if id==5 & year==2001
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==5 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert missing(dev_mean_mo) if id==5 & year==2001
assert missing(z_mean_mo) if id==5 & year==2001
assert missing(dev_total) if id==5 & year==2001
assert missing(z_total) if id==5 & year==2001
assert missing(dev_raindays) if id==5 & year==2001
assert missing(z_raindays) if id==5 & year==2001
assert missing(dev_norain) if id==5 & year==2001
assert missing(z_norain) if id==5 & year==2001
assert missing(dev_pct_raindays) if id==5 & year==2001
assert missing(z_pct_raindays) if id==5 & year==2001
assert missing(dev_dry) if id==5 & year==2001
assert missing(z_dry) if id==5 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2002
assert !missing(mean) & abs(mean - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==5 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2002
assert !missing(var) & abs(var - (3.7955555555555556)) <= 1e-9 * max(1,abs(3.7955555555555556)) if id==5 & year==2002
assert !missing(sd) & abs(sd - (1.948218559493661)) <= 1e-9 * max(1,abs(1.948218559493661)) if id==5 & year==2002
assert !missing(skew) & abs(skew - (1.3710507706441655)) <= 1e-9 * max(1,abs(1.3710507706441655)) if id==5 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2002
assert !missing(total) & abs(total - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2002
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==5 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.3500000000000014)) <= 1e-9 * max(1,abs(-7.3500000000000014)) if id==5 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.58725817420577686)) <= 1e-9 * max(1,abs(-0.58725817420577686)) if id==5 & year==2002
assert !missing(dev_total) & abs(dev_total - (-7.3500000000000014)) <= 1e-9 * max(1,abs(-7.3500000000000014)) if id==5 & year==2002
assert !missing(z_total) & abs(z_total - (-0.58725817420577686)) <= 1e-9 * max(1,abs(-0.58725817420577686)) if id==5 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2002
assert missing(z_norain) if id==5 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.068181818181818232)) <= 1e-9 * max(1,abs(0.068181818181818232)) if id==5 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.5152288168283168)) <= 1e-9 * max(1,abs(1.5152288168283168)) if id==5 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert missing(z_dry) if id==5 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2003
assert !missing(mean) & abs(mean - (3.21)) <= 1e-9 * max(1,abs(3.21)) if id==5 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(var) & abs(var - (26.978777777777779)) <= 1e-9 * max(1,abs(26.978777777777779)) if id==5 & year==2003
assert !missing(sd) & abs(sd - (5.1941099119847065)) <= 1e-9 * max(1,abs(5.1941099119847065)) if id==5 & year==2003
assert !missing(skew) & abs(skew - (2.4825276781536116)) <= 1e-9 * max(1,abs(2.4825276781536116)) if id==5 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (32.100000000000001)) <= 1e-9 * max(1,abs(32.100000000000001)) if id==5 & year==2003
assert !missing(total) & abs(total - (32.100000000000001)) <= 1e-9 * max(1,abs(32.100000000000001)) if id==5 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2003
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==5 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.78567420131838628)) <= 1e-9 * max(1,abs(0.78567420131838628)) if id==5 & year==2003
assert !missing(dev_total) & abs(dev_total - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2003
assert !missing(z_total) & abs(z_total - (0.78567420131838628)) <= 1e-9 * max(1,abs(0.78567420131838628)) if id==5 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert missing(z_raindays) if id==5 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==5 & year==2003
assert !missing(z_norain) & abs(z_norain - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==5 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.21818181818181814)) <= 1e-9 * max(1,abs(0.21818181818181814)) if id==5 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (8.485281374238566)) <= 1e-9 * max(1,abs(8.485281374238566)) if id==5 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==5 & year==2003
assert missing(z_dry) if id==5 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2004
assert !missing(mean) & abs(mean - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==5 & year==2004
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==5 & year==2004
assert !missing(var) & abs(var - (30.210000000000001)) <= 1e-9 * max(1,abs(30.210000000000001)) if id==5 & year==2004
assert !missing(sd) & abs(sd - (5.496362433464518)) <= 1e-9 * max(1,abs(5.496362433464518)) if id==5 & year==2004
assert !missing(skew) & abs(skew - (2.8809675513981352)) <= 1e-9 * max(1,abs(2.8809675513981352)) if id==5 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (22.5)) <= 1e-9 * max(1,abs(22.5)) if id==5 & year==2004
assert !missing(total) & abs(total - (22.5)) <= 1e-9 * max(1,abs(22.5)) if id==5 & year==2004
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2004
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==5 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2004
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.0500000000000007)) <= 1e-9 * max(1,abs(-1.0500000000000007)) if id==5 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.086837674882558516)) <= 1e-9 * max(1,abs(-0.086837674882558516)) if id==5 & year==2004
assert !missing(dev_total) & abs(dev_total - (-1.0500000000000007)) <= 1e-9 * max(1,abs(-1.0500000000000007)) if id==5 & year==2004
assert !missing(z_total) & abs(z_total - (-0.086837674882558516)) <= 1e-9 * max(1,abs(-0.086837674882558516)) if id==5 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==5 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==5 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.16666666666666669)) <= 1e-9 * max(1,abs(-0.16666666666666669)) if id==5 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.1785113019775795)) <= 1e-9 * max(1,abs(-1.1785113019775795)) if id==5 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2004
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==5 & year==2005
assert !missing(mean) & abs(mean - (3.6454545454545455)) <= 1e-9 * max(1,abs(3.6454545454545455)) if id==5 & year==2005
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2005
assert !missing(var) & abs(var - (43.732727272727274)) <= 1e-9 * max(1,abs(43.732727272727274)) if id==5 & year==2005
assert !missing(sd) & abs(sd - (6.6130724533099796)) <= 1e-9 * max(1,abs(6.6130724533099796)) if id==5 & year==2005
assert !missing(skew) & abs(skew - (1.9083107919280566)) <= 1e-9 * max(1,abs(1.9083107919280566)) if id==5 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (40.100000000000001)) <= 1e-9 * max(1,abs(40.100000000000001)) if id==5 & year==2005
assert !missing(total) & abs(total - (40.100000000000001)) <= 1e-9 * max(1,abs(40.100000000000001)) if id==5 & year==2005
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2005
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==5 & year==2005
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.800000000000001)) <= 1e-9 * max(1,abs(12.800000000000001)) if id==5 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.8856180831641267)) <= 1e-9 * max(1,abs(1.8856180831641267)) if id==5 & year==2005
assert !missing(dev_total) & abs(dev_total - (12.800000000000001)) <= 1e-9 * max(1,abs(12.800000000000001)) if id==5 & year==2005
assert !missing(z_total) & abs(z_total - (1.8856180831641267)) <= 1e-9 * max(1,abs(1.8856180831641267)) if id==5 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==5 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2005
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.012121212121212144)) <= 1e-9 * max(1,abs(-0.012121212121212144)) if id==5 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.064282434653322618)) <= 1e-9 * max(1,abs(-0.064282434653322618)) if id==5 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2000
assert !missing(mean) & abs(mean - (6.9000000000000004)) <= 1e-9 * max(1,abs(6.9000000000000004)) if id==6 & year==2000
assert !missing(median) & abs(median - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==6 & year==2000
assert !missing(var) & abs(var - (50.544444444444444)) <= 1e-9 * max(1,abs(50.544444444444444)) if id==6 & year==2000
assert !missing(sd) & abs(sd - (7.1094616142464995)) <= 1e-9 * max(1,abs(7.1094616142464995)) if id==6 & year==2000
assert !missing(skew) & abs(skew - (0.89417621164558037)) <= 1e-9 * max(1,abs(0.89417621164558037)) if id==6 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (69)) <= 1e-9 * max(1,abs(69)) if id==6 & year==2000
assert !missing(total) & abs(total - (69)) <= 1e-9 * max(1,abs(69)) if id==6 & year==2000
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2000
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2000
assert missing(dev_mean_mo) if id==6 & year==2000
assert missing(z_mean_mo) if id==6 & year==2000
assert missing(dev_total) if id==6 & year==2000
assert missing(z_total) if id==6 & year==2000
assert missing(dev_raindays) if id==6 & year==2000
assert missing(z_raindays) if id==6 & year==2000
assert missing(dev_norain) if id==6 & year==2000
assert missing(z_norain) if id==6 & year==2000
assert missing(dev_pct_raindays) if id==6 & year==2000
assert missing(z_pct_raindays) if id==6 & year==2000
assert missing(dev_dry) if id==6 & year==2000
assert missing(z_dry) if id==6 & year==2000
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==6 & year==2001
assert !missing(mean) & abs(mean - (2.7749999999999999)) <= 1e-9 * max(1,abs(2.7749999999999999)) if id==6 & year==2001
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==6 & year==2001
assert !missing(var) & abs(var - (23.316590909090909)) <= 1e-9 * max(1,abs(23.316590909090909)) if id==6 & year==2001
assert !missing(sd) & abs(sd - (4.8287255988605224)) <= 1e-9 * max(1,abs(4.8287255988605224)) if id==6 & year==2001
assert !missing(skew) & abs(skew - (2.7024312746338244)) <= 1e-9 * max(1,abs(2.7024312746338244)) if id==6 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (33.299999999999997)) <= 1e-9 * max(1,abs(33.299999999999997)) if id==6 & year==2001
assert !missing(total) & abs(total - (33.299999999999997)) <= 1e-9 * max(1,abs(33.299999999999997)) if id==6 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2001
assert missing(dev_mean_mo) if id==6 & year==2001
assert missing(z_mean_mo) if id==6 & year==2001
assert missing(dev_total) if id==6 & year==2001
assert missing(z_total) if id==6 & year==2001
assert missing(dev_raindays) if id==6 & year==2001
assert missing(z_raindays) if id==6 & year==2001
assert missing(dev_norain) if id==6 & year==2001
assert missing(z_norain) if id==6 & year==2001
assert missing(dev_pct_raindays) if id==6 & year==2001
assert missing(z_pct_raindays) if id==6 & year==2001
assert missing(dev_dry) if id==6 & year==2001
assert missing(z_dry) if id==6 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2002
assert !missing(mean) & abs(mean - (4.7000000000000002)) <= 1e-9 * max(1,abs(4.7000000000000002)) if id==6 & year==2002
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==6 & year==2002
assert !missing(var) & abs(var - (45.528888888888886)) <= 1e-9 * max(1,abs(45.528888888888886)) if id==6 & year==2002
assert !missing(sd) & abs(sd - (6.7475098287359971)) <= 1e-9 * max(1,abs(6.7475098287359971)) if id==6 & year==2002
assert !missing(skew) & abs(skew - (1.4750387178973636)) <= 1e-9 * max(1,abs(1.4750387178973636)) if id==6 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (47)) <= 1e-9 * max(1,abs(47)) if id==6 & year==2002
assert !missing(total) & abs(total - (47)) <= 1e-9 * max(1,abs(47)) if id==6 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2002
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.1499999999999986)) <= 1e-9 * max(1,abs(-4.1499999999999986)) if id==6 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.16439737489771264)) <= 1e-9 * max(1,abs(-0.16439737489771264)) if id==6 & year==2002
assert !missing(dev_total) & abs(dev_total - (-4.1499999999999986)) <= 1e-9 * max(1,abs(-4.1499999999999986)) if id==6 & year==2002
assert !missing(z_total) & abs(z_total - (-0.16439737489771264)) <= 1e-9 * max(1,abs(-0.16439737489771264)) if id==6 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-3)) <= 1e-9 * max(1,abs(-3)) if id==6 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-1.0606601717798212)) <= 1e-9 * max(1,abs(-1.0606601717798212)) if id==6 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.47140452079103173)) <= 1e-9 * max(1,abs(0.47140452079103173)) if id==6 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25)) <= 1e-9 * max(1,abs(-0.25)) if id==6 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==6 & year==2002
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==6 & year==2003
assert !missing(mean) & abs(mean - (4.2818181818181822)) <= 1e-9 * max(1,abs(4.2818181818181822)) if id==6 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(var) & abs(var - (41.283636363636361)) <= 1e-9 * max(1,abs(41.283636363636361)) if id==6 & year==2003
assert !missing(sd) & abs(sd - (6.4252343430910255)) <= 1e-9 * max(1,abs(6.4252343430910255)) if id==6 & year==2003
assert !missing(skew) & abs(skew - (1.7525821090322617)) <= 1e-9 * max(1,abs(1.7525821090322617)) if id==6 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (47.100000000000001)) <= 1e-9 * max(1,abs(47.100000000000001)) if id==6 & year==2003
assert !missing(total) & abs(total - (47.100000000000001)) <= 1e-9 * max(1,abs(47.100000000000001)) if id==6 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==6 & year==2003
assert !missing(dry_start) & abs(dry_start - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (6.9500000000000028)) <= 1e-9 * max(1,abs(6.9500000000000028)) if id==6 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.71742950791919802)) <= 1e-9 * max(1,abs(0.71742950791919802)) if id==6 & year==2003
assert !missing(dev_total) & abs(dev_total - (6.9500000000000028)) <= 1e-9 * max(1,abs(6.9500000000000028)) if id==6 & year==2003
assert !missing(z_total) & abs(z_total - (0.71742950791919802)) <= 1e-9 * max(1,abs(0.71742950791919802)) if id==6 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.045454545454545414)) <= 1e-9 * max(1,abs(0.045454545454545414)) if id==6 & year==2003
assert missing(z_pct_raindays) if id==6 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==6 & year==2004
assert !missing(mean) & abs(mean - (1.8666666666666667)) <= 1e-9 * max(1,abs(1.8666666666666667)) if id==6 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(var) & abs(var - (3.4075000000000002)) <= 1e-9 * max(1,abs(3.4075000000000002)) if id==6 & year==2004
assert !missing(sd) & abs(sd - (1.8459414941974732)) <= 1e-9 * max(1,abs(1.8459414941974732)) if id==6 & year==2004
assert !missing(skew) & abs(skew - (1.30980766588909)) <= 1e-9 * max(1,abs(1.30980766588909)) if id==6 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (16.800000000000001)) <= 1e-9 * max(1,abs(16.800000000000001)) if id==6 & year==2004
assert !missing(total) & abs(total - (16.800000000000001)) <= 1e-9 * max(1,abs(16.800000000000001)) if id==6 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2004
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==6 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-30.249999999999996)) <= 1e-9 * max(1,abs(-30.249999999999996)) if id==6 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-427.79960261785516)) <= 1e-9 * max(1,abs(-427.79960261785516)) if id==6 & year==2004
assert !missing(dev_total) & abs(dev_total - (-30.249999999999996)) <= 1e-9 * max(1,abs(-30.249999999999996)) if id==6 & year==2004
assert !missing(z_total) & abs(z_total - (-427.79960261785516)) <= 1e-9 * max(1,abs(-427.79960261785516)) if id==6 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==6 & year==2004
assert missing(z_norain) if id==6 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.14393939393939392)) <= 1e-9 * max(1,abs(0.14393939393939392)) if id==6 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (4.478342947514804)) <= 1e-9 * max(1,abs(4.478342947514804)) if id==6 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2004
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==6 & year==2005
assert !missing(mean) & abs(mean - (1.3545454545454545)) <= 1e-9 * max(1,abs(1.3545454545454545)) if id==6 & year==2005
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==6 & year==2005
assert !missing(var) & abs(var - (2.0287272727272727)) <= 1e-9 * max(1,abs(2.0287272727272727)) if id==6 & year==2005
assert !missing(sd) & abs(sd - (1.4243339751361943)) <= 1e-9 * max(1,abs(1.4243339751361943)) if id==6 & year==2005
assert !missing(skew) & abs(skew - (1.794110932609964)) <= 1e-9 * max(1,abs(1.794110932609964)) if id==6 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (14.9)) <= 1e-9 * max(1,abs(14.9)) if id==6 & year==2005
assert !missing(total) & abs(total - (14.9)) <= 1e-9 * max(1,abs(14.9)) if id==6 & year==2005
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2005
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==6 & year==2005
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2005
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-17.050000000000004)) <= 1e-9 * max(1,abs(-17.050000000000004)) if id==6 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.79578683955317742)) <= 1e-9 * max(1,abs(-0.79578683955317742)) if id==6 & year==2005
assert !missing(dev_total) & abs(dev_total - (-17.050000000000004)) <= 1e-9 * max(1,abs(-17.050000000000004)) if id==6 & year==2005
assert !missing(z_total) & abs(z_total - (-0.79578683955317742)) <= 1e-9 * max(1,abs(-0.79578683955317742)) if id==6 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2005
assert missing(z_raindays) if id==6 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2005
assert !missing(z_norain) & abs(z_norain - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==6 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.15151515151515144)) <= 1e-9 * max(1,abs(-0.15151515151515144)) if id==6 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.767766952966368)) <= 1e-9 * max(1,abs(-1.767766952966368)) if id==6 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2005
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2000
assert !missing(mean) & abs(mean - (3.3999999999999999)) <= 1e-9 * max(1,abs(3.3999999999999999)) if id==7 & year==2000
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==7 & year==2000
assert !missing(var) & abs(var - (32.60285714285714)) <= 1e-9 * max(1,abs(32.60285714285714)) if id==7 & year==2000
assert !missing(sd) & abs(sd - (5.709891167339106)) <= 1e-9 * max(1,abs(5.709891167339106)) if id==7 & year==2000
assert !missing(skew) & abs(skew - (2.4620029362330573)) <= 1e-9 * max(1,abs(2.4620029362330573)) if id==7 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (27.199999999999999)) <= 1e-9 * max(1,abs(27.199999999999999)) if id==7 & year==2000
assert !missing(total) & abs(total - (27.199999999999999)) <= 1e-9 * max(1,abs(27.199999999999999)) if id==7 & year==2000
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2000
assert missing(dev_mean_mo) if id==7 & year==2000
assert missing(z_mean_mo) if id==7 & year==2000
assert missing(dev_total) if id==7 & year==2000
assert missing(z_total) if id==7 & year==2000
assert missing(dev_raindays) if id==7 & year==2000
assert missing(z_raindays) if id==7 & year==2000
assert missing(dev_norain) if id==7 & year==2000
assert missing(z_norain) if id==7 & year==2000
assert missing(dev_pct_raindays) if id==7 & year==2000
assert missing(z_pct_raindays) if id==7 & year==2000
assert missing(dev_dry) if id==7 & year==2000
assert missing(z_dry) if id==7 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2001
assert !missing(mean) & abs(mean - (2.4199999999999999)) <= 1e-9 * max(1,abs(2.4199999999999999)) if id==7 & year==2001
assert !missing(median) & abs(median - (0.10000000000000001)) <= 1e-9 * max(1,abs(0.10000000000000001)) if id==7 & year==2001
assert !missing(var) & abs(var - (28.608444444444444)) <= 1e-9 * max(1,abs(28.608444444444444)) if id==7 & year==2001
assert !missing(sd) & abs(sd - (5.3486862353707423)) <= 1e-9 * max(1,abs(5.3486862353707423)) if id==7 & year==2001
assert !missing(skew) & abs(skew - (2.7493274359923658)) <= 1e-9 * max(1,abs(2.7493274359923658)) if id==7 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (24.199999999999999)) <= 1e-9 * max(1,abs(24.199999999999999)) if id==7 & year==2001
assert !missing(total) & abs(total - (24.199999999999999)) <= 1e-9 * max(1,abs(24.199999999999999)) if id==7 & year==2001
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==7 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2001
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2001
assert missing(dev_mean_mo) if id==7 & year==2001
assert missing(z_mean_mo) if id==7 & year==2001
assert missing(dev_total) if id==7 & year==2001
assert missing(z_total) if id==7 & year==2001
assert missing(dev_raindays) if id==7 & year==2001
assert missing(z_raindays) if id==7 & year==2001
assert missing(dev_norain) if id==7 & year==2001
assert missing(z_norain) if id==7 & year==2001
assert missing(dev_pct_raindays) if id==7 & year==2001
assert missing(z_pct_raindays) if id==7 & year==2001
assert missing(dev_dry) if id==7 & year==2001
assert missing(z_dry) if id==7 & year==2001
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==7 & year==2002
assert !missing(mean) & abs(mean - (6.1222222222222218)) <= 1e-9 * max(1,abs(6.1222222222222218)) if id==7 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(var) & abs(var - (66.939444444444447)) <= 1e-9 * max(1,abs(66.939444444444447)) if id==7 & year==2002
assert !missing(sd) & abs(sd - (8.1816529164004788)) <= 1e-9 * max(1,abs(8.1816529164004788)) if id==7 & year==2002
assert !missing(skew) & abs(skew - (0.83570058160497962)) <= 1e-9 * max(1,abs(0.83570058160497962)) if id==7 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (55.100000000000001)) <= 1e-9 * max(1,abs(55.100000000000001)) if id==7 & year==2002
assert !missing(total) & abs(total - (55.100000000000001)) <= 1e-9 * max(1,abs(55.100000000000001)) if id==7 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2002
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.55555555555555558)) <= 1e-9 * max(1,abs(0.55555555555555558)) if id==7 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (29.400000000000002)) <= 1e-9 * max(1,abs(29.400000000000002)) if id==7 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (13.859292911256334)) <= 1e-9 * max(1,abs(13.859292911256334)) if id==7 & year==2002
assert !missing(dev_total) & abs(dev_total - (29.400000000000002)) <= 1e-9 * max(1,abs(29.400000000000002)) if id==7 & year==2002
assert !missing(z_total) & abs(z_total - (13.859292911256334)) <= 1e-9 * max(1,abs(13.859292911256334)) if id==7 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert missing(z_raindays) if id==7 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.10555555555555557)) <= 1e-9 * max(1,abs(0.10555555555555557)) if id==7 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.4927809825049341)) <= 1e-9 * max(1,abs(1.4927809825049341)) if id==7 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7 & year==2002
assert !missing(z_dry) & abs(z_dry - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==7 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2003
assert !missing(mean) & abs(mean - (6.2999999999999998)) <= 1e-9 * max(1,abs(6.2999999999999998)) if id==7 & year==2003
assert !missing(median) & abs(median - (2.9500000000000002)) <= 1e-9 * max(1,abs(2.9500000000000002)) if id==7 & year==2003
assert !missing(var) & abs(var - (57.973333333333336)) <= 1e-9 * max(1,abs(57.973333333333336)) if id==7 & year==2003
assert !missing(sd) & abs(sd - (7.6140221521435922)) <= 1e-9 * max(1,abs(7.6140221521435922)) if id==7 & year==2003
assert !missing(skew) & abs(skew - (0.8271254947890293)) <= 1e-9 * max(1,abs(0.8271254947890293)) if id==7 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (63)) <= 1e-9 * max(1,abs(63)) if id==7 & year==2003
assert !missing(total) & abs(total - (63)) <= 1e-9 * max(1,abs(63)) if id==7 & year==2003
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2003
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (23.350000000000001)) <= 1e-9 * max(1,abs(23.350000000000001)) if id==7 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.0686694718903484)) <= 1e-9 * max(1,abs(1.0686694718903484)) if id==7 & year==2003
assert !missing(dev_total) & abs(dev_total - (23.350000000000001)) <= 1e-9 * max(1,abs(23.350000000000001)) if id==7 & year==2003
assert !missing(z_total) & abs(z_total - (1.0686694718903484)) <= 1e-9 * max(1,abs(1.0686694718903484)) if id==7 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.022222222222222199)) <= 1e-9 * max(1,abs(0.022222222222222199)) if id==7 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.20203050891044194)) <= 1e-9 * max(1,abs(0.20203050891044194)) if id==7 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==7 & year==2003
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2004
assert !missing(mean) & abs(mean - (5.1375000000000002)) <= 1e-9 * max(1,abs(5.1375000000000002)) if id==7 & year==2004
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==7 & year==2004
assert !missing(var) & abs(var - (56.24267857142857)) <= 1e-9 * max(1,abs(56.24267857142857)) if id==7 & year==2004
assert !missing(sd) & abs(sd - (7.4995118888784065)) <= 1e-9 * max(1,abs(7.4995118888784065)) if id==7 & year==2004
assert !missing(skew) & abs(skew - (1.2644739554002618)) <= 1e-9 * max(1,abs(1.2644739554002618)) if id==7 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (41.100000000000001)) <= 1e-9 * max(1,abs(41.100000000000001)) if id==7 & year==2004
assert !missing(total) & abs(total - (41.100000000000001)) <= 1e-9 * max(1,abs(41.100000000000001)) if id==7 & year==2004
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-17.949999999999996)) <= 1e-9 * max(1,abs(-17.949999999999996)) if id==7 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.2133080309616529)) <= 1e-9 * max(1,abs(-3.2133080309616529)) if id==7 & year==2004
assert !missing(dev_total) & abs(dev_total - (-17.949999999999996)) <= 1e-9 * max(1,abs(-17.949999999999996)) if id==7 & year==2004
assert !missing(z_total) & abs(z_total - (-3.2133080309616529)) <= 1e-9 * max(1,abs(-3.2133080309616529)) if id==7 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2004
assert missing(z_raindays) if id==7 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.02777777777777779)) <= 1e-9 * max(1,abs(-0.02777777777777779)) if id==7 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2004
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==7 & year==2005
assert !missing(mean) & abs(mean - (3.588888888888889)) <= 1e-9 * max(1,abs(3.588888888888889)) if id==7 & year==2005
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2005
assert !missing(var) & abs(var - (28.996111111111112)) <= 1e-9 * max(1,abs(28.996111111111112)) if id==7 & year==2005
assert !missing(sd) & abs(sd - (5.3848037207600346)) <= 1e-9 * max(1,abs(5.3848037207600346)) if id==7 & year==2005
assert !missing(skew) & abs(skew - (2.3325999891985316)) <= 1e-9 * max(1,abs(2.3325999891985316)) if id==7 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (32.299999999999997)) <= 1e-9 * max(1,abs(32.299999999999997)) if id==7 & year==2005
assert !missing(total) & abs(total - (32.299999999999997)) <= 1e-9 * max(1,abs(32.299999999999997)) if id==7 & year==2005
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2005
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.55555555555555558)) <= 1e-9 * max(1,abs(0.55555555555555558)) if id==7 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2005
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2005
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2005
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-19.75)) <= 1e-9 * max(1,abs(-19.75)) if id==7 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.2753752446058735)) <= 1e-9 * max(1,abs(-1.2753752446058735)) if id==7 & year==2005
assert !missing(dev_total) & abs(dev_total - (-19.75)) <= 1e-9 * max(1,abs(-19.75)) if id==7 & year==2005
assert !missing(z_total) & abs(z_total - (-1.2753752446058735)) <= 1e-9 * max(1,abs(-1.2753752446058735)) if id==7 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2005
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.05555555555555558)) <= 1e-9 * max(1,abs(0.05555555555555558)) if id==7 & year==2005
assert missing(z_pct_raindays) if id==7 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert missing(z_dry) if id==7 & year==2005
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==8 & year==2000
assert !missing(mean) & abs(mean - (5.1818181818181817)) <= 1e-9 * max(1,abs(5.1818181818181817)) if id==8 & year==2000
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2000
assert !missing(var) & abs(var - (38.529636363636364)) <= 1e-9 * max(1,abs(38.529636363636364)) if id==8 & year==2000
assert !missing(sd) & abs(sd - (6.2072245298229998)) <= 1e-9 * max(1,abs(6.2072245298229998)) if id==8 & year==2000
assert !missing(skew) & abs(skew - (1.4351828057557132)) <= 1e-9 * max(1,abs(1.4351828057557132)) if id==8 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (57)) <= 1e-9 * max(1,abs(57)) if id==8 & year==2000
assert !missing(total) & abs(total - (57)) <= 1e-9 * max(1,abs(57)) if id==8 & year==2000
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.63636363636363635)) <= 1e-9 * max(1,abs(0.63636363636363635)) if id==8 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2000
assert missing(dev_mean_mo) if id==8 & year==2000
assert missing(z_mean_mo) if id==8 & year==2000
assert missing(dev_total) if id==8 & year==2000
assert missing(z_total) if id==8 & year==2000
assert missing(dev_raindays) if id==8 & year==2000
assert missing(z_raindays) if id==8 & year==2000
assert missing(dev_norain) if id==8 & year==2000
assert missing(z_norain) if id==8 & year==2000
assert missing(dev_pct_raindays) if id==8 & year==2000
assert missing(z_pct_raindays) if id==8 & year==2000
assert missing(dev_dry) if id==8 & year==2000
assert missing(z_dry) if id==8 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2001
assert !missing(mean) & abs(mean - (4.3399999999999999)) <= 1e-9 * max(1,abs(4.3399999999999999)) if id==8 & year==2001
assert !missing(median) & abs(median - (1.1000000000000001)) <= 1e-9 * max(1,abs(1.1000000000000001)) if id==8 & year==2001
assert !missing(var) & abs(var - (46.969333333333331)) <= 1e-9 * max(1,abs(46.969333333333331)) if id==8 & year==2001
assert !missing(sd) & abs(sd - (6.8534176389107744)) <= 1e-9 * max(1,abs(6.8534176389107744)) if id==8 & year==2001
assert !missing(skew) & abs(skew - (1.5729864769790387)) <= 1e-9 * max(1,abs(1.5729864769790387)) if id==8 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (43.399999999999999)) <= 1e-9 * max(1,abs(43.399999999999999)) if id==8 & year==2001
assert !missing(total) & abs(total - (43.399999999999999)) <= 1e-9 * max(1,abs(43.399999999999999)) if id==8 & year==2001
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2001
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2001
assert missing(dev_mean_mo) if id==8 & year==2001
assert missing(z_mean_mo) if id==8 & year==2001
assert missing(dev_total) if id==8 & year==2001
assert missing(z_total) if id==8 & year==2001
assert missing(dev_raindays) if id==8 & year==2001
assert missing(z_raindays) if id==8 & year==2001
assert missing(dev_norain) if id==8 & year==2001
assert missing(z_norain) if id==8 & year==2001
assert missing(dev_pct_raindays) if id==8 & year==2001
assert missing(z_pct_raindays) if id==8 & year==2001
assert missing(dev_dry) if id==8 & year==2001
assert missing(z_dry) if id==8 & year==2001
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2002
assert !missing(mean) & abs(mean - (5.8499999999999996)) <= 1e-9 * max(1,abs(5.8499999999999996)) if id==8 & year==2002
assert !missing(median) & abs(median - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(var) & abs(var - (50.977142857142859)) <= 1e-9 * max(1,abs(50.977142857142859)) if id==8 & year==2002
assert !missing(sd) & abs(sd - (7.1398279290990523)) <= 1e-9 * max(1,abs(7.1398279290990523)) if id==8 & year==2002
assert !missing(skew) & abs(skew - (1.1588160695052545)) <= 1e-9 * max(1,abs(1.1588160695052545)) if id==8 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (46.799999999999997)) <= 1e-9 * max(1,abs(46.799999999999997)) if id==8 & year==2002
assert !missing(total) & abs(total - (46.799999999999997)) <= 1e-9 * max(1,abs(46.799999999999997)) if id==8 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2002
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==8 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.4000000000000057)) <= 1e-9 * max(1,abs(-3.4000000000000057)) if id==8 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.35355339059327434)) <= 1e-9 * max(1,abs(-0.35355339059327434)) if id==8 & year==2002
assert !missing(dev_total) & abs(dev_total - (-3.4000000000000057)) <= 1e-9 * max(1,abs(-3.4000000000000057)) if id==8 & year==2002
assert !missing(z_total) & abs(z_total - (-0.35355339059327434)) <= 1e-9 * max(1,abs(-0.35355339059327434)) if id==8 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==8 & year==2002
assert !missing(z_norain) & abs(z_norain - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==8 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.056818181818181879)) <= 1e-9 * max(1,abs(0.056818181818181879)) if id==8 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.58925565098879029)) <= 1e-9 * max(1,abs(0.58925565098879029)) if id==8 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert missing(z_dry) if id==8 & year==2002
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==8 & year==2003
assert !missing(mean) & abs(mean - (5.4272727272727277)) <= 1e-9 * max(1,abs(5.4272727272727277)) if id==8 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(var) & abs(var - (57.096181818181819)) <= 1e-9 * max(1,abs(57.096181818181819)) if id==8 & year==2003
assert !missing(sd) & abs(sd - (7.5562015469534574)) <= 1e-9 * max(1,abs(7.5562015469534574)) if id==8 & year==2003
assert !missing(skew) & abs(skew - (1.0799175839957291)) <= 1e-9 * max(1,abs(1.0799175839957291)) if id==8 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (59.700000000000003)) <= 1e-9 * max(1,abs(59.700000000000003)) if id==8 & year==2003
assert !missing(total) & abs(total - (59.700000000000003)) <= 1e-9 * max(1,abs(59.700000000000003)) if id==8 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==8 & year==2003
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.600000000000009)) <= 1e-9 * max(1,abs(14.600000000000009)) if id==8 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (6.0727994148962381)) <= 1e-9 * max(1,abs(6.0727994148962381)) if id==8 & year==2003
assert !missing(dev_total) & abs(dev_total - (14.600000000000009)) <= 1e-9 * max(1,abs(14.600000000000009)) if id==8 & year==2003
assert !missing(z_total) & abs(z_total - (6.0727994148962381)) <= 1e-9 * max(1,abs(6.0727994148962381)) if id==8 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert missing(z_raindays) if id==8 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.017045454545454586)) <= 1e-9 * max(1,abs(-0.017045454545454586)) if id==8 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.19284730395996796)) <= 1e-9 * max(1,abs(-0.19284730395996796)) if id==8 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(mean) & abs(mean - (2.1600000000000001)) <= 1e-9 * max(1,abs(2.1600000000000001)) if id==8 & year==2004
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8 & year==2004
assert !missing(var) & abs(var - (27.829333333333334)) <= 1e-9 * max(1,abs(27.829333333333334)) if id==8 & year==2004
assert !missing(sd) & abs(sd - (5.2753514890795037)) <= 1e-9 * max(1,abs(5.2753514890795037)) if id==8 & year==2004
assert !missing(skew) & abs(skew - (3.0323120851199712)) <= 1e-9 * max(1,abs(3.0323120851199712)) if id==8 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (21.600000000000001)) <= 1e-9 * max(1,abs(21.600000000000001)) if id==8 & year==2004
assert !missing(total) & abs(total - (21.600000000000001)) <= 1e-9 * max(1,abs(21.600000000000001)) if id==8 & year==2004
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==8 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-31.649999999999999)) <= 1e-9 * max(1,abs(-31.649999999999999)) if id==8 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.4697565309386387)) <= 1e-9 * max(1,abs(-3.4697565309386387)) if id==8 & year==2004
assert !missing(dev_total) & abs(dev_total - (-31.649999999999999)) <= 1e-9 * max(1,abs(-31.649999999999999)) if id==8 & year==2004
assert !missing(z_total) & abs(z_total - (-3.4697565309386387)) <= 1e-9 * max(1,abs(-3.4697565309386387)) if id==8 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==8 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.28522727272727272)) <= 1e-9 * max(1,abs(-0.28522727272727272)) if id==8 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-5.0709657736520946)) <= 1e-9 * max(1,abs(-5.0709657736520946)) if id==8 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2004
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2005
assert !missing(mean) & abs(mean - (3.2999999999999998)) <= 1e-9 * max(1,abs(3.2999999999999998)) if id==8 & year==2005
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==8 & year==2005
assert !missing(var) & abs(var - (33.231428571428573)) <= 1e-9 * max(1,abs(33.231428571428573)) if id==8 & year==2005
assert !missing(sd) & abs(sd - (5.7646707253258249)) <= 1e-9 * max(1,abs(5.7646707253258249)) if id==8 & year==2005
assert !missing(skew) & abs(skew - (2.4430413644624638)) <= 1e-9 * max(1,abs(2.4430413644624638)) if id==8 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (26.399999999999999)) <= 1e-9 * max(1,abs(26.399999999999999)) if id==8 & year==2005
assert !missing(total) & abs(total - (26.399999999999999)) <= 1e-9 * max(1,abs(26.399999999999999)) if id==8 & year==2005
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2005
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==8 & year==2005
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2005
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-14.250000000000007)) <= 1e-9 * max(1,abs(-14.250000000000007)) if id==8 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.5289381434072602)) <= 1e-9 * max(1,abs(-0.5289381434072602)) if id==8 & year==2005
assert !missing(dev_total) & abs(dev_total - (-14.250000000000007)) <= 1e-9 * max(1,abs(-14.250000000000007)) if id==8 & year==2005
assert !missing(z_total) & abs(z_total - (-0.5289381434072602)) <= 1e-9 * max(1,abs(-0.5289381434072602)) if id==8 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==8 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==8 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2005
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.047727272727272729)) <= 1e-9 * max(1,abs(-0.047727272727272729)) if id==8 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.27498597046143519)) <= 1e-9 * max(1,abs(-0.27498597046143519)) if id==8 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert missing(z_dry) if id==8 & year==2005
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==9 & year==2000
assert !missing(mean) & abs(mean - (1.0777777777777777)) <= 1e-9 * max(1,abs(1.0777777777777777)) if id==9 & year==2000
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9 & year==2000
assert !missing(var) & abs(var - (2.5644444444444443)) <= 1e-9 * max(1,abs(2.5644444444444443)) if id==9 & year==2000
assert !missing(sd) & abs(sd - (1.6013882865952418)) <= 1e-9 * max(1,abs(1.6013882865952418)) if id==9 & year==2000
assert !missing(skew) & abs(skew - (2.2369447578325672)) <= 1e-9 * max(1,abs(2.2369447578325672)) if id==9 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (9.6999999999999993)) <= 1e-9 * max(1,abs(9.6999999999999993)) if id==9 & year==2000
assert !missing(total) & abs(total - (9.6999999999999993)) <= 1e-9 * max(1,abs(9.6999999999999993)) if id==9 & year==2000
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==9 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert missing(dev_mean_mo) if id==9 & year==2000
assert missing(z_mean_mo) if id==9 & year==2000
assert missing(dev_total) if id==9 & year==2000
assert missing(z_total) if id==9 & year==2000
assert missing(dev_raindays) if id==9 & year==2000
assert missing(z_raindays) if id==9 & year==2000
assert missing(dev_norain) if id==9 & year==2000
assert missing(z_norain) if id==9 & year==2000
assert missing(dev_pct_raindays) if id==9 & year==2000
assert missing(z_pct_raindays) if id==9 & year==2000
assert missing(dev_dry) if id==9 & year==2000
assert missing(z_dry) if id==9 & year==2000
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(mean) & abs(mean - (2.8624999999999998)) <= 1e-9 * max(1,abs(2.8624999999999998)) if id==9 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(var) & abs(var - (33.036964285714284)) <= 1e-9 * max(1,abs(33.036964285714284)) if id==9 & year==2001
assert !missing(sd) & abs(sd - (5.7477790741915511)) <= 1e-9 * max(1,abs(5.7477790741915511)) if id==9 & year==2001
assert !missing(skew) & abs(skew - (2.7596588777378228)) <= 1e-9 * max(1,abs(2.7596588777378228)) if id==9 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (22.899999999999999)) <= 1e-9 * max(1,abs(22.899999999999999)) if id==9 & year==2001
assert !missing(total) & abs(total - (22.899999999999999)) <= 1e-9 * max(1,abs(22.899999999999999)) if id==9 & year==2001
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2001
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==9 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert missing(dev_mean_mo) if id==9 & year==2001
assert missing(z_mean_mo) if id==9 & year==2001
assert missing(dev_total) if id==9 & year==2001
assert missing(z_total) if id==9 & year==2001
assert missing(dev_raindays) if id==9 & year==2001
assert missing(z_raindays) if id==9 & year==2001
assert missing(dev_norain) if id==9 & year==2001
assert missing(z_norain) if id==9 & year==2001
assert missing(dev_pct_raindays) if id==9 & year==2001
assert missing(z_pct_raindays) if id==9 & year==2001
assert missing(dev_dry) if id==9 & year==2001
assert missing(z_dry) if id==9 & year==2001
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2002
assert !missing(mean) & abs(mean - (1.2749999999999999)) <= 1e-9 * max(1,abs(1.2749999999999999)) if id==9 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==9 & year==2002
assert !missing(var) & abs(var - (2.6707142857142858)) <= 1e-9 * max(1,abs(2.6707142857142858)) if id==9 & year==2002
assert !missing(sd) & abs(sd - (1.6342320170998628)) <= 1e-9 * max(1,abs(1.6342320170998628)) if id==9 & year==2002
assert !missing(skew) & abs(skew - (2.0679191897079154)) <= 1e-9 * max(1,abs(2.0679191897079154)) if id==9 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (10.199999999999999)) <= 1e-9 * max(1,abs(10.199999999999999)) if id==9 & year==2002
assert !missing(total) & abs(total - (10.199999999999999)) <= 1e-9 * max(1,abs(10.199999999999999)) if id==9 & year==2002
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2002
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==9 & year==2002
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-6.0999999999999979)) <= 1e-9 * max(1,abs(-6.0999999999999979)) if id==9 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.65353808564211191)) <= 1e-9 * max(1,abs(-0.65353808564211191)) if id==9 & year==2002
assert !missing(dev_total) & abs(dev_total - (-6.0999999999999979)) <= 1e-9 * max(1,abs(-6.0999999999999979)) if id==9 & year==2002
assert !missing(z_total) & abs(z_total - (-0.65353808564211191)) <= 1e-9 * max(1,abs(-0.65353808564211191)) if id==9 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==9 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.10416666666666663)) <= 1e-9 * max(1,abs(-0.10416666666666663)) if id==9 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.50507627227610519)) <= 1e-9 * max(1,abs(-0.50507627227610519)) if id==9 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2002
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2003
assert !missing(mean) & abs(mean - (2.5090909090909093)) <= 1e-9 * max(1,abs(2.5090909090909093)) if id==9 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(var) & abs(var - (23.786909090909091)) <= 1e-9 * max(1,abs(23.786909090909091)) if id==9 & year==2003
assert !missing(sd) & abs(sd - (4.8771824951409286)) <= 1e-9 * max(1,abs(4.8771824951409286)) if id==9 & year==2003
assert !missing(skew) & abs(skew - (3.1424017473917969)) <= 1e-9 * max(1,abs(3.1424017473917969)) if id==9 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (27.600000000000001)) <= 1e-9 * max(1,abs(27.600000000000001)) if id==9 & year==2003
assert !missing(total) & abs(total - (27.600000000000001)) <= 1e-9 * max(1,abs(27.600000000000001)) if id==9 & year==2003
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==9 & year==2003
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.63636363636363635)) <= 1e-9 * max(1,abs(0.63636363636363635)) if id==9 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(cut03) & abs(cut03 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (11.050000000000004)) <= 1e-9 * max(1,abs(11.050000000000004)) if id==9 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2304771546632052)) <= 1e-9 * max(1,abs(1.2304771546632052)) if id==9 & year==2003
assert !missing(dev_total) & abs(dev_total - (11.050000000000004)) <= 1e-9 * max(1,abs(11.050000000000004)) if id==9 & year==2003
assert !missing(z_total) & abs(z_total - (1.2304771546632052)) <= 1e-9 * max(1,abs(1.2304771546632052)) if id==9 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==9 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.13636363636363635)) <= 1e-9 * max(1,abs(0.13636363636363635)) if id==9 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.77138921583986997)) <= 1e-9 * max(1,abs(0.77138921583986997)) if id==9 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2003
assert missing(z_dry) if id==9 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2004
assert !missing(mean) & abs(mean - (3.7000000000000002)) <= 1e-9 * max(1,abs(3.7000000000000002)) if id==9 & year==2004
assert !missing(median) & abs(median - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==9 & year==2004
assert !missing(var) & abs(var - (25.973333333333333)) <= 1e-9 * max(1,abs(25.973333333333333)) if id==9 & year==2004
assert !missing(sd) & abs(sd - (5.0964039609643716)) <= 1e-9 * max(1,abs(5.0964039609643716)) if id==9 & year==2004
assert !missing(skew) & abs(skew - (2.3053961321470404)) <= 1e-9 * max(1,abs(2.3053961321470404)) if id==9 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (37)) <= 1e-9 * max(1,abs(37)) if id==9 & year==2004
assert !missing(total) & abs(total - (37)) <= 1e-9 * max(1,abs(37)) if id==9 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2004
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==9 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (18.100000000000001)) <= 1e-9 * max(1,abs(18.100000000000001)) if id==9 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.4711072114340815)) <= 1e-9 * max(1,abs(1.4711072114340815)) if id==9 & year==2004
assert !missing(dev_total) & abs(dev_total - (18.100000000000001)) <= 1e-9 * max(1,abs(18.100000000000001)) if id==9 & year==2004
assert !missing(z_total) & abs(z_total - (1.4711072114340815)) <= 1e-9 * max(1,abs(1.4711072114340815)) if id==9 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==9 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.094318181818181857)) <= 1e-9 * max(1,abs(0.094318181818181857)) if id==9 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.51034663337811714)) <= 1e-9 * max(1,abs(0.51034663337811714)) if id==9 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2005
assert !missing(mean) & abs(mean - (4.8899999999999997)) <= 1e-9 * max(1,abs(4.8899999999999997)) if id==9 & year==2005
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2005
assert !missing(var) & abs(var - (44.187666666666665)) <= 1e-9 * max(1,abs(44.187666666666665)) if id==9 & year==2005
assert !missing(sd) & abs(sd - (6.6473804364325852)) <= 1e-9 * max(1,abs(6.6473804364325852)) if id==9 & year==2005
assert !missing(skew) & abs(skew - (1.4607643339166845)) <= 1e-9 * max(1,abs(1.4607643339166845)) if id==9 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (48.899999999999999)) <= 1e-9 * max(1,abs(48.899999999999999)) if id==9 & year==2005
assert !missing(total) & abs(total - (48.899999999999999)) <= 1e-9 * max(1,abs(48.899999999999999)) if id==9 & year==2005
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2005
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==9 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2005
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2005
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (16.600000000000001)) <= 1e-9 * max(1,abs(16.600000000000001)) if id==9 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.4974409718503598)) <= 1e-9 * max(1,abs(2.4974409718503598)) if id==9 & year==2005
assert !missing(dev_total) & abs(dev_total - (16.600000000000001)) <= 1e-9 * max(1,abs(16.600000000000001)) if id==9 & year==2005
assert !missing(z_total) & abs(z_total - (2.4974409718503598)) <= 1e-9 * max(1,abs(2.4974409718503598)) if id==9 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert missing(z_norain) if id==9 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.018181818181818188)) <= 1e-9 * max(1,abs(-0.018181818181818188)) if id==9 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==9 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9 & year==2005
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2005
assert !missing(nobs) & abs(nobs - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(mean) & abs(mean - (1.4833333333333334)) <= 1e-9 * max(1,abs(1.4833333333333334)) if id==10 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2000
assert !missing(var) & abs(var - (3.0536666666666665)) <= 1e-9 * max(1,abs(3.0536666666666665)) if id==10 & year==2000
assert !missing(sd) & abs(sd - (1.7474743679569857)) <= 1e-9 * max(1,abs(1.7474743679569857)) if id==10 & year==2000
assert !missing(skew) & abs(skew - (2.2863692638794033)) <= 1e-9 * max(1,abs(2.2863692638794033)) if id==10 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (8.9000000000000004)) <= 1e-9 * max(1,abs(8.9000000000000004)) if id==10 & year==2000
assert !missing(total) & abs(total - (8.9000000000000004)) <= 1e-9 * max(1,abs(8.9000000000000004)) if id==10 & year==2000
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10 & year==2000
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert missing(dev_mean_mo) if id==10 & year==2000
assert missing(z_mean_mo) if id==10 & year==2000
assert missing(dev_total) if id==10 & year==2000
assert missing(z_total) if id==10 & year==2000
assert missing(dev_raindays) if id==10 & year==2000
assert missing(z_raindays) if id==10 & year==2000
assert missing(dev_norain) if id==10 & year==2000
assert missing(z_norain) if id==10 & year==2000
assert missing(dev_pct_raindays) if id==10 & year==2000
assert missing(z_pct_raindays) if id==10 & year==2000
assert missing(dev_dry) if id==10 & year==2000
assert missing(z_dry) if id==10 & year==2000
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2001
assert !missing(mean) & abs(mean - (2.7749999999999999)) <= 1e-9 * max(1,abs(2.7749999999999999)) if id==10 & year==2001
assert !missing(median) & abs(median - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==10 & year==2001
assert !missing(var) & abs(var - (33.776428571428575)) <= 1e-9 * max(1,abs(33.776428571428575)) if id==10 & year==2001
assert !missing(sd) & abs(sd - (5.811749183458331)) <= 1e-9 * max(1,abs(5.811749183458331)) if id==10 & year==2001
assert !missing(skew) & abs(skew - (2.7079357496527514)) <= 1e-9 * max(1,abs(2.7079357496527514)) if id==10 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (22.199999999999999)) <= 1e-9 * max(1,abs(22.199999999999999)) if id==10 & year==2001
assert !missing(total) & abs(total - (22.199999999999999)) <= 1e-9 * max(1,abs(22.199999999999999)) if id==10 & year==2001
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2001
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert missing(dev_mean_mo) if id==10 & year==2001
assert missing(z_mean_mo) if id==10 & year==2001
assert missing(dev_total) if id==10 & year==2001
assert missing(z_total) if id==10 & year==2001
assert missing(dev_raindays) if id==10 & year==2001
assert missing(z_raindays) if id==10 & year==2001
assert missing(dev_norain) if id==10 & year==2001
assert missing(z_norain) if id==10 & year==2001
assert missing(dev_pct_raindays) if id==10 & year==2001
assert missing(z_pct_raindays) if id==10 & year==2001
assert missing(dev_dry) if id==10 & year==2001
assert missing(z_dry) if id==10 & year==2001
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==10 & year==2002
assert !missing(mean) & abs(mean - (3.7545454545454544)) <= 1e-9 * max(1,abs(3.7545454545454544)) if id==10 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2002
assert !missing(var) & abs(var - (23.982727272727274)) <= 1e-9 * max(1,abs(23.982727272727274)) if id==10 & year==2002
assert !missing(sd) & abs(sd - (4.897216277920271)) <= 1e-9 * max(1,abs(4.897216277920271)) if id==10 & year==2002
assert !missing(skew) & abs(skew - (2.2261752322191137)) <= 1e-9 * max(1,abs(2.2261752322191137)) if id==10 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (41.299999999999997)) <= 1e-9 * max(1,abs(41.299999999999997)) if id==10 & year==2002
assert !missing(total) & abs(total - (41.299999999999997)) <= 1e-9 * max(1,abs(41.299999999999997)) if id==10 & year==2002
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2002
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.63636363636363635)) <= 1e-9 * max(1,abs(0.63636363636363635)) if id==10 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (25.749999999999996)) <= 1e-9 * max(1,abs(25.749999999999996)) if id==10 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.738045054970466)) <= 1e-9 * max(1,abs(2.738045054970466)) if id==10 & year==2002
assert !missing(dev_total) & abs(dev_total - (25.749999999999996)) <= 1e-9 * max(1,abs(25.749999999999996)) if id==10 & year==2002
assert !missing(z_total) & abs(z_total - (2.738045054970466)) <= 1e-9 * max(1,abs(2.738045054970466)) if id==10 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (2.8284271247461898)) <= 1e-9 * max(1,abs(2.8284271247461898)) if id==10 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert missing(z_norain) if id==10 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.21969696969696972)) <= 1e-9 * max(1,abs(0.21969696969696972)) if id==10 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.8641906049463526)) <= 1e-9 * max(1,abs(1.8641906049463526)) if id==10 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert missing(z_dry) if id==10 & year==2002
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2003
assert !missing(mean) & abs(mean - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==10 & year==2003
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==10 & year==2003
assert !missing(var) & abs(var - (0.2175)) <= 1e-9 * max(1,abs(0.2175)) if id==10 & year==2003
assert !missing(sd) & abs(sd - (0.46636895265444073)) <= 1e-9 * max(1,abs(0.46636895265444073)) if id==10 & year==2003
assert !missing(skew) & abs(skew - (0.19540967383743046)) <= 1e-9 * max(1,abs(0.19540967383743046)) if id==10 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (4.2000000000000002)) <= 1e-9 * max(1,abs(4.2000000000000002)) if id==10 & year==2003
assert !missing(total) & abs(total - (4.2000000000000002)) <= 1e-9 * max(1,abs(4.2000000000000002)) if id==10 & year==2003
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==10 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-27.550000000000001)) <= 1e-9 * max(1,abs(-27.550000000000001)) if id==10 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.0398734891821348)) <= 1e-9 * max(1,abs(-2.0398734891821348)) if id==10 & year==2003
assert !missing(dev_total) & abs(dev_total - (-27.550000000000001)) <= 1e-9 * max(1,abs(-27.550000000000001)) if id==10 & year==2003
assert !missing(z_total) & abs(z_total - (-2.0398734891821348)) <= 1e-9 * max(1,abs(-2.0398734891821348)) if id==10 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==10 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==10 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert missing(z_norain) if id==10 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.34595959595959591)) <= 1e-9 * max(1,abs(-0.34595959595959591)) if id==10 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.5879121860206298)) <= 1e-9 * max(1,abs(-3.5879121860206298)) if id==10 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert missing(z_dry) if id==10 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2004
assert !missing(mean) & abs(mean - (4.5333333333333332)) <= 1e-9 * max(1,abs(4.5333333333333332)) if id==10 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(var) & abs(var - (50.207500000000003)) <= 1e-9 * max(1,abs(50.207500000000003)) if id==10 & year==2004
assert !missing(sd) & abs(sd - (7.0857250863972983)) <= 1e-9 * max(1,abs(7.0857250863972983)) if id==10 & year==2004
assert !missing(skew) & abs(skew - (1.5980315497093596)) <= 1e-9 * max(1,abs(1.5980315497093596)) if id==10 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (40.799999999999997)) <= 1e-9 * max(1,abs(40.799999999999997)) if id==10 & year==2004
assert !missing(total) & abs(total - (40.799999999999997)) <= 1e-9 * max(1,abs(40.799999999999997)) if id==10 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2004
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==10 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (18.049999999999997)) <= 1e-9 * max(1,abs(18.049999999999997)) if id==10 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.68804729921386421)) <= 1e-9 * max(1,abs(0.68804729921386421)) if id==10 & year==2004
assert !missing(dev_total) & abs(dev_total - (18.049999999999997)) <= 1e-9 * max(1,abs(18.049999999999997)) if id==10 & year==2004
assert !missing(z_total) & abs(z_total - (0.68804729921386421)) <= 1e-9 * max(1,abs(0.68804729921386421)) if id==10 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.42426406871192851)) <= 1e-9 * max(1,abs(0.42426406871192851)) if id==10 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==10 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==10 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.23737373737373735)) <= 1e-9 * max(1,abs(0.23737373737373735)) if id==10 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.81058582233579823)) <= 1e-9 * max(1,abs(0.81058582233579823)) if id==10 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2004
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==10 & year==2005
assert !missing(mean) & abs(mean - (3.6916666666666669)) <= 1e-9 * max(1,abs(3.6916666666666669)) if id==10 & year==2005
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2005
assert !missing(var) & abs(var - (40.364469696969699)) <= 1e-9 * max(1,abs(40.364469696969699)) if id==10 & year==2005
assert !missing(sd) & abs(sd - (6.3533038410711713)) <= 1e-9 * max(1,abs(6.3533038410711713)) if id==10 & year==2005
assert !missing(skew) & abs(skew - (1.8862200206015838)) <= 1e-9 * max(1,abs(1.8862200206015838)) if id==10 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (44.299999999999997)) <= 1e-9 * max(1,abs(44.299999999999997)) if id==10 & year==2005
assert !missing(total) & abs(total - (44.299999999999997)) <= 1e-9 * max(1,abs(44.299999999999997)) if id==10 & year==2005
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2005
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==10 & year==2005
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2005
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2005
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2005
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (21.799999999999997)) <= 1e-9 * max(1,abs(21.799999999999997)) if id==10 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.84234578305282704)) <= 1e-9 * max(1,abs(0.84234578305282704)) if id==10 & year==2005
assert !missing(dev_total) & abs(dev_total - (21.799999999999997)) <= 1e-9 * max(1,abs(21.799999999999997)) if id==10 & year==2005
assert !missing(z_total) & abs(z_total - (0.84234578305282704)) <= 1e-9 * max(1,abs(0.84234578305282704)) if id==10 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==10 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2005
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.027777777777777735)) <= 1e-9 * max(1,abs(-0.027777777777777735)) if id==10 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.088388347648318308)) <= 1e-9 * max(1,abs(-0.088388347648318308)) if id==10 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==11 & year==2000
assert !missing(mean) & abs(mean - (2.3399999999999999)) <= 1e-9 * max(1,abs(2.3399999999999999)) if id==11 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==11 & year==2000
assert !missing(var) & abs(var - (26.887111111111111)) <= 1e-9 * max(1,abs(26.887111111111111)) if id==11 & year==2000
assert !missing(sd) & abs(sd - (5.185278306042127)) <= 1e-9 * max(1,abs(5.185278306042127)) if id==11 & year==2000
assert !missing(skew) & abs(skew - (3.0858880785021325)) <= 1e-9 * max(1,abs(3.0858880785021325)) if id==11 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (23.399999999999999)) <= 1e-9 * max(1,abs(23.399999999999999)) if id==11 & year==2000
assert !missing(total) & abs(total - (23.399999999999999)) <= 1e-9 * max(1,abs(23.399999999999999)) if id==11 & year==2000
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==11 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2000
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2000
assert missing(dev_mean_mo) if id==11 & year==2000
assert missing(z_mean_mo) if id==11 & year==2000
assert missing(dev_total) if id==11 & year==2000
assert missing(z_total) if id==11 & year==2000
assert missing(dev_raindays) if id==11 & year==2000
assert missing(z_raindays) if id==11 & year==2000
assert missing(dev_norain) if id==11 & year==2000
assert missing(z_norain) if id==11 & year==2000
assert missing(dev_pct_raindays) if id==11 & year==2000
assert missing(z_pct_raindays) if id==11 & year==2000
assert missing(dev_dry) if id==11 & year==2000
assert missing(z_dry) if id==11 & year==2000
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2001
assert !missing(mean) & abs(mean - (2.7000000000000002)) <= 1e-9 * max(1,abs(2.7000000000000002)) if id==11 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==11 & year==2001
assert !missing(var) & abs(var - (29.535)) <= 1e-9 * max(1,abs(29.535)) if id==11 & year==2001
assert !missing(sd) & abs(sd - (5.4346113016479842)) <= 1e-9 * max(1,abs(5.4346113016479842)) if id==11 & year==2001
assert !missing(skew) & abs(skew - (2.8503310105039881)) <= 1e-9 * max(1,abs(2.8503310105039881)) if id==11 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (24.300000000000001)) <= 1e-9 * max(1,abs(24.300000000000001)) if id==11 & year==2001
assert !missing(total) & abs(total - (24.300000000000001)) <= 1e-9 * max(1,abs(24.300000000000001)) if id==11 & year==2001
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2001
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==11 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2001
assert missing(dev_mean_mo) if id==11 & year==2001
assert missing(z_mean_mo) if id==11 & year==2001
assert missing(dev_total) if id==11 & year==2001
assert missing(z_total) if id==11 & year==2001
assert missing(dev_raindays) if id==11 & year==2001
assert missing(z_raindays) if id==11 & year==2001
assert missing(dev_norain) if id==11 & year==2001
assert missing(z_norain) if id==11 & year==2001
assert missing(dev_pct_raindays) if id==11 & year==2001
assert missing(z_pct_raindays) if id==11 & year==2001
assert missing(dev_dry) if id==11 & year==2001
assert missing(z_dry) if id==11 & year==2001
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2002
assert !missing(mean) & abs(mean - (3.8888888888888888)) <= 1e-9 * max(1,abs(3.8888888888888888)) if id==11 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(var) & abs(var - (29.111111111111111)) <= 1e-9 * max(1,abs(29.111111111111111)) if id==11 & year==2002
assert !missing(sd) & abs(sd - (5.3954713520795483)) <= 1e-9 * max(1,abs(5.3954713520795483)) if id==11 & year==2002
assert !missing(skew) & abs(skew - (2.0982447853906838)) <= 1e-9 * max(1,abs(2.0982447853906838)) if id==11 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (35)) <= 1e-9 * max(1,abs(35)) if id==11 & year==2002
assert !missing(total) & abs(total - (35)) <= 1e-9 * max(1,abs(35)) if id==11 & year==2002
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2002
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==11 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (11.149999999999999)) <= 1e-9 * max(1,abs(11.149999999999999)) if id==11 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (17.520534689399966)) <= 1e-9 * max(1,abs(17.520534689399966)) if id==11 & year==2002
assert !missing(dev_total) & abs(dev_total - (11.149999999999999)) <= 1e-9 * max(1,abs(11.149999999999999)) if id==11 & year==2002
assert !missing(z_total) & abs(z_total - (17.520534689399966)) <= 1e-9 * max(1,abs(17.520534689399966)) if id==11 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert missing(z_raindays) if id==11 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==11 & year==2002
assert !missing(z_norain) & abs(z_norain - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==11 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.24444444444444441)) <= 1e-9 * max(1,abs(0.24444444444444441)) if id==11 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (7.7781745930520296)) <= 1e-9 * max(1,abs(7.7781745930520296)) if id==11 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11 & year==2002
assert !missing(z_dry) & abs(z_dry - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==11 & year==2002
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2003
assert !missing(mean) & abs(mean - (3.3875000000000002)) <= 1e-9 * max(1,abs(3.3875000000000002)) if id==11 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(var) & abs(var - (32.721249999999998)) <= 1e-9 * max(1,abs(32.721249999999998)) if id==11 & year==2003
assert !missing(sd) & abs(sd - (5.7202491204492132)) <= 1e-9 * max(1,abs(5.7202491204492132)) if id==11 & year==2003
assert !missing(skew) & abs(skew - (2.4525752577800501)) <= 1e-9 * max(1,abs(2.4525752577800501)) if id==11 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (27.100000000000001)) <= 1e-9 * max(1,abs(27.100000000000001)) if id==11 & year==2003
assert !missing(total) & abs(total - (27.100000000000001)) <= 1e-9 * max(1,abs(27.100000000000001)) if id==11 & year==2003
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2003
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==11 & year==2003
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.5499999999999972)) <= 1e-9 * max(1,abs(-2.5499999999999972)) if id==11 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.33703220411695223)) <= 1e-9 * max(1,abs(-0.33703220411695223)) if id==11 & year==2003
assert !missing(dev_total) & abs(dev_total - (-2.5499999999999972)) <= 1e-9 * max(1,abs(-2.5499999999999972)) if id==11 & year==2003
assert !missing(z_total) & abs(z_total - (-0.33703220411695223)) <= 1e-9 * max(1,abs(-0.33703220411695223)) if id==11 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.06944444444444442)) <= 1e-9 * max(1,abs(0.06944444444444442)) if id==11 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.44194173824159205)) <= 1e-9 * max(1,abs(0.44194173824159205)) if id==11 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==11 & year==2004
assert !missing(mean) & abs(mean - (2.8909090909090911)) <= 1e-9 * max(1,abs(2.8909090909090911)) if id==11 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(var) & abs(var - (23.568909090909091)) <= 1e-9 * max(1,abs(23.568909090909091)) if id==11 & year==2004
assert !missing(sd) & abs(sd - (4.8547820848014478)) <= 1e-9 * max(1,abs(4.8547820848014478)) if id==11 & year==2004
assert !missing(skew) & abs(skew - (2.9370728624560303)) <= 1e-9 * max(1,abs(2.9370728624560303)) if id==11 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (31.800000000000001)) <= 1e-9 * max(1,abs(31.800000000000001)) if id==11 & year==2004
assert !missing(total) & abs(total - (31.800000000000001)) <= 1e-9 * max(1,abs(31.800000000000001)) if id==11 & year==2004
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2004
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.72727272727272729)) <= 1e-9 * max(1,abs(0.72727272727272729)) if id==11 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==11 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.1342607812379521)) <= 1e-9 * max(1,abs(0.1342607812379521)) if id==11 & year==2004
assert !missing(dev_total) & abs(dev_total - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==11 & year==2004
assert !missing(z_total) & abs(z_total - (0.1342607812379521)) <= 1e-9 * max(1,abs(0.1342607812379521)) if id==11 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==11 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==11 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert missing(z_norain) if id==11 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.081439393939394034)) <= 1e-9 * max(1,abs(0.081439393939394034)) if id==11 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.764144690092873)) <= 1e-9 * max(1,abs(2.764144690092873)) if id==11 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert missing(z_dry) if id==11 & year==2004
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==11 & year==2005
assert !missing(mean) & abs(mean - (1.8818181818181818)) <= 1e-9 * max(1,abs(1.8818181818181818)) if id==11 & year==2005
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2005
assert !missing(var) & abs(var - (2.5476363636363635)) <= 1e-9 * max(1,abs(2.5476363636363635)) if id==11 & year==2005
assert !missing(sd) & abs(sd - (1.596131687435709)) <= 1e-9 * max(1,abs(1.596131687435709)) if id==11 & year==2005
assert !missing(skew) & abs(skew - (1.6548627152433868)) <= 1e-9 * max(1,abs(1.6548627152433868)) if id==11 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (20.699999999999999)) <= 1e-9 * max(1,abs(20.699999999999999)) if id==11 & year==2005
assert !missing(total) & abs(total - (20.699999999999999)) <= 1e-9 * max(1,abs(20.699999999999999)) if id==11 & year==2005
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2005
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.72727272727272729)) <= 1e-9 * max(1,abs(0.72727272727272729)) if id==11 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2005
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2005
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2005
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2005
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-8.7500000000000036)) <= 1e-9 * max(1,abs(-8.7500000000000036)) if id==11 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.6328443980350187)) <= 1e-9 * max(1,abs(-2.6328443980350187)) if id==11 & year==2005
assert !missing(dev_total) & abs(dev_total - (-8.7500000000000036)) <= 1e-9 * max(1,abs(-8.7500000000000036)) if id==11 & year==2005
assert !missing(z_total) & abs(z_total - (-2.6328443980350187)) <= 1e-9 * max(1,abs(-2.6328443980350187)) if id==11 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==11 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert missing(z_norain) if id==11 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.051136363636363646)) <= 1e-9 * max(1,abs(0.051136363636363646)) if id==11 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11 & year==2005
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11 & year==2005
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2000
assert !missing(mean) & abs(mean - (2.9444444444444446)) <= 1e-9 * max(1,abs(2.9444444444444446)) if id==12 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12 & year==2000
assert !missing(var) & abs(var - (30.237777777777779)) <= 1e-9 * max(1,abs(30.237777777777779)) if id==12 & year==2000
assert !missing(sd) & abs(sd - (5.4988887766327643)) <= 1e-9 * max(1,abs(5.4988887766327643)) if id==12 & year==2000
assert !missing(skew) & abs(skew - (2.5915473164997347)) <= 1e-9 * max(1,abs(2.5915473164997347)) if id==12 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (26.5)) <= 1e-9 * max(1,abs(26.5)) if id==12 & year==2000
assert !missing(total) & abs(total - (26.5)) <= 1e-9 * max(1,abs(26.5)) if id==12 & year==2000
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2000
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==12 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2000
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2000
assert missing(dev_mean_mo) if id==12 & year==2000
assert missing(z_mean_mo) if id==12 & year==2000
assert missing(dev_total) if id==12 & year==2000
assert missing(z_total) if id==12 & year==2000
assert missing(dev_raindays) if id==12 & year==2000
assert missing(z_raindays) if id==12 & year==2000
assert missing(dev_norain) if id==12 & year==2000
assert missing(z_norain) if id==12 & year==2000
assert missing(dev_pct_raindays) if id==12 & year==2000
assert missing(z_pct_raindays) if id==12 & year==2000
assert missing(dev_dry) if id==12 & year==2000
assert missing(z_dry) if id==12 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2001
assert !missing(mean) & abs(mean - (4.0300000000000002)) <= 1e-9 * max(1,abs(4.0300000000000002)) if id==12 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2001
assert !missing(var) & abs(var - (47.053444444444445)) <= 1e-9 * max(1,abs(47.053444444444445)) if id==12 & year==2001
assert !missing(sd) & abs(sd - (6.8595513296748818)) <= 1e-9 * max(1,abs(6.8595513296748818)) if id==12 & year==2001
assert !missing(skew) & abs(skew - (1.7484964664273568)) <= 1e-9 * max(1,abs(1.7484964664273568)) if id==12 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (40.299999999999997)) <= 1e-9 * max(1,abs(40.299999999999997)) if id==12 & year==2001
assert !missing(total) & abs(total - (40.299999999999997)) <= 1e-9 * max(1,abs(40.299999999999997)) if id==12 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2001
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==12 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2001
assert missing(dev_mean_mo) if id==12 & year==2001
assert missing(z_mean_mo) if id==12 & year==2001
assert missing(dev_total) if id==12 & year==2001
assert missing(z_total) if id==12 & year==2001
assert missing(dev_raindays) if id==12 & year==2001
assert missing(z_raindays) if id==12 & year==2001
assert missing(dev_norain) if id==12 & year==2001
assert missing(z_norain) if id==12 & year==2001
assert missing(dev_pct_raindays) if id==12 & year==2001
assert missing(z_pct_raindays) if id==12 & year==2001
assert missing(dev_dry) if id==12 & year==2001
assert missing(z_dry) if id==12 & year==2001
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==12 & year==2002
assert !missing(mean) & abs(mean - (1.1000000000000001)) <= 1e-9 * max(1,abs(1.1000000000000001)) if id==12 & year==2002
assert !missing(median) & abs(median - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(var) & abs(var - (3.8540000000000001)) <= 1e-9 * max(1,abs(3.8540000000000001)) if id==12 & year==2002
assert !missing(sd) & abs(sd - (1.96316071680339)) <= 1e-9 * max(1,abs(1.96316071680339)) if id==12 & year==2002
assert !missing(skew) & abs(skew - (1.775561106500098)) <= 1e-9 * max(1,abs(1.775561106500098)) if id==12 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (12.1)) <= 1e-9 * max(1,abs(12.1)) if id==12 & year==2002
assert !missing(total) & abs(total - (12.1)) <= 1e-9 * max(1,abs(12.1)) if id==12 & year==2002
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2002
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==12 & year==2002
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-21.299999999999997)) <= 1e-9 * max(1,abs(-21.299999999999997)) if id==12 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.1828078897497774)) <= 1e-9 * max(1,abs(-2.1828078897497774)) if id==12 & year==2002
assert !missing(dev_total) & abs(dev_total - (-21.299999999999997)) <= 1e-9 * max(1,abs(-21.299999999999997)) if id==12 & year==2002
assert !missing(z_total) & abs(z_total - (-2.1828078897497774)) <= 1e-9 * max(1,abs(-2.1828078897497774)) if id==12 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==12 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==12 & year==2002
assert !missing(z_norain) & abs(z_norain - (4.9497474683058327)) <= 1e-9 * max(1,abs(4.9497474683058327)) if id==12 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.24949494949494944)) <= 1e-9 * max(1,abs(-0.24949494949494944)) if id==12 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.2682516227672362)) <= 1e-9 * max(1,abs(-2.2682516227672362)) if id==12 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==12 & year==2002
assert !missing(z_dry) & abs(z_dry - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==12 & year==2002
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2003
assert !missing(mean) & abs(mean - (2.3624999999999998)) <= 1e-9 * max(1,abs(2.3624999999999998)) if id==12 & year==2003
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==12 & year==2003
assert !missing(var) & abs(var - (4.8312499999999998)) <= 1e-9 * max(1,abs(4.8312499999999998)) if id==12 & year==2003
assert !missing(sd) & abs(sd - (2.1980104640333264)) <= 1e-9 * max(1,abs(2.1980104640333264)) if id==12 & year==2003
assert !missing(skew) & abs(skew - (0.5922107637126186)) <= 1e-9 * max(1,abs(0.5922107637126186)) if id==12 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (18.899999999999999)) <= 1e-9 * max(1,abs(18.899999999999999)) if id==12 & year==2003
assert !missing(total) & abs(total - (18.899999999999999)) <= 1e-9 * max(1,abs(18.899999999999999)) if id==12 & year==2003
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2003
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.3000000000000007)) <= 1e-9 * max(1,abs(-7.3000000000000007)) if id==12 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.366090744869631)) <= 1e-9 * max(1,abs(-0.366090744869631)) if id==12 & year==2003
assert !missing(dev_total) & abs(dev_total - (-7.3000000000000007)) <= 1e-9 * max(1,abs(-7.3000000000000007)) if id==12 & year==2003
assert !missing(z_total) & abs(z_total - (-0.366090744869631)) <= 1e-9 * max(1,abs(-0.366090744869631)) if id==12 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==12 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.063636363636363658)) <= 1e-9 * max(1,abs(0.063636363636363658)) if id==12 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.27498597046143525)) <= 1e-9 * max(1,abs(0.27498597046143525)) if id==12 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2003
assert !missing(z_dry) & abs(z_dry - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==12 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2004
assert !missing(mean) & abs(mean - (6.5888888888888886)) <= 1e-9 * max(1,abs(6.5888888888888886)) if id==12 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(var) & abs(var - (63.021111111111111)) <= 1e-9 * max(1,abs(63.021111111111111)) if id==12 & year==2004
assert !missing(sd) & abs(sd - (7.9385836968007784)) <= 1e-9 * max(1,abs(7.9385836968007784)) if id==12 & year==2004
assert !missing(skew) & abs(skew - (0.74738607546899871)) <= 1e-9 * max(1,abs(0.74738607546899871)) if id==12 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (59.299999999999997)) <= 1e-9 * max(1,abs(59.299999999999997)) if id==12 & year==2004
assert !missing(total) & abs(total - (59.299999999999997)) <= 1e-9 * max(1,abs(59.299999999999997)) if id==12 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2004
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==12 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (43.799999999999997)) <= 1e-9 * max(1,abs(43.799999999999997)) if id==12 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (9.1091991223443483)) <= 1e-9 * max(1,abs(9.1091991223443483)) if id==12 & year==2004
assert !missing(dev_total) & abs(dev_total - (43.799999999999997)) <= 1e-9 * max(1,abs(43.799999999999997)) if id==12 & year==2004
assert !missing(z_total) & abs(z_total - (9.1091991223443483)) <= 1e-9 * max(1,abs(9.1091991223443483)) if id==12 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==12 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==12 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-3)) <= 1e-9 * max(1,abs(-3)) if id==12 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.0606601717798212)) <= 1e-9 * max(1,abs(-1.0606601717798212)) if id==12 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.28030303030303028)) <= 1e-9 * max(1,abs(0.28030303030303028)) if id==12 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.744196726926817)) <= 1e-9 * max(1,abs(1.744196726926817)) if id==12 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==12 & year==2004
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2005
assert !missing(mean) & abs(mean - (3.7749999999999999)) <= 1e-9 * max(1,abs(3.7749999999999999)) if id==12 & year==2005
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==12 & year==2005
assert !missing(var) & abs(var - (32.527857142857144)) <= 1e-9 * max(1,abs(32.527857142857144)) if id==12 & year==2005
assert !missing(sd) & abs(sd - (5.7033198352237919)) <= 1e-9 * max(1,abs(5.7033198352237919)) if id==12 & year==2005
assert !missing(skew) & abs(skew - (2.2141078489490265)) <= 1e-9 * max(1,abs(2.2141078489490265)) if id==12 & year==2005
assert !missing(mean_mo) & abs(mean_mo - (30.199999999999999)) <= 1e-9 * max(1,abs(30.199999999999999)) if id==12 & year==2005
assert !missing(total) & abs(total - (30.199999999999999)) <= 1e-9 * max(1,abs(30.199999999999999)) if id==12 & year==2005
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2005
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2005
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2005
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2005
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2005
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2005
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2005
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2005
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-8.899999999999995)) <= 1e-9 * max(1,abs(-8.899999999999995)) if id==12 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.31154704715644899)) <= 1e-9 * max(1,abs(-0.31154704715644899)) if id==12 & year==2005
assert !missing(dev_total) & abs(dev_total - (-8.899999999999995)) <= 1e-9 * max(1,abs(-8.899999999999995)) if id==12 & year==2005
assert !missing(z_total) & abs(z_total - (-0.31154704715644899)) <= 1e-9 * max(1,abs(-0.31154704715644899)) if id==12 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2005
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.083333333333333259)) <= 1e-9 * max(1,abs(-0.083333333333333259)) if id==12 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654702)) <= 1e-9 * max(1,abs(-0.70710678118654702)) if id==12 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2005
assert missing(z_dry) if id==12 & year==2005
assert _N==72
