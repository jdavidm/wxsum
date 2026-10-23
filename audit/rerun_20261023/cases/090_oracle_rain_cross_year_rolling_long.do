version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/oracle_rain.csv", clear varnames(1) asdouble
wxsum x_, type(rain) ini_month(12) ini_day(29) fin_month(3) fin_day(2) lr_years(2) ref_min(2) minobs(2) shape(long) keep(id) cuts(1 2 5)
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(mean) & abs(mean - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1 & year==2000
assert !missing(median) & abs(median - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1 & year==2000
assert !missing(var) & abs(var - (0.32000000000000001)) <= 1e-9 * max(1,abs(0.32000000000000001)) if id==1 & year==2000
assert !missing(sd) & abs(sd - (0.56568542494923801)) <= 1e-9 * max(1,abs(0.56568542494923801)) if id==1 & year==2000
assert missing(skew) if id==1 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1 & year==2000
assert !missing(total) & abs(total - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1 & year==2000
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
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
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==1 & year==2001
assert !missing(mean) & abs(mean - (3.3076923076923075)) <= 1e-9 * max(1,abs(3.3076923076923075)) if id==1 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2001
assert !missing(var) & abs(var - (37.369102564102562)) <= 1e-9 * max(1,abs(37.369102564102562)) if id==1 & year==2001
assert !missing(sd) & abs(sd - (6.1130272831145263)) <= 1e-9 * max(1,abs(6.1130272831145263)) if id==1 & year==2001
assert !missing(skew) & abs(skew - (2.1237997821220285)) <= 1e-9 * max(1,abs(2.1237997821220285)) if id==1 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.333333333333334)) <= 1e-9 * max(1,abs(14.333333333333334)) if id==1 & year==2001
assert !missing(total) & abs(total - (43)) <= 1e-9 * max(1,abs(43)) if id==1 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==1 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==1 & year==2002
assert !missing(mean) & abs(mean - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(var) & abs(var - (50.142857142857146)) <= 1e-9 * max(1,abs(50.142857142857146)) if id==1 & year==2002
assert !missing(sd) & abs(sd - (7.0811621322249882)) <= 1e-9 * max(1,abs(7.0811621322249882)) if id==1 & year==2002
assert !missing(skew) & abs(skew - (0.96792634662515575)) <= 1e-9 * max(1,abs(0.96792634662515575)) if id==1 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (22.5)) <= 1e-9 * max(1,abs(22.5)) if id==1 & year==2002
assert !missing(total) & abs(total - (90)) <= 1e-9 * max(1,abs(90)) if id==1 & year==2002
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==1 & year==2002
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==1 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.733333333333334)) <= 1e-9 * max(1,abs(14.733333333333334)) if id==1 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.5865035395149949)) <= 1e-9 * max(1,abs(1.5865035395149949)) if id==1 & year==2002
assert !missing(dev_total) & abs(dev_total - (67.900000000000006)) <= 1e-9 * max(1,abs(67.900000000000006)) if id==1 & year==2002
assert !missing(z_total) & abs(z_total - (2.2972512173476836)) <= 1e-9 * max(1,abs(2.2972512173476836)) if id==1 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==1 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1.8856180831641269)) <= 1e-9 * max(1,abs(1.8856180831641269)) if id==1 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.1414213562373095)) <= 1e-9 * max(1,abs(-0.1414213562373095)) if id==1 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.28076923076923088)) <= 1e-9 * max(1,abs(0.28076923076923088)) if id==1 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (10.323759005323604)) <= 1e-9 * max(1,abs(10.323759005323604)) if id==1 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==1 & year==2003
assert !missing(mean) & abs(mean - (2.3187500000000001)) <= 1e-9 * max(1,abs(2.3187500000000001)) if id==1 & year==2003
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1 & year==2003
assert !missing(var) & abs(var - (17.742958333333334)) <= 1e-9 * max(1,abs(17.742958333333334)) if id==1 & year==2003
assert !missing(sd) & abs(sd - (4.2122391116048163)) <= 1e-9 * max(1,abs(4.2122391116048163)) if id==1 & year==2003
assert !missing(skew) & abs(skew - (3.1937322646126645)) <= 1e-9 * max(1,abs(3.1937322646126645)) if id==1 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (9.2750000000000004)) <= 1e-9 * max(1,abs(9.2750000000000004)) if id==1 & year==2003
assert !missing(total) & abs(total - (37.100000000000001)) <= 1e-9 * max(1,abs(37.100000000000001)) if id==1 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2003
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==1 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2003
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-9.1416666666666675)) <= 1e-9 * max(1,abs(-9.1416666666666675)) if id==1 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.5830533448196791)) <= 1e-9 * max(1,abs(-1.5830533448196791)) if id==1 & year==2003
assert !missing(dev_total) & abs(dev_total - (-29.399999999999999)) <= 1e-9 * max(1,abs(-29.399999999999999)) if id==1 & year==2003
assert !missing(z_total) & abs(z_total - (-0.88463571773976579)) <= 1e-9 * max(1,abs(-0.88463571773976579)) if id==1 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==1 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.98994949366116647)) <= 1e-9 * max(1,abs(-0.98994949366116647)) if id==1 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (5.5)) <= 1e-9 * max(1,abs(5.5)) if id==1 & year==2003
assert !missing(z_norain) & abs(z_norain - (2.5927248643506746)) <= 1e-9 * max(1,abs(2.5927248643506746)) if id==1 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.2942307692307693)) <= 1e-9 * max(1,abs(-0.2942307692307693)) if id==1 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.5909902576697319)) <= 1e-9 * max(1,abs(-1.5909902576697319)) if id==1 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==1 & year==2003
assert !missing(z_dry) & abs(z_dry - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==1 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2004
assert !missing(mean) & abs(mean - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(median) & abs(median - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==1 & year==2004
assert !missing(var) & abs(var - (2.4066666666666667)) <= 1e-9 * max(1,abs(2.4066666666666667)) if id==1 & year==2004
assert !missing(sd) & abs(sd - (1.5513435037626795)) <= 1e-9 * max(1,abs(1.5513435037626795)) if id==1 & year==2004
assert !missing(skew) & abs(skew - (2.2500825646046452)) <= 1e-9 * max(1,abs(2.2500825646046452)) if id==1 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1 & year==2004
assert !missing(total) & abs(total - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2004
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==1 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-13.387499999999999)) <= 1e-9 * max(1,abs(-13.387499999999999)) if id==1 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.4315904776007418)) <= 1e-9 * max(1,abs(-1.4315904776007418)) if id==1 & year==2004
assert !missing(dev_total) & abs(dev_total - (-53.549999999999997)) <= 1e-9 * max(1,abs(-53.549999999999997)) if id==1 & year==2004
assert !missing(z_total) & abs(z_total - (-1.4315904776007418)) <= 1e-9 * max(1,abs(-1.4315904776007418)) if id==1 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-6)) <= 1e-9 * max(1,abs(-6)) if id==1 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-1.4142135623730951)) <= 1e-9 * max(1,abs(-1.4142135623730951)) if id==1 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.10101525445522107)) <= 1e-9 * max(1,abs(0.10101525445522107)) if id==1 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.28750000000000003)) <= 1e-9 * max(1,abs(-0.28750000000000003)) if id==1 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.95667388042885848)) <= 1e-9 * max(1,abs(-0.95667388042885848)) if id==1 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2004
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(skew) if id==2 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2000
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2000
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
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
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(skew) if id==2 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2001
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2001
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
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
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(skew) if id==2 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2002
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2002
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
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
assert !missing(nobs) & abs(nobs - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(skew) if id==2 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==2 & year==2003
assert !missing(total) & abs(total - (38)) <= 1e-9 * max(1,abs(38)) if id==2 & year==2003
assert !missing(raindays) & abs(raindays - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut03) & abs(cut03 - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==2 & year==2003
assert missing(z_mean_mo) if id==2 & year==2003
assert !missing(dev_total) & abs(dev_total - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert missing(z_total) if id==2 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert missing(z_raindays) if id==2 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_norain) if id==2 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_pct_raindays) if id==2 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry) if id==2 & year==2003
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(skew) if id==2 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2004
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2004
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.25)) <= 1e-9 * max(1,abs(-0.25)) if id==2 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2 & year==2004
assert !missing(dev_total) & abs(dev_total - (-1)) <= 1e-9 * max(1,abs(-1)) if id==2 & year==2004
assert !missing(z_total) & abs(z_total - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==2 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_norain) if id==2 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_pct_raindays) if id==2 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry) if id==2 & year==2004
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==4 & year==2000
assert !missing(mean) & abs(mean - (5.5533333333333337)) <= 1e-9 * max(1,abs(5.5533333333333337)) if id==4 & year==2000
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2000
assert !missing(var) & abs(var - (38.735523809523812)) <= 1e-9 * max(1,abs(38.735523809523812)) if id==4 & year==2000
assert !missing(sd) & abs(sd - (6.2237869347788415)) <= 1e-9 * max(1,abs(6.2237869347788415)) if id==4 & year==2000
assert !missing(skew) & abs(skew - (1.2940101590126338)) <= 1e-9 * max(1,abs(1.2940101590126338)) if id==4 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (20.824999999999999)) <= 1e-9 * max(1,abs(20.824999999999999)) if id==4 & year==2000
assert !missing(total) & abs(total - (83.299999999999997)) <= 1e-9 * max(1,abs(83.299999999999997)) if id==4 & year==2000
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==4 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.73333333333333328)) <= 1e-9 * max(1,abs(0.73333333333333328)) if id==4 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2000
assert !missing(cut04) & abs(cut04 - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2000
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==4 & year==2001
assert !missing(mean) & abs(mean - (1.5733333333333333)) <= 1e-9 * max(1,abs(1.5733333333333333)) if id==4 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4 & year==2001
assert !missing(var) & abs(var - (3.4363809523809525)) <= 1e-9 * max(1,abs(3.4363809523809525)) if id==4 & year==2001
assert !missing(sd) & abs(sd - (1.8537478125087437)) <= 1e-9 * max(1,abs(1.8537478125087437)) if id==4 & year==2001
assert !missing(skew) & abs(skew - (1.3380636716760939)) <= 1e-9 * max(1,abs(1.3380636716760939)) if id==4 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (7.8666666666666671)) <= 1e-9 * max(1,abs(7.8666666666666671)) if id==4 & year==2001
assert !missing(total) & abs(total - (23.600000000000001)) <= 1e-9 * max(1,abs(23.600000000000001)) if id==4 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2001
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==4 & year==2001
assert !missing(dry_start) & abs(dry_start - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
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
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==4 & year==2002
assert !missing(mean) & abs(mean - (4.2307692307692308)) <= 1e-9 * max(1,abs(4.2307692307692308)) if id==4 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(var) & abs(var - (35.830641025641029)) <= 1e-9 * max(1,abs(35.830641025641029)) if id==4 & year==2002
assert !missing(sd) & abs(sd - (5.9858701143310009)) <= 1e-9 * max(1,abs(5.9858701143310009)) if id==4 & year==2002
assert !missing(skew) & abs(skew - (1.734210919117058)) <= 1e-9 * max(1,abs(1.734210919117058)) if id==4 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (18.333333333333332)) <= 1e-9 * max(1,abs(18.333333333333332)) if id==4 & year==2002
assert !missing(total) & abs(total - (55)) <= 1e-9 * max(1,abs(55)) if id==4 & year==2002
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==4 & year==2002
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.9874999999999989)) <= 1e-9 * max(1,abs(3.9874999999999989)) if id==4 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.43517761388779796)) <= 1e-9 * max(1,abs(0.43517761388779796)) if id==4 & year==2002
assert !missing(dev_total) & abs(dev_total - (1.5499999999999972)) <= 1e-9 * max(1,abs(1.5499999999999972)) if id==4 & year==2002
assert !missing(z_total) & abs(z_total - (0.036717437549050137)) <= 1e-9 * max(1,abs(0.036717437549050137)) if id==4 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.061538461538461542)) <= 1e-9 * max(1,abs(-0.061538461538461542)) if id==4 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.32635697593225277)) <= 1e-9 * max(1,abs(-0.32635697593225277)) if id==4 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4 & year==2002
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==4 & year==2003
assert !missing(mean) & abs(mean - (4.4222222222222225)) <= 1e-9 * max(1,abs(4.4222222222222225)) if id==4 & year==2003
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==4 & year==2003
assert !missing(var) & abs(var - (36.758300653594773)) <= 1e-9 * max(1,abs(36.758300653594773)) if id==4 & year==2003
assert !missing(sd) & abs(sd - (6.0628624142062444)) <= 1e-9 * max(1,abs(6.0628624142062444)) if id==4 & year==2003
assert !missing(skew) & abs(skew - (1.6051151924529741)) <= 1e-9 * max(1,abs(1.6051151924529741)) if id==4 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (19.899999999999999)) <= 1e-9 * max(1,abs(19.899999999999999)) if id==4 & year==2003
assert !missing(total) & abs(total - (79.599999999999994)) <= 1e-9 * max(1,abs(79.599999999999994)) if id==4 & year==2003
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (6.7999999999999989)) <= 1e-9 * max(1,abs(6.7999999999999989)) if id==4 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.91878842905767966)) <= 1e-9 * max(1,abs(0.91878842905767966)) if id==4 & year==2003
assert !missing(dev_total) & abs(dev_total - (40.299999999999997)) <= 1e-9 * max(1,abs(40.299999999999997)) if id==4 & year==2003
assert !missing(z_total) & abs(z_total - (1.8150575338737494)) <= 1e-9 * max(1,abs(1.8150575338737494)) if id==4 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert missing(z_raindays) if id==4 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert !missing(z_norain) & abs(z_norain - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==4 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.002564102564102555)) <= 1e-9 * max(1,abs(-0.002564102564102555)) if id==4 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.050507627227610381)) <= 1e-9 * max(1,abs(-0.050507627227610381)) if id==4 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2003
assert missing(z_dry) if id==4 & year==2003
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==4 & year==2004
assert !missing(mean) & abs(mean - (7.6230769230769226)) <= 1e-9 * max(1,abs(7.6230769230769226)) if id==4 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(var) & abs(var - (60.783589743589744)) <= 1e-9 * max(1,abs(60.783589743589744)) if id==4 & year==2004
assert !missing(sd) & abs(sd - (7.79638311934385)) <= 1e-9 * max(1,abs(7.79638311934385)) if id==4 & year==2004
assert !missing(skew) & abs(skew - (0.47321302776390833)) <= 1e-9 * max(1,abs(0.47321302776390833)) if id==4 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (33.033333333333331)) <= 1e-9 * max(1,abs(33.033333333333331)) if id==4 & year==2004
assert !missing(total) & abs(total - (99.099999999999994)) <= 1e-9 * max(1,abs(99.099999999999994)) if id==4 & year==2004
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==4 & year==2004
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.84615384615384615)) <= 1e-9 * max(1,abs(0.84615384615384615)) if id==4 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2004
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (13.916666666666664)) <= 1e-9 * max(1,abs(13.916666666666664)) if id==4 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (12.562428984909941)) <= 1e-9 * max(1,abs(12.562428984909941)) if id==4 & year==2004
assert !missing(dev_total) & abs(dev_total - (31.799999999999997)) <= 1e-9 * max(1,abs(31.799999999999997)) if id==4 & year==2004
assert !missing(z_total) & abs(z_total - (1.8281297269700985)) <= 1e-9 * max(1,abs(1.8281297269700985)) if id==4 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==4 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-5.5)) <= 1e-9 * max(1,abs(-5.5)) if id==4 & year==2004
assert !missing(z_norain) & abs(z_norain - (-2.5927248643506746)) <= 1e-9 * max(1,abs(-2.5927248643506746)) if id==4 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.32692307692307698)) <= 1e-9 * max(1,abs(0.32692307692307698)) if id==4 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (12.020815280171318)) <= 1e-9 * max(1,abs(12.020815280171318)) if id==4 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==4 & year==2004
assert !missing(z_dry) & abs(z_dry - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==4 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2000
assert !missing(mean) & abs(mean - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==5 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2000
assert !missing(var) & abs(var - (19.189523809523809)) <= 1e-9 * max(1,abs(19.189523809523809)) if id==5 & year==2000
assert !missing(sd) & abs(sd - (4.3805848707134771)) <= 1e-9 * max(1,abs(4.3805848707134771)) if id==5 & year==2000
assert !missing(skew) & abs(skew - (2.8170764665843957)) <= 1e-9 * max(1,abs(2.8170764665843957)) if id==5 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2000
assert !missing(total) & abs(total - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2000
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2000
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==5 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2000
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2001
assert !missing(mean) & abs(mean - (2.6800000000000002)) <= 1e-9 * max(1,abs(2.6800000000000002)) if id==5 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2001
assert !missing(var) & abs(var - (19.140285714285714)) <= 1e-9 * max(1,abs(19.140285714285714)) if id==5 & year==2001
assert !missing(sd) & abs(sd - (4.3749612243179614)) <= 1e-9 * max(1,abs(4.3749612243179614)) if id==5 & year==2001
assert !missing(skew) & abs(skew - (2.8191449827198878)) <= 1e-9 * max(1,abs(2.8191449827198878)) if id==5 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (10.050000000000001)) <= 1e-9 * max(1,abs(10.050000000000001)) if id==5 & year==2001
assert !missing(total) & abs(total - (40.200000000000003)) <= 1e-9 * max(1,abs(40.200000000000003)) if id==5 & year==2001
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2001
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2002
assert !missing(mean) & abs(mean - (2.46)) <= 1e-9 * max(1,abs(2.46)) if id==5 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(var) & abs(var - (18.69257142857143)) <= 1e-9 * max(1,abs(18.69257142857143)) if id==5 & year==2002
assert !missing(sd) & abs(sd - (4.3234906532304924)) <= 1e-9 * max(1,abs(4.3234906532304924)) if id==5 & year==2002
assert !missing(skew) & abs(skew - (3.0895692328065056)) <= 1e-9 * max(1,abs(3.0895692328065056)) if id==5 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9.2249999999999996)) <= 1e-9 * max(1,abs(9.2249999999999996)) if id==5 & year==2002
assert !missing(total) & abs(total - (36.899999999999999)) <= 1e-9 * max(1,abs(36.899999999999999)) if id==5 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2002
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.80000000000000071)) <= 1e-9 * max(1,abs(-0.80000000000000071)) if id==5 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-22.62741699796922)) <= 1e-9 * max(1,abs(-22.62741699796922)) if id==5 & year==2002
assert !missing(dev_total) & abs(dev_total - (-3.2000000000000028)) <= 1e-9 * max(1,abs(-3.2000000000000028)) if id==5 & year==2002
assert !missing(z_total) & abs(z_total - (-22.62741699796922)) <= 1e-9 * max(1,abs(-22.62741699796922)) if id==5 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.066666666666666652)) <= 1e-9 * max(1,abs(0.066666666666666652)) if id==5 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2002
assert missing(z_dry) if id==5 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2003
assert !missing(mean) & abs(mean - (4.9812500000000002)) <= 1e-9 * max(1,abs(4.9812500000000002)) if id==5 & year==2003
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==5 & year==2003
assert !missing(var) & abs(var - (52.930958333333336)) <= 1e-9 * max(1,abs(52.930958333333336)) if id==5 & year==2003
assert !missing(sd) & abs(sd - (7.275366542885199)) <= 1e-9 * max(1,abs(7.275366542885199)) if id==5 & year==2003
assert !missing(skew) & abs(skew - (1.1776767149919345)) <= 1e-9 * max(1,abs(1.1776767149919345)) if id==5 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (19.925000000000001)) <= 1e-9 * max(1,abs(19.925000000000001)) if id==5 & year==2003
assert !missing(total) & abs(total - (79.700000000000003)) <= 1e-9 * max(1,abs(79.700000000000003)) if id==5 & year==2003
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (10.287500000000001)) <= 1e-9 * max(1,abs(10.287500000000001)) if id==5 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (17.63481457322812)) <= 1e-9 * max(1,abs(17.63481457322812)) if id==5 & year==2003
assert !missing(dev_total) & abs(dev_total - (41.150000000000006)) <= 1e-9 * max(1,abs(41.150000000000006)) if id==5 & year==2003
assert !missing(z_total) & abs(z_total - (17.63481457322812)) <= 1e-9 * max(1,abs(17.63481457322812)) if id==5 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert missing(z_raindays) if id==5 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert missing(z_norain) if id==5 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.033333333333333326)) <= 1e-9 * max(1,abs(-0.033333333333333326)) if id==5 & year==2003
assert missing(z_pct_raindays) if id==5 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2003
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2004
assert !missing(mean) & abs(mean - (2.8062499999999999)) <= 1e-9 * max(1,abs(2.8062499999999999)) if id==5 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2004
assert !missing(var) & abs(var - (30.941958333333332)) <= 1e-9 * max(1,abs(30.941958333333332)) if id==5 & year==2004
assert !missing(sd) & abs(sd - (5.5625496252468016)) <= 1e-9 * max(1,abs(5.5625496252468016)) if id==5 & year==2004
assert !missing(skew) & abs(skew - (2.4703945069762248)) <= 1e-9 * max(1,abs(2.4703945069762248)) if id==5 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==5 & year==2004
assert !missing(total) & abs(total - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==5 & year==2004
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2004
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==5 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.3499999999999996)) <= 1e-9 * max(1,abs(-3.3499999999999996)) if id==5 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.44276779756540813)) <= 1e-9 * max(1,abs(-0.44276779756540813)) if id==5 & year==2004
assert !missing(dev_total) & abs(dev_total - (-13.399999999999999)) <= 1e-9 * max(1,abs(-13.399999999999999)) if id==5 & year==2004
assert !missing(z_total) & abs(z_total - (-0.44276779756540813)) <= 1e-9 * max(1,abs(-0.44276779756540813)) if id==5 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2004
assert missing(z_raindays) if id==5 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==5 & year==2004
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==5 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.079166666666666607)) <= 1e-9 * max(1,abs(-0.079166666666666607)) if id==5 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.3587572106360986)) <= 1e-9 * max(1,abs(-3.3587572106360986)) if id==5 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2004
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==6 & year==2000
assert !missing(mean) & abs(mean - (5.083333333333333)) <= 1e-9 * max(1,abs(5.083333333333333)) if id==6 & year==2000
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2000
assert !missing(var) & abs(var - (45.870882352941173)) <= 1e-9 * max(1,abs(45.870882352941173)) if id==6 & year==2000
assert !missing(sd) & abs(sd - (6.7728046149982193)) <= 1e-9 * max(1,abs(6.7728046149982193)) if id==6 & year==2000
assert !missing(skew) & abs(skew - (1.2346728891824617)) <= 1e-9 * max(1,abs(1.2346728891824617)) if id==6 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (22.875)) <= 1e-9 * max(1,abs(22.875)) if id==6 & year==2000
assert !missing(total) & abs(total - (91.5)) <= 1e-9 * max(1,abs(91.5)) if id==6 & year==2000
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==6 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.61111111111111116)) <= 1e-9 * max(1,abs(0.61111111111111116)) if id==6 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2001
assert !missing(mean) & abs(mean - (3.7400000000000002)) <= 1e-9 * max(1,abs(3.7400000000000002)) if id==6 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(var) & abs(var - (32.264000000000003)) <= 1e-9 * max(1,abs(32.264000000000003)) if id==6 & year==2001
assert !missing(sd) & abs(sd - (5.6801408433242218)) <= 1e-9 * max(1,abs(5.6801408433242218)) if id==6 & year==2001
assert !missing(skew) & abs(skew - (1.960991958098907)) <= 1e-9 * max(1,abs(1.960991958098907)) if id==6 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.025)) <= 1e-9 * max(1,abs(14.025)) if id==6 & year==2001
assert !missing(total) & abs(total - (56.100000000000001)) <= 1e-9 * max(1,abs(56.100000000000001)) if id==6 & year==2001
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2001
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
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==6 & year==2002
assert !missing(mean) & abs(mean - (3.592857142857143)) <= 1e-9 * max(1,abs(3.592857142857143)) if id==6 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(var) & abs(var - (33.756098901098902)) <= 1e-9 * max(1,abs(33.756098901098902)) if id==6 & year==2002
assert !missing(sd) & abs(sd - (5.809999905430197)) <= 1e-9 * max(1,abs(5.809999905430197)) if id==6 & year==2002
assert !missing(skew) & abs(skew - (2.1048860812757262)) <= 1e-9 * max(1,abs(2.1048860812757262)) if id==6 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (16.766666666666666)) <= 1e-9 * max(1,abs(16.766666666666666)) if id==6 & year==2002
assert !missing(total) & abs(total - (50.299999999999997)) <= 1e-9 * max(1,abs(50.299999999999997)) if id==6 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==6 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2002
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.6833333333333336)) <= 1e-9 * max(1,abs(-1.6833333333333336)) if id==6 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.26899354011239662)) <= 1e-9 * max(1,abs(-0.26899354011239662)) if id==6 & year==2002
assert !missing(dev_total) & abs(dev_total - (-23.5)) <= 1e-9 * max(1,abs(-23.5)) if id==6 & year==2002
assert !missing(z_total) & abs(z_total - (-0.93881408801603761)) <= 1e-9 * max(1,abs(-0.93881408801603761)) if id==6 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==6 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==6 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2002
assert missing(z_norain) if id==6 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.00079365079365079083)) <= 1e-9 * max(1,abs(-0.00079365079365079083)) if id==6 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.01443075063646009)) <= 1e-9 * max(1,abs(-0.01443075063646009)) if id==6 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2002
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2003
assert !missing(mean) & abs(mean - (2.7466666666666666)) <= 1e-9 * max(1,abs(2.7466666666666666)) if id==6 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(var) & abs(var - (18.681238095238097)) <= 1e-9 * max(1,abs(18.681238095238097)) if id==6 & year==2003
assert !missing(sd) & abs(sd - (4.3221797851591157)) <= 1e-9 * max(1,abs(4.3221797851591157)) if id==6 & year==2003
assert !missing(skew) & abs(skew - (2.8953920715463042)) <= 1e-9 * max(1,abs(2.8953920715463042)) if id==6 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (10.300000000000001)) <= 1e-9 * max(1,abs(10.300000000000001)) if id==6 & year==2003
assert !missing(total) & abs(total - (41.200000000000003)) <= 1e-9 * max(1,abs(41.200000000000003)) if id==6 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==6 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.0958333333333314)) <= 1e-9 * max(1,abs(-5.0958333333333314)) if id==6 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.6285458765688383)) <= 1e-9 * max(1,abs(-2.6285458765688383)) if id==6 & year==2003
assert !missing(dev_total) & abs(dev_total - (-12)) <= 1e-9 * max(1,abs(-12)) if id==6 & year==2003
assert !missing(z_total) & abs(z_total - (-2.9259590945650218)) <= 1e-9 * max(1,abs(-2.9259590945650218)) if id==6 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert missing(z_raindays) if id==6 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==6 & year==2003
assert !missing(z_norain) & abs(z_norain - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==6 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.11428571428571421)) <= 1e-9 * max(1,abs(0.11428571428571421)) if id==6 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (4.2426406871192848)) <= 1e-9 * max(1,abs(4.2426406871192848)) if id==6 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2003
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2004
assert !missing(mean) & abs(mean - (2.54)) <= 1e-9 * max(1,abs(2.54)) if id==6 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(var) & abs(var - (18.481142857142856)) <= 1e-9 * max(1,abs(18.481142857142856)) if id==6 & year==2004
assert !missing(sd) & abs(sd - (4.298969976301632)) <= 1e-9 * max(1,abs(4.298969976301632)) if id==6 & year==2004
assert !missing(skew) & abs(skew - (3.0849106249301164)) <= 1e-9 * max(1,abs(3.0849106249301164)) if id==6 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (9.5250000000000004)) <= 1e-9 * max(1,abs(9.5250000000000004)) if id==6 & year==2004
assert !missing(total) & abs(total - (38.100000000000001)) <= 1e-9 * max(1,abs(38.100000000000001)) if id==6 & year==2004
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2004
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.0083333333333329)) <= 1e-9 * max(1,abs(-4.0083333333333329)) if id==6 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.87659371585239543)) <= 1e-9 * max(1,abs(-0.87659371585239543)) if id==6 & year==2004
assert !missing(dev_total) & abs(dev_total - (-7.6499999999999986)) <= 1e-9 * max(1,abs(-7.6499999999999986)) if id==6 & year==2004
assert !missing(z_total) & abs(z_total - (-1.1888718408960639)) <= 1e-9 * max(1,abs(-1.1888718408960639)) if id==6 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==6 & year==2004
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.085714285714285743)) <= 1e-9 * max(1,abs(-0.085714285714285743)) if id==6 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.2727922061357861)) <= 1e-9 * max(1,abs(-1.2727922061357861)) if id==6 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==6 & year==2004
assert !missing(z_dry) & abs(z_dry - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==6 & year==2004
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==7 & year==2000
assert !missing(mean) & abs(mean - (3.7285714285714286)) <= 1e-9 * max(1,abs(3.7285714285714286)) if id==7 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(var) & abs(var - (35.49296703296703)) <= 1e-9 * max(1,abs(35.49296703296703)) if id==7 & year==2000
assert !missing(sd) & abs(sd - (5.9575974211897726)) <= 1e-9 * max(1,abs(5.9575974211897726)) if id==7 & year==2000
assert !missing(skew) & abs(skew - (1.8322500403765247)) <= 1e-9 * max(1,abs(1.8322500403765247)) if id==7 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (13.050000000000001)) <= 1e-9 * max(1,abs(13.050000000000001)) if id==7 & year==2000
assert !missing(total) & abs(total - (52.200000000000003)) <= 1e-9 * max(1,abs(52.200000000000003)) if id==7 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==7 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2000
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2000
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
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2001
assert !missing(mean) & abs(mean - (4.5307692307692307)) <= 1e-9 * max(1,abs(4.5307692307692307)) if id==7 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7 & year==2001
assert !missing(var) & abs(var - (50.967307692307692)) <= 1e-9 * max(1,abs(50.967307692307692)) if id==7 & year==2001
assert !missing(sd) & abs(sd - (7.1391391422431099)) <= 1e-9 * max(1,abs(7.1391391422431099)) if id==7 & year==2001
assert !missing(skew) & abs(skew - (1.4171859413540904)) <= 1e-9 * max(1,abs(1.4171859413540904)) if id==7 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.725)) <= 1e-9 * max(1,abs(14.725)) if id==7 & year==2001
assert !missing(total) & abs(total - (58.899999999999999)) <= 1e-9 * max(1,abs(58.899999999999999)) if id==7 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2001
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
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==7 & year==2002
assert !missing(mean) & abs(mean - (5.5750000000000002)) <= 1e-9 * max(1,abs(5.5750000000000002)) if id==7 & year==2002
assert !missing(median) & abs(median - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==7 & year==2002
assert !missing(var) & abs(var - (49.42733333333333)) <= 1e-9 * max(1,abs(49.42733333333333)) if id==7 & year==2002
assert !missing(sd) & abs(sd - (7.0304575479362175)) <= 1e-9 * max(1,abs(7.0304575479362175)) if id==7 & year==2002
assert !missing(skew) & abs(skew - (1.0668958405616675)) <= 1e-9 * max(1,abs(1.0668958405616675)) if id==7 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (22.300000000000001)) <= 1e-9 * max(1,abs(22.300000000000001)) if id==7 & year==2002
assert !missing(total) & abs(total - (89.200000000000003)) <= 1e-9 * max(1,abs(89.200000000000003)) if id==7 & year==2002
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==7 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (8.4125000000000014)) <= 1e-9 * max(1,abs(8.4125000000000014)) if id==7 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (7.1027293095305506)) <= 1e-9 * max(1,abs(7.1027293095305506)) if id==7 & year==2002
assert !missing(dev_total) & abs(dev_total - (33.650000000000006)) <= 1e-9 * max(1,abs(33.650000000000006)) if id==7 & year==2002
assert !missing(z_total) & abs(z_total - (7.1027293095305506)) <= 1e-9 * max(1,abs(7.1027293095305506)) if id==7 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==7 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.10851648351648358)) <= 1e-9 * max(1,abs(0.10851648351648358)) if id==7 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.3965358928434328)) <= 1e-9 * max(1,abs(1.3965358928434328)) if id==7 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==7 & year==2002
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2003
assert !missing(mean) & abs(mean - (3.6000000000000001)) <= 1e-9 * max(1,abs(3.6000000000000001)) if id==7 & year==2003
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7 & year==2003
assert !missing(var) & abs(var - (36.983333333333334)) <= 1e-9 * max(1,abs(36.983333333333334)) if id==7 & year==2003
assert !missing(sd) & abs(sd - (6.0813923844242561)) <= 1e-9 * max(1,abs(6.0813923844242561)) if id==7 & year==2003
assert !missing(skew) & abs(skew - (1.9986642921122109)) <= 1e-9 * max(1,abs(1.9986642921122109)) if id==7 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (11.699999999999999)) <= 1e-9 * max(1,abs(11.699999999999999)) if id==7 & year==2003
assert !missing(total) & abs(total - (46.799999999999997)) <= 1e-9 * max(1,abs(46.799999999999997)) if id==7 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2003
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-6.8125)) <= 1e-9 * max(1,abs(-6.8125)) if id==7 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.2718587318371892)) <= 1e-9 * max(1,abs(-1.2718587318371892)) if id==7 & year==2003
assert !missing(dev_total) & abs(dev_total - (-27.25)) <= 1e-9 * max(1,abs(-27.25)) if id==7 & year==2003
assert !missing(z_total) & abs(z_total - (-1.2718587318371892)) <= 1e-9 * max(1,abs(-1.2718587318371892)) if id==7 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.081730769230769273)) <= 1e-9 * max(1,abs(-0.081730769230769273)) if id==7 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654802)) <= 1e-9 * max(1,abs(-0.70710678118654802)) if id==7 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2003
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2004
assert !missing(mean) & abs(mean - (5.5615384615384613)) <= 1e-9 * max(1,abs(5.5615384615384613)) if id==7 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(var) & abs(var - (45.815897435897433)) <= 1e-9 * max(1,abs(45.815897435897433)) if id==7 & year==2004
assert !missing(sd) & abs(sd - (6.7687441550037502)) <= 1e-9 * max(1,abs(6.7687441550037502)) if id==7 & year==2004
assert !missing(skew) & abs(skew - (1.1821402275208197)) <= 1e-9 * max(1,abs(1.1821402275208197)) if id==7 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (18.074999999999999)) <= 1e-9 * max(1,abs(18.074999999999999)) if id==7 & year==2004
assert !missing(total) & abs(total - (72.299999999999997)) <= 1e-9 * max(1,abs(72.299999999999997)) if id==7 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==7 & year==2004
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==7 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.0749999999999993)) <= 1e-9 * max(1,abs(1.0749999999999993)) if id==7 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.14342260184444114)) <= 1e-9 * max(1,abs(0.14342260184444114)) if id==7 & year==2004
assert !missing(dev_total) & abs(dev_total - (4.2999999999999972)) <= 1e-9 * max(1,abs(4.2999999999999972)) if id==7 & year==2004
assert !missing(z_total) & abs(z_total - (0.14342260184444114)) <= 1e-9 * max(1,abs(0.14342260184444114)) if id==7 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==7 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==7 & year==2004
assert !missing(z_norain) & abs(z_norain - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==7 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.14903846153846145)) <= 1e-9 * max(1,abs(0.14903846153846145)) if id==7 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.2894300127519391)) <= 1e-9 * max(1,abs(1.2894300127519391)) if id==7 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert missing(z_dry) if id==7 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==8 & year==2000
assert !missing(mean) & abs(mean - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==8 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2000
assert !missing(var) & abs(var - (32.727142857142859)) <= 1e-9 * max(1,abs(32.727142857142859)) if id==8 & year==2000
assert !missing(sd) & abs(sd - (5.7207641847171828)) <= 1e-9 * max(1,abs(5.7207641847171828)) if id==8 & year==2000
assert !missing(skew) & abs(skew - (2.0459705163777095)) <= 1e-9 * max(1,abs(2.0459705163777095)) if id==8 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (13.125)) <= 1e-9 * max(1,abs(13.125)) if id==8 & year==2000
assert !missing(total) & abs(total - (52.5)) <= 1e-9 * max(1,abs(52.5)) if id==8 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==8 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2000
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
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==8 & year==2001
assert !missing(mean) & abs(mean - (6.1357142857142861)) <= 1e-9 * max(1,abs(6.1357142857142861)) if id==8 & year==2001
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(var) & abs(var - (53.108626373626372)) <= 1e-9 * max(1,abs(53.108626373626372)) if id==8 & year==2001
assert !missing(sd) & abs(sd - (7.287566560493727)) <= 1e-9 * max(1,abs(7.287566560493727)) if id==8 & year==2001
assert !missing(skew) & abs(skew - (0.92258914387871072)) <= 1e-9 * max(1,abs(0.92258914387871072)) if id==8 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (21.475000000000001)) <= 1e-9 * max(1,abs(21.475000000000001)) if id==8 & year==2001
assert !missing(total) & abs(total - (85.900000000000006)) <= 1e-9 * max(1,abs(85.900000000000006)) if id==8 & year==2001
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2001
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==8 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2001
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
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==8 & year==2002
assert !missing(mean) & abs(mean - (4.0999999999999996)) <= 1e-9 * max(1,abs(4.0999999999999996)) if id==8 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==8 & year==2002
assert !missing(var) & abs(var - (43.454666666666668)) <= 1e-9 * max(1,abs(43.454666666666668)) if id==8 & year==2002
assert !missing(sd) & abs(sd - (6.5920153721503612)) <= 1e-9 * max(1,abs(6.5920153721503612)) if id==8 & year==2002
assert !missing(skew) & abs(skew - (1.5619219099198085)) <= 1e-9 * max(1,abs(1.5619219099198085)) if id==8 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (16.399999999999999)) <= 1e-9 * max(1,abs(16.399999999999999)) if id==8 & year==2002
assert !missing(total) & abs(total - (65.599999999999994)) <= 1e-9 * max(1,abs(65.599999999999994)) if id==8 & year==2002
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2002
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==8 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.90000000000000213)) <= 1e-9 * max(1,abs(-0.90000000000000213)) if id==8 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.15243020432763932)) <= 1e-9 * max(1,abs(-0.15243020432763932)) if id==8 & year==2002
assert !missing(dev_total) & abs(dev_total - (-3.6000000000000085)) <= 1e-9 * max(1,abs(-3.6000000000000085)) if id==8 & year==2002
assert !missing(z_total) & abs(z_total - (-0.15243020432763932)) <= 1e-9 * max(1,abs(-0.15243020432763932)) if id==8 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==8 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==8 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.15059523809523812)) <= 1e-9 * max(1,abs(-0.15059523809523812)) if id==8 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.944543648263005)) <= 1e-9 * max(1,abs(-1.944543648263005)) if id==8 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2002
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==8 & year==2003
assert !missing(mean) & abs(mean - (1.9199999999999999)) <= 1e-9 * max(1,abs(1.9199999999999999)) if id==8 & year==2003
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8 & year==2003
assert !missing(var) & abs(var - (19.204571428571427)) <= 1e-9 * max(1,abs(19.204571428571427)) if id==8 & year==2003
assert !missing(sd) & abs(sd - (4.3823020695259505)) <= 1e-9 * max(1,abs(4.3823020695259505)) if id==8 & year==2003
assert !missing(skew) & abs(skew - (3.3307804786234221)) <= 1e-9 * max(1,abs(3.3307804786234221)) if id==8 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (7.2000000000000002)) <= 1e-9 * max(1,abs(7.2000000000000002)) if id==8 & year==2003
assert !missing(total) & abs(total - (28.800000000000001)) <= 1e-9 * max(1,abs(28.800000000000001)) if id==8 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2003
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-11.737500000000001)) <= 1e-9 * max(1,abs(-11.737500000000001)) if id==8 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.2708042735673293)) <= 1e-9 * max(1,abs(-3.2708042735673293)) if id==8 & year==2003
assert !missing(dev_total) & abs(dev_total - (-46.950000000000003)) <= 1e-9 * max(1,abs(-46.950000000000003)) if id==8 & year==2003
assert !missing(z_total) & abs(z_total - (-3.2708042735673293)) <= 1e-9 * max(1,abs(-3.2708042735673293)) if id==8 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==8 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.14017857142857137)) <= 1e-9 * max(1,abs(-0.14017857142857137)) if id==8 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.96535447518511208)) <= 1e-9 * max(1,abs(-0.96535447518511208)) if id==8 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2003
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==8 & year==2004
assert !missing(mean) & abs(mean - (3.2071428571428573)) <= 1e-9 * max(1,abs(3.2071428571428573)) if id==8 & year==2004
assert !missing(median) & abs(median - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==8 & year==2004
assert !missing(var) & abs(var - (35.820714285714288)) <= 1e-9 * max(1,abs(35.820714285714288)) if id==8 & year==2004
assert !missing(sd) & abs(sd - (5.9850408758599372)) <= 1e-9 * max(1,abs(5.9850408758599372)) if id==8 & year==2004
assert !missing(skew) & abs(skew - (2.1009673449073625)) <= 1e-9 * max(1,abs(2.1009673449073625)) if id==8 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==8 & year==2004
assert !missing(total) & abs(total - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==8 & year==2004
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2004
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.2857142857142857)) <= 1e-9 * max(1,abs(0.2857142857142857)) if id==8 & year==2004
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.57499999999999929)) <= 1e-9 * max(1,abs(-0.57499999999999929)) if id==8 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.088388347648318349)) <= 1e-9 * max(1,abs(-0.088388347648318349)) if id==8 & year==2004
assert !missing(dev_total) & abs(dev_total - (-2.2999999999999972)) <= 1e-9 * max(1,abs(-2.2999999999999972)) if id==8 & year==2004
assert !missing(z_total) & abs(z_total - (-0.088388347648318349)) <= 1e-9 * max(1,abs(-0.088388347648318349)) if id==8 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==8 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert missing(z_norain) if id==8 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.13303571428571431)) <= 1e-9 * max(1,abs(-0.13303571428571431)) if id==8 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-5.0170909712759837)) <= 1e-9 * max(1,abs(-5.0170909712759837)) if id==8 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert missing(z_dry) if id==8 & year==2004
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2000
assert !missing(mean) & abs(mean - (2.5142857142857142)) <= 1e-9 * max(1,abs(2.5142857142857142)) if id==9 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(var) & abs(var - (20.015164835164835)) <= 1e-9 * max(1,abs(20.015164835164835)) if id==9 & year==2000
assert !missing(sd) & abs(sd - (4.4738311138402214)) <= 1e-9 * max(1,abs(4.4738311138402214)) if id==9 & year==2000
assert !missing(skew) & abs(skew - (2.9979745415516375)) <= 1e-9 * max(1,abs(2.9979745415516375)) if id==9 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (8.8000000000000007)) <= 1e-9 * max(1,abs(8.8000000000000007)) if id==9 & year==2000
assert !missing(total) & abs(total - (35.200000000000003)) <= 1e-9 * max(1,abs(35.200000000000003)) if id==9 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==9 & year==2000
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2000
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
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2001
assert !missing(mean) & abs(mean - (2.7999999999999998)) <= 1e-9 * max(1,abs(2.7999999999999998)) if id==9 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==9 & year==2001
assert !missing(var) & abs(var - (20.199999999999999)) <= 1e-9 * max(1,abs(20.199999999999999)) if id==9 & year==2001
assert !missing(sd) & abs(sd - (4.4944410108488464)) <= 1e-9 * max(1,abs(4.4944410108488464)) if id==9 & year==2001
assert !missing(skew) & abs(skew - (2.7547222793893016)) <= 1e-9 * max(1,abs(2.7547222793893016)) if id==9 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9.8000000000000007)) <= 1e-9 * max(1,abs(9.8000000000000007)) if id==9 & year==2001
assert !missing(total) & abs(total - (39.200000000000003)) <= 1e-9 * max(1,abs(39.200000000000003)) if id==9 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2001
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.42857142857142855)) <= 1e-9 * max(1,abs(0.42857142857142855)) if id==9 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2001
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
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==9 & year==2002
assert !missing(mean) & abs(mean - (4.0352941176470587)) <= 1e-9 * max(1,abs(4.0352941176470587)) if id==9 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(var) & abs(var - (39.831176470588233)) <= 1e-9 * max(1,abs(39.831176470588233)) if id==9 & year==2002
assert !missing(sd) & abs(sd - (6.311194535948661)) <= 1e-9 * max(1,abs(6.311194535948661)) if id==9 & year==2002
assert !missing(skew) & abs(skew - (1.7114765050354401)) <= 1e-9 * max(1,abs(1.7114765050354401)) if id==9 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (17.149999999999999)) <= 1e-9 * max(1,abs(17.149999999999999)) if id==9 & year==2002
assert !missing(total) & abs(total - (68.599999999999994)) <= 1e-9 * max(1,abs(68.599999999999994)) if id==9 & year==2002
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.6470588235294118)) <= 1e-9 * max(1,abs(0.6470588235294118)) if id==9 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(cut03) & abs(cut03 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.8499999999999979)) <= 1e-9 * max(1,abs(7.8499999999999979)) if id==9 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (11.101576464628792)) <= 1e-9 * max(1,abs(11.101576464628792)) if id==9 & year==2002
assert !missing(dev_total) & abs(dev_total - (31.399999999999991)) <= 1e-9 * max(1,abs(31.399999999999991)) if id==9 & year==2002
assert !missing(z_total) & abs(z_total - (11.101576464628792)) <= 1e-9 * max(1,abs(11.101576464628792)) if id==9 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (2.8284271247461898)) <= 1e-9 * max(1,abs(2.8284271247461898)) if id==9 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1470588235294118)) <= 1e-9 * max(1,abs(0.1470588235294118)) if id==9 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.4558080789134806)) <= 1e-9 * max(1,abs(1.4558080789134806)) if id==9 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9 & year==2002
assert !missing(z_dry) & abs(z_dry - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==9 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==9 & year==2003
assert !missing(mean) & abs(mean - (4.2437500000000004)) <= 1e-9 * max(1,abs(4.2437500000000004)) if id==9 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(var) & abs(var - (28.487958333333335)) <= 1e-9 * max(1,abs(28.487958333333335)) if id==9 & year==2003
assert !missing(sd) & abs(sd - (5.337411201447134)) <= 1e-9 * max(1,abs(5.337411201447134)) if id==9 & year==2003
assert !missing(skew) & abs(skew - (1.9081428516968335)) <= 1e-9 * max(1,abs(1.9081428516968335)) if id==9 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (16.975000000000001)) <= 1e-9 * max(1,abs(16.975000000000001)) if id==9 & year==2003
assert !missing(total) & abs(total - (67.900000000000006)) <= 1e-9 * max(1,abs(67.900000000000006)) if id==9 & year==2003
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.6875)) <= 1e-9 * max(1,abs(0.6875)) if id==9 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==9 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.5000000000000018)) <= 1e-9 * max(1,abs(3.5000000000000018)) if id==9 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.6734350297014744)) <= 1e-9 * max(1,abs(0.6734350297014744)) if id==9 & year==2003
assert !missing(dev_total) & abs(dev_total - (14.000000000000007)) <= 1e-9 * max(1,abs(14.000000000000007)) if id==9 & year==2003
assert !missing(z_total) & abs(z_total - (0.6734350297014744)) <= 1e-9 * max(1,abs(0.6734350297014744)) if id==9 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==9 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==9 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==9 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.14968487394957986)) <= 1e-9 * max(1,abs(0.14968487394957986)) if id==9 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.96887227229887507)) <= 1e-9 * max(1,abs(0.96887227229887507)) if id==9 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2004
assert !missing(mean) & abs(mean - (3.8642857142857143)) <= 1e-9 * max(1,abs(3.8642857142857143)) if id==9 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(var) & abs(var - (33.599395604395603)) <= 1e-9 * max(1,abs(33.599395604395603)) if id==9 & year==2004
assert !missing(sd) & abs(sd - (5.7964985641674751)) <= 1e-9 * max(1,abs(5.7964985641674751)) if id==9 & year==2004
assert !missing(skew) & abs(skew - (1.9529385935308152)) <= 1e-9 * max(1,abs(1.9529385935308152)) if id==9 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (13.525)) <= 1e-9 * max(1,abs(13.525)) if id==9 & year==2004
assert !missing(total) & abs(total - (54.100000000000001)) <= 1e-9 * max(1,abs(54.100000000000001)) if id==9 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==9 & year==2004
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==9 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(cut03) & abs(cut03 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.5374999999999996)) <= 1e-9 * max(1,abs(-3.5374999999999996)) if id==9 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-28.587317010828023)) <= 1e-9 * max(1,abs(-28.587317010828023)) if id==9 & year==2004
assert !missing(dev_total) & abs(dev_total - (-14.149999999999999)) <= 1e-9 * max(1,abs(-14.149999999999999)) if id==9 & year==2004
assert !missing(z_total) & abs(z_total - (-28.587317010828023)) <= 1e-9 * max(1,abs(-28.587317010828023)) if id==9 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==9 & year==2004
assert missing(z_raindays) if id==9 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2004
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.024422268907562938)) <= 1e-9 * max(1,abs(-0.024422268907562938)) if id==9 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.85403806039413943)) <= 1e-9 * max(1,abs(-0.85403806039413943)) if id==9 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2004
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==10 & year==2000
assert !missing(mean) & abs(mean - (2.5083333333333333)) <= 1e-9 * max(1,abs(2.5083333333333333)) if id==10 & year==2000
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==10 & year==2000
assert !missing(var) & abs(var - (22.940833333333334)) <= 1e-9 * max(1,abs(22.940833333333334)) if id==10 & year==2000
assert !missing(sd) & abs(sd - (4.7896589996922883)) <= 1e-9 * max(1,abs(4.7896589996922883)) if id==10 & year==2000
assert !missing(skew) & abs(skew - (2.9540936586989566)) <= 1e-9 * max(1,abs(2.9540936586989566)) if id==10 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (7.5250000000000004)) <= 1e-9 * max(1,abs(7.5250000000000004)) if id==10 & year==2000
assert !missing(total) & abs(total - (30.100000000000001)) <= 1e-9 * max(1,abs(30.100000000000001)) if id==10 & year==2000
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2000
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
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
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==10 & year==2001
assert !missing(mean) & abs(mean - (3.8875000000000002)) <= 1e-9 * max(1,abs(3.8875000000000002)) if id==10 & year==2001
assert !missing(median) & abs(median - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2001
assert !missing(var) & abs(var - (29.859833333333334)) <= 1e-9 * max(1,abs(29.859833333333334)) if id==10 & year==2001
assert !missing(sd) & abs(sd - (5.4644151867636612)) <= 1e-9 * max(1,abs(5.4644151867636612)) if id==10 & year==2001
assert !missing(skew) & abs(skew - (1.9527171276650597)) <= 1e-9 * max(1,abs(1.9527171276650597)) if id==10 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (15.550000000000001)) <= 1e-9 * max(1,abs(15.550000000000001)) if id==10 & year==2001
assert !missing(total) & abs(total - (62.200000000000003)) <= 1e-9 * max(1,abs(62.200000000000003)) if id==10 & year==2001
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==10 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==10 & year==2002
assert !missing(mean) & abs(mean - (0.83333333333333337)) <= 1e-9 * max(1,abs(0.83333333333333337)) if id==10 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2002
assert !missing(var) & abs(var - (1.5123809523809524)) <= 1e-9 * max(1,abs(1.5123809523809524)) if id==10 & year==2002
assert !missing(sd) & abs(sd - (1.2297889869326983)) <= 1e-9 * max(1,abs(1.2297889869326983)) if id==10 & year==2002
assert !missing(skew) & abs(skew - (3.0843894119332429)) <= 1e-9 * max(1,abs(3.0843894119332429)) if id==10 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (3.125)) <= 1e-9 * max(1,abs(3.125)) if id==10 & year==2002
assert !missing(total) & abs(total - (12.5)) <= 1e-9 * max(1,abs(12.5)) if id==10 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2002
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2002
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-8.4125000000000014)) <= 1e-9 * max(1,abs(-8.4125000000000014)) if id==10 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.4825011331418896)) <= 1e-9 * max(1,abs(-1.4825011331418896)) if id==10 & year==2002
assert !missing(dev_total) & abs(dev_total - (-33.650000000000006)) <= 1e-9 * max(1,abs(-33.650000000000006)) if id==10 & year==2002
assert !missing(z_total) & abs(z_total - (-1.4825011331418896)) <= 1e-9 * max(1,abs(-1.4825011331418896)) if id==10 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-3)) <= 1e-9 * max(1,abs(-3)) if id==10 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-1.0606601717798212)) <= 1e-9 * max(1,abs(-1.0606601717798212)) if id==10 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert missing(z_norain) if id==10 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.22916666666666669)) <= 1e-9 * max(1,abs(-0.22916666666666669)) if id==10 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.5927248643506742)) <= 1e-9 * max(1,abs(-2.5927248643506742)) if id==10 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2002
assert !missing(z_dry) & abs(z_dry - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10 & year==2002
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==10 & year==2003
assert !missing(mean) & abs(mean - (5.0538461538461537)) <= 1e-9 * max(1,abs(5.0538461538461537)) if id==10 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(var) & abs(var - (47.782692307692308)) <= 1e-9 * max(1,abs(47.782692307692308)) if id==10 & year==2003
assert !missing(sd) & abs(sd - (6.9125026081508505)) <= 1e-9 * max(1,abs(6.9125026081508505)) if id==10 & year==2003
assert !missing(skew) & abs(skew - (1.3458217207294318)) <= 1e-9 * max(1,abs(1.3458217207294318)) if id==10 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (16.425000000000001)) <= 1e-9 * max(1,abs(16.425000000000001)) if id==10 & year==2003
assert !missing(total) & abs(total - (65.700000000000003)) <= 1e-9 * max(1,abs(65.700000000000003)) if id==10 & year==2003
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2003
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==10 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.0875000000000004)) <= 1e-9 * max(1,abs(7.0875000000000004)) if id==10 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.80669928557901893)) <= 1e-9 * max(1,abs(0.80669928557901893)) if id==10 & year==2003
assert !missing(dev_total) & abs(dev_total - (28.350000000000001)) <= 1e-9 * max(1,abs(28.350000000000001)) if id==10 & year==2003
assert !missing(z_total) & abs(z_total - (0.80669928557901893)) <= 1e-9 * max(1,abs(0.80669928557901893)) if id==10 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.42426406871192851)) <= 1e-9 * max(1,abs(0.42426406871192851)) if id==10 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-4)) <= 1e-9 * max(1,abs(-4)) if id==10 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==10 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.21314102564102566)) <= 1e-9 * max(1,abs(0.21314102564102566)) if id==10 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.0334637571188003)) <= 1e-9 * max(1,abs(1.0334637571188003)) if id==10 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2003
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==10 & year==2004
assert !missing(mean) & abs(mean - (4.0411764705882351)) <= 1e-9 * max(1,abs(4.0411764705882351)) if id==10 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2004
assert !missing(var) & abs(var - (40.500073529411765)) <= 1e-9 * max(1,abs(40.500073529411765)) if id==10 & year==2004
assert !missing(sd) & abs(sd - (6.363966807692492)) <= 1e-9 * max(1,abs(6.363966807692492)) if id==10 & year==2004
assert !missing(skew) & abs(skew - (1.6553223848340348)) <= 1e-9 * max(1,abs(1.6553223848340348)) if id==10 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (22.900000000000002)) <= 1e-9 * max(1,abs(22.900000000000002)) if id==10 & year==2004
assert !missing(total) & abs(total - (68.700000000000003)) <= 1e-9 * max(1,abs(68.700000000000003)) if id==10 & year==2004
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2004
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.47058823529411764)) <= 1e-9 * max(1,abs(0.47058823529411764)) if id==10 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (13.125000000000002)) <= 1e-9 * max(1,abs(13.125000000000002)) if id==10 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.3956054891839753)) <= 1e-9 * max(1,abs(1.3956054891839753)) if id==10 & year==2004
assert !missing(dev_total) & abs(dev_total - (29.600000000000001)) <= 1e-9 * max(1,abs(29.600000000000001)) if id==10 & year==2004
assert !missing(z_total) & abs(z_total - (0.78685566628277459)) <= 1e-9 * max(1,abs(0.78685566628277459)) if id==10 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==10 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.47140452079103173)) <= 1e-9 * max(1,abs(0.47140452079103173)) if id==10 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.042232277526395134)) <= 1e-9 * max(1,abs(-0.042232277526395134)) if id==10 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.16637806616154044)) <= 1e-9 * max(1,abs(-0.16637806616154044)) if id==10 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2000
assert !missing(mean) & abs(mean - (2.7066666666666666)) <= 1e-9 * max(1,abs(2.7066666666666666)) if id==11 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==11 & year==2000
assert !missing(var) & abs(var - (19.134952380952381)) <= 1e-9 * max(1,abs(19.134952380952381)) if id==11 & year==2000
assert !missing(sd) & abs(sd - (4.3743516526397803)) <= 1e-9 * max(1,abs(4.3743516526397803)) if id==11 & year==2000
assert !missing(skew) & abs(skew - (2.7971651436801928)) <= 1e-9 * max(1,abs(2.7971651436801928)) if id==11 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (10.15)) <= 1e-9 * max(1,abs(10.15)) if id==11 & year==2000
assert !missing(total) & abs(total - (40.600000000000001)) <= 1e-9 * max(1,abs(40.600000000000001)) if id==11 & year==2000
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2000
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==11 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2000
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
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2001
assert !missing(mean) & abs(mean - (5.4666666666666668)) <= 1e-9 * max(1,abs(5.4666666666666668)) if id==11 & year==2001
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2001
assert !missing(var) & abs(var - (39.55238095238095)) <= 1e-9 * max(1,abs(39.55238095238095)) if id==11 & year==2001
assert !missing(sd) & abs(sd - (6.2890683691927656)) <= 1e-9 * max(1,abs(6.2890683691927656)) if id==11 & year==2001
assert !missing(skew) & abs(skew - (1.2757034417289985)) <= 1e-9 * max(1,abs(1.2757034417289985)) if id==11 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (20.5)) <= 1e-9 * max(1,abs(20.5)) if id==11 & year==2001
assert !missing(total) & abs(total - (82)) <= 1e-9 * max(1,abs(82)) if id==11 & year==2001
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==11 & year==2001
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==11 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(cut04) & abs(cut04 - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2001
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
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==11 & year==2002
assert !missing(mean) & abs(mean - (3.6230769230769231)) <= 1e-9 * max(1,abs(3.6230769230769231)) if id==11 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(var) & abs(var - (37.016923076923078)) <= 1e-9 * max(1,abs(37.016923076923078)) if id==11 & year==2002
assert !missing(sd) & abs(sd - (6.0841534396268377)) <= 1e-9 * max(1,abs(6.0841534396268377)) if id==11 & year==2002
assert !missing(skew) & abs(skew - (1.9784390504014764)) <= 1e-9 * max(1,abs(1.9784390504014764)) if id==11 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (15.700000000000001)) <= 1e-9 * max(1,abs(15.700000000000001)) if id==11 & year==2002
assert !missing(total) & abs(total - (47.100000000000001)) <= 1e-9 * max(1,abs(47.100000000000001)) if id==11 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2002
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.61538461538461542)) <= 1e-9 * max(1,abs(0.61538461538461542)) if id==11 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.37500000000000178)) <= 1e-9 * max(1,abs(0.37500000000000178)) if id==11 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.051239621825112387)) <= 1e-9 * max(1,abs(0.051239621825112387)) if id==11 & year==2002
assert !missing(dev_total) & abs(dev_total - (-14.199999999999996)) <= 1e-9 * max(1,abs(-14.199999999999996)) if id==11 & year==2002
assert !missing(z_total) & abs(z_total - (-0.48506841994439481)) <= 1e-9 * max(1,abs(-0.48506841994439481)) if id==11 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.42426406871192851)) <= 1e-9 * max(1,abs(-0.42426406871192851)) if id==11 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.1414213562373095)) <= 1e-9 * max(1,abs(-0.1414213562373095)) if id==11 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.017948717948717885)) <= 1e-9 * max(1,abs(-0.017948717948717885)) if id==11 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.076149961050858681)) <= 1e-9 * max(1,abs(-0.076149961050858681)) if id==11 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11 & year==2002
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==11 & year==2003
assert !missing(mean) & abs(mean - (3.0352941176470587)) <= 1e-9 * max(1,abs(3.0352941176470587)) if id==11 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(var) & abs(var - (28.913676470588236)) <= 1e-9 * max(1,abs(28.913676470588236)) if id==11 & year==2003
assert !missing(sd) & abs(sd - (5.3771438952838366)) <= 1e-9 * max(1,abs(5.3771438952838366)) if id==11 & year==2003
assert !missing(skew) & abs(skew - (2.4087388708912201)) <= 1e-9 * max(1,abs(2.4087388708912201)) if id==11 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (12.9)) <= 1e-9 * max(1,abs(12.9)) if id==11 & year==2003
assert !missing(total) & abs(total - (51.600000000000001)) <= 1e-9 * max(1,abs(51.600000000000001)) if id==11 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==11 & year==2003
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.58823529411764708)) <= 1e-9 * max(1,abs(0.58823529411764708)) if id==11 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.2000000000000011)) <= 1e-9 * max(1,abs(-5.2000000000000011)) if id==11 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.5320646925708536)) <= 1e-9 * max(1,abs(-1.5320646925708536)) if id==11 & year==2003
assert !missing(dev_total) & abs(dev_total - (-12.949999999999996)) <= 1e-9 * max(1,abs(-12.949999999999996)) if id==11 & year==2003
assert !missing(z_total) & abs(z_total - (-0.52475832758543195)) <= 1e-9 * max(1,abs(-0.52475832758543195)) if id==11 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.11945701357466065)) <= 1e-9 * max(1,abs(-0.11945701357466065)) if id==11 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.91507936388847333)) <= 1e-9 * max(1,abs(-0.91507936388847333)) if id==11 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11 & year==2003
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2004
assert !missing(mean) & abs(mean - (1.5666666666666667)) <= 1e-9 * max(1,abs(1.5666666666666667)) if id==11 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(var) & abs(var - (2.1595238095238094)) <= 1e-9 * max(1,abs(2.1595238095238094)) if id==11 & year==2004
assert !missing(sd) & abs(sd - (1.4695318334503031)) <= 1e-9 * max(1,abs(1.4695318334503031)) if id==11 & year==2004
assert !missing(skew) & abs(skew - (1.9443939629851632)) <= 1e-9 * max(1,abs(1.9443939629851632)) if id==11 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (7.833333333333333)) <= 1e-9 * max(1,abs(7.833333333333333)) if id==11 & year==2004
assert !missing(total) & abs(total - (23.5)) <= 1e-9 * max(1,abs(23.5)) if id==11 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2004
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2004
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-6.4666666666666677)) <= 1e-9 * max(1,abs(-6.4666666666666677)) if id==11 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.2661598940521479)) <= 1e-9 * max(1,abs(-3.2661598940521479)) if id==11 & year==2004
assert !missing(dev_total) & abs(dev_total - (-25.850000000000001)) <= 1e-9 * max(1,abs(-25.850000000000001)) if id==11 & year==2004
assert !missing(z_total) & abs(z_total - (-8.1238712416321128)) <= 1e-9 * max(1,abs(-8.1238712416321128)) if id==11 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.0018099547511313263)) <= 1e-9 * max(1,abs(-0.0018099547511313263)) if id==11 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.09428090415821172)) <= 1e-9 * max(1,abs(-0.09428090415821172)) if id==11 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert missing(z_dry) if id==11 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==12 & year==2000
assert !missing(mean) & abs(mean - (3.0866666666666669)) <= 1e-9 * max(1,abs(3.0866666666666669)) if id==12 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(var) & abs(var - (33.498380952380955)) <= 1e-9 * max(1,abs(33.498380952380955)) if id==12 & year==2000
assert !missing(sd) & abs(sd - (5.7877785852934069)) <= 1e-9 * max(1,abs(5.7877785852934069)) if id==12 & year==2000
assert !missing(skew) & abs(skew - (2.2019364321357879)) <= 1e-9 * max(1,abs(2.2019364321357879)) if id==12 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (11.574999999999999)) <= 1e-9 * max(1,abs(11.574999999999999)) if id==12 & year==2000
assert !missing(total) & abs(total - (46.299999999999997)) <= 1e-9 * max(1,abs(46.299999999999997)) if id==12 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==12 & year==2000
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2000
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2000
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
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==12 & year==2001
assert !missing(mean) & abs(mean - (2.3125)) <= 1e-9 * max(1,abs(2.3125)) if id==12 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12 & year==2001
assert !missing(var) & abs(var - (18.873166666666666)) <= 1e-9 * max(1,abs(18.873166666666666)) if id==12 & year==2001
assert !missing(sd) & abs(sd - (4.3443258011648558)) <= 1e-9 * max(1,abs(4.3443258011648558)) if id==12 & year==2001
assert !missing(skew) & abs(skew - (2.9091292854797488)) <= 1e-9 * max(1,abs(2.9091292854797488)) if id==12 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9.25)) <= 1e-9 * max(1,abs(9.25)) if id==12 & year==2001
assert !missing(total) & abs(total - (37)) <= 1e-9 * max(1,abs(37)) if id==12 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2001
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==12 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2001
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
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
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==12 & year==2002
assert !missing(mean) & abs(mean - (2.8692307692307693)) <= 1e-9 * max(1,abs(2.8692307692307693)) if id==12 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12 & year==2002
assert !missing(var) & abs(var - (21.79397435897436)) <= 1e-9 * max(1,abs(21.79397435897436)) if id==12 & year==2002
assert !missing(sd) & abs(sd - (4.6684016921184446)) <= 1e-9 * max(1,abs(4.6684016921184446)) if id==12 & year==2002
assert !missing(skew) & abs(skew - (2.6464372055970311)) <= 1e-9 * max(1,abs(2.6464372055970311)) if id==12 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9.3249999999999993)) <= 1e-9 * max(1,abs(9.3249999999999993)) if id==12 & year==2002
assert !missing(total) & abs(total - (37.299999999999997)) <= 1e-9 * max(1,abs(37.299999999999997)) if id==12 & year==2002
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2002
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==12 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.0875000000000004)) <= 1e-9 * max(1,abs(-1.0875000000000004)) if id==12 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.66148698885193202)) <= 1e-9 * max(1,abs(-0.66148698885193202)) if id==12 & year==2002
assert !missing(dev_total) & abs(dev_total - (-4.3500000000000014)) <= 1e-9 * max(1,abs(-4.3500000000000014)) if id==12 & year==2002
assert !missing(z_total) & abs(z_total - (-0.66148698885193202)) <= 1e-9 * max(1,abs(-0.66148698885193202)) if id==12 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.023878205128205099)) <= 1e-9 * max(1,abs(-0.023878205128205099)) if id==12 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.35237093778192463)) <= 1e-9 * max(1,abs(-0.35237093778192463)) if id==12 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==12 & year==2003
assert !missing(mean) & abs(mean - (6.0562500000000004)) <= 1e-9 * max(1,abs(6.0562500000000004)) if id==12 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(var) & abs(var - (59.410625000000003)) <= 1e-9 * max(1,abs(59.410625000000003)) if id==12 & year==2003
assert !missing(sd) & abs(sd - (7.7078288123180316)) <= 1e-9 * max(1,abs(7.7078288123180316)) if id==12 & year==2003
assert !missing(skew) & abs(skew - (0.8246527622246832)) <= 1e-9 * max(1,abs(0.8246527622246832)) if id==12 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (24.225000000000001)) <= 1e-9 * max(1,abs(24.225000000000001)) if id==12 & year==2003
assert !missing(total) & abs(total - (96.900000000000006)) <= 1e-9 * max(1,abs(96.900000000000006)) if id==12 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2003
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==12 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2003
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.937500000000002)) <= 1e-9 * max(1,abs(14.937500000000002)) if id==12 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (281.66420117264414)) <= 1e-9 * max(1,abs(281.66420117264414)) if id==12 & year==2003
assert !missing(dev_total) & abs(dev_total - (59.750000000000007)) <= 1e-9 * max(1,abs(59.750000000000007)) if id==12 & year==2003
assert !missing(z_total) & abs(z_total - (281.66420117264414)) <= 1e-9 * max(1,abs(281.66420117264414)) if id==12 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==12 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (4.9497474683058327)) <= 1e-9 * max(1,abs(4.9497474683058327)) if id==12 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==12 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.17548076923076922)) <= 1e-9 * max(1,abs(0.17548076923076922)) if id==12 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (10.323759005323581)) <= 1e-9 * max(1,abs(10.323759005323581)) if id==12 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==12 & year==2004
assert !missing(mean) & abs(mean - (3.290909090909091)) <= 1e-9 * max(1,abs(3.290909090909091)) if id==12 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(var) & abs(var - (24.856909090909092)) <= 1e-9 * max(1,abs(24.856909090909092)) if id==12 & year==2004
assert !missing(sd) & abs(sd - (4.9856703752764373)) <= 1e-9 * max(1,abs(4.9856703752764373)) if id==12 & year==2004
assert !missing(skew) & abs(skew - (2.4117045295500548)) <= 1e-9 * max(1,abs(2.4117045295500548)) if id==12 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (12.066666666666668)) <= 1e-9 * max(1,abs(12.066666666666668)) if id==12 & year==2004
assert !missing(total) & abs(total - (36.200000000000003)) <= 1e-9 * max(1,abs(36.200000000000003)) if id==12 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2004
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==12 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2004
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.7083333333333304)) <= 1e-9 * max(1,abs(-4.7083333333333304)) if id==12 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.4468851581324374)) <= 1e-9 * max(1,abs(-0.4468851581324374)) if id==12 & year==2004
assert !missing(dev_total) & abs(dev_total - (-30.899999999999991)) <= 1e-9 * max(1,abs(-30.899999999999991)) if id==12 & year==2004
assert !missing(z_total) & abs(z_total - (-0.73320803821021163)) <= 1e-9 * max(1,abs(-0.73320803821021163)) if id==12 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2004
assert !missing(z_norain) & abs(z_norain - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.0021853146853145766)) <= 1e-9 * max(1,abs(0.0021853146853145766)) if id==12 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.018906598427446859)) <= 1e-9 * max(1,abs(0.018906598427446859)) if id==12 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert missing(z_dry) if id==12 & year==2004
assert _N==60
