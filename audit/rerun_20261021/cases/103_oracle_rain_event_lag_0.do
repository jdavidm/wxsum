version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261021/oracle_rain.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(rain) event_date(event) days(5) lag(0) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(mean) & abs(mean - (5.9749999999999996)) <= 1e-9 * max(1,abs(5.9749999999999996)) if id==1
assert !missing(median) & abs(median - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(var) & abs(var - (57.669166666666669)) <= 1e-9 * max(1,abs(57.669166666666669)) if id==1
assert !missing(sd) & abs(sd - (7.5940217715428409)) <= 1e-9 * max(1,abs(7.5940217715428409)) if id==1
assert !missing(skew) & abs(skew - (1.6521629701228833)) <= 1e-9 * max(1,abs(1.6521629701228833)) if id==1
assert !missing(mean_mo) & abs(mean_mo - (23.899999999999999)) <= 1e-9 * max(1,abs(23.899999999999999)) if id==1
assert !missing(total) & abs(total - (23.899999999999999)) <= 1e-9 * max(1,abs(23.899999999999999)) if id==1
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(pct_raindays) & abs(pct_raindays - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==1
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.449999999999999)) <= 1e-9 * max(1,abs(12.449999999999999)) if id==1
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.3648805311275218)) <= 1e-9 * max(1,abs(1.3648805311275218)) if id==1
assert !missing(dev_total) & abs(dev_total - (12.449999999999999)) <= 1e-9 * max(1,abs(12.449999999999999)) if id==1
assert !missing(z_total) & abs(z_total - (1.3648805311275218)) <= 1e-9 * max(1,abs(1.3648805311275218)) if id==1
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==1
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.08333333333333337)) <= 1e-9 * max(1,abs(0.08333333333333337)) if id==1
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.17677669529663695)) <= 1e-9 * max(1,abs(0.17677669529663695)) if id==1
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
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
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(mean) & abs(mean - (5.9500000000000002)) <= 1e-9 * max(1,abs(5.9500000000000002)) if id==4
assert !missing(median) & abs(median - (2.9500000000000002)) <= 1e-9 * max(1,abs(2.9500000000000002)) if id==4
assert !missing(var) & abs(var - (58.00333333333333)) <= 1e-9 * max(1,abs(58.00333333333333)) if id==4
assert !missing(sd) & abs(sd - (7.6159919467744537)) <= 1e-9 * max(1,abs(7.6159919467744537)) if id==4
assert !missing(skew) & abs(skew - (1.6461690864120699)) <= 1e-9 * max(1,abs(1.6461690864120699)) if id==4
assert !missing(mean_mo) & abs(mean_mo - (23.800000000000001)) <= 1e-9 * max(1,abs(23.800000000000001)) if id==4
assert !missing(total) & abs(total - (23.800000000000001)) <= 1e-9 * max(1,abs(23.800000000000001)) if id==4
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (10.9)) <= 1e-9 * max(1,abs(10.9)) if id==4
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.84697405658608449)) <= 1e-9 * max(1,abs(0.84697405658608449)) if id==4
assert !missing(dev_total) & abs(dev_total - (10.9)) <= 1e-9 * max(1,abs(10.9)) if id==4
assert !missing(z_total) & abs(z_total - (0.84697405658608449)) <= 1e-9 * max(1,abs(0.84697405658608449)) if id==4
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert missing(z_raindays) if id==4
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.049999999999999989)) <= 1e-9 * max(1,abs(0.049999999999999989)) if id==4
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert missing(z_dry) if id==4
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(mean) & abs(mean - (0.43333333333333335)) <= 1e-9 * max(1,abs(0.43333333333333335)) if id==5
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==5
assert !missing(var) & abs(var - (0.16333333333333333)) <= 1e-9 * max(1,abs(0.16333333333333333)) if id==5
assert !missing(sd) & abs(sd - (0.40414518843273806)) <= 1e-9 * max(1,abs(0.40414518843273806)) if id==5
assert !missing(skew) & abs(skew - (1.7320508075688772)) <= 1e-9 * max(1,abs(1.7320508075688772)) if id==5
assert !missing(mean_mo) & abs(mean_mo - (1.3)) <= 1e-9 * max(1,abs(1.3)) if id==5
assert !missing(total) & abs(total - (1.3)) <= 1e-9 * max(1,abs(1.3)) if id==5
assert !missing(raindays) & abs(raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(pct_raindays) & abs(pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-11.699999999999999)) <= 1e-9 * max(1,abs(-11.699999999999999)) if id==5
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.3788582233137676)) <= 1e-9 * max(1,abs(-1.3788582233137676)) if id==5
assert !missing(dev_total) & abs(dev_total - (-11.699999999999999)) <= 1e-9 * max(1,abs(-11.699999999999999)) if id==5
assert !missing(z_total) & abs(z_total - (-1.3788582233137676)) <= 1e-9 * max(1,abs(-1.3788582233137676)) if id==5
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==5
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==5
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==5
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==5
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.625)) <= 1e-9 * max(1,abs(-0.625)) if id==5
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==5
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert missing(z_dry) if id==5
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(mean) & abs(mean - (1.78)) <= 1e-9 * max(1,abs(1.78)) if id==6
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var) & abs(var - (3.742)) <= 1e-9 * max(1,abs(3.742)) if id==6
assert !missing(sd) & abs(sd - (1.934424979160474)) <= 1e-9 * max(1,abs(1.934424979160474)) if id==6
assert !missing(skew) & abs(skew - (1.53120382695761)) <= 1e-9 * max(1,abs(1.53120382695761)) if id==6
assert !missing(mean_mo) & abs(mean_mo - (8.9000000000000004)) <= 1e-9 * max(1,abs(8.9000000000000004)) if id==6
assert !missing(total) & abs(total - (8.9000000000000004)) <= 1e-9 * max(1,abs(8.9000000000000004)) if id==6
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==6
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-16.149999999999999)) <= 1e-9 * max(1,abs(-16.149999999999999)) if id==6
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.8711100054788963)) <= 1e-9 * max(1,abs(-3.8711100054788963)) if id==6
assert !missing(dev_total) & abs(dev_total - (-16.149999999999999)) <= 1e-9 * max(1,abs(-16.149999999999999)) if id==6
assert !missing(z_total) & abs(z_total - (-3.8711100054788963)) <= 1e-9 * max(1,abs(-3.8711100054788963)) if id==6
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.099999999999999978)) <= 1e-9 * max(1,abs(-0.099999999999999978)) if id==6
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654713)) <= 1e-9 * max(1,abs(-0.70710678118654713)) if id==6
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(mean) & abs(mean - (8.5500000000000007)) <= 1e-9 * max(1,abs(8.5500000000000007)) if id==7
assert !missing(median) & abs(median - (8.5999999999999996)) <= 1e-9 * max(1,abs(8.5999999999999996)) if id==7
assert !missing(var) & abs(var - (95.209999999999994)) <= 1e-9 * max(1,abs(95.209999999999994)) if id==7
assert !missing(sd) & abs(sd - (9.7575611707024414)) <= 1e-9 * max(1,abs(9.7575611707024414)) if id==7
assert !missing(skew) & abs(skew - (-0.00036382526348973282)) <= 1e-9 * max(1,abs(-0.00036382526348973282)) if id==7
assert !missing(mean_mo) & abs(mean_mo - (34.200000000000003)) <= 1e-9 * max(1,abs(34.200000000000003)) if id==7
assert !missing(total) & abs(total - (34.200000000000003)) <= 1e-9 * max(1,abs(34.200000000000003)) if id==7
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.7000000000000028)) <= 1e-9 * max(1,abs(7.7000000000000028)) if id==7
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.63310723431818805)) <= 1e-9 * max(1,abs(0.63310723431818805)) if id==7
assert !missing(dev_total) & abs(dev_total - (7.7000000000000028)) <= 1e-9 * max(1,abs(7.7000000000000028)) if id==7
assert !missing(z_total) & abs(z_total - (0.63310723431818805)) <= 1e-9 * max(1,abs(0.63310723431818805)) if id==7
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.125)) <= 1e-9 * max(1,abs(0.125)) if id==7
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(mean) & abs(mean - (0.73333333333333339)) <= 1e-9 * max(1,abs(0.73333333333333339)) if id==8
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8
assert !missing(var) & abs(var - (1.2133333333333334)) <= 1e-9 * max(1,abs(1.2133333333333334)) if id==8
assert !missing(sd) & abs(sd - (1.1015141094572205)) <= 1e-9 * max(1,abs(1.1015141094572205)) if id==8
assert !missing(skew) & abs(skew - (1.6680336834432485)) <= 1e-9 * max(1,abs(1.6680336834432485)) if id==8
assert !missing(mean_mo) & abs(mean_mo - (2.2000000000000002)) <= 1e-9 * max(1,abs(2.2000000000000002)) if id==8
assert !missing(total) & abs(total - (2.2000000000000002)) <= 1e-9 * max(1,abs(2.2000000000000002)) if id==8
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==8
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-32.549999999999997)) <= 1e-9 * max(1,abs(-32.549999999999997)) if id==8
assert !missing(z_mean_mo) & abs(z_mean_mo - (-153.44217151748225)) <= 1e-9 * max(1,abs(-153.44217151748225)) if id==8
assert !missing(dev_total) & abs(dev_total - (-32.549999999999997)) <= 1e-9 * max(1,abs(-32.549999999999997)) if id==8
assert !missing(z_total) & abs(z_total - (-153.44217151748225)) <= 1e-9 * max(1,abs(-153.44217151748225)) if id==8
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert missing(z_raindays) if id==8
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==8
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0606601717798214)) <= 1e-9 * max(1,abs(-1.0606601717798214)) if id==8
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert missing(z_dry) if id==8
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(mean) & abs(mean - (9)) <= 1e-9 * max(1,abs(9)) if id==9
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(var) & abs(var - (48)) <= 1e-9 * max(1,abs(48)) if id==9
assert !missing(sd) & abs(sd - (6.9282032302755088)) <= 1e-9 * max(1,abs(6.9282032302755088)) if id==9
assert !missing(skew) & abs(skew - (1.7320508075688781)) <= 1e-9 * max(1,abs(1.7320508075688781)) if id==9
assert !missing(mean_mo) & abs(mean_mo - (27)) <= 1e-9 * max(1,abs(27)) if id==9
assert !missing(total) & abs(total - (27)) <= 1e-9 * max(1,abs(27)) if id==9
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (15.5)) <= 1e-9 * max(1,abs(15.5)) if id==9
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2597879434932744)) <= 1e-9 * max(1,abs(1.2597879434932744)) if id==9
assert !missing(dev_total) & abs(dev_total - (15.5)) <= 1e-9 * max(1,abs(15.5)) if id==9
assert !missing(z_total) & abs(z_total - (1.2597879434932744)) <= 1e-9 * max(1,abs(1.2597879434932744)) if id==9
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==9
assert !missing(z_norain) & abs(z_norain - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==9
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.57499999999999996)) <= 1e-9 * max(1,abs(0.57499999999999996)) if id==9
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.3233508524700848)) <= 1e-9 * max(1,abs(2.3233508524700848)) if id==9
assert !missing(dev_dry) & abs(dev_dry - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9
assert !missing(z_dry) & abs(z_dry - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==9
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(mean) & abs(mean - (0.6333333333333333)) <= 1e-9 * max(1,abs(0.6333333333333333)) if id==10
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10
assert !missing(var) & abs(var - (0.30333333333333334)) <= 1e-9 * max(1,abs(0.30333333333333334)) if id==10
assert !missing(sd) & abs(sd - (0.55075705472861025)) <= 1e-9 * max(1,abs(0.55075705472861025)) if id==10
assert !missing(skew) & abs(skew - (-1.6680336834432485)) <= 1e-9 * max(1,abs(-1.6680336834432485)) if id==10
assert !missing(mean_mo) & abs(mean_mo - (1.8999999999999999)) <= 1e-9 * max(1,abs(1.8999999999999999)) if id==10
assert !missing(total) & abs(total - (1.8999999999999999)) <= 1e-9 * max(1,abs(1.8999999999999999)) if id==10
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.25)) <= 1e-9 * max(1,abs(-7.25)) if id==10
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.84735936588470584)) <= 1e-9 * max(1,abs(-0.84735936588470584)) if id==10
assert !missing(dev_total) & abs(dev_total - (-7.25)) <= 1e-9 * max(1,abs(-7.25)) if id==10
assert !missing(z_total) & abs(z_total - (-0.84735936588470584)) <= 1e-9 * max(1,abs(-0.84735936588470584)) if id==10
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==10
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==10
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_norain) if id==10
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.21666666666666673)) <= 1e-9 * max(1,abs(-0.21666666666666673)) if id==10
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.0641293851417073)) <= 1e-9 * max(1,abs(-3.0641293851417073)) if id==10
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_dry) if id==10
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(mean) & abs(mean - (1.1799999999999999)) <= 1e-9 * max(1,abs(1.1799999999999999)) if id==11
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var) & abs(var - (0.71199999999999997)) <= 1e-9 * max(1,abs(0.71199999999999997)) if id==11
assert !missing(sd) & abs(sd - (0.84380092438915943)) <= 1e-9 * max(1,abs(0.84380092438915943)) if id==11
assert !missing(skew) & abs(skew - (-0.39398371181612546)) <= 1e-9 * max(1,abs(-0.39398371181612546)) if id==11
assert !missing(mean_mo) & abs(mean_mo - (5.9000000000000004)) <= 1e-9 * max(1,abs(5.9000000000000004)) if id==11
assert !missing(total) & abs(total - (5.9000000000000004)) <= 1e-9 * max(1,abs(5.9000000000000004)) if id==11
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-13.15)) <= 1e-9 * max(1,abs(-13.15)) if id==11
assert !missing(z_mean_mo) & abs(z_mean_mo - (-185.96908345205938)) <= 1e-9 * max(1,abs(-185.96908345205938)) if id==11
assert !missing(dev_total) & abs(dev_total - (-13.15)) <= 1e-9 * max(1,abs(-13.15)) if id==11
assert !missing(z_total) & abs(z_total - (-185.96908345205938)) <= 1e-9 * max(1,abs(-185.96908345205938)) if id==11
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert missing(z_raindays) if id==11
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.066666666666666652)) <= 1e-9 * max(1,abs(0.066666666666666652)) if id==11
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==11
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(mean) & abs(mean - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(median) & abs(median - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(var) & abs(var - (128)) <= 1e-9 * max(1,abs(128)) if id==12
assert !missing(sd) & abs(sd - (11.313708498984761)) <= 1e-9 * max(1,abs(11.313708498984761)) if id==12
assert missing(skew) if id==12
assert !missing(mean_mo) & abs(mean_mo - (18)) <= 1e-9 * max(1,abs(18)) if id==12
assert !missing(total) & abs(total - (18)) <= 1e-9 * max(1,abs(18)) if id==12
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.300000000000001)) <= 1e-9 * max(1,abs(12.300000000000001)) if id==12
assert !missing(z_mean_mo) & abs(z_mean_mo - (17.39482681718907)) <= 1e-9 * max(1,abs(17.39482681718907)) if id==12
assert !missing(dev_total) & abs(dev_total - (12.300000000000001)) <= 1e-9 * max(1,abs(12.300000000000001)) if id==12
assert !missing(z_total) & abs(z_total - (17.39482681718907)) <= 1e-9 * max(1,abs(17.39482681718907)) if id==12
assert !missing(dev_raindays) & abs(dev_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_norain) & abs(dev_norain - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==12
assert !missing(z_norain) & abs(z_norain - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==12
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.56666666666666665)) <= 1e-9 * max(1,abs(0.56666666666666665)) if id==12
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.7172593257387585)) <= 1e-9 * max(1,abs(1.7172593257387585)) if id==12
assert !missing(dev_dry) & abs(dev_dry - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==12
assert !missing(z_dry) & abs(z_dry - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==12
