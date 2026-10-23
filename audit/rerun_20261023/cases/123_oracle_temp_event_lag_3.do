version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/oracle_temp.csv", clear varnames(1) asdouble
gen long event=16080
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) event_date(event) days(5) lag(3) keep(id event) lr_years(2)
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(mean) & abs(mean - (9.875)) <= 1e-9 * max(1,abs(9.875)) if id==1
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(var) & abs(var - (326.72916666666669)) <= 1e-9 * max(1,abs(326.72916666666669)) if id==1
assert !missing(sd) & abs(sd - (18.075651210030212)) <= 1e-9 * max(1,abs(18.075651210030212)) if id==1
assert !missing(skew) & abs(skew - (-0.024557250055451747)) <= 1e-9 * max(1,abs(-0.024557250055451747)) if id==1
assert !missing(max) & abs(max - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1
assert !missing(gdd) & abs(gdd - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays) & abs(heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(pct_heatdays) & abs(pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_gdd) & abs(dev_gdd - (-25.25)) <= 1e-9 * max(1,abs(-25.25)) if id==1
assert !missing(z_gdd) & abs(z_gdd - (-3.4008468999924433)) <= 1e-9 * max(1,abs(-3.4008468999924433)) if id==1
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==1
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==1
assert !missing(z_heatdays) & abs(z_heatdays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==1
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.375)) <= 1e-9 * max(1,abs(-0.375)) if id==1
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==1
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1
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
assert !missing(mean) & abs(mean - (18.300000000000001)) <= 1e-9 * max(1,abs(18.300000000000001)) if id==4
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==4
assert !missing(var) & abs(var - (479.94999999999999)) <= 1e-9 * max(1,abs(479.94999999999999)) if id==4
assert !missing(sd) & abs(sd - (21.907761181827777)) <= 1e-9 * max(1,abs(21.907761181827777)) if id==4
assert !missing(skew) & abs(skew - (-0.5785224978931941)) <= 1e-9 * max(1,abs(-0.5785224978931941)) if id==4
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd) & abs(gdd - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==4
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==4
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_gdd) & abs(dev_gdd - (34.5)) <= 1e-9 * max(1,abs(34.5)) if id==4
assert !missing(z_gdd) & abs(z_gdd - (1.6263455967290592)) <= 1e-9 * max(1,abs(1.6263455967290592)) if id==4
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==4
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.70710678118654757)) <= 1e-9 * max(1,abs(0.70710678118654757)) if id==4
assert !missing(dev_heat) & abs(dev_heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert missing(z_heat) if id==4
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(mean) & abs(mean - (24.399999999999999)) <= 1e-9 * max(1,abs(24.399999999999999)) if id==5
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==5
assert !missing(var) & abs(var - (236.80000000000001)) <= 1e-9 * max(1,abs(236.80000000000001)) if id==5
assert !missing(sd) & abs(sd - (15.388307249337076)) <= 1e-9 * max(1,abs(15.388307249337076)) if id==5
assert !missing(skew) & abs(skew - (-1.1664261723847222)) <= 1e-9 * max(1,abs(-1.1664261723847222)) if id==5
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd) & abs(gdd - (70)) <= 1e-9 * max(1,abs(70)) if id==5
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==5
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_gdd) & abs(dev_gdd - (5.25)) <= 1e-9 * max(1,abs(5.25)) if id==5
assert !missing(z_gdd) & abs(z_gdd - (0.14702220202888613)) <= 1e-9 * max(1,abs(0.14702220202888613)) if id==5
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert missing(z_kdd) if id==5
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(z_heatdays) & abs(z_heatdays - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==5
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.19999999999999996)) <= 1e-9 * max(1,abs(0.19999999999999996)) if id==5
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.35355339059327368)) <= 1e-9 * max(1,abs(0.35355339059327368)) if id==5
assert !missing(dev_heat) & abs(dev_heat - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(z_heat) & abs(z_heat - (0.35355339059327373)) <= 1e-9 * max(1,abs(0.35355339059327373)) if id==5
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(mean) & abs(mean - (12)) <= 1e-9 * max(1,abs(12)) if id==6
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==6
assert !missing(var) & abs(var - (270)) <= 1e-9 * max(1,abs(270)) if id==6
assert !missing(sd) & abs(sd - (16.431676725154983)) <= 1e-9 * max(1,abs(16.431676725154983)) if id==6
assert !missing(skew) & abs(skew - (-0.51842052767978652)) <= 1e-9 * max(1,abs(-0.51842052767978652)) if id==6
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==6
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==6
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dev_gdd) & abs(dev_gdd - (-14.75)) <= 1e-9 * max(1,abs(-14.75)) if id==6
assert !missing(z_gdd) & abs(z_gdd - (-1.9866333376193479)) <= 1e-9 * max(1,abs(-1.9866333376193479)) if id==6
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==6
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==6
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==6
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(mean) & abs(mean - (21.899999999999999)) <= 1e-9 * max(1,abs(21.899999999999999)) if id==7
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==7
assert !missing(var) & abs(var - (318.05000000000001)) <= 1e-9 * max(1,abs(318.05000000000001)) if id==7
assert !missing(sd) & abs(sd - (17.833956375409244)) <= 1e-9 * max(1,abs(17.833956375409244)) if id==7
assert !missing(skew) & abs(skew - (-2.235247570247247)) <= 1e-9 * max(1,abs(-2.235247570247247)) if id==7
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==7
assert !missing(gdd) & abs(gdd - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==7
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==7
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(dev_gdd) & abs(dev_gdd - (34.75)) <= 1e-9 * max(1,abs(34.75)) if id==7
assert !missing(z_gdd) & abs(z_gdd - (5.1730443465752689)) <= 1e-9 * max(1,abs(5.1730443465752689)) if id==7
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==7
assert missing(z_kdd) if id==7
assert !missing(dev_heatdays) & abs(dev_heatdays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==7
assert !missing(z_heatdays) & abs(z_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==7
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==7
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.1785113019775793)) <= 1e-9 * max(1,abs(1.1785113019775793)) if id==7
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert missing(z_heat) if id==7
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(mean) & abs(mean - (25.899999999999999)) <= 1e-9 * max(1,abs(25.899999999999999)) if id==8
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==8
assert !missing(var) & abs(var - (229.05000000000001)) <= 1e-9 * max(1,abs(229.05000000000001)) if id==8
assert !missing(sd) & abs(sd - (15.134397906755327)) <= 1e-9 * max(1,abs(15.134397906755327)) if id==8
assert !missing(skew) & abs(skew - (-0.28682108576919413)) <= 1e-9 * max(1,abs(-0.28682108576919413)) if id==8
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd) & abs(gdd - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==8
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_gdd) & abs(dev_gdd - (34.5)) <= 1e-9 * max(1,abs(34.5)) if id==8
assert !missing(z_gdd) & abs(z_gdd - (4.8790367901871781)) <= 1e-9 * max(1,abs(4.8790367901871781)) if id==8
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==8
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert missing(z_heatdays) if id==8
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.13333333333333336)) <= 1e-9 * max(1,abs(0.13333333333333336)) if id==8
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.4142135623730956)) <= 1e-9 * max(1,abs(1.4142135623730956)) if id==8
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heat) if id==8
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(mean) & abs(mean - (13.166666666666666)) <= 1e-9 * max(1,abs(13.166666666666666)) if id==9
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var) & abs(var - (425.08333333333331)) <= 1e-9 * max(1,abs(425.08333333333331)) if id==9
assert !missing(sd) & abs(sd - (20.61754915923164)) <= 1e-9 * max(1,abs(20.61754915923164)) if id==9
assert !missing(skew) & abs(skew - (-1.3276156983409753)) <= 1e-9 * max(1,abs(-1.3276156983409753)) if id==9
assert !missing(max) & abs(max - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==9
assert !missing(gdd) & abs(gdd - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==9
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heatdays) & abs(heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(pct_heatdays) & abs(pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dev_gdd) & abs(dev_gdd - (-25)) <= 1e-9 * max(1,abs(-25)) if id==9
assert !missing(z_gdd) & abs(z_gdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_kdd) if id==9
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==9
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.29999999999999999)) <= 1e-9 * max(1,abs(-0.29999999999999999)) if id==9
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(nobs) & abs(nobs - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(mean) & abs(mean - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(var) & abs(var - (100)) <= 1e-9 * max(1,abs(100)) if id==10
assert !missing(sd) & abs(sd - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(skew) & abs(skew - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==10
assert !missing(gdd) & abs(gdd - (50)) <= 1e-9 * max(1,abs(50)) if id==10
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==10
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_gdd) & abs(dev_gdd - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(z_gdd) & abs(z_gdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==10
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heatdays) if id==10
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==10
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(mean) & abs(mean - (12.5)) <= 1e-9 * max(1,abs(12.5)) if id==11
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(var) & abs(var - (91.666666666666671)) <= 1e-9 * max(1,abs(91.666666666666671)) if id==11
assert !missing(sd) & abs(sd - (9.574271077563381)) <= 1e-9 * max(1,abs(9.574271077563381)) if id==11
assert !missing(skew) & abs(skew - (-0.85456303832797076)) <= 1e-9 * max(1,abs(-0.85456303832797076)) if id==11
assert !missing(max) & abs(max - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(gdd) & abs(gdd - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays) & abs(heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(pct_heatdays) & abs(pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_gdd) & abs(dev_gdd - (-29.75)) <= 1e-9 * max(1,abs(-29.75)) if id==11
assert !missing(z_gdd) & abs(z_gdd - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11
assert !missing(z_heatdays) & abs(z_heatdays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==11
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.54166666666666663)) <= 1e-9 * max(1,abs(-0.54166666666666663)) if id==11
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.8384776310850233)) <= 1e-9 * max(1,abs(-1.8384776310850233)) if id==11
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(nobs) & abs(nobs - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(mean) & abs(mean - (33)) <= 1e-9 * max(1,abs(33)) if id==12
assert !missing(median) & abs(median - (36)) <= 1e-9 * max(1,abs(36)) if id==12
assert !missing(var) & abs(var - (89.333333333333329)) <= 1e-9 * max(1,abs(89.333333333333329)) if id==12
assert !missing(sd) & abs(sd - (9.4516312525052157)) <= 1e-9 * max(1,abs(9.4516312525052157)) if id==12
assert !missing(skew) & abs(skew - (-1.1938237737069408)) <= 1e-9 * max(1,abs(-1.1938237737069408)) if id==12
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd) & abs(gdd - (70)) <= 1e-9 * max(1,abs(70)) if id==12
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==12
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(heat_end) & abs(heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_gdd) & abs(dev_gdd - (35.25)) <= 1e-9 * max(1,abs(35.25)) if id==12
assert !missing(z_gdd) & abs(z_gdd - (1.007091476235386)) <= 1e-9 * max(1,abs(1.007091476235386)) if id==12
assert !missing(dev_kdd) & abs(dev_kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert missing(z_kdd) if id==12
assert !missing(dev_heatdays) & abs(dev_heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(z_heatdays) & abs(z_heatdays - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==12
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==12
assert !missing(dev_heat) & abs(dev_heat - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert missing(z_heat) if id==12
