version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261016/original/oracle_rain.csv", clear varnames(1) asdouble
wxsum x_, type(rain) ini_month(1) ini_day(1) fin_month(1) fin_day(12) baseline(2000 2002) ref_min(2) minobs(2) shape(long) keep(id) cuts(1 2 5)
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.2000000000000028)) <= 1e-9 * max(1,abs(5.2000000000000028)) if id==1 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1 & year==2000
assert !missing(dev_total) & abs(dev_total - (5.2000000000000028)) <= 1e-9 * max(1,abs(5.2000000000000028)) if id==1 & year==2000
assert !missing(z_total) & abs(z_total - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert missing(z_norain) if id==1 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.018181818181818188)) <= 1e-9 * max(1,abs(0.018181818181818188)) if id==1 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==1 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==1 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==1 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert missing(z_dry_end) if id==1 & year==2000
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
assert missing(dev_dry_start) if id==1 & year==2001
assert missing(z_dry_start) if id==1 & year==2001
assert missing(dev_dry) if id==1 & year==2001
assert missing(z_dry) if id==1 & year==2001
assert missing(dev_dry_end) if id==1 & year==2001
assert missing(z_dry_end) if id==1 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.2000000000000028)) <= 1e-9 * max(1,abs(-5.2000000000000028)) if id==1 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2002
assert !missing(dev_total) & abs(dev_total - (-5.2000000000000028)) <= 1e-9 * max(1,abs(-5.2000000000000028)) if id==1 & year==2002
assert !missing(z_total) & abs(z_total - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert missing(z_norain) if id==1 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.018181818181818188)) <= 1e-9 * max(1,abs(-0.018181818181818188)) if id==1 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==1 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==1 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==1 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert missing(z_dry_end) if id==1 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.67991036652552606)) <= 1e-9 * max(1,abs(0.67991036652552606)) if id==1 & year==2003
assert !missing(dev_total) & abs(dev_total - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2003
assert !missing(z_total) & abs(z_total - (0.67991036652552606)) <= 1e-9 * max(1,abs(0.67991036652552606)) if id==1 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==1 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-3)) <= 1e-9 * max(1,abs(-3)) if id==1 & year==2003
assert missing(z_norain) if id==1 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.28181818181818186)) <= 1e-9 * max(1,abs(0.28181818181818186)) if id==1 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (10.960155108391485)) <= 1e-9 * max(1,abs(10.960155108391485)) if id==1 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==1 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==1 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert missing(z_dry_end) if id==1 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-17)) <= 1e-9 * max(1,abs(-17)) if id==1 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.3116952461867886)) <= 1e-9 * max(1,abs(-2.3116952461867886)) if id==1 & year==2004
assert !missing(dev_total) & abs(dev_total - (-17)) <= 1e-9 * max(1,abs(-17)) if id==1 & year==2004
assert !missing(z_total) & abs(z_total - (-2.3116952461867886)) <= 1e-9 * max(1,abs(-2.3116952461867886)) if id==1 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==1 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==1 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert missing(z_norain) if id==1 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25454545454545452)) <= 1e-9 * max(1,abs(-0.25454545454545452)) if id==1 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-9.8994949366116618)) <= 1e-9 * max(1,abs(-9.8994949366116618)) if id==1 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==1 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==1 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2004
assert missing(z_dry_end) if id==1 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-38)) <= 1e-9 * max(1,abs(-38)) if id==1 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-5.1673187855939986)) <= 1e-9 * max(1,abs(-5.1673187855939986)) if id==1 & year==2005
assert !missing(dev_total) & abs(dev_total - (-38)) <= 1e-9 * max(1,abs(-38)) if id==1 & year==2005
assert !missing(z_total) & abs(z_total - (-5.1673187855939986)) <= 1e-9 * max(1,abs(-5.1673187855939986)) if id==1 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-4.5)) <= 1e-9 * max(1,abs(-4.5)) if id==1 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-6.3639610306789276)) <= 1e-9 * max(1,abs(-6.3639610306789276)) if id==1 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert missing(z_norain) if id==1 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.33246753246753247)) <= 1e-9 * max(1,abs(-0.33246753246753247)) if id==1 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-12.929952570268293)) <= 1e-9 * max(1,abs(-12.929952570268293)) if id==1 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==1 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1 & year==2005
assert missing(z_dry_end) if id==1 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_mean_mo) if id==2 & year==2000
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_total) if id==2 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_raindays) if id==2 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_norain) if id==2 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_pct_raindays) if id==2 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_dry_start) if id==2 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_dry) if id==2 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_dry_end) if id==2 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_mean_mo) if id==2 & year==2001
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_total) if id==2 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_raindays) if id==2 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_norain) if id==2 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_pct_raindays) if id==2 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_dry_start) if id==2 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_dry) if id==2 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_dry_end) if id==2 & year==2001
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
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_dry_start) if id==2 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_dry) if id==2 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_dry_end) if id==2 & year==2002
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
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry_start) if id==2 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry) if id==2 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry_end) if id==2 & year==2003
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
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry_start) if id==2 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry) if id==2 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry_end) if id==2 & year==2004
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
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_dry_start) if id==2 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_dry) if id==2 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_dry_end) if id==2 & year==2005
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
assert missing(dev_dry_start) if id==3 & year==2000
assert missing(z_dry_start) if id==3 & year==2000
assert missing(dev_dry) if id==3 & year==2000
assert missing(z_dry) if id==3 & year==2000
assert missing(dev_dry_end) if id==3 & year==2000
assert missing(z_dry_end) if id==3 & year==2000
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
assert missing(dev_dry_start) if id==3 & year==2001
assert missing(z_dry_start) if id==3 & year==2001
assert missing(dev_dry) if id==3 & year==2001
assert missing(z_dry) if id==3 & year==2001
assert missing(dev_dry_end) if id==3 & year==2001
assert missing(z_dry_end) if id==3 & year==2001
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
assert missing(dev_dry_start) if id==3 & year==2002
assert missing(z_dry_start) if id==3 & year==2002
assert missing(dev_dry) if id==3 & year==2002
assert missing(z_dry) if id==3 & year==2002
assert missing(dev_dry_end) if id==3 & year==2002
assert missing(z_dry_end) if id==3 & year==2002
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
assert missing(dev_dry_start) if id==3 & year==2003
assert missing(z_dry_start) if id==3 & year==2003
assert missing(dev_dry) if id==3 & year==2003
assert missing(z_dry) if id==3 & year==2003
assert missing(dev_dry_end) if id==3 & year==2003
assert missing(z_dry_end) if id==3 & year==2003
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
assert missing(dev_dry_start) if id==3 & year==2004
assert missing(z_dry_start) if id==3 & year==2004
assert missing(dev_dry) if id==3 & year==2004
assert missing(z_dry) if id==3 & year==2004
assert missing(dev_dry_end) if id==3 & year==2004
assert missing(z_dry_end) if id==3 & year==2004
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
assert missing(dev_dry_start) if id==3 & year==2005
assert missing(z_dry_start) if id==3 & year==2005
assert missing(dev_dry) if id==3 & year==2005
assert missing(z_dry) if id==3 & year==2005
assert missing(dev_dry_end) if id==3 & year==2005
assert missing(z_dry_end) if id==3 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.833333333333336)) <= 1e-9 * max(1,abs(12.833333333333336)) if id==4 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.85646325318515282)) <= 1e-9 * max(1,abs(0.85646325318515282)) if id==4 & year==2000
assert !missing(dev_total) & abs(dev_total - (12.833333333333336)) <= 1e-9 * max(1,abs(12.833333333333336)) if id==4 & year==2000
assert !missing(z_total) & abs(z_total - (0.85646325318515282)) <= 1e-9 * max(1,abs(0.85646325318515282)) if id==4 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==4 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.80064076902543591)) <= 1e-9 * max(1,abs(-0.80064076902543591)) if id==4 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(z_norain) & abs(z_norain - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==4 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.13703703703703707)) <= 1e-9 * max(1,abs(-0.13703703703703707)) if id==4 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.71645714187624776)) <= 1e-9 * max(1,abs(-0.71645714187624776)) if id==4 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==4 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==4 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert missing(z_dry_end) if id==4 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.6333333333333329)) <= 1e-9 * max(1,abs(3.6333333333333329)) if id==4 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.2424792067459263)) <= 1e-9 * max(1,abs(0.2424792067459263)) if id==4 & year==2001
assert !missing(dev_total) & abs(dev_total - (3.6333333333333329)) <= 1e-9 * max(1,abs(3.6333333333333329)) if id==4 & year==2001
assert !missing(z_total) & abs(z_total - (0.2424792067459263)) <= 1e-9 * max(1,abs(0.2424792067459263)) if id==4 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (2.333333333333333)) <= 1e-9 * max(1,abs(2.333333333333333)) if id==4 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1.1208970766356099)) <= 1e-9 * max(1,abs(1.1208970766356099)) if id==4 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2001
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.21851851851851856)) <= 1e-9 * max(1,abs(0.21851851851851856)) if id==4 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1424586856945571)) <= 1e-9 * max(1,abs(1.1424586856945571)) if id==4 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==4 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==4 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert missing(z_dry_end) if id==4 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-16.466666666666665)) <= 1e-9 * max(1,abs(-16.466666666666665)) if id==4 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0989424599310789)) <= 1e-9 * max(1,abs(-1.0989424599310789)) if id==4 & year==2002
assert !missing(dev_total) & abs(dev_total - (-16.466666666666665)) <= 1e-9 * max(1,abs(-16.466666666666665)) if id==4 & year==2002
assert !missing(z_total) & abs(z_total - (-1.0989424599310789)) <= 1e-9 * max(1,abs(-1.0989424599310789)) if id==4 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==4 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.32025630761017443)) <= 1e-9 * max(1,abs(-0.32025630761017443)) if id==4 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==4 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.081481481481481488)) <= 1e-9 * max(1,abs(-0.081481481481481488)) if id==4 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.4260015438183094)) <= 1e-9 * max(1,abs(-0.4260015438183094)) if id==4 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==4 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==4 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert missing(z_dry_end) if id==4 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (23.633333333333333)) <= 1e-9 * max(1,abs(23.633333333333333)) if id==4 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.5772271337877226)) <= 1e-9 * max(1,abs(1.5772271337877226)) if id==4 & year==2003
assert !missing(dev_total) & abs(dev_total - (23.633333333333333)) <= 1e-9 * max(1,abs(23.633333333333333)) if id==4 & year==2003
assert !missing(z_total) & abs(z_total - (1.5772271337877226)) <= 1e-9 * max(1,abs(1.5772271337877226)) if id==4 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==4 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.16012815380508699)) <= 1e-9 * max(1,abs(0.16012815380508699)) if id==4 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==4 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.085185185185185142)) <= 1e-9 * max(1,abs(0.085185185185185142)) if id==4 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.44536525035550506)) <= 1e-9 * max(1,abs(0.44536525035550506)) if id==4 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==4 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==4 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert missing(z_dry_end) if id==4 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (18.233333333333334)) <= 1e-9 * max(1,abs(18.233333333333334)) if id==4 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2168451934864377)) <= 1e-9 * max(1,abs(1.2168451934864377)) if id==4 & year==2004
assert !missing(dev_total) & abs(dev_total - (18.233333333333334)) <= 1e-9 * max(1,abs(18.233333333333334)) if id==4 & year==2004
assert !missing(z_total) & abs(z_total - (1.2168451934864377)) <= 1e-9 * max(1,abs(1.2168451934864377)) if id==4 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==4 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.32025630761017443)) <= 1e-9 * max(1,abs(-0.32025630761017443)) if id==4 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(z_norain) & abs(z_norain - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==4 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.12693602693602696)) <= 1e-9 * max(1,abs(-0.12693602693602696)) if id==4 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.66364703313844076)) <= 1e-9 * max(1,abs(-0.66364703313844076)) if id==4 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==4 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==4 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==4 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.28867513459481303)) <= 1e-9 * max(1,abs(-0.28867513459481303)) if id==4 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert missing(z_dry_end) if id==4 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (49.833333333333329)) <= 1e-9 * max(1,abs(49.833333333333329)) if id==4 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.3257469182124755)) <= 1e-9 * max(1,abs(3.3257469182124755)) if id==4 & year==2005
assert !missing(dev_total) & abs(dev_total - (49.833333333333329)) <= 1e-9 * max(1,abs(49.833333333333329)) if id==4 & year==2005
assert !missing(z_total) & abs(z_total - (3.3257469182124755)) <= 1e-9 * max(1,abs(3.3257469182124755)) if id==4 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (2.333333333333333)) <= 1e-9 * max(1,abs(2.333333333333333)) if id==4 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (1.1208970766356099)) <= 1e-9 * max(1,abs(1.1208970766356099)) if id==4 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2005
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.21851851851851856)) <= 1e-9 * max(1,abs(0.21851851851851856)) if id==4 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1424586856945571)) <= 1e-9 * max(1,abs(1.1424586856945571)) if id==4 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==4 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==4 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4 & year==2005
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2005
assert missing(z_dry_end) if id==4 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-6.3999999999999986)) <= 1e-9 * max(1,abs(-6.3999999999999986)) if id==5 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.65207746809355993)) <= 1e-9 * max(1,abs(-0.65207746809355993)) if id==5 & year==2000
assert !missing(dev_total) & abs(dev_total - (-6.3999999999999986)) <= 1e-9 * max(1,abs(-6.3999999999999986)) if id==5 & year==2000
assert !missing(z_total) & abs(z_total - (-0.65207746809355993)) <= 1e-9 * max(1,abs(-0.65207746809355993)) if id==5 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==5 & year==2000
assert !missing(z_norain) & abs(z_norain - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==5 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.054545454545454564)) <= 1e-9 * max(1,abs(-0.054545454545454564)) if id==5 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0776318121606494)) <= 1e-9 * max(1,abs(-1.0776318121606494)) if id==5 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert missing(z_dry_start) if id==5 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert missing(z_dry) if id==5 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (11.300000000000001)) <= 1e-9 * max(1,abs(11.300000000000001)) if id==5 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1513242796026921)) <= 1e-9 * max(1,abs(1.1513242796026921)) if id==5 & year==2001
assert !missing(dev_total) & abs(dev_total - (11.300000000000001)) <= 1e-9 * max(1,abs(11.300000000000001)) if id==5 & year==2001
assert !missing(z_total) & abs(z_total - (1.1513242796026921)) <= 1e-9 * max(1,abs(1.1513242796026921)) if id==5 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==5 & year==2001
assert !missing(z_norain) & abs(z_norain - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==5 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.0090909090909090939)) <= 1e-9 * max(1,abs(0.0090909090909090939)) if id==5 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.17960530202677488)) <= 1e-9 * max(1,abs(0.17960530202677488)) if id==5 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert missing(z_dry_start) if id==5 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert missing(z_dry) if id==5 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.8999999999999986)) <= 1e-9 * max(1,abs(-4.8999999999999986)) if id==5 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.4992468115091318)) <= 1e-9 * max(1,abs(-0.4992468115091318)) if id==5 & year==2002
assert !missing(dev_total) & abs(dev_total - (-4.8999999999999986)) <= 1e-9 * max(1,abs(-4.8999999999999986)) if id==5 & year==2002
assert !missing(z_total) & abs(z_total - (-0.4992468115091318)) <= 1e-9 * max(1,abs(-0.4992468115091318)) if id==5 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5 & year==2002
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792521)) <= 1e-9 * max(1,abs(-1.1547005383792521)) if id==5 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.04545454545454547)) <= 1e-9 * max(1,abs(0.04545454545454547)) if id==5 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.89802651013387447)) <= 1e-9 * max(1,abs(0.89802651013387447)) if id==5 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert missing(z_dry_start) if id==5 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert missing(z_dry) if id==5 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.200000000000003)) <= 1e-9 * max(1,abs(12.200000000000003)) if id==5 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2430226735533492)) <= 1e-9 * max(1,abs(1.2430226735533492)) if id==5 & year==2003
assert !missing(dev_total) & abs(dev_total - (12.200000000000003)) <= 1e-9 * max(1,abs(12.200000000000003)) if id==5 & year==2003
assert !missing(z_total) & abs(z_total - (1.2430226735533492)) <= 1e-9 * max(1,abs(1.2430226735533492)) if id==5 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==5 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (4.0414518843273806)) <= 1e-9 * max(1,abs(4.0414518843273806)) if id==5 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==5 & year==2003
assert !missing(z_norain) & abs(z_norain - (-4.6188021535170067)) <= 1e-9 * max(1,abs(-4.6188021535170067)) if id==5 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.24545454545454543)) <= 1e-9 * max(1,abs(0.24545454545454543)) if id==5 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (4.84934315472292)) <= 1e-9 * max(1,abs(4.84934315472292)) if id==5 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2003
assert missing(z_dry_start) if id==5 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==5 & year==2003
assert missing(z_dry) if id==5 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (2.6000000000000014)) <= 1e-9 * max(1,abs(2.6000000000000014)) if id==5 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.26490647141300894)) <= 1e-9 * max(1,abs(0.26490647141300894)) if id==5 & year==2004
assert !missing(dev_total) & abs(dev_total - (2.6000000000000014)) <= 1e-9 * max(1,abs(2.6000000000000014)) if id==5 & year==2004
assert !missing(z_total) & abs(z_total - (0.26490647141300894)) <= 1e-9 * max(1,abs(0.26490647141300894)) if id==5 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792521)) <= 1e-9 * max(1,abs(-1.1547005383792521)) if id==5 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.021212121212121238)) <= 1e-9 * max(1,abs(-0.021212121212121238)) if id==5 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.4190790380624751)) <= 1e-9 * max(1,abs(-0.4190790380624751)) if id==5 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert missing(z_dry_start) if id==5 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert missing(z_dry) if id==5 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (20.200000000000003)) <= 1e-9 * max(1,abs(20.200000000000003)) if id==5 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.0581195086702992)) <= 1e-9 * max(1,abs(2.0581195086702992)) if id==5 & year==2005
assert !missing(dev_total) & abs(dev_total - (20.200000000000003)) <= 1e-9 * max(1,abs(20.200000000000003)) if id==5 & year==2005
assert !missing(z_total) & abs(z_total - (2.0581195086702992)) <= 1e-9 * max(1,abs(2.0581195086702992)) if id==5 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==5 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (2.3094010767585034)) <= 1e-9 * max(1,abs(2.3094010767585034)) if id==5 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5 & year==2005
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792521)) <= 1e-9 * max(1,abs(-1.1547005383792521)) if id==5 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.099999999999999978)) <= 1e-9 * max(1,abs(0.099999999999999978)) if id==5 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.9756583222945228)) <= 1e-9 * max(1,abs(1.9756583222945228)) if id==5 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert missing(z_dry_start) if id==5 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2005
assert missing(z_dry) if id==5 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (19.233333333333334)) <= 1e-9 * max(1,abs(19.233333333333334)) if id==6 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.067919904042218)) <= 1e-9 * max(1,abs(1.067919904042218)) if id==6 & year==2000
assert !missing(dev_total) & abs(dev_total - (19.233333333333334)) <= 1e-9 * max(1,abs(19.233333333333334)) if id==6 & year==2000
assert !missing(z_total) & abs(z_total - (1.067919904042218)) <= 1e-9 * max(1,abs(1.067919904042218)) if id==6 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (1.1338934190276817)) <= 1e-9 * max(1,abs(1.1338934190276817)) if id==6 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-3.6666666666666665)) <= 1e-9 * max(1,abs(-3.6666666666666665)) if id==6 & year==2000
assert !missing(z_norain) & abs(z_norain - (-1.1406468642034677)) <= 1e-9 * max(1,abs(-1.1406468642034677)) if id==6 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==6 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==6 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==6 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333333)) <= 1e-9 * max(1,abs(-1.3333333333333333)) if id==6 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396945)) <= 1e-9 * max(1,abs(-0.87287156094396945)) if id==6 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-16.466666666666669)) <= 1e-9 * max(1,abs(-16.466666666666669)) if id==6 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.91430230952661318)) <= 1e-9 * max(1,abs(-0.91430230952661318)) if id==6 & year==2001
assert !missing(dev_total) & abs(dev_total - (-16.466666666666669)) <= 1e-9 * max(1,abs(-16.466666666666669)) if id==6 & year==2001
assert !missing(z_total) & abs(z_total - (-0.91430230952661318)) <= 1e-9 * max(1,abs(-0.91430230952661318)) if id==6 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==6 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==6 & year==2001
assert !missing(z_norain) & abs(z_norain - (0.72586618631129773)) <= 1e-9 * max(1,abs(0.72586618631129773)) if id==6 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.16666666666666663)) <= 1e-9 * max(1,abs(-0.16666666666666663)) if id==6 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==6 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==6 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==6 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==6 & year==2001
assert !missing(z_dry) & abs(z_dry - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==6 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.7666666666666657)) <= 1e-9 * max(1,abs(-2.7666666666666657)) if id==6 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.15361759451560497)) <= 1e-9 * max(1,abs(-0.15361759451560497)) if id==6 & year==2002
assert !missing(dev_total) & abs(dev_total - (-2.7666666666666657)) <= 1e-9 * max(1,abs(-2.7666666666666657)) if id==6 & year==2002
assert !missing(z_total) & abs(z_total - (-0.15361759451560497)) <= 1e-9 * max(1,abs(-0.15361759451560497)) if id==6 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==6 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==6 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==6 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.41478067789217016)) <= 1e-9 * max(1,abs(0.41478067789217016)) if id==6 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.16666666666666663)) <= 1e-9 * max(1,abs(-0.16666666666666663)) if id==6 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==6 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==6 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==6 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==6 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.6666666666666643)) <= 1e-9 * max(1,abs(-2.6666666666666643)) if id==6 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.14806515134034207)) <= 1e-9 * max(1,abs(-0.14806515134034207)) if id==6 & year==2003
assert !missing(dev_total) & abs(dev_total - (-2.6666666666666643)) <= 1e-9 * max(1,abs(-2.6666666666666643)) if id==6 & year==2003
assert !missing(z_total) & abs(z_total - (-0.14806515134034207)) <= 1e-9 * max(1,abs(-0.14806515134034207)) if id==6 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==6 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==6 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.41478067789217016)) <= 1e-9 * max(1,abs(0.41478067789217016)) if id==6 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.12121212121212122)) <= 1e-9 * max(1,abs(-0.12121212121212122)) if id==6 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.41989110486518239)) <= 1e-9 * max(1,abs(-0.41989110486518239)) if id==6 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==6 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (4.6188021535170058)) <= 1e-9 * max(1,abs(4.6188021535170058)) if id==6 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==6 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.43643578047198478)) <= 1e-9 * max(1,abs(0.43643578047198478)) if id==6 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-32.966666666666669)) <= 1e-9 * max(1,abs(-32.966666666666669)) if id==6 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.8304554334449805)) <= 1e-9 * max(1,abs(-1.8304554334449805)) if id==6 & year==2004
assert !missing(dev_total) & abs(dev_total - (-32.966666666666669)) <= 1e-9 * max(1,abs(-32.966666666666669)) if id==6 & year==2004
assert !missing(z_total) & abs(z_total - (-1.8304554334449805)) <= 1e-9 * max(1,abs(-1.8304554334449805)) if id==6 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==6 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==6 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.207390338946085)) <= 1e-9 * max(1,abs(-0.207390338946085)) if id==6 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==6 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==6 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==6 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==6 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-34.866666666666667)) <= 1e-9 * max(1,abs(-34.866666666666667)) if id==6 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.9359518537749743)) <= 1e-9 * max(1,abs(-1.9359518537749743)) if id==6 & year==2005
assert !missing(dev_total) & abs(dev_total - (-34.866666666666667)) <= 1e-9 * max(1,abs(-34.866666666666667)) if id==6 & year==2005
assert !missing(z_total) & abs(z_total - (-1.9359518537749743)) <= 1e-9 * max(1,abs(-1.9359518537749743)) if id==6 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==6 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==6 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==6 & year==2005
assert !missing(z_norain) & abs(z_norain - (0.72586618631129773)) <= 1e-9 * max(1,abs(0.72586618631129773)) if id==6 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.2121212121212121)) <= 1e-9 * max(1,abs(-0.2121212121212121)) if id==6 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.73480943351406913)) <= 1e-9 * max(1,abs(-0.73480943351406913)) if id==6 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==6 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==6 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==6 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-8.3000000000000007)) <= 1e-9 * max(1,abs(-8.3000000000000007)) if id==7 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.48708215642060937)) <= 1e-9 * max(1,abs(-0.48708215642060937)) if id==7 & year==2000
assert !missing(dev_total) & abs(dev_total - (-8.3000000000000007)) <= 1e-9 * max(1,abs(-8.3000000000000007)) if id==7 & year==2000
assert !missing(z_total) & abs(z_total - (-0.48708215642060937)) <= 1e-9 * max(1,abs(-0.48708215642060937)) if id==7 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==7 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==7 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.014814814814814781)) <= 1e-9 * max(1,abs(0.014814814814814781)) if id==7 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.18793639429397541)) <= 1e-9 * max(1,abs(0.18793639429397541)) if id==7 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-11.300000000000001)) <= 1e-9 * max(1,abs(-11.300000000000001)) if id==7 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.66313594789793806)) <= 1e-9 * max(1,abs(-0.66313594789793806)) if id==7 & year==2001
assert !missing(dev_total) & abs(dev_total - (-11.300000000000001)) <= 1e-9 * max(1,abs(-11.300000000000001)) if id==7 & year==2001
assert !missing(z_total) & abs(z_total - (-0.66313594789793806)) <= 1e-9 * max(1,abs(-0.66313594789793806)) if id==7 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==7 & year==2001
assert !missing(z_norain) & abs(z_norain - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==7 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.085185185185185197)) <= 1e-9 * max(1,abs(-0.085185185185185197)) if id==7 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0806342671903613)) <= 1e-9 * max(1,abs(-1.0806342671903613)) if id==7 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==7 & year==2001
assert !missing(z_dry) & abs(z_dry - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==7 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (19.600000000000001)) <= 1e-9 * max(1,abs(19.600000000000001)) if id==7 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1502181043185473)) <= 1e-9 * max(1,abs(1.1502181043185473)) if id==7 & year==2002
assert !missing(dev_total) & abs(dev_total - (19.600000000000001)) <= 1e-9 * max(1,abs(19.600000000000001)) if id==7 & year==2002
assert !missing(z_total) & abs(z_total - (1.1502181043185473)) <= 1e-9 * max(1,abs(1.1502181043185473)) if id==7 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==7 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==7 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.070370370370370361)) <= 1e-9 * max(1,abs(0.070370370370370361)) if id==7 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.89269787289638514)) <= 1e-9 * max(1,abs(0.89269787289638514)) if id==7 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==7 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==7 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (27.5)) <= 1e-9 * max(1,abs(27.5)) if id==7 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.6138264218755127)) <= 1e-9 * max(1,abs(1.6138264218755127)) if id==7 & year==2003
assert !missing(dev_total) & abs(dev_total - (27.5)) <= 1e-9 * max(1,abs(27.5)) if id==7 & year==2003
assert !missing(z_total) & abs(z_total - (1.6138264218755127)) <= 1e-9 * max(1,abs(1.6138264218755127)) if id==7 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==7 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==7 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.014814814814814781)) <= 1e-9 * max(1,abs(0.014814814814814781)) if id==7 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.18793639429397541)) <= 1e-9 * max(1,abs(0.18793639429397541)) if id==7 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==7 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==7 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2003
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
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.6000000000000014)) <= 1e-9 * max(1,abs(5.6000000000000014)) if id==7 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.32863374409101359)) <= 1e-9 * max(1,abs(0.32863374409101359)) if id==7 & year==2004
assert !missing(dev_total) & abs(dev_total - (5.6000000000000014)) <= 1e-9 * max(1,abs(5.6000000000000014)) if id==7 & year==2004
assert !missing(z_total) & abs(z_total - (0.32863374409101359)) <= 1e-9 * max(1,abs(0.32863374409101359)) if id==7 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==7 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==7 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.014814814814814781)) <= 1e-9 * max(1,abs(0.014814814814814781)) if id==7 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.18793639429397541)) <= 1e-9 * max(1,abs(0.18793639429397541)) if id==7 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-2.3333333333333335)) <= 1e-9 * max(1,abs(-2.3333333333333335)) if id==7 & year==2004
assert !missing(z_dry) & abs(z_dry - (-1.5275252316519468)) <= 1e-9 * max(1,abs(-1.5275252316519468)) if id==7 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==7 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==7 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.2000000000000028)) <= 1e-9 * max(1,abs(-3.2000000000000028)) if id==7 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.18779071090915075)) <= 1e-9 * max(1,abs(-0.18779071090915075)) if id==7 & year==2005
assert !missing(dev_total) & abs(dev_total - (-3.2000000000000028)) <= 1e-9 * max(1,abs(-3.2000000000000028)) if id==7 & year==2005
assert !missing(z_total) & abs(z_total - (-0.18779071090915075)) <= 1e-9 * max(1,abs(-0.18779071090915075)) if id==7 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==7 & year==2005
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==7 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.070370370370370361)) <= 1e-9 * max(1,abs(0.070370370370370361)) if id==7 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.89269787289638514)) <= 1e-9 * max(1,abs(0.89269787289638514)) if id==7 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==7 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==7 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.9333333333333371)) <= 1e-9 * max(1,abs(7.9333333333333371)) if id==8 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1208970766356103)) <= 1e-9 * max(1,abs(1.1208970766356103)) if id==8 & year==2000
assert !missing(dev_total) & abs(dev_total - (7.9333333333333371)) <= 1e-9 * max(1,abs(7.9333333333333371)) if id==8 & year==2000
assert !missing(z_total) & abs(z_total - (1.1208970766356103)) <= 1e-9 * max(1,abs(1.1208970766356103)) if id==8 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==8 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==8 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.049242424242424199)) <= 1e-9 * max(1,abs(0.049242424242424199)) if id==8 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.65081402661828602)) <= 1e-9 * max(1,abs(0.65081402661828602)) if id==8 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==8 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==8 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert missing(z_dry_end) if id==8 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.6666666666666643)) <= 1e-9 * max(1,abs(-5.6666666666666643)) if id==8 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.80064076902543524)) <= 1e-9 * max(1,abs(-0.80064076902543524)) if id==8 & year==2001
assert !missing(dev_total) & abs(dev_total - (-5.6666666666666643)) <= 1e-9 * max(1,abs(-5.6666666666666643)) if id==8 & year==2001
assert !missing(z_total) & abs(z_total - (-0.80064076902543524)) <= 1e-9 * max(1,abs(-0.80064076902543524)) if id==8 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==8 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==8 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.087121212121212155)) <= 1e-9 * max(1,abs(-0.087121212121212155)) if id==8 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.151440200940046)) <= 1e-9 * max(1,abs(-1.151440200940046)) if id==8 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==8 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==8 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2001
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2001
assert missing(z_dry_end) if id==8 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.2666666666666657)) <= 1e-9 * max(1,abs(-2.2666666666666657)) if id==8 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.3202563076101741)) <= 1e-9 * max(1,abs(-0.3202563076101741)) if id==8 & year==2002
assert !missing(dev_total) & abs(dev_total - (-2.2666666666666657)) <= 1e-9 * max(1,abs(-2.2666666666666657)) if id==8 & year==2002
assert !missing(z_total) & abs(z_total - (-0.3202563076101741)) <= 1e-9 * max(1,abs(-0.3202563076101741)) if id==8 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==8 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==8 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(z_norain) & abs(z_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.037878787878787845)) <= 1e-9 * max(1,abs(0.037878787878787845)) if id==8 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.50062617432175849)) <= 1e-9 * max(1,abs(0.50062617432175849)) if id==8 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==8 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==8 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==8 & year==2002
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==8 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert missing(z_dry_end) if id==8 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (10.63333333333334)) <= 1e-9 * max(1,abs(10.63333333333334)) if id==8 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.5023788548183181)) <= 1e-9 * max(1,abs(1.5023788548183181)) if id==8 & year==2003
assert !missing(dev_total) & abs(dev_total - (10.63333333333334)) <= 1e-9 * max(1,abs(10.63333333333334)) if id==8 & year==2003
assert !missing(z_total) & abs(z_total - (1.5023788548183181)) <= 1e-9 * max(1,abs(1.5023788548183181)) if id==8 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==8 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==8 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.041666666666666741)) <= 1e-9 * max(1,abs(-0.041666666666666741)) if id==8 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.55068879175393581)) <= 1e-9 * max(1,abs(-0.55068879175393581)) if id==8 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==8 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==8 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert missing(z_dry_end) if id==8 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-27.466666666666661)) <= 1e-9 * max(1,abs(-27.466666666666661)) if id==8 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.8807529039821103)) <= 1e-9 * max(1,abs(-3.8807529039821103)) if id==8 & year==2004
assert !missing(dev_total) & abs(dev_total - (-27.466666666666661)) <= 1e-9 * max(1,abs(-27.466666666666661)) if id==8 & year==2004
assert !missing(z_total) & abs(z_total - (-3.8807529039821103)) <= 1e-9 * max(1,abs(-3.8807529039821103)) if id==8 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==8 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==8 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(z_norain) & abs(z_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.28712121212121217)) <= 1e-9 * max(1,abs(-0.28712121212121217)) if id==8 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.7947464013589332)) <= 1e-9 * max(1,abs(-3.7947464013589332)) if id==8 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==8 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==8 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert missing(z_dry_end) if id==8 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-22.666666666666664)) <= 1e-9 * max(1,abs(-22.666666666666664)) if id==8 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.2025630761017418)) <= 1e-9 * max(1,abs(-3.2025630761017418)) if id==8 & year==2005
assert !missing(dev_total) & abs(dev_total - (-22.666666666666664)) <= 1e-9 * max(1,abs(-22.666666666666664)) if id==8 & year==2005
assert !missing(z_total) & abs(z_total - (-3.2025630761017418)) <= 1e-9 * max(1,abs(-3.2025630761017418)) if id==8 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==8 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==8 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.21212121212121215)) <= 1e-9 * max(1,abs(-0.21212121212121215)) if id==8 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.8035065762018503)) <= 1e-9 * max(1,abs(-2.8035065762018503)) if id==8 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==8 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==8 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2005
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert missing(z_dry_end) if id==8 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.5666666666666664)) <= 1e-9 * max(1,abs(-4.5666666666666664)) if id==9 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.61044638360915904)) <= 1e-9 * max(1,abs(-0.61044638360915904)) if id==9 & year==2000
assert !missing(dev_total) & abs(dev_total - (-4.5666666666666664)) <= 1e-9 * max(1,abs(-4.5666666666666664)) if id==9 & year==2000
assert !missing(z_total) & abs(z_total - (-0.61044638360915904)) <= 1e-9 * max(1,abs(-0.61044638360915904)) if id==9 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==9 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==9 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==9 & year==2000
assert !missing(z_norain) & abs(z_norain - (0.87287156094396923)) <= 1e-9 * max(1,abs(0.87287156094396923)) if id==9 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.1111111111111111)) <= 1e-9 * max(1,abs(-0.1111111111111111)) if id==9 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70436072506049896)) <= 1e-9 * max(1,abs(-0.70436072506049896)) if id==9 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==9 & year==2000
assert !missing(z_dry) & abs(z_dry - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==9 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert missing(z_dry_end) if id==9 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (8.6333333333333329)) <= 1e-9 * max(1,abs(8.6333333333333329)) if id==9 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1540555719326437)) <= 1e-9 * max(1,abs(1.1540555719326437)) if id==9 & year==2001
assert !missing(dev_total) & abs(dev_total - (8.6333333333333329)) <= 1e-9 * max(1,abs(8.6333333333333329)) if id==9 & year==2001
assert !missing(z_total) & abs(z_total - (1.1540555719326437)) <= 1e-9 * max(1,abs(1.1540555719326437)) if id==9 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==9 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==9 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9 & year==2001
assert !missing(z_norain) & abs(z_norain - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==9 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.18055555555555558)) <= 1e-9 * max(1,abs(0.18055555555555558)) if id==9 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1445861782233109)) <= 1e-9 * max(1,abs(1.1445861782233109)) if id==9 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==9 & year==2001
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert missing(z_dry_end) if id==9 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.0666666666666664)) <= 1e-9 * max(1,abs(-4.0666666666666664)) if id==9 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.5436091883234847)) <= 1e-9 * max(1,abs(-0.5436091883234847)) if id==9 & year==2002
assert !missing(dev_total) & abs(dev_total - (-4.0666666666666664)) <= 1e-9 * max(1,abs(-4.0666666666666664)) if id==9 & year==2002
assert !missing(z_total) & abs(z_total - (-0.5436091883234847)) <= 1e-9 * max(1,abs(-0.5436091883234847)) if id==9 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==9 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==9 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==9 & year==2002
assert !missing(z_norain) & abs(z_norain - (0.21821789023599217)) <= 1e-9 * max(1,abs(0.21821789023599217)) if id==9 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.06944444444444442)) <= 1e-9 * max(1,abs(-0.06944444444444442)) if id==9 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.4402254531628117)) <= 1e-9 * max(1,abs(-0.4402254531628117)) if id==9 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==9 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert missing(z_dry_end) if id==9 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (13.333333333333336)) <= 1e-9 * max(1,abs(13.333333333333336)) if id==9 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.782325207617983)) <= 1e-9 * max(1,abs(1.782325207617983)) if id==9 & year==2003
assert !missing(dev_total) & abs(dev_total - (13.333333333333336)) <= 1e-9 * max(1,abs(13.333333333333336)) if id==9 & year==2003
assert !missing(z_total) & abs(z_total - (1.782325207617983)) <= 1e-9 * max(1,abs(1.782325207617983)) if id==9 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (3.3333333333333335)) <= 1e-9 * max(1,abs(3.3333333333333335)) if id==9 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==9 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.43643578047198495)) <= 1e-9 * max(1,abs(-0.43643578047198495)) if id==9 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.19191919191919193)) <= 1e-9 * max(1,abs(0.19191919191919193)) if id==9 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.2166230705590437)) <= 1e-9 * max(1,abs(1.2166230705590437)) if id==9 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==9 & year==2003
assert !missing(z_dry) & abs(z_dry - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==9 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert missing(z_dry_end) if id==9 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (22.733333333333334)) <= 1e-9 * max(1,abs(22.733333333333334)) if id==9 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.0388644789886605)) <= 1e-9 * max(1,abs(3.0388644789886605)) if id==9 & year==2004
assert !missing(dev_total) & abs(dev_total - (22.733333333333334)) <= 1e-9 * max(1,abs(22.733333333333334)) if id==9 & year==2004
assert !missing(z_total) & abs(z_total - (3.0388644789886605)) <= 1e-9 * max(1,abs(3.0388644789886605)) if id==9 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==9 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (2.0207259421636903)) <= 1e-9 * max(1,abs(2.0207259421636903)) if id==9 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.43643578047198495)) <= 1e-9 * max(1,abs(-0.43643578047198495)) if id==9 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.15555555555555556)) <= 1e-9 * max(1,abs(0.15555555555555556)) if id==9 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.98610501508469861)) <= 1e-9 * max(1,abs(0.98610501508469861)) if id==9 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==9 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert missing(z_dry_end) if id==9 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (34.633333333333333)) <= 1e-9 * max(1,abs(34.633333333333333)) if id==9 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (4.6295897267877102)) <= 1e-9 * max(1,abs(4.6295897267877102)) if id==9 & year==2005
assert !missing(dev_total) & abs(dev_total - (34.633333333333333)) <= 1e-9 * max(1,abs(34.633333333333333)) if id==9 & year==2005
assert !missing(z_total) & abs(z_total - (4.6295897267877102)) <= 1e-9 * max(1,abs(4.6295897267877102)) if id==9 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==9 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (2.0207259421636903)) <= 1e-9 * max(1,abs(2.0207259421636903)) if id==9 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9 & year==2005
assert !missing(z_norain) & abs(z_norain - (-0.43643578047198495)) <= 1e-9 * max(1,abs(-0.43643578047198495)) if id==9 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.15555555555555556)) <= 1e-9 * max(1,abs(0.15555555555555556)) if id==9 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.98610501508469861)) <= 1e-9 * max(1,abs(0.98610501508469861)) if id==9 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==9 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert missing(z_dry_end) if id==9 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-15.233333333333333)) <= 1e-9 * max(1,abs(-15.233333333333333)) if id==10 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.935346890519276)) <= 1e-9 * max(1,abs(-0.935346890519276)) if id==10 & year==2000
assert !missing(dev_total) & abs(dev_total - (-15.233333333333333)) <= 1e-9 * max(1,abs(-15.233333333333333)) if id==10 & year==2000
assert !missing(z_total) & abs(z_total - (-0.935346890519276)) <= 1e-9 * max(1,abs(-0.935346890519276)) if id==10 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==10 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.92717264994553061)) <= 1e-9 * max(1,abs(-0.92717264994553061)) if id==10 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert missing(z_norain) if id==10 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.15656565656565657)) <= 1e-9 * max(1,abs(-0.15656565656565657)) if id==10 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0316154047415687)) <= 1e-9 * max(1,abs(-1.0316154047415687)) if id==10 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==10 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==10 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==10 & year==2000
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
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.9333333333333336)) <= 1e-9 * max(1,abs(-1.9333333333333336)) if id==10 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.1187092333700613)) <= 1e-9 * max(1,abs(-0.1187092333700613)) if id==10 & year==2001
assert !missing(dev_total) & abs(dev_total - (-1.9333333333333336)) <= 1e-9 * max(1,abs(-1.9333333333333336)) if id==10 & year==2001
assert !missing(z_total) & abs(z_total - (-0.1187092333700613)) <= 1e-9 * max(1,abs(-0.1187092333700613)) if id==10 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==10 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.13245323570650427)) <= 1e-9 * max(1,abs(-0.13245323570650427)) if id==10 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert missing(z_norain) if id==10 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.010101010101010111)) <= 1e-9 * max(1,abs(0.010101010101010111)) if id==10 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.066555832563972239)) <= 1e-9 * max(1,abs(0.066555832563972239)) if id==10 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==10 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==10 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==10 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==10 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (17.166666666666664)) <= 1e-9 * max(1,abs(17.166666666666664)) if id==10 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.0540561238893371)) <= 1e-9 * max(1,abs(1.0540561238893371)) if id==10 & year==2002
assert !missing(dev_total) & abs(dev_total - (17.166666666666664)) <= 1e-9 * max(1,abs(17.166666666666664)) if id==10 & year==2002
assert !missing(z_total) & abs(z_total - (1.0540561238893371)) <= 1e-9 * max(1,abs(1.0540561238893371)) if id==10 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==10 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1.0596258856520353)) <= 1e-9 * max(1,abs(1.0596258856520353)) if id==10 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert missing(z_norain) if id==10 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.14646464646464646)) <= 1e-9 * max(1,abs(0.14646464646464646)) if id==10 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.96505957217759653)) <= 1e-9 * max(1,abs(0.96505957217759653)) if id==10 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==10 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==10 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==10 & year==2002
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
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-19.933333333333334)) <= 1e-9 * max(1,abs(-19.933333333333334)) if id==10 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.2239331302637353)) <= 1e-9 * max(1,abs(-1.2239331302637353)) if id==10 & year==2003
assert !missing(dev_total) & abs(dev_total - (-19.933333333333334)) <= 1e-9 * max(1,abs(-19.933333333333334)) if id==10 & year==2003
assert !missing(z_total) & abs(z_total - (-1.2239331302637353)) <= 1e-9 * max(1,abs(-1.2239331302637353)) if id==10 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==10 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.92717264994553061)) <= 1e-9 * max(1,abs(-0.92717264994553061)) if id==10 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert missing(z_norain) if id==10 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.26767676767676768)) <= 1e-9 * max(1,abs(-0.26767676767676768)) if id==10 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.7637295629452625)) <= 1e-9 * max(1,abs(-1.7637295629452625)) if id==10 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==10 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==10 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (16.666666666666664)) <= 1e-9 * max(1,abs(16.666666666666664)) if id==10 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.0233554600867352)) <= 1e-9 * max(1,abs(1.0233554600867352)) if id==10 & year==2004
assert !missing(dev_total) & abs(dev_total - (16.666666666666664)) <= 1e-9 * max(1,abs(16.666666666666664)) if id==10 & year==2004
assert !missing(z_total) & abs(z_total - (1.0233554600867352)) <= 1e-9 * max(1,abs(1.0233554600867352)) if id==10 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==10 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.66226617853252201)) <= 1e-9 * max(1,abs(0.66226617853252201)) if id==10 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2004
assert missing(z_norain) if id==10 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.17676767676767674)) <= 1e-9 * max(1,abs(0.17676767676767674)) if id==10 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1647270698695129)) <= 1e-9 * max(1,abs(1.1647270698695129)) if id==10 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1.3333333333333333)) <= 1e-9 * max(1,abs(-1.3333333333333333)) if id==10 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (-2.3094010767585029)) <= 1e-9 * max(1,abs(-2.3094010767585029)) if id==10 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==10 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==10 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (20.166666666666664)) <= 1e-9 * max(1,abs(20.166666666666664)) if id==10 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2382601067049495)) <= 1e-9 * max(1,abs(1.2382601067049495)) if id==10 & year==2005
assert !missing(dev_total) & abs(dev_total - (20.166666666666664)) <= 1e-9 * max(1,abs(20.166666666666664)) if id==10 & year==2005
assert !missing(z_total) & abs(z_total - (1.2382601067049495)) <= 1e-9 * max(1,abs(1.2382601067049495)) if id==10 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==10 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (0.26490647141300888)) <= 1e-9 * max(1,abs(0.26490647141300888)) if id==10 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2005
assert missing(z_norain) if id==10 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.073232323232323204)) <= 1e-9 * max(1,abs(-0.073232323232323204)) if id==10 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.48252978608879804)) <= 1e-9 * max(1,abs(-0.48252978608879804)) if id==10 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==10 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==10 & year==2005
assert !missing(z_dry) & abs(z_dry - (2.3094010767585034)) <= 1e-9 * max(1,abs(2.3094010767585034)) if id==10 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (2.3333333333333335)) <= 1e-9 * max(1,abs(2.3333333333333335)) if id==10 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (2.0207259421636903)) <= 1e-9 * max(1,abs(2.0207259421636903)) if id==10 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.1666666666666679)) <= 1e-9 * max(1,abs(-4.1666666666666679)) if id==11 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.64567803953664182)) <= 1e-9 * max(1,abs(-0.64567803953664182)) if id==11 & year==2000
assert !missing(dev_total) & abs(dev_total - (-4.1666666666666679)) <= 1e-9 * max(1,abs(-4.1666666666666679)) if id==11 & year==2000
assert !missing(z_total) & abs(z_total - (-0.64567803953664182)) <= 1e-9 * max(1,abs(-0.64567803953664182)) if id==11 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==11 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==11 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==11 & year==2000
assert !missing(z_norain) & abs(z_norain - (0.87287156094396923)) <= 1e-9 * max(1,abs(0.87287156094396923)) if id==11 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.10370370370370363)) <= 1e-9 * max(1,abs(-0.10370370370370363)) if id==11 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.72586618631129729)) <= 1e-9 * max(1,abs(-0.72586618631129729)) if id==11 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==11 & year==2000
assert !missing(z_dry) & abs(z_dry - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==11 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==11 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==11 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.2666666666666657)) <= 1e-9 * max(1,abs(-3.2666666666666657)) if id==11 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.50621158299672686)) <= 1e-9 * max(1,abs(-0.50621158299672686)) if id==11 & year==2001
assert !missing(dev_total) & abs(dev_total - (-3.2666666666666657)) <= 1e-9 * max(1,abs(-3.2666666666666657)) if id==11 & year==2001
assert !missing(z_total) & abs(z_total - (-0.50621158299672686)) <= 1e-9 * max(1,abs(-0.50621158299672686)) if id==11 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==11 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==11 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==11 & year==2001
assert !missing(z_norain) & abs(z_norain - (0.21821789023599217)) <= 1e-9 * max(1,abs(0.21821789023599217)) if id==11 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.059259259259259234)) <= 1e-9 * max(1,abs(-0.059259259259259234)) if id==11 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.41478067789216994)) <= 1e-9 * max(1,abs(-0.41478067789216994)) if id==11 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==11 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==11 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==11 & year==2001
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==11 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.4333333333333336)) <= 1e-9 * max(1,abs(7.4333333333333336)) if id==11 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1518896225333688)) <= 1e-9 * max(1,abs(1.1518896225333688)) if id==11 & year==2002
assert !missing(dev_total) & abs(dev_total - (7.4333333333333336)) <= 1e-9 * max(1,abs(7.4333333333333336)) if id==11 & year==2002
assert !missing(z_total) & abs(z_total - (1.1518896225333688)) <= 1e-9 * max(1,abs(1.1518896225333688)) if id==11 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==11 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==11 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==11 & year==2002
assert !missing(z_norain) & abs(z_norain - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==11 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.16296296296296298)) <= 1e-9 * max(1,abs(0.16296296296296298)) if id==11 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1406468642034679)) <= 1e-9 * max(1,abs(1.1406468642034679)) if id==11 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==11 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==11 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.46666666666666501)) <= 1e-9 * max(1,abs(-0.46666666666666501)) if id==11 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.072315940428103603)) <= 1e-9 * max(1,abs(-0.072315940428103603)) if id==11 & year==2003
assert !missing(dev_total) & abs(dev_total - (-0.46666666666666501)) <= 1e-9 * max(1,abs(-0.46666666666666501)) if id==11 & year==2003
assert !missing(z_total) & abs(z_total - (-0.072315940428103603)) <= 1e-9 * max(1,abs(-0.072315940428103603)) if id==11 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==11 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==11 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==11 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==11 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.12129629629629635)) <= 1e-9 * max(1,abs(0.12129629629629635)) if id==11 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.84900420006053612)) <= 1e-9 * max(1,abs(0.84900420006053612)) if id==11 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==11 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==11 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==11 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==11 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (4.2333333333333343)) <= 1e-9 * max(1,abs(4.2333333333333343)) if id==11 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.65600888816922809)) <= 1e-9 * max(1,abs(0.65600888816922809)) if id==11 & year==2004
assert !missing(dev_total) & abs(dev_total - (4.2333333333333343)) <= 1e-9 * max(1,abs(4.2333333333333343)) if id==11 & year==2004
assert !missing(z_total) & abs(z_total - (0.65600888816922809)) <= 1e-9 * max(1,abs(0.65600888816922809)) if id==11 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (3.333333333333333)) <= 1e-9 * max(1,abs(3.333333333333333)) if id==11 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (2.8867513459481287)) <= 1e-9 * max(1,abs(2.8867513459481287)) if id==11 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==11 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==11 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.22356902356902364)) <= 1e-9 * max(1,abs(0.22356902356902364)) if id==11 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.5648543756840969)) <= 1e-9 * max(1,abs(1.5648543756840969)) if id==11 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==11 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==11 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-6.8666666666666671)) <= 1e-9 * max(1,abs(-6.8666666666666671)) if id==11 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0640774091563854)) <= 1e-9 * max(1,abs(-1.0640774091563854)) if id==11 & year==2005
assert !missing(dev_total) & abs(dev_total - (-6.8666666666666671)) <= 1e-9 * max(1,abs(-6.8666666666666671)) if id==11 & year==2005
assert !missing(z_total) & abs(z_total - (-1.0640774091563854)) <= 1e-9 * max(1,abs(-1.0640774091563854)) if id==11 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (3.333333333333333)) <= 1e-9 * max(1,abs(3.333333333333333)) if id==11 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (2.8867513459481287)) <= 1e-9 * max(1,abs(2.8867513459481287)) if id==11 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==11 & year==2005
assert !missing(z_norain) & abs(z_norain - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==11 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.22356902356902364)) <= 1e-9 * max(1,abs(0.22356902356902364)) if id==11 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.5648543756840969)) <= 1e-9 * max(1,abs(1.5648543756840969)) if id==11 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==11 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==11 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11 & year==2005
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.20000000000000284)) <= 1e-9 * max(1,abs(0.20000000000000284)) if id==12 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.014183327086761274)) <= 1e-9 * max(1,abs(0.014183327086761274)) if id==12 & year==2000
assert !missing(dev_total) & abs(dev_total - (0.20000000000000284)) <= 1e-9 * max(1,abs(0.20000000000000284)) if id==12 & year==2000
assert !missing(z_total) & abs(z_total - (0.014183327086761274)) <= 1e-9 * max(1,abs(0.014183327086761274)) if id==12 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==12 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.21821789023599217)) <= 1e-9 * max(1,abs(-0.21821789023599217)) if id==12 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==12 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.32025630761017443)) <= 1e-9 * max(1,abs(-0.32025630761017443)) if id==12 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.0053872053872053849)) <= 1e-9 * max(1,abs(0.0053872053872053849)) if id==12 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.032908438041733032)) <= 1e-9 * max(1,abs(0.032908438041733032)) if id==12 & year==2000
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2000
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==12 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==12 & year==2000
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==12 & year==2000
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==12 & year==2000
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14)) <= 1e-9 * max(1,abs(14)) if id==12 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.99283289607327507)) <= 1e-9 * max(1,abs(0.99283289607327507)) if id==12 & year==2001
assert !missing(dev_total) & abs(dev_total - (14)) <= 1e-9 * max(1,abs(14)) if id==12 & year==2001
assert !missing(z_total) & abs(z_total - (0.99283289607327507)) <= 1e-9 * max(1,abs(0.99283289607327507)) if id==12 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==12 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1.091089451179962)) <= 1e-9 * max(1,abs(1.091089451179962)) if id==12 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12 & year==2001
assert !missing(z_norain) & abs(z_norain - (-0.80064076902543591)) <= 1e-9 * max(1,abs(-0.80064076902543591)) if id==12 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.16094276094276094)) <= 1e-9 * max(1,abs(0.16094276094276094)) if id==12 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.9831395864967748)) <= 1e-9 * max(1,abs(0.9831395864967748)) if id==12 & year==2001
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2001
assert !missing(z_dry_start) & abs(z_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==12 & year==2001
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==12 & year==2001
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==12 & year==2001
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==12 & year==2001
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-14.199999999999998)) <= 1e-9 * max(1,abs(-14.199999999999998)) if id==12 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0070162231600359)) <= 1e-9 * max(1,abs(-1.0070162231600359)) if id==12 & year==2002
assert !missing(dev_total) & abs(dev_total - (-14.199999999999998)) <= 1e-9 * max(1,abs(-14.199999999999998)) if id==12 & year==2002
assert !missing(z_total) & abs(z_total - (-1.0070162231600359)) <= 1e-9 * max(1,abs(-1.0070162231600359)) if id==12 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==12 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.87287156094396923)) <= 1e-9 * max(1,abs(-0.87287156094396923)) if id==12 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (2.333333333333333)) <= 1e-9 * max(1,abs(2.333333333333333)) if id==12 & year==2002
assert !missing(z_norain) & abs(z_norain - (1.1208970766356099)) <= 1e-9 * max(1,abs(1.1208970766356099)) if id==12 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.16632996632996633)) <= 1e-9 * max(1,abs(-0.16632996632996633)) if id==12 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0160480245385077)) <= 1e-9 * max(1,abs(-1.0160480245385077)) if id==12 & year==2002
assert !missing(dev_dry_start) & abs(dev_dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(z_dry_start) & abs(z_dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==12 & year==2002
assert !missing(z_dry) & abs(z_dry - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==12 & year==2002
assert !missing(dev_dry_end) & abs(dev_dry_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==12 & year==2002
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==12 & year==2002
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.3999999999999986)) <= 1e-9 * max(1,abs(-7.3999999999999986)) if id==12 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.52478310221015956)) <= 1e-9 * max(1,abs(-0.52478310221015956)) if id==12 & year==2003
assert !missing(dev_total) & abs(dev_total - (-7.3999999999999986)) <= 1e-9 * max(1,abs(-7.3999999999999986)) if id==12 & year==2003
assert !missing(z_total) & abs(z_total - (-0.52478310221015956)) <= 1e-9 * max(1,abs(-0.52478310221015956)) if id==12 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==12 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.21821789023599217)) <= 1e-9 * max(1,abs(-0.21821789023599217)) if id==12 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12 & year==2003
assert !missing(z_norain) & abs(z_norain - (-0.80064076902543591)) <= 1e-9 * max(1,abs(-0.80064076902543591)) if id==12 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.060942760942760965)) <= 1e-9 * max(1,abs(0.060942760942760965)) if id==12 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.37227670534710522)) <= 1e-9 * max(1,abs(0.37227670534710522)) if id==12 & year==2003
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==12 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==12 & year==2003
assert !missing(dev_dry_end) & abs(dev_dry_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==12 & year==2003
assert !missing(z_dry_end) & abs(z_dry_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==12 & year==2003
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (33)) <= 1e-9 * max(1,abs(33)) if id==12 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.340248969315577)) <= 1e-9 * max(1,abs(2.340248969315577)) if id==12 & year==2004
assert !missing(dev_total) & abs(dev_total - (33)) <= 1e-9 * max(1,abs(33)) if id==12 & year==2004
assert !missing(z_total) & abs(z_total - (2.340248969315577)) <= 1e-9 * max(1,abs(2.340248969315577)) if id==12 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==12 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (1.091089451179962)) <= 1e-9 * max(1,abs(1.091089451179962)) if id==12 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==12 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.2810252304406973)) <= 1e-9 * max(1,abs(-1.2810252304406973)) if id==12 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.22760942760942759)) <= 1e-9 * max(1,abs(0.22760942760942759)) if id==12 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.3903815072632211)) <= 1e-9 * max(1,abs(1.3903815072632211)) if id==12 & year==2004
assert !missing(dev_dry_start) & abs(dev_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(z_dry_start) & abs(z_dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==12 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==12 & year==2004
assert !missing(dev_dry_end) & abs(dev_dry_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==12 & year==2004
assert !missing(z_dry_end) & abs(z_dry_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==12 & year==2004
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.9000000000000021)) <= 1e-9 * max(1,abs(3.9000000000000021)) if id==12 & year==2005
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.27657487819184107)) <= 1e-9 * max(1,abs(0.27657487819184107)) if id==12 & year==2005
assert !missing(dev_total) & abs(dev_total - (3.9000000000000021)) <= 1e-9 * max(1,abs(3.9000000000000021)) if id==12 & year==2005
assert !missing(z_total) & abs(z_total - (0.27657487819184107)) <= 1e-9 * max(1,abs(0.27657487819184107)) if id==12 & year==2005
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==12 & year==2005
assert !missing(z_raindays) & abs(z_raindays - (-0.21821789023599217)) <= 1e-9 * max(1,abs(-0.21821789023599217)) if id==12 & year==2005
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12 & year==2005
assert !missing(z_norain) & abs(z_norain - (-0.80064076902543591)) <= 1e-9 * max(1,abs(-0.80064076902543591)) if id==12 & year==2005
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.060942760942760965)) <= 1e-9 * max(1,abs(0.060942760942760965)) if id==12 & year==2005
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.37227670534710522)) <= 1e-9 * max(1,abs(0.37227670534710522)) if id==12 & year==2005
assert !missing(dev_dry_start) & abs(dev_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2005
assert !missing(z_dry_start) & abs(z_dry_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2005
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==12 & year==2005
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==12 & year==2005
assert !missing(dev_dry_end) & abs(dev_dry_end - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==12 & year==2005
assert !missing(z_dry_end) & abs(z_dry_end - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==12 & year==2005
assert _N==72
