version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/oracle_rain.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(rain) event_date(event) days(5) lag(3) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(mean) & abs(mean - (2.0249999999999999)) <= 1e-9 * max(1,abs(2.0249999999999999)) if id==1
assert !missing(median) & abs(median - (1.45)) <= 1e-9 * max(1,abs(1.45)) if id==1
assert !missing(var) & abs(var - (4.4824999999999999)) <= 1e-9 * max(1,abs(4.4824999999999999)) if id==1
assert !missing(sd) & abs(sd - (2.1171915359740128)) <= 1e-9 * max(1,abs(2.1171915359740128)) if id==1
assert !missing(skew) & abs(skew - (1.3226384172907566)) <= 1e-9 * max(1,abs(1.3226384172907566)) if id==1
assert !missing(mean_mo) & abs(mean_mo - (8.0999999999999996)) <= 1e-9 * max(1,abs(8.0999999999999996)) if id==1
assert !missing(total) & abs(total - (8.0999999999999996)) <= 1e-9 * max(1,abs(8.0999999999999996)) if id==1
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-22.350000000000001)) <= 1e-9 * max(1,abs(-22.350000000000001)) if id==1
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.8997865246824479)) <= 1e-9 * max(1,abs(-2.8997865246824479)) if id==1
assert !missing(dev_total) & abs(dev_total - (-22.350000000000001)) <= 1e-9 * max(1,abs(-22.350000000000001)) if id==1
assert !missing(z_total) & abs(z_total - (-2.8997865246824479)) <= 1e-9 * max(1,abs(-2.8997865246824479)) if id==1
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==1
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==1
assert !missing(dev_norain) & abs(dev_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==1
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==1
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.375)) <= 1e-9 * max(1,abs(-0.375)) if id==1
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==1
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
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
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(mean) & abs(mean - (4.7000000000000002)) <= 1e-9 * max(1,abs(4.7000000000000002)) if id==4
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4
assert !missing(var) & abs(var - (67.420000000000002)) <= 1e-9 * max(1,abs(67.420000000000002)) if id==4
assert !missing(sd) & abs(sd - (8.2109682742049372)) <= 1e-9 * max(1,abs(8.2109682742049372)) if id==4
assert !missing(skew) & abs(skew - (1.9838019695298059)) <= 1e-9 * max(1,abs(1.9838019695298059)) if id==4
assert !missing(mean_mo) & abs(mean_mo - (18.800000000000001)) <= 1e-9 * max(1,abs(18.800000000000001)) if id==4
assert !missing(total) & abs(total - (18.800000000000001)) <= 1e-9 * max(1,abs(18.800000000000001)) if id==4
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(pct_raindays) & abs(pct_raindays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==4
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (15.350000000000001)) <= 1e-9 * max(1,abs(15.350000000000001)) if id==4
assert !missing(z_mean_mo) & abs(z_mean_mo - (19.734707438570009)) <= 1e-9 * max(1,abs(19.734707438570009)) if id==4
assert !missing(dev_total) & abs(dev_total - (15.350000000000001)) <= 1e-9 * max(1,abs(15.350000000000001)) if id==4
assert !missing(z_total) & abs(z_total - (19.734707438570009)) <= 1e-9 * max(1,abs(19.734707438570009)) if id==4
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25)) <= 1e-9 * max(1,abs(-0.25)) if id==4
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(mean) & abs(mean - (0.66000000000000003)) <= 1e-9 * max(1,abs(0.66000000000000003)) if id==5
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==5
assert !missing(var) & abs(var - (0.67800000000000005)) <= 1e-9 * max(1,abs(0.67800000000000005)) if id==5
assert !missing(sd) & abs(sd - (0.82340755400955612)) <= 1e-9 * max(1,abs(0.82340755400955612)) if id==5
assert !missing(skew) & abs(skew - (1.4462527717025506)) <= 1e-9 * max(1,abs(1.4462527717025506)) if id==5
assert !missing(mean_mo) & abs(mean_mo - (3.2999999999999998)) <= 1e-9 * max(1,abs(3.2999999999999998)) if id==5
assert !missing(total) & abs(total - (3.2999999999999998)) <= 1e-9 * max(1,abs(3.2999999999999998)) if id==5
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(pct_raindays) & abs(pct_raindays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==5
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-12.349999999999998)) <= 1e-9 * max(1,abs(-12.349999999999998)) if id==5
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.9192898346492002)) <= 1e-9 * max(1,abs(-1.9192898346492002)) if id==5
assert !missing(dev_total) & abs(dev_total - (-12.349999999999998)) <= 1e-9 * max(1,abs(-12.349999999999998)) if id==5
assert !missing(z_total) & abs(z_total - (-1.9192898346492002)) <= 1e-9 * max(1,abs(-1.9192898346492002)) if id==5
assert !missing(dev_raindays) & abs(dev_raindays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==5
assert !missing(z_raindays) & abs(z_raindays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==5
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(z_norain) & abs(z_norain - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==5
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.37499999999999994)) <= 1e-9 * max(1,abs(-0.37499999999999994)) if id==5
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.5152288168283159)) <= 1e-9 * max(1,abs(-1.5152288168283159)) if id==5
assert !missing(dev_dry) & abs(dev_dry - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==5
assert !missing(z_dry) & abs(z_dry - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==5
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(mean) & abs(mean - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var) & abs(var - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(sd) & abs(sd - (1.4142135623730951)) <= 1e-9 * max(1,abs(1.4142135623730951)) if id==6
assert missing(skew) if id==6
assert !missing(mean_mo) & abs(mean_mo - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(total) & abs(total - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-25.5)) <= 1e-9 * max(1,abs(-25.5)) if id==6
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.6912273015308896)) <= 1e-9 * max(1,abs(-2.6912273015308896)) if id==6
assert !missing(dev_total) & abs(dev_total - (-25.5)) <= 1e-9 * max(1,abs(-25.5)) if id==6
assert !missing(z_total) & abs(z_total - (-2.6912273015308896)) <= 1e-9 * max(1,abs(-2.6912273015308896)) if id==6
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert missing(z_raindays) if id==6
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert missing(z_norain) if id==6
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_pct_raindays) if id==6
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(mean) & abs(mean - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(median) & abs(median - (11)) <= 1e-9 * max(1,abs(11)) if id==7
assert !missing(var) & abs(var - (68)) <= 1e-9 * max(1,abs(68)) if id==7
assert !missing(sd) & abs(sd - (8.2462112512353212)) <= 1e-9 * max(1,abs(8.2462112512353212)) if id==7
assert !missing(skew) & abs(skew - (-0.19973522061815657)) <= 1e-9 * max(1,abs(-0.19973522061815657)) if id==7
assert !missing(mean_mo) & abs(mean_mo - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(total) & abs(total - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (20.399999999999999)) <= 1e-9 * max(1,abs(20.399999999999999)) if id==7
assert !missing(z_mean_mo) & abs(z_mean_mo - (6.0104076400856528)) <= 1e-9 * max(1,abs(6.0104076400856528)) if id==7
assert !missing(dev_total) & abs(dev_total - (20.399999999999999)) <= 1e-9 * max(1,abs(20.399999999999999)) if id==7
assert !missing(z_total) & abs(z_total - (6.0104076400856528)) <= 1e-9 * max(1,abs(6.0104076400856528)) if id==7
assert !missing(dev_raindays) & abs(dev_raindays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==7
assert !missing(z_raindays) & abs(z_raindays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==7
assert !missing(dev_norain) & abs(dev_norain - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==7
assert !missing(z_norain) & abs(z_norain - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==7
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==7
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(mean) & abs(mean - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(var) & abs(var - (1.3333333333333333)) <= 1e-9 * max(1,abs(1.3333333333333333)) if id==8
assert !missing(sd) & abs(sd - (1.1547005383792515)) <= 1e-9 * max(1,abs(1.1547005383792515)) if id==8
assert !missing(skew) & abs(skew - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(mean_mo) & abs(mean_mo - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(total) & abs(total - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-17.550000000000001)) <= 1e-9 * max(1,abs(-17.550000000000001)) if id==8
assert !missing(z_mean_mo) & abs(z_mean_mo - (-5.5154328932550714)) <= 1e-9 * max(1,abs(-5.5154328932550714)) if id==8
assert !missing(dev_total) & abs(dev_total - (-17.550000000000001)) <= 1e-9 * max(1,abs(-17.550000000000001)) if id==8
assert !missing(z_total) & abs(z_total - (-5.5154328932550714)) <= 1e-9 * max(1,abs(-5.5154328932550714)) if id==8
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_raindays) if id==8
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert missing(z_norain) if id==8
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.099999999999999978)) <= 1e-9 * max(1,abs(0.099999999999999978)) if id==8
assert missing(z_pct_raindays) if id==8
assert !missing(dev_dry) & abs(dev_dry - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8
assert !missing(z_dry) & abs(z_dry - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(mean) & abs(mean - (3.5800000000000001)) <= 1e-9 * max(1,abs(3.5800000000000001)) if id==9
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(var) & abs(var - (3.9319999999999999)) <= 1e-9 * max(1,abs(3.9319999999999999)) if id==9
assert !missing(sd) & abs(sd - (1.98292712927127)) <= 1e-9 * max(1,abs(1.98292712927127)) if id==9
assert !missing(skew) & abs(skew - (-0.78040295808739024)) <= 1e-9 * max(1,abs(-0.78040295808739024)) if id==9
assert !missing(mean_mo) & abs(mean_mo - (17.899999999999999)) <= 1e-9 * max(1,abs(17.899999999999999)) if id==9
assert !missing(total) & abs(total - (17.899999999999999)) <= 1e-9 * max(1,abs(17.899999999999999)) if id==9
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==9
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (3.3999999999999986)) <= 1e-9 * max(1,abs(3.3999999999999986)) if id==9
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.32055507413790141)) <= 1e-9 * max(1,abs(0.32055507413790141)) if id==9
assert !missing(dev_total) & abs(dev_total - (3.3999999999999986)) <= 1e-9 * max(1,abs(3.3999999999999986)) if id==9
assert !missing(z_total) & abs(z_total - (0.32055507413790141)) <= 1e-9 * max(1,abs(0.32055507413790141)) if id==9
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==9
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==9
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_norain) & abs(z_norain - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==9
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.17500000000000004)) <= 1e-9 * max(1,abs(0.17500000000000004)) if id==9
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.32998316455372229)) <= 1e-9 * max(1,abs(0.32998316455372229)) if id==9
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(mean) & abs(mean - (11.666666666666666)) <= 1e-9 * max(1,abs(11.666666666666666)) if id==10
assert !missing(median) & abs(median - (17)) <= 1e-9 * max(1,abs(17)) if id==10
assert !missing(var) & abs(var - (85.333333333333329)) <= 1e-9 * max(1,abs(85.333333333333329)) if id==10
assert !missing(sd) & abs(sd - (9.2376043070340117)) <= 1e-9 * max(1,abs(9.2376043070340117)) if id==10
assert !missing(skew) & abs(skew - (-1.7320508075688767)) <= 1e-9 * max(1,abs(-1.7320508075688767)) if id==10
assert !missing(mean_mo) & abs(mean_mo - (35)) <= 1e-9 * max(1,abs(35)) if id==10
assert !missing(total) & abs(total - (35)) <= 1e-9 * max(1,abs(35)) if id==10
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (29.149999999999999)) <= 1e-9 * max(1,abs(29.149999999999999)) if id==10
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.7820481966216253)) <= 1e-9 * max(1,abs(3.7820481966216253)) if id==10
assert !missing(dev_total) & abs(dev_total - (29.149999999999999)) <= 1e-9 * max(1,abs(29.149999999999999)) if id==10
assert !missing(z_total) & abs(z_total - (3.7820481966216253)) <= 1e-9 * max(1,abs(3.7820481966216253)) if id==10
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(z_raindays) & abs(z_raindays - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==10
assert !missing(dev_norain) & abs(dev_norain - (-3)) <= 1e-9 * max(1,abs(-3)) if id==10
assert missing(z_norain) if id==10
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==10
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.8284271247461903)) <= 1e-9 * max(1,abs(2.8284271247461903)) if id==10
assert !missing(dev_dry) & abs(dev_dry - (-2)) <= 1e-9 * max(1,abs(-2)) if id==10
assert !missing(z_dry) & abs(z_dry - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==10
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(mean) & abs(mean - (1.2250000000000001)) <= 1e-9 * max(1,abs(1.2250000000000001)) if id==11
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var) & abs(var - (0.26916666666666667)) <= 1e-9 * max(1,abs(0.26916666666666667)) if id==11
assert !missing(sd) & abs(sd - (0.51881274720911263)) <= 1e-9 * max(1,abs(0.51881274720911263)) if id==11
assert !missing(skew) & abs(skew - (1.9495571645070928)) <= 1e-9 * max(1,abs(1.9495571645070928)) if id==11
assert !missing(mean_mo) & abs(mean_mo - (4.9000000000000004)) <= 1e-9 * max(1,abs(4.9000000000000004)) if id==11
assert !missing(total) & abs(total - (4.9000000000000004)) <= 1e-9 * max(1,abs(4.9000000000000004)) if id==11
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(pct_raindays) & abs(pct_raindays - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==11
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.6500000000000004)) <= 1e-9 * max(1,abs(-5.6500000000000004)) if id==11
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.42276754642370301)) <= 1e-9 * max(1,abs(-0.42276754642370301)) if id==11
assert !missing(dev_total) & abs(dev_total - (-5.6500000000000004)) <= 1e-9 * max(1,abs(-5.6500000000000004)) if id==11
assert !missing(z_total) & abs(z_total - (-0.42276754642370301)) <= 1e-9 * max(1,abs(-0.42276754642370301)) if id==11
assert !missing(dev_raindays) & abs(dev_raindays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11
assert !missing(z_raindays) & abs(z_raindays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==11
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==11
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==11
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(mean) & abs(mean - (6.0666666666666664)) <= 1e-9 * max(1,abs(6.0666666666666664)) if id==12
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(var) & abs(var - (89.813333333333333)) <= 1e-9 * max(1,abs(89.813333333333333)) if id==12
assert !missing(sd) & abs(sd - (9.4769896767556592)) <= 1e-9 * max(1,abs(9.4769896767556592)) if id==12
assert !missing(skew) & abs(skew - (1.7181759131659562)) <= 1e-9 * max(1,abs(1.7181759131659562)) if id==12
assert !missing(mean_mo) & abs(mean_mo - (18.199999999999999)) <= 1e-9 * max(1,abs(18.199999999999999)) if id==12
assert !missing(total) & abs(total - (18.199999999999999)) <= 1e-9 * max(1,abs(18.199999999999999)) if id==12
assert !missing(raindays) & abs(raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==12
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.1999999999999993)) <= 1e-9 * max(1,abs(7.1999999999999993)) if id==12
assert !missing(z_mean_mo) & abs(z_mean_mo - (50.911688245431598)) <= 1e-9 * max(1,abs(50.911688245431598)) if id==12
assert !missing(dev_total) & abs(dev_total - (7.1999999999999993)) <= 1e-9 * max(1,abs(7.1999999999999993)) if id==12
assert !missing(z_total) & abs(z_total - (50.911688245431598)) <= 1e-9 * max(1,abs(50.911688245431598)) if id==12
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert missing(z_raindays) if id==12
assert !missing(dev_norain) & abs(dev_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1333333333333333)) <= 1e-9 * max(1,abs(0.1333333333333333)) if id==12
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
