version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261016/original/oracle_temp.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) event_date(event) days(5) lag(-2) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(mean) & abs(mean - (30.875)) <= 1e-9 * max(1,abs(30.875)) if id==1
assert !missing(median) & abs(median - (31)) <= 1e-9 * max(1,abs(31)) if id==1
assert !missing(var) & abs(var - (1.7291666666666667)) <= 1e-9 * max(1,abs(1.7291666666666667)) if id==1
assert !missing(sd) & abs(sd - (1.3149778198382918)) <= 1e-9 * max(1,abs(1.3149778198382918)) if id==1
assert !missing(skew) & abs(skew - (-0.12369075733128361)) <= 1e-9 * max(1,abs(-0.12369075733128361)) if id==1
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==1
assert !missing(gdd) & abs(gdd - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==1
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==1
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(heat_end) & abs(heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dev_gdd) & abs(dev_gdd - (39.75)) <= 1e-9 * max(1,abs(39.75)) if id==1
assert !missing(z_gdd) & abs(z_gdd - (1.4231642811222918)) <= 1e-9 * max(1,abs(1.4231642811222918)) if id==1
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==1
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_heatdays) & abs(dev_heatdays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1
assert !missing(z_heatdays) & abs(z_heatdays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==1
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==1
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==1
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_start) if id==1
assert !missing(dev_heat) & abs(dev_heat - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1
assert !missing(z_heat) & abs(z_heat - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==1
assert !missing(dev_heat_end) & abs(dev_heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert missing(z_heat_end) if id==1
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew) if id==2
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd) & abs(gdd - (100)) <= 1e-9 * max(1,abs(100)) if id==2
assert !missing(kdd) & abs(kdd - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start) & abs(heat_start - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(heat) & abs(heat - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(heat_end) & abs(heat_end - (5)) <= 1e-9 * max(1,abs(5)) if id==2
assert !missing(dev_gdd) & abs(dev_gdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd) if id==2
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd) if id==2
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays) if id==2
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays) if id==2
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_start) if id==2
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat) if id==2
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_end) if id==2
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean) if id==3
assert missing(median) if id==3
assert missing(var) if id==3
assert missing(sd) if id==3
assert missing(skew) if id==3
assert missing(max) if id==3
assert missing(gdd) if id==3
assert missing(kdd) if id==3
assert missing(heatdays) if id==3
assert missing(pct_heatdays) if id==3
assert missing(heat_start) if id==3
assert missing(heat) if id==3
assert missing(heat_end) if id==3
assert missing(dev_gdd) if id==3
assert missing(z_gdd) if id==3
assert missing(dev_kdd) if id==3
assert missing(z_kdd) if id==3
assert missing(dev_heatdays) if id==3
assert missing(z_heatdays) if id==3
assert missing(dev_pct_heatdays) if id==3
assert missing(z_pct_heatdays) if id==3
assert missing(dev_heat_start) if id==3
assert missing(z_heat_start) if id==3
assert missing(dev_heat) if id==3
assert missing(z_heat) if id==3
assert missing(dev_heat_end) if id==3
assert missing(z_heat_end) if id==3
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(mean) & abs(mean - (30.199999999999999)) <= 1e-9 * max(1,abs(30.199999999999999)) if id==4
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==4
assert !missing(var) & abs(var - (1.075)) <= 1e-9 * max(1,abs(1.075)) if id==4
assert !missing(sd) & abs(sd - (1.036822067666386)) <= 1e-9 * max(1,abs(1.036822067666386)) if id==4
assert !missing(skew) & abs(skew - (1.9177563393288515)) <= 1e-9 * max(1,abs(1.9177563393288515)) if id==4
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==4
assert !missing(gdd) & abs(gdd - (99)) <= 1e-9 * max(1,abs(99)) if id==4
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==4
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dev_gdd) & abs(dev_gdd - (44.25)) <= 1e-9 * max(1,abs(44.25)) if id==4
assert !missing(z_gdd) & abs(z_gdd - (1.264221214848676)) <= 1e-9 * max(1,abs(1.264221214848676)) if id==4
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==4
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.099999999999999978)) <= 1e-9 * max(1,abs(0.099999999999999978)) if id==4
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.28284271247461895)) <= 1e-9 * max(1,abs(0.28284271247461895)) if id==4
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(z_heat_start) & abs(z_heat_start - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==4
assert !missing(z_heat) & abs(z_heat - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==4
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(mean) & abs(mean - (14.4)) <= 1e-9 * max(1,abs(14.4)) if id==5
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(var) & abs(var - (146.80000000000001)) <= 1e-9 * max(1,abs(146.80000000000001)) if id==5
assert !missing(sd) & abs(sd - (12.116104984688768)) <= 1e-9 * max(1,abs(12.116104984688768)) if id==5
assert !missing(skew) & abs(skew - (0.57886787767725856)) <= 1e-9 * max(1,abs(0.57886787767725856)) if id==5
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==5
assert !missing(gdd) & abs(gdd - (30)) <= 1e-9 * max(1,abs(30)) if id==5
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==5
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_gdd) & abs(dev_gdd - (-5)) <= 1e-9 * max(1,abs(-5)) if id==5
assert !missing(z_gdd) & abs(z_gdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==5
assert missing(z_kdd) if id==5
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.23333333333333334)) <= 1e-9 * max(1,abs(-0.23333333333333334)) if id==5
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654768)) <= 1e-9 * max(1,abs(-0.70710678118654768)) if id==5
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert missing(z_heat) if id==5
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(mean) & abs(mean - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(skew) if id==6
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dev_gdd) & abs(dev_gdd - (20)) <= 1e-9 * max(1,abs(20)) if id==6
assert !missing(z_gdd) & abs(z_gdd - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==6
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_kdd) if id==6
assert !missing(dev_heatdays) & abs(dev_heatdays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==6
assert !missing(z_heatdays) & abs(z_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==6
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (6.3639610306789276)) <= 1e-9 * max(1,abs(6.3639610306789276)) if id==6
assert !missing(dev_heat_start) & abs(dev_heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert missing(z_heat_start) if id==6
assert !missing(dev_heat) & abs(dev_heat - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==6
assert !missing(z_heat) & abs(z_heat - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6
assert !missing(dev_heat_end) & abs(dev_heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert missing(z_heat_end) if id==6
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(mean) & abs(mean - (3.3333333333333335)) <= 1e-9 * max(1,abs(3.3333333333333335)) if id==7
assert !missing(median) & abs(median - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(var) & abs(var - (233.33333333333334)) <= 1e-9 * max(1,abs(233.33333333333334)) if id==7
assert !missing(sd) & abs(sd - (15.275252316519467)) <= 1e-9 * max(1,abs(15.275252316519467)) if id==7
assert !missing(skew) & abs(skew - (0.93521952958282495)) <= 1e-9 * max(1,abs(0.93521952958282495)) if id==7
assert !missing(max) & abs(max - (20)) <= 1e-9 * max(1,abs(20)) if id==7
assert !missing(gdd) & abs(gdd - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heatdays) & abs(heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(pct_heatdays) & abs(pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_gdd) & abs(dev_gdd - (-39.5)) <= 1e-9 * max(1,abs(-39.5)) if id==7
assert !missing(z_gdd) & abs(z_gdd - (-1.3965358928434313)) <= 1e-9 * max(1,abs(-1.3965358928434313)) if id==7
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_kdd) if id==7
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==7
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==7
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat) if id==7
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_end) if id==7
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(mean) & abs(mean - (18)) <= 1e-9 * max(1,abs(18)) if id==8
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(var) & abs(var - (588)) <= 1e-9 * max(1,abs(588)) if id==8
assert !missing(sd) & abs(sd - (24.248711305964282)) <= 1e-9 * max(1,abs(24.248711305964282)) if id==8
assert !missing(skew) & abs(skew - (-1.7320508075688772)) <= 1e-9 * max(1,abs(-1.7320508075688772)) if id==8
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==8
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_gdd) & abs(dev_gdd - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_gdd) & abs(z_gdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_kdd) if id==8
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.46666666666666662)) <= 1e-9 * max(1,abs(0.46666666666666662)) if id==8
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.6499158227686108)) <= 1e-9 * max(1,abs(1.6499158227686108)) if id==8
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert missing(z_heat_start) if id==8
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(mean) & abs(mean - (18.399999999999999)) <= 1e-9 * max(1,abs(18.399999999999999)) if id==9
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var) & abs(var - (382.80000000000001)) <= 1e-9 * max(1,abs(382.80000000000001)) if id==9
assert !missing(sd) & abs(sd - (19.56527536223296)) <= 1e-9 * max(1,abs(19.56527536223296)) if id==9
assert !missing(skew) & abs(skew - (-0.60649535844204983)) <= 1e-9 * max(1,abs(-0.60649535844204983)) if id==9
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd) & abs(gdd - (50)) <= 1e-9 * max(1,abs(50)) if id==9
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==9
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dev_gdd) & abs(dev_gdd - (30)) <= 1e-9 * max(1,abs(30)) if id==9
assert missing(z_gdd) if id==9
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert missing(z_kdd) if id==9
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert missing(z_heatdays) if id==9
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.17500000000000002)) <= 1e-9 * max(1,abs(0.17500000000000002)) if id==9
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (4.9497474683058345)) <= 1e-9 * max(1,abs(4.9497474683058345)) if id==9
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_heat_start) if id==9
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_heat) if id==9
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert missing(z_heat_end) if id==9
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(mean) & abs(mean - (4.4000000000000004)) <= 1e-9 * max(1,abs(4.4000000000000004)) if id==10
assert !missing(median) & abs(median - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(var) & abs(var - (306.80000000000001)) <= 1e-9 * max(1,abs(306.80000000000001)) if id==10
assert !missing(sd) & abs(sd - (17.515707236649053)) <= 1e-9 * max(1,abs(17.515707236649053)) if id==10
assert !missing(skew) & abs(skew - (1.1741370565780689)) <= 1e-9 * max(1,abs(1.1741370565780689)) if id==10
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==10
assert !missing(gdd) & abs(gdd - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==10
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dev_gdd) & abs(dev_gdd - (-30)) <= 1e-9 * max(1,abs(-30)) if id==10
assert !missing(z_gdd) & abs(z_gdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==10
assert !missing(dev_kdd) & abs(dev_kdd - (-12)) <= 1e-9 * max(1,abs(-12)) if id==10
assert !missing(z_kdd) & abs(z_kdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==10
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==10
assert !missing(z_heatdays) & abs(z_heatdays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==10
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.67500000000000004)) <= 1e-9 * max(1,abs(-0.67500000000000004)) if id==10
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-3.8183766184073566)) <= 1e-9 * max(1,abs(-3.8183766184073566)) if id==10
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert missing(z_heat_start) if id==10
assert !missing(dev_heat) & abs(dev_heat - (-2)) <= 1e-9 * max(1,abs(-2)) if id==10
assert missing(z_heat) if id==10
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(mean) & abs(mean - (15.5)) <= 1e-9 * max(1,abs(15.5)) if id==11
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(var) & abs(var - (387.66666666666669)) <= 1e-9 * max(1,abs(387.66666666666669)) if id==11
assert !missing(sd) & abs(sd - (19.689252567496478)) <= 1e-9 * max(1,abs(19.689252567496478)) if id==11
assert !missing(skew) & abs(skew - (-0.8041539398978097)) <= 1e-9 * max(1,abs(-0.8041539398978097)) if id==11
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd) & abs(dev_gdd - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(z_gdd) & abs(z_gdd - (0.037216146378239341)) <= 1e-9 * max(1,abs(0.037216146378239341)) if id==11
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_kdd) if id==11
assert !missing(dev_heatdays) & abs(dev_heatdays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11
assert !missing(z_heatdays) & abs(z_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==11
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_heat_start) if id==11
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_heat) if id==11
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(mean) & abs(mean - (9.875)) <= 1e-9 * max(1,abs(9.875)) if id==12
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(var) & abs(var - (260.0625)) <= 1e-9 * max(1,abs(260.0625)) if id==12
assert !missing(sd) & abs(sd - (16.126453422870139)) <= 1e-9 * max(1,abs(16.126453422870139)) if id==12
assert !missing(skew) & abs(skew - (-0.046503710309008392)) <= 1e-9 * max(1,abs(-0.046503710309008392)) if id==12
assert !missing(max) & abs(max - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12
assert !missing(gdd) & abs(gdd - (19.5)) <= 1e-9 * max(1,abs(19.5)) if id==12
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heatdays) & abs(heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(pct_heatdays) & abs(pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_gdd) & abs(dev_gdd - (-35.5)) <= 1e-9 * max(1,abs(-35.5)) if id==12
assert !missing(z_gdd) & abs(z_gdd - (-5.0204581464244873)) <= 1e-9 * max(1,abs(-5.0204581464244873)) if id==12
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==12
assert missing(z_kdd) if id==12
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==12
assert !missing(z_heatdays) & abs(z_heatdays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==12
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.57499999999999996)) <= 1e-9 * max(1,abs(-0.57499999999999996)) if id==12
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-2.3233508524700848)) <= 1e-9 * max(1,abs(-2.3233508524700848)) if id==12
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert missing(z_heat_start) if id==12
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12
assert !missing(z_heat_end) & abs(z_heat_end - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12
