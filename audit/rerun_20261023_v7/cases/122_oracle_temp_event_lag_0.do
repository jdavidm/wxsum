version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023_v7/oracle_temp.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) event_date(event) days(5) lag(0) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(mean) & abs(mean - (17.875)) <= 1e-9 * max(1,abs(17.875)) if id==1
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==1
assert !missing(var) & abs(var - (372.0625)) <= 1e-9 * max(1,abs(372.0625)) if id==1
assert !missing(sd) & abs(sd - (19.288921690960333)) <= 1e-9 * max(1,abs(19.288921690960333)) if id==1
assert !missing(skew) & abs(skew - (-1.6033910042471657)) <= 1e-9 * max(1,abs(-1.6033910042471657)) if id==1
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==1
assert !missing(gdd) & abs(gdd - (49.5)) <= 1e-9 * max(1,abs(49.5)) if id==1
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==1
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dev_gdd) & abs(dev_gdd - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(z_gdd) & abs(z_gdd - (0.72523772429389488)) <= 1e-9 * max(1,abs(0.72523772429389488)) if id==1
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_kdd) if id==1
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert missing(z_heatdays) if id==1
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==1
assert missing(z_pct_heatdays) if id==1
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat) if id==1
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
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat) if id==2
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
assert missing(dev_heat) if id==3
assert missing(z_heat) if id==3
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(mean) & abs(mean - (22.199999999999999)) <= 1e-9 * max(1,abs(22.199999999999999)) if id==4
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==4
assert !missing(var) & abs(var - (325.07499999999999)) <= 1e-9 * max(1,abs(325.07499999999999)) if id==4
assert !missing(sd) & abs(sd - (18.029836383062381)) <= 1e-9 * max(1,abs(18.029836383062381)) if id==4
assert !missing(skew) & abs(skew - (-2.2174976462436033)) <= 1e-9 * max(1,abs(-2.2174976462436033)) if id==4
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==4
assert !missing(gdd) & abs(gdd - (79)) <= 1e-9 * max(1,abs(79)) if id==4
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==4
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_gdd) & abs(dev_gdd - (29.25)) <= 1e-9 * max(1,abs(29.25)) if id==4
assert !missing(z_gdd) & abs(z_gdd - (1.047234093656026)) <= 1e-9 * max(1,abs(1.047234093656026)) if id==4
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert missing(z_kdd) if id==4
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.050000000000000044)) <= 1e-9 * max(1,abs(0.050000000000000044)) if id==4
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.23570226039551606)) <= 1e-9 * max(1,abs(0.23570226039551606)) if id==4
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(mean) & abs(mean - (20.800000000000001)) <= 1e-9 * max(1,abs(20.800000000000001)) if id==5
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==5
assert !missing(var) & abs(var - (121.2)) <= 1e-9 * max(1,abs(121.2)) if id==5
assert !missing(sd) & abs(sd - (11.009087155618309)) <= 1e-9 * max(1,abs(11.009087155618309)) if id==5
assert !missing(skew) & abs(skew - (0.090534270087810301)) <= 1e-9 * max(1,abs(0.090534270087810301)) if id==5
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==5
assert !missing(gdd) & abs(gdd - (50)) <= 1e-9 * max(1,abs(50)) if id==5
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==5
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_gdd) & abs(dev_gdd - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==5
assert !missing(z_gdd) & abs(z_gdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==5
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.033333333333333326)) <= 1e-9 * max(1,abs(-0.033333333333333326)) if id==5
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.10101525445522107)) <= 1e-9 * max(1,abs(-0.10101525445522107)) if id==5
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert missing(z_heat) if id==5
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(mean) & abs(mean - (21)) <= 1e-9 * max(1,abs(21)) if id==6
assert !missing(median) & abs(median - (26)) <= 1e-9 * max(1,abs(26)) if id==6
assert !missing(var) & abs(var - (228)) <= 1e-9 * max(1,abs(228)) if id==6
assert !missing(sd) & abs(sd - (15.0996688705415)) <= 1e-9 * max(1,abs(15.0996688705415)) if id==6
assert !missing(skew) & abs(skew - (-1.2780575375189018)) <= 1e-9 * max(1,abs(-1.2780575375189018)) if id==6
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(gdd) & abs(gdd - (50)) <= 1e-9 * max(1,abs(50)) if id==6
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dev_gdd) & abs(dev_gdd - (10.25)) <= 1e-9 * max(1,abs(10.25)) if id==6
assert !missing(z_gdd) & abs(z_gdd - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==6
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_kdd) if id==6
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==6
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.0606601717798212)) <= 1e-9 * max(1,abs(1.0606601717798212)) if id==6
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_heat) if id==6
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(mean) & abs(mean - (13.9)) <= 1e-9 * max(1,abs(13.9)) if id==7
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==7
assert !missing(var) & abs(var - (326.05000000000001)) <= 1e-9 * max(1,abs(326.05000000000001)) if id==7
assert !missing(sd) & abs(sd - (18.056854654119583)) <= 1e-9 * max(1,abs(18.056854654119583)) if id==7
assert !missing(skew) & abs(skew - (-0.576146247507486)) <= 1e-9 * max(1,abs(-0.576146247507486)) if id==7
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==7
assert !missing(gdd) & abs(gdd - (49.5)) <= 1e-9 * max(1,abs(49.5)) if id==7
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==7
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_gdd) & abs(dev_gdd - (-15)) <= 1e-9 * max(1,abs(-15)) if id==7
assert !missing(z_gdd) & abs(z_gdd - (-2.3570226039551585)) <= 1e-9 * max(1,abs(-2.3570226039551585)) if id==7
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==7
assert missing(z_kdd) if id==7
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==7
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==7
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(z_heat) & abs(z_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(mean) & abs(mean - (33.833333333333336)) <= 1e-9 * max(1,abs(33.833333333333336)) if id==8
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(var) & abs(var - (30.083333333333332)) <= 1e-9 * max(1,abs(30.083333333333332)) if id==8
assert !missing(sd) & abs(sd - (5.4848275573014442)) <= 1e-9 * max(1,abs(5.4848275573014442)) if id==8
assert !missing(skew) & abs(skew - (1.3360957607299762)) <= 1e-9 * max(1,abs(1.3360957607299762)) if id==8
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd) & abs(gdd - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==8
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==8
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_gdd) & abs(dev_gdd - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(z_gdd) & abs(z_gdd - (0.74432292756478691)) <= 1e-9 * max(1,abs(0.74432292756478691)) if id==8
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.31666666666666665)) <= 1e-9 * max(1,abs(0.31666666666666665)) if id==8
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.4927809825049336)) <= 1e-9 * max(1,abs(1.4927809825049336)) if id==8
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(mean) & abs(mean - (11.9)) <= 1e-9 * max(1,abs(11.9)) if id==9
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==9
assert !missing(var) & abs(var - (515.54999999999995)) <= 1e-9 * max(1,abs(515.54999999999995)) if id==9
assert !missing(sd) & abs(sd - (22.70572615002656)) <= 1e-9 * max(1,abs(22.70572615002656)) if id==9
assert !missing(skew) & abs(skew - (0.23585040415721958)) <= 1e-9 * max(1,abs(0.23585040415721958)) if id==9
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd) & abs(gdd - (39.5)) <= 1e-9 * max(1,abs(39.5)) if id==9
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dev_gdd) & abs(dev_gdd - (-5.25)) <= 1e-9 * max(1,abs(-5.25)) if id==9
assert !missing(z_gdd) & abs(z_gdd - (-0.25168207465961862)) <= 1e-9 * max(1,abs(-0.25168207465961862)) if id==9
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert missing(z_kdd) if id==9
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.125)) <= 1e-9 * max(1,abs(-0.125)) if id==9
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.178511301977579)) <= 1e-9 * max(1,abs(-1.178511301977579)) if id==9
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_heat) if id==9
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(mean) & abs(mean - (12.4)) <= 1e-9 * max(1,abs(12.4)) if id==10
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(var) & abs(var - (338.80000000000001)) <= 1e-9 * max(1,abs(338.80000000000001)) if id==10
assert !missing(sd) & abs(sd - (18.406520583749661)) <= 1e-9 * max(1,abs(18.406520583749661)) if id==10
assert !missing(skew) & abs(skew - (-0.011930477693258959)) <= 1e-9 * max(1,abs(-0.011930477693258959)) if id==10
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==10
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==10
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dev_gdd) & abs(dev_gdd - (-15)) <= 1e-9 * max(1,abs(-15)) if id==10
assert !missing(z_gdd) & abs(z_gdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_kdd) & abs(dev_kdd - (-12)) <= 1e-9 * max(1,abs(-12)) if id==10
assert !missing(z_kdd) & abs(z_kdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==10
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.22499999999999998)) <= 1e-9 * max(1,abs(-0.22499999999999998)) if id==10
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.2727922061357853)) <= 1e-9 * max(1,abs(-1.2727922061357853)) if id==10
assert !missing(dev_heat) & abs(dev_heat - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(mean) & abs(mean - (12)) <= 1e-9 * max(1,abs(12)) if id==11
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==11
assert !missing(var) & abs(var - (220)) <= 1e-9 * max(1,abs(220)) if id==11
assert !missing(sd) & abs(sd - (14.832396974191326)) <= 1e-9 * max(1,abs(14.832396974191326)) if id==11
assert !missing(skew) & abs(skew - (-0.5516180692881073)) <= 1e-9 * max(1,abs(-0.5516180692881073)) if id==11
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==11
assert !missing(gdd) & abs(gdd - (30)) <= 1e-9 * max(1,abs(30)) if id==11
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==11
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd) & abs(dev_gdd - (-14.5)) <= 1e-9 * max(1,abs(-14.5)) if id==11
assert !missing(z_gdd) & abs(z_gdd - (-2.0506096654409878)) <= 1e-9 * max(1,abs(-2.0506096654409878)) if id==11
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_kdd) if id==11
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_heatdays) if id==11
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==11
assert missing(z_pct_heatdays) if id==11
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(mean) & abs(mean - (27.875)) <= 1e-9 * max(1,abs(27.875)) if id==12
assert !missing(median) & abs(median - (30.75)) <= 1e-9 * max(1,abs(30.75)) if id==12
assert !missing(var) & abs(var - (162.0625)) <= 1e-9 * max(1,abs(162.0625)) if id==12
assert !missing(sd) & abs(sd - (12.730377056474016)) <= 1e-9 * max(1,abs(12.730377056474016)) if id==12
assert !missing(skew) & abs(skew - (-1.245460913820547)) <= 1e-9 * max(1,abs(-1.245460913820547)) if id==12
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd) & abs(gdd - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==12
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_gdd) & abs(dev_gdd - (19.5)) <= 1e-9 * max(1,abs(19.5)) if id==12
assert !missing(z_gdd) & abs(z_gdd - (1.3788582233137676)) <= 1e-9 * max(1,abs(1.3788582233137676)) if id==12
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert missing(z_kdd) if id==12
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.125)) <= 1e-9 * max(1,abs(0.125)) if id==12
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
