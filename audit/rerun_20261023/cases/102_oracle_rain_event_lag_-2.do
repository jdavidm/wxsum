version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/oracle_rain.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(rain) event_date(event) days(5) lag(-2) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(mean) & abs(mean - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1
assert !missing(var) & abs(var - (52.914999999999999)) <= 1e-9 * max(1,abs(52.914999999999999)) if id==1
assert !missing(sd) & abs(sd - (7.2742697227969213)) <= 1e-9 * max(1,abs(7.2742697227969213)) if id==1
assert !missing(skew) & abs(skew - (2.2250909004050174)) <= 1e-9 * max(1,abs(2.2250909004050174)) if id==1
assert !missing(mean_mo) & abs(mean_mo - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(total) & abs(total - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==1
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (8.0500000000000007)) <= 1e-9 * max(1,abs(8.0500000000000007)) if id==1
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.62897343519908377)) <= 1e-9 * max(1,abs(0.62897343519908377)) if id==1
assert !missing(dev_total) & abs(dev_total - (8.0500000000000007)) <= 1e-9 * max(1,abs(8.0500000000000007)) if id==1
assert !missing(z_total) & abs(z_total - (0.62897343519908377)) <= 1e-9 * max(1,abs(0.62897343519908377)) if id==1
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(z_norain) & abs(z_norain - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==1
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.34999999999999998)) <= 1e-9 * max(1,abs(-0.34999999999999998)) if id==1
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.98994949366116636)) <= 1e-9 * max(1,abs(-0.98994949366116636)) if id==1
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert missing(z_dry) if id==1
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew) if id==2
assert !missing(mean_mo) & abs(mean_mo - (10)) <= 1e-9 * max(1,abs(10)) if id==2
assert !missing(total) & abs(total - (10)) <= 1e-9 * max(1,abs(10)) if id==2
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_mean_mo) if id==2
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_total) if id==2
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_raindays) if id==2
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain) if id==2
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays) if id==2
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry) if id==2
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean) if id==3
assert missing(median) if id==3
assert missing(var) if id==3
assert missing(sd) if id==3
assert missing(skew) if id==3
assert missing(mean_mo) if id==3
assert missing(total) if id==3
assert missing(raindays) if id==3
assert missing(norain) if id==3
assert missing(pct_raindays) if id==3
assert missing(dry_start) if id==3
assert missing(dry) if id==3
assert missing(dry_end) if id==3
assert missing(dev_mean_mo) if id==3
assert missing(z_mean_mo) if id==3
assert missing(dev_total) if id==3
assert missing(z_total) if id==3
assert missing(dev_raindays) if id==3
assert missing(z_raindays) if id==3
assert missing(dev_norain) if id==3
assert missing(z_norain) if id==3
assert missing(dev_pct_raindays) if id==3
assert missing(z_pct_raindays) if id==3
assert missing(dev_dry) if id==3
assert missing(z_dry) if id==3
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(mean) & abs(mean - (4.9400000000000004)) <= 1e-9 * max(1,abs(4.9400000000000004)) if id==4
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4
assert !missing(var) & abs(var - (48.603000000000002)) <= 1e-9 * max(1,abs(48.603000000000002)) if id==4
assert !missing(sd) & abs(sd - (6.9715851855944502)) <= 1e-9 * max(1,abs(6.9715851855944502)) if id==4
assert !missing(skew) & abs(skew - (1.9136766218426671)) <= 1e-9 * max(1,abs(1.9136766218426671)) if id==4
assert !missing(mean_mo) & abs(mean_mo - (24.699999999999999)) <= 1e-9 * max(1,abs(24.699999999999999)) if id==4
assert !missing(total) & abs(total - (24.699999999999999)) <= 1e-9 * max(1,abs(24.699999999999999)) if id==4
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==4
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.8000000000000007)) <= 1e-9 * max(1,abs(3.8000000000000007)) if id==4
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.14845335737618129)) <= 1e-9 * max(1,abs(0.14845335737618129)) if id==4
assert !missing(dev_total) & abs(dev_total - (3.8000000000000007)) <= 1e-9 * max(1,abs(3.8000000000000007)) if id==4
assert !missing(z_total) & abs(z_total - (0.14845335737618129)) <= 1e-9 * max(1,abs(0.14845335737618129)) if id==4
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4
assert !missing(z_norain) & abs(z_norain - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==4
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.22499999999999998)) <= 1e-9 * max(1,abs(-0.22499999999999998)) if id==4
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.42426406871192851)) <= 1e-9 * max(1,abs(-0.42426406871192851)) if id==4
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_dry) & abs(z_dry - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==4
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(mean) & abs(mean - (6.4000000000000004)) <= 1e-9 * max(1,abs(6.4000000000000004)) if id==5
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(var) & abs(var - (85.079999999999998)) <= 1e-9 * max(1,abs(85.079999999999998)) if id==5
assert !missing(sd) & abs(sd - (9.2238820460801652)) <= 1e-9 * max(1,abs(9.2238820460801652)) if id==5
assert !missing(skew) & abs(skew - (1.658141248811938)) <= 1e-9 * max(1,abs(1.658141248811938)) if id==5
assert !missing(mean_mo) & abs(mean_mo - (19.199999999999999)) <= 1e-9 * max(1,abs(19.199999999999999)) if id==5
assert !missing(total) & abs(total - (19.199999999999999)) <= 1e-9 * max(1,abs(19.199999999999999)) if id==5
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==5
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.25)) <= 1e-9 * max(1,abs(14.25)) if id==5
assert !missing(z_mean_mo) & abs(z_mean_mo - (5.1673187855940004)) <= 1e-9 * max(1,abs(5.1673187855940004)) if id==5
assert !missing(dev_total) & abs(dev_total - (14.25)) <= 1e-9 * max(1,abs(14.25)) if id==5
assert !missing(z_total) & abs(z_total - (5.1673187855940004)) <= 1e-9 * max(1,abs(5.1673187855940004)) if id==5
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert missing(z_raindays) if id==5
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert missing(z_norain) if id==5
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.16666666666666663)) <= 1e-9 * max(1,abs(0.16666666666666663)) if id==5
assert missing(z_pct_raindays) if id==5
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert missing(z_dry) if id==5
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(mean) & abs(mean - (1.76)) <= 1e-9 * max(1,abs(1.76)) if id==6
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var) & abs(var - (3.2829999999999999)) <= 1e-9 * max(1,abs(3.2829999999999999)) if id==6
assert !missing(sd) & abs(sd - (1.8119050747762697)) <= 1e-9 * max(1,abs(1.8119050747762697)) if id==6
assert !missing(skew) & abs(skew - (2.2318122055052885)) <= 1e-9 * max(1,abs(2.2318122055052885)) if id==6
assert !missing(mean_mo) & abs(mean_mo - (8.8000000000000007)) <= 1e-9 * max(1,abs(8.8000000000000007)) if id==6
assert !missing(total) & abs(total - (8.8000000000000007)) <= 1e-9 * max(1,abs(8.8000000000000007)) if id==6
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==6
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.6999999999999993)) <= 1e-9 * max(1,abs(-7.6999999999999993)) if id==6
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.1836352641600902)) <= 1e-9 * max(1,abs(-1.1836352641600902)) if id==6
assert !missing(dev_total) & abs(dev_total - (-7.6999999999999993)) <= 1e-9 * max(1,abs(-7.6999999999999993)) if id==6
assert !missing(z_total) & abs(z_total - (-1.1836352641600902)) <= 1e-9 * max(1,abs(-1.1836352641600902)) if id==6
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_raindays) if id==6
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.075000000000000067)) <= 1e-9 * max(1,abs(-0.075000000000000067)) if id==6
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654802)) <= 1e-9 * max(1,abs(-0.70710678118654802)) if id==6
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert missing(z_dry) if id==6
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(mean) & abs(mean - (0.3666666666666667)) <= 1e-9 * max(1,abs(0.3666666666666667)) if id==7
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==7
assert !missing(var) & abs(var - (0.22333333333333336)) <= 1e-9 * max(1,abs(0.22333333333333336)) if id==7
assert !missing(sd) & abs(sd - (0.47258156262526085)) <= 1e-9 * max(1,abs(0.47258156262526085)) if id==7
assert !missing(skew) & abs(skew - (1.3896361387064919)) <= 1e-9 * max(1,abs(1.3896361387064919)) if id==7
assert !missing(mean_mo) & abs(mean_mo - (1.1000000000000001)) <= 1e-9 * max(1,abs(1.1000000000000001)) if id==7
assert !missing(total) & abs(total - (1.1000000000000001)) <= 1e-9 * max(1,abs(1.1000000000000001)) if id==7
assert !missing(raindays) & abs(raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(pct_raindays) & abs(pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-20.399999999999999)) <= 1e-9 * max(1,abs(-20.399999999999999)) if id==7
assert !missing(z_mean_mo) & abs(z_mean_mo - (-9.015611460128472)) <= 1e-9 * max(1,abs(-9.015611460128472)) if id==7
assert !missing(dev_total) & abs(dev_total - (-20.399999999999999)) <= 1e-9 * max(1,abs(-20.399999999999999)) if id==7
assert !missing(z_total) & abs(z_total - (-9.015611460128472)) <= 1e-9 * max(1,abs(-9.015611460128472)) if id==7
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7
assert missing(z_raindays) if id==7
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.45000000000000001)) <= 1e-9 * max(1,abs(-0.45000000000000001)) if id==7
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-6.3639610306789294)) <= 1e-9 * max(1,abs(-6.3639610306789294)) if id==7
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(mean) & abs(mean - (0.10000000000000001)) <= 1e-9 * max(1,abs(0.10000000000000001)) if id==8
assert !missing(median) & abs(median - (0.10000000000000001)) <= 1e-9 * max(1,abs(0.10000000000000001)) if id==8
assert !missing(var) & abs(var - (0.013333333333333334)) <= 1e-9 * max(1,abs(0.013333333333333334)) if id==8
assert !missing(sd) & abs(sd - (0.11547005383792516)) <= 1e-9 * max(1,abs(0.11547005383792516)) if id==8
assert !missing(skew) & abs(skew - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(mean_mo) & abs(mean_mo - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(total) & abs(total - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(raindays) & abs(raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(pct_raindays) & abs(pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-22.300000000000001)) <= 1e-9 * max(1,abs(-22.300000000000001)) if id==8
assert !missing(z_mean_mo) & abs(z_mean_mo - (-22.526401743514324)) <= 1e-9 * max(1,abs(-22.526401743514324)) if id==8
assert !missing(dev_total) & abs(dev_total - (-22.300000000000001)) <= 1e-9 * max(1,abs(-22.300000000000001)) if id==8
assert !missing(z_total) & abs(z_total - (-22.526401743514324)) <= 1e-9 * max(1,abs(-22.526401743514324)) if id==8
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==8
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.80000000000000004)) <= 1e-9 * max(1,abs(-0.80000000000000004)) if id==8
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.8284271247461903)) <= 1e-9 * max(1,abs(-2.8284271247461903)) if id==8
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(mean) & abs(mean - (5.9666666666666668)) <= 1e-9 * max(1,abs(5.9666666666666668)) if id==9
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==9
assert !missing(var) & abs(var - (91.50333333333333)) <= 1e-9 * max(1,abs(91.50333333333333)) if id==9
assert !missing(sd) & abs(sd - (9.56573746939217)) <= 1e-9 * max(1,abs(9.56573746939217)) if id==9
assert !missing(skew) & abs(skew - (1.7148178269418364)) <= 1e-9 * max(1,abs(1.7148178269418364)) if id==9
assert !missing(mean_mo) & abs(mean_mo - (17.899999999999999)) <= 1e-9 * max(1,abs(17.899999999999999)) if id==9
assert !missing(total) & abs(total - (17.899999999999999)) <= 1e-9 * max(1,abs(17.899999999999999)) if id==9
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==9
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (13.799999999999999)) <= 1e-9 * max(1,abs(13.799999999999999)) if id==9
assert !missing(z_mean_mo) & abs(z_mean_mo - (8.8709759821585052)) <= 1e-9 * max(1,abs(8.8709759821585052)) if id==9
assert !missing(dev_total) & abs(dev_total - (13.799999999999999)) <= 1e-9 * max(1,abs(13.799999999999999)) if id==9
assert !missing(z_total) & abs(z_total - (8.8709759821585052)) <= 1e-9 * max(1,abs(8.8709759821585052)) if id==9
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==9
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.29999999999999999)) <= 1e-9 * max(1,abs(-0.29999999999999999)) if id==9
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-6.3639610306789285)) <= 1e-9 * max(1,abs(-6.3639610306789285)) if id==9
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert missing(z_dry) if id==9
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(mean) & abs(mean - (0.95999999999999996)) <= 1e-9 * max(1,abs(0.95999999999999996)) if id==10
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10
assert !missing(var) & abs(var - (0.503)) <= 1e-9 * max(1,abs(0.503)) if id==10
assert !missing(sd) & abs(sd - (0.70922492905988577)) <= 1e-9 * max(1,abs(0.70922492905988577)) if id==10
assert !missing(skew) & abs(skew - (0.28003577111123551)) <= 1e-9 * max(1,abs(0.28003577111123551)) if id==10
assert !missing(mean_mo) & abs(mean_mo - (4.7999999999999998)) <= 1e-9 * max(1,abs(4.7999999999999998)) if id==10
assert !missing(total) & abs(total - (4.7999999999999998)) <= 1e-9 * max(1,abs(4.7999999999999998)) if id==10
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==10
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-10.649999999999999)) <= 1e-9 * max(1,abs(-10.649999999999999)) if id==10
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.60005475853679124)) <= 1e-9 * max(1,abs(-0.60005475853679124)) if id==10
assert !missing(dev_total) & abs(dev_total - (-10.649999999999999)) <= 1e-9 * max(1,abs(-10.649999999999999)) if id==10
assert !missing(z_total) & abs(z_total - (-0.60005475853679124)) <= 1e-9 * max(1,abs(-0.60005475853679124)) if id==10
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25)) <= 1e-9 * max(1,abs(-0.25)) if id==10
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.178511301977579)) <= 1e-9 * max(1,abs(-1.178511301977579)) if id==10
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_dry) if id==10
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(mean) & abs(mean - (4.1799999999999997)) <= 1e-9 * max(1,abs(4.1799999999999997)) if id==11
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var) & abs(var - (51.862000000000002)) <= 1e-9 * max(1,abs(51.862000000000002)) if id==11
assert !missing(sd) & abs(sd - (7.2015276157215427)) <= 1e-9 * max(1,abs(7.2015276157215427)) if id==11
assert !missing(skew) & abs(skew - (2.1823217414304499)) <= 1e-9 * max(1,abs(2.1823217414304499)) if id==11
assert !missing(mean_mo) & abs(mean_mo - (20.899999999999999)) <= 1e-9 * max(1,abs(20.899999999999999)) if id==11
assert !missing(total) & abs(total - (20.899999999999999)) <= 1e-9 * max(1,abs(20.899999999999999)) if id==11
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.8999999999999986)) <= 1e-9 * max(1,abs(5.8999999999999986)) if id==11
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.41719300090006295)) <= 1e-9 * max(1,abs(0.41719300090006295)) if id==11
assert !missing(dev_total) & abs(dev_total - (5.8999999999999986)) <= 1e-9 * max(1,abs(5.8999999999999986)) if id==11
assert !missing(z_total) & abs(z_total - (0.41719300090006295)) <= 1e-9 * max(1,abs(0.41719300090006295)) if id==11
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(z_raindays) & abs(z_raindays - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==11
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.033333333333333326)) <= 1e-9 * max(1,abs(0.033333333333333326)) if id==11
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.10101525445522104)) <= 1e-9 * max(1,abs(0.10101525445522104)) if id==11
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert missing(z_dry) if id==11
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(mean) & abs(mean - (8.9749999999999996)) <= 1e-9 * max(1,abs(8.9749999999999996)) if id==12
assert !missing(median) & abs(median - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(var) & abs(var - (85.869166666666672)) <= 1e-9 * max(1,abs(85.869166666666672)) if id==12
assert !missing(sd) & abs(sd - (9.2665617500055912)) <= 1e-9 * max(1,abs(9.2665617500055912)) if id==12
assert !missing(skew) & abs(skew - (-0.00010085308066387633)) <= 1e-9 * max(1,abs(-0.00010085308066387633)) if id==12
assert !missing(mean_mo) & abs(mean_mo - (35.899999999999999)) <= 1e-9 * max(1,abs(35.899999999999999)) if id==12
assert !missing(total) & abs(total - (35.899999999999999)) <= 1e-9 * max(1,abs(35.899999999999999)) if id==12
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(pct_raindays) & abs(pct_raindays - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==12
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (32.299999999999997)) <= 1e-9 * max(1,abs(32.299999999999997)) if id==12
assert !missing(z_mean_mo) & abs(z_mean_mo - (8.7844419355098005)) <= 1e-9 * max(1,abs(8.7844419355098005)) if id==12
assert !missing(dev_total) & abs(dev_total - (32.299999999999997)) <= 1e-9 * max(1,abs(32.299999999999997)) if id==12
assert !missing(z_total) & abs(z_total - (8.7844419355098005)) <= 1e-9 * max(1,abs(8.7844419355098005)) if id==12
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==12
assert !missing(z_raindays) & abs(z_raindays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==12
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.29166666666666669)) <= 1e-9 * max(1,abs(0.29166666666666669)) if id==12
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.9899494936611668)) <= 1e-9 * max(1,abs(0.9899494936611668)) if id==12
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
