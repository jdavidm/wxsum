version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261016/revised/oracle_temp.csv", clear varnames(1) asdouble
gen long s=.
gen long e=.
replace s=16071 in 1
replace e=16082 in 1
replace s=16434 in 2
replace e=16497 in 2
replace s=16130 in 3
replace e=16132 in 3
replace s=15706 in 4
replace e=16082 in 4
replace s=14607 in 5
replace e=14621 in 5
replace s=16799 in 6
replace e=16804 in 6
replace s=16071 in 8
replace e=16082 in 8
replace s=16434 in 9
replace e=16497 in 9
replace s=16130 in 10
replace e=16132 in 10
replace s=15706 in 11
replace e=16082 in 11
replace s=14607 in 12
replace e=14621 in 12
format s e %td
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) start(s) end(e) keep(id s e) minobs(2) ref_min(2) baseline(2000 2002) cuts(10 30 32)
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==1
assert !missing(mean) & abs(mean - (19.222222222222221)) <= 1e-9 * max(1,abs(19.222222222222221)) if id==1
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1
assert !missing(var) & abs(var - (245.38194444444446)) <= 1e-9 * max(1,abs(245.38194444444446)) if id==1
assert !missing(sd) & abs(sd - (15.664671858817997)) <= 1e-9 * max(1,abs(15.664671858817997)) if id==1
assert !missing(skew) & abs(skew - (-1.0555000375781902)) <= 1e-9 * max(1,abs(-1.0555000375781902)) if id==1
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==1
assert !missing(gdd) & abs(gdd - (109)) <= 1e-9 * max(1,abs(109)) if id==1
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==1
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_gdd) & abs(dev_gdd - (-39.5)) <= 1e-9 * max(1,abs(-39.5)) if id==1
assert !missing(z_gdd) & abs(z_gdd - (-1.3965358928434313)) <= 1e-9 * max(1,abs(-1.3965358928434313)) if id==1
assert !missing(dev_kdd) & abs(dev_kdd - (-16)) <= 1e-9 * max(1,abs(-16)) if id==1
assert missing(z_kdd) if id==1
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1
assert !missing(z_heatdays) & abs(z_heatdays - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==1
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.024999999999999967)) <= 1e-9 * max(1,abs(0.024999999999999967)) if id==1
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.16317848796612613)) <= 1e-9 * max(1,abs(0.16317848796612613)) if id==1
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_start) if id==1
assert !missing(dev_heat) & abs(dev_heat - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==1
assert !missing(z_heat) & abs(z_heat - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==1
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_end) if id==1
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew) if id==2
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd) & abs(gdd - (360)) <= 1e-9 * max(1,abs(360)) if id==2
assert !missing(kdd) & abs(kdd - (54)) <= 1e-9 * max(1,abs(54)) if id==2
assert !missing(heatdays) & abs(heatdays - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start) & abs(heat_start - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat) & abs(heat - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end) & abs(heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04) & abs(cut04 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
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
assert missing(cut01) if id==3
assert missing(cut02) if id==3
assert missing(cut03) if id==3
assert missing(cut04) if id==3
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
assert !missing(nobs) & abs(nobs - (25)) <= 1e-9 * max(1,abs(25)) if id==4
assert !missing(mean) & abs(mean - (22.16)) <= 1e-9 * max(1,abs(22.16)) if id==4
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==4
assert !missing(var) & abs(var - (253.18166666666667)) <= 1e-9 * max(1,abs(253.18166666666667)) if id==4
assert !missing(sd) & abs(sd - (15.911683338561847)) <= 1e-9 * max(1,abs(15.911683338561847)) if id==4
assert !missing(skew) & abs(skew - (-0.84331642951358898)) <= 1e-9 * max(1,abs(-0.84331642951358898)) if id==4
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd) & abs(gdd - (328)) <= 1e-9 * max(1,abs(328)) if id==4
assert !missing(kdd) & abs(kdd - (32)) <= 1e-9 * max(1,abs(32)) if id==4
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==4
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.47999999999999998)) <= 1e-9 * max(1,abs(0.47999999999999998)) if id==4
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(cut02) & abs(cut02 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(cut03) & abs(cut03 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(dev_gdd) & abs(dev_gdd - (48.833333333333314)) <= 1e-9 * max(1,abs(48.833333333333314)) if id==4
assert !missing(z_gdd) & abs(z_gdd - (1.8522428730142857)) <= 1e-9 * max(1,abs(1.8522428730142857)) if id==4
assert !missing(dev_kdd) & abs(dev_kdd - (-2.6666666666666643)) <= 1e-9 * max(1,abs(-2.6666666666666643)) if id==4
assert !missing(z_kdd) & abs(z_kdd - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==4
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(z_heatdays) & abs(z_heatdays - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==4
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.0075776397515527893)) <= 1e-9 * max(1,abs(-0.0075776397515527893)) if id==4
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.083544008802543854)) <= 1e-9 * max(1,abs(-0.083544008802543854)) if id==4
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==4
assert !missing(z_heat_start) & abs(z_heat_start - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==4
assert !missing(dev_heat) & abs(dev_heat - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4
assert !missing(z_heat) & abs(z_heat - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(dev_heat_end) & abs(dev_heat_end - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==4
assert !missing(z_heat_end) & abs(z_heat_end - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==4
assert missing(nobs) if id==5
assert missing(mean) if id==5
assert missing(median) if id==5
assert missing(var) if id==5
assert missing(sd) if id==5
assert missing(skew) if id==5
assert missing(max) if id==5
assert missing(gdd) if id==5
assert missing(kdd) if id==5
assert missing(heatdays) if id==5
assert missing(pct_heatdays) if id==5
assert missing(heat_start) if id==5
assert missing(heat) if id==5
assert missing(heat_end) if id==5
assert missing(cut01) if id==5
assert missing(cut02) if id==5
assert missing(cut03) if id==5
assert missing(cut04) if id==5
assert missing(dev_gdd) if id==5
assert missing(z_gdd) if id==5
assert missing(dev_kdd) if id==5
assert missing(z_kdd) if id==5
assert missing(dev_heatdays) if id==5
assert missing(z_heatdays) if id==5
assert missing(dev_pct_heatdays) if id==5
assert missing(z_pct_heatdays) if id==5
assert missing(dev_heat_start) if id==5
assert missing(z_heat_start) if id==5
assert missing(dev_heat) if id==5
assert missing(z_heat) if id==5
assert missing(dev_heat_end) if id==5
assert missing(z_heat_end) if id==5
assert missing(nobs) if id==6
assert missing(mean) if id==6
assert missing(median) if id==6
assert missing(var) if id==6
assert missing(sd) if id==6
assert missing(skew) if id==6
assert missing(max) if id==6
assert missing(gdd) if id==6
assert missing(kdd) if id==6
assert missing(heatdays) if id==6
assert missing(pct_heatdays) if id==6
assert missing(heat_start) if id==6
assert missing(heat) if id==6
assert missing(heat_end) if id==6
assert missing(cut01) if id==6
assert missing(cut02) if id==6
assert missing(cut03) if id==6
assert missing(cut04) if id==6
assert missing(dev_gdd) if id==6
assert missing(z_gdd) if id==6
assert missing(dev_kdd) if id==6
assert missing(z_kdd) if id==6
assert missing(dev_heatdays) if id==6
assert missing(z_heatdays) if id==6
assert missing(dev_pct_heatdays) if id==6
assert missing(z_pct_heatdays) if id==6
assert missing(dev_heat_start) if id==6
assert missing(z_heat_start) if id==6
assert missing(dev_heat) if id==6
assert missing(z_heat) if id==6
assert missing(dev_heat_end) if id==6
assert missing(z_heat_end) if id==6
assert missing(nobs) if id==7
assert missing(mean) if id==7
assert missing(median) if id==7
assert missing(var) if id==7
assert missing(sd) if id==7
assert missing(skew) if id==7
assert missing(max) if id==7
assert missing(gdd) if id==7
assert missing(kdd) if id==7
assert missing(heatdays) if id==7
assert missing(pct_heatdays) if id==7
assert missing(heat_start) if id==7
assert missing(heat) if id==7
assert missing(heat_end) if id==7
assert missing(cut01) if id==7
assert missing(cut02) if id==7
assert missing(cut03) if id==7
assert missing(cut04) if id==7
assert missing(dev_gdd) if id==7
assert missing(z_gdd) if id==7
assert missing(dev_kdd) if id==7
assert missing(z_kdd) if id==7
assert missing(dev_heatdays) if id==7
assert missing(z_heatdays) if id==7
assert missing(dev_pct_heatdays) if id==7
assert missing(z_pct_heatdays) if id==7
assert missing(dev_heat_start) if id==7
assert missing(z_heat_start) if id==7
assert missing(dev_heat) if id==7
assert missing(z_heat) if id==7
assert missing(dev_heat_end) if id==7
assert missing(z_heat_end) if id==7
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean) & abs(mean - (20.550000000000001)) <= 1e-9 * max(1,abs(20.550000000000001)) if id==8
assert !missing(median) & abs(median - (30.75)) <= 1e-9 * max(1,abs(30.75)) if id==8
assert !missing(var) & abs(var - (368.80277777777781)) <= 1e-9 * max(1,abs(368.80277777777781)) if id==8
assert !missing(sd) & abs(sd - (19.204238536786033)) <= 1e-9 * max(1,abs(19.204238536786033)) if id==8
assert !missing(skew) & abs(skew - (-0.77335733493123016)) <= 1e-9 * max(1,abs(-0.77335733493123016)) if id==8
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==8
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(dev_gdd) & abs(dev_gdd - (22.833333333333329)) <= 1e-9 * max(1,abs(22.833333333333329)) if id==8
assert !missing(z_gdd) & abs(z_gdd - (1.4947925481165476)) <= 1e-9 * max(1,abs(1.4947925481165476)) if id==8
assert !missing(dev_kdd) & abs(dev_kdd - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==8
assert !missing(z_kdd) & abs(z_kdd - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==8
assert !missing(z_heatdays) & abs(z_heatdays - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==8
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.066666666666666652)) <= 1e-9 * max(1,abs(0.066666666666666652)) if id==8
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==8
assert !missing(dev_heat_start) & abs(dev_heat_start - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==8
assert !missing(z_heat_start) & abs(z_heat_start - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==8
assert !missing(dev_heat) & abs(dev_heat - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==8
assert !missing(z_heat) & abs(z_heat - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==8
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==8
assert !missing(z_heat_end) & abs(z_heat_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==8
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean) & abs(mean - (15.433333333333334)) <= 1e-9 * max(1,abs(15.433333333333334)) if id==9
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var) & abs(var - (258.6738095238095)) <= 1e-9 * max(1,abs(258.6738095238095)) if id==9
assert !missing(sd) & abs(sd - (16.083339501602566)) <= 1e-9 * max(1,abs(16.083339501602566)) if id==9
assert !missing(skew) & abs(skew - (-0.06680944234391302)) <= 1e-9 * max(1,abs(-0.06680944234391302)) if id==9
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut02) & abs(cut02 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_gdd) & abs(dev_gdd - (-46.166666666666657)) <= 1e-9 * max(1,abs(-46.166666666666657)) if id==9
assert !missing(z_gdd) & abs(z_gdd - (-1.8344773145350852)) <= 1e-9 * max(1,abs(-1.8344773145350852)) if id==9
assert !missing(dev_kdd) & abs(dev_kdd - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==9
assert !missing(z_kdd) & abs(z_kdd - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==9
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==9
assert !missing(z_heatdays) & abs(z_heatdays - (-1.5275252316519463)) <= 1e-9 * max(1,abs(-1.5275252316519463)) if id==9
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.15555555555555556)) <= 1e-9 * max(1,abs(-0.15555555555555556)) if id==9
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.5275252316519465)) <= 1e-9 * max(1,abs(-1.5275252316519465)) if id==9
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert missing(z_heat_start) if id==9
assert !missing(dev_heat) & abs(dev_heat - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==9
assert !missing(z_heat) & abs(z_heat - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==9
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==9
assert !missing(z_heat_end) & abs(z_heat_end - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==9
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(mean) & abs(mean - (26.666666666666668)) <= 1e-9 * max(1,abs(26.666666666666668)) if id==10
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(var) & abs(var - (133.33333333333334)) <= 1e-9 * max(1,abs(133.33333333333334)) if id==10
assert !missing(sd) & abs(sd - (11.547005383792516)) <= 1e-9 * max(1,abs(11.547005383792516)) if id==10
assert !missing(skew) & abs(skew - (1.7320508075688754)) <= 1e-9 * max(1,abs(1.7320508075688754)) if id==10
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd) & abs(gdd - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_gdd) & abs(dev_gdd - (16.833333333333332)) <= 1e-9 * max(1,abs(16.833333333333332)) if id==10
assert !missing(z_gdd) & abs(z_gdd - (0.67599750674607473)) <= 1e-9 * max(1,abs(0.67599750674607473)) if id==10
assert !missing(dev_kdd) & abs(dev_kdd - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==10
assert !missing(z_kdd) & abs(z_kdd - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10
assert !missing(z_heatdays) & abs(z_heatdays - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.1111111111111111)) <= 1e-9 * max(1,abs(0.1111111111111111)) if id==10
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.66666666666666663)) <= 1e-9 * max(1,abs(-0.66666666666666663)) if id==10
assert !missing(z_heat_start) & abs(z_heat_start - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==10
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat) if id==10
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert missing(z_heat_end) if id==10
assert !missing(nobs) & abs(nobs - (21)) <= 1e-9 * max(1,abs(21)) if id==11
assert !missing(mean) & abs(mean - (19.11904761904762)) <= 1e-9 * max(1,abs(19.11904761904762)) if id==11
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==11
assert !missing(var) & abs(var - (310.89761904761906)) <= 1e-9 * max(1,abs(310.89761904761906)) if id==11
assert !missing(sd) & abs(sd - (17.6322891040165)) <= 1e-9 * max(1,abs(17.6322891040165)) if id==11
assert !missing(skew) & abs(skew - (-0.69526700099483862)) <= 1e-9 * max(1,abs(-0.69526700099483862)) if id==11
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(gdd) & abs(gdd - (249.5)) <= 1e-9 * max(1,abs(249.5)) if id==11
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==11
assert !missing(heatdays) & abs(heatdays - (10)) <= 1e-9 * max(1,abs(10)) if id==11
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.47619047619047616)) <= 1e-9 * max(1,abs(0.47619047619047616)) if id==11
assert !missing(heat_start) & abs(heat_start - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut02) & abs(cut02 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut03) & abs(cut03 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(dev_gdd) & abs(dev_gdd - (-58.166666666666686)) <= 1e-9 * max(1,abs(-58.166666666666686)) if id==11
assert !missing(z_gdd) & abs(z_gdd - (-1.3393489387052553)) <= 1e-9 * max(1,abs(-1.3393489387052553)) if id==11
assert !missing(dev_kdd) & abs(dev_kdd - (13.333333333333334)) <= 1e-9 * max(1,abs(13.333333333333334)) if id==11
assert !missing(z_kdd) & abs(z_kdd - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==11
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.33333333333333393)) <= 1e-9 * max(1,abs(0.33333333333333393)) if id==11
assert !missing(z_heatdays) & abs(z_heatdays - (0.11547005383792537)) <= 1e-9 * max(1,abs(0.11547005383792537)) if id==11
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.072781669272897309)) <= 1e-9 * max(1,abs(0.072781669272897309)) if id==11
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.82492882606718243)) <= 1e-9 * max(1,abs(0.82492882606718243)) if id==11
assert !missing(dev_heat_start) & abs(dev_heat_start - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==11
assert !missing(z_heat_start) & abs(z_heat_start - (4.6188021535170058)) <= 1e-9 * max(1,abs(4.6188021535170058)) if id==11
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_heat) if id==11
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.33333333333333331)) <= 1e-9 * max(1,abs(-0.33333333333333331)) if id==11
assert !missing(z_heat_end) & abs(z_heat_end - (-0.57735026918962573)) <= 1e-9 * max(1,abs(-0.57735026918962573)) if id==11
assert missing(nobs) if id==12
assert missing(mean) if id==12
assert missing(median) if id==12
assert missing(var) if id==12
assert missing(sd) if id==12
assert missing(skew) if id==12
assert missing(max) if id==12
assert missing(gdd) if id==12
assert missing(kdd) if id==12
assert missing(heatdays) if id==12
assert missing(pct_heatdays) if id==12
assert missing(heat_start) if id==12
assert missing(heat) if id==12
assert missing(heat_end) if id==12
assert missing(cut01) if id==12
assert missing(cut02) if id==12
assert missing(cut03) if id==12
assert missing(cut04) if id==12
assert missing(dev_gdd) if id==12
assert missing(z_gdd) if id==12
assert missing(dev_kdd) if id==12
assert missing(z_kdd) if id==12
assert missing(dev_heatdays) if id==12
assert missing(z_heatdays) if id==12
assert missing(dev_pct_heatdays) if id==12
assert missing(z_pct_heatdays) if id==12
assert missing(dev_heat_start) if id==12
assert missing(z_heat_start) if id==12
assert missing(dev_heat) if id==12
assert missing(z_heat) if id==12
assert missing(dev_heat_end) if id==12
assert missing(z_heat_end) if id==12
