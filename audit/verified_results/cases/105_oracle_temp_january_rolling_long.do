version 15.1
set type double
import delimited using "C:/Users/annal/Documents/Codex/2026-10-15/rea/outputs/wxsum_audit/verified_results/oracle_temp.csv", clear varnames(1) asdouble
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) ini_month(1) ini_day(1) fin_month(1) fin_day(12) lr_years(2) ref_min(2) minobs(2) shape(long) keep(id) cuts(10 30 32)
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==1 & year==2000
assert !missing(mean) & abs(mean - (24.208333333333332)) <= 1e-9 * max(1,abs(24.208333333333332)) if id==1 & year==2000
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1 & year==2000
assert !missing(var) & abs(var - (191.11174242424244)) <= 1e-9 * max(1,abs(191.11174242424244)) if id==1 & year==2000
assert !missing(sd) & abs(sd - (13.824317068999916)) <= 1e-9 * max(1,abs(13.824317068999916)) if id==1 & year==2000
assert !missing(skew) & abs(skew - (-0.91397561861594034)) <= 1e-9 * max(1,abs(-0.91397561861594034)) if id==1 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==1 & year==2000
assert !missing(gdd) & abs(gdd - (168.5)) <= 1e-9 * max(1,abs(168.5)) if id==1 & year==2000
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==1 & year==2000
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==1 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2000
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2000
assert missing(dev_gdd) if id==1 & year==2000
assert missing(z_gdd) if id==1 & year==2000
assert missing(dev_kdd) if id==1 & year==2000
assert missing(z_kdd) if id==1 & year==2000
assert missing(dev_heatdays) if id==1 & year==2000
assert missing(z_heatdays) if id==1 & year==2000
assert missing(dev_pct_heatdays) if id==1 & year==2000
assert missing(z_pct_heatdays) if id==1 & year==2000
assert missing(dev_heat_start) if id==1 & year==2000
assert missing(z_heat_start) if id==1 & year==2000
assert missing(dev_heat) if id==1 & year==2000
assert missing(z_heat) if id==1 & year==2000
assert missing(dev_heat_end) if id==1 & year==2000
assert missing(z_heat_end) if id==1 & year==2000
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2001
assert missing(mean) if id==1 & year==2001
assert missing(median) if id==1 & year==2001
assert missing(var) if id==1 & year==2001
assert missing(sd) if id==1 & year==2001
assert missing(skew) if id==1 & year==2001
assert missing(max) if id==1 & year==2001
assert missing(gdd) if id==1 & year==2001
assert missing(kdd) if id==1 & year==2001
assert missing(heatdays) if id==1 & year==2001
assert missing(pct_heatdays) if id==1 & year==2001
assert missing(heat_start) if id==1 & year==2001
assert missing(heat) if id==1 & year==2001
assert missing(heat_end) if id==1 & year==2001
assert missing(cut01) if id==1 & year==2001
assert missing(cut02) if id==1 & year==2001
assert missing(cut03) if id==1 & year==2001
assert missing(cut04) if id==1 & year==2001
assert missing(dev_gdd) if id==1 & year==2001
assert missing(z_gdd) if id==1 & year==2001
assert missing(dev_kdd) if id==1 & year==2001
assert missing(z_kdd) if id==1 & year==2001
assert missing(dev_heatdays) if id==1 & year==2001
assert missing(z_heatdays) if id==1 & year==2001
assert missing(dev_pct_heatdays) if id==1 & year==2001
assert missing(z_pct_heatdays) if id==1 & year==2001
assert missing(dev_heat_start) if id==1 & year==2001
assert missing(z_heat_start) if id==1 & year==2001
assert missing(dev_heat) if id==1 & year==2001
assert missing(z_heat) if id==1 & year==2001
assert missing(dev_heat_end) if id==1 & year==2001
assert missing(z_heat_end) if id==1 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2002
assert !missing(mean) & abs(mean - (23.850000000000001)) <= 1e-9 * max(1,abs(23.850000000000001)) if id==1 & year==2002
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==1 & year==2002
assert !missing(var) & abs(var - (158.05833333333334)) <= 1e-9 * max(1,abs(158.05833333333334)) if id==1 & year==2002
assert !missing(sd) & abs(sd - (12.572125251258569)) <= 1e-9 * max(1,abs(12.572125251258569)) if id==1 & year==2002
assert !missing(skew) & abs(skew - (-0.51922371338299211)) <= 1e-9 * max(1,abs(-0.51922371338299211)) if id==1 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==1 & year==2002
assert !missing(gdd) & abs(gdd - (128.5)) <= 1e-9 * max(1,abs(128.5)) if id==1 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==1 & year==2002
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==1 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(cut02) & abs(cut02 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert missing(dev_gdd) if id==1 & year==2002
assert missing(z_gdd) if id==1 & year==2002
assert missing(dev_kdd) if id==1 & year==2002
assert missing(z_kdd) if id==1 & year==2002
assert missing(dev_heatdays) if id==1 & year==2002
assert missing(z_heatdays) if id==1 & year==2002
assert missing(dev_pct_heatdays) if id==1 & year==2002
assert missing(z_pct_heatdays) if id==1 & year==2002
assert missing(dev_heat_start) if id==1 & year==2002
assert missing(z_heat_start) if id==1 & year==2002
assert missing(dev_heat) if id==1 & year==2002
assert missing(z_heat) if id==1 & year==2002
assert missing(dev_heat_end) if id==1 & year==2002
assert missing(z_heat_end) if id==1 & year==2002
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==1 & year==2003
assert !missing(mean) & abs(mean - (18.75)) <= 1e-9 * max(1,abs(18.75)) if id==1 & year==2003
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==1 & year==2003
assert !missing(var) & abs(var - (98.214285714285708)) <= 1e-9 * max(1,abs(98.214285714285708)) if id==1 & year==2003
assert !missing(sd) & abs(sd - (9.9103120896511481)) <= 1e-9 * max(1,abs(9.9103120896511481)) if id==1 & year==2003
assert !missing(skew) & abs(skew - (-0.86227905520534942)) <= 1e-9 * max(1,abs(-0.86227905520534942)) if id==1 & year==2003
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==1 & year==2003
assert !missing(gdd) & abs(gdd - (80)) <= 1e-9 * max(1,abs(80)) if id==1 & year==2003
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==1 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2003
assert missing(dev_gdd) if id==1 & year==2003
assert missing(z_gdd) if id==1 & year==2003
assert missing(dev_kdd) if id==1 & year==2003
assert missing(z_kdd) if id==1 & year==2003
assert missing(dev_heatdays) if id==1 & year==2003
assert missing(z_heatdays) if id==1 & year==2003
assert missing(dev_pct_heatdays) if id==1 & year==2003
assert missing(z_pct_heatdays) if id==1 & year==2003
assert missing(dev_heat_start) if id==1 & year==2003
assert missing(z_heat_start) if id==1 & year==2003
assert missing(dev_heat) if id==1 & year==2003
assert missing(z_heat) if id==1 & year==2003
assert missing(dev_heat_end) if id==1 & year==2003
assert missing(z_heat_end) if id==1 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==1 & year==2004
assert !missing(mean) & abs(mean - (19.222222222222221)) <= 1e-9 * max(1,abs(19.222222222222221)) if id==1 & year==2004
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1 & year==2004
assert !missing(var) & abs(var - (245.38194444444446)) <= 1e-9 * max(1,abs(245.38194444444446)) if id==1 & year==2004
assert !missing(sd) & abs(sd - (15.664671858817997)) <= 1e-9 * max(1,abs(15.664671858817997)) if id==1 & year==2004
assert !missing(skew) & abs(skew - (-1.0555000375781902)) <= 1e-9 * max(1,abs(-1.0555000375781902)) if id==1 & year==2004
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==1 & year==2004
assert !missing(gdd) & abs(gdd - (109)) <= 1e-9 * max(1,abs(109)) if id==1 & year==2004
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==1 & year==2004
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==1 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (4.75)) <= 1e-9 * max(1,abs(4.75)) if id==1 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (0.13850545198499384)) <= 1e-9 * max(1,abs(0.13850545198499384)) if id==1 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==1 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert missing(z_heatdays) if id==1 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.10833333333333331)) <= 1e-9 * max(1,abs(0.10833333333333331)) if id==1 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (3.064129385141706)) <= 1e-9 * max(1,abs(3.064129385141706)) if id==1 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert missing(z_heat_start) if id==1 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2004
assert missing(z_heat) if id==1 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert missing(z_heat_end) if id==1 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2005
assert !missing(mean) & abs(mean - (7.2000000000000002)) <= 1e-9 * max(1,abs(7.2000000000000002)) if id==1 & year==2005
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2005
assert !missing(var) & abs(var - (300.62222222222221)) <= 1e-9 * max(1,abs(300.62222222222221)) if id==1 & year==2005
assert !missing(sd) & abs(sd - (17.338460780075671)) <= 1e-9 * max(1,abs(17.338460780075671)) if id==1 & year==2005
assert !missing(skew) & abs(skew - (0.28230515408438117)) <= 1e-9 * max(1,abs(0.28230515408438117)) if id==1 & year==2005
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==1 & year==2005
assert !missing(gdd) & abs(gdd - (60)) <= 1e-9 * max(1,abs(60)) if id==1 & year==2005
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==1 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==1 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (-34.5)) <= 1e-9 * max(1,abs(-34.5)) if id==1 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (-1.6824264793748891)) <= 1e-9 * max(1,abs(-1.6824264793748891)) if id==1 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert missing(z_kdd) if id==1 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.091666666666666619)) <= 1e-9 * max(1,abs(-0.091666666666666619)) if id==1 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.5556349186104041)) <= 1e-9 * max(1,abs(-1.5556349186104041)) if id==1 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2005
assert missing(z_heat_start) if id==1 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1 & year==2005
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2005
assert missing(z_heat_end) if id==1 & year==2005
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2000
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2000
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(skew) if id==2 & year==2000
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2000
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2000
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2000
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2000
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2000
assert missing(dev_gdd) if id==2 & year==2000
assert missing(z_gdd) if id==2 & year==2000
assert missing(dev_kdd) if id==2 & year==2000
assert missing(z_kdd) if id==2 & year==2000
assert missing(dev_heatdays) if id==2 & year==2000
assert missing(z_heatdays) if id==2 & year==2000
assert missing(dev_pct_heatdays) if id==2 & year==2000
assert missing(z_pct_heatdays) if id==2 & year==2000
assert missing(dev_heat_start) if id==2 & year==2000
assert missing(z_heat_start) if id==2 & year==2000
assert missing(dev_heat) if id==2 & year==2000
assert missing(z_heat) if id==2 & year==2000
assert missing(dev_heat_end) if id==2 & year==2000
assert missing(z_heat_end) if id==2 & year==2000
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2001
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2001
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(skew) if id==2 & year==2001
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2001
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2001
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2001
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2001
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2001
assert missing(dev_gdd) if id==2 & year==2001
assert missing(z_gdd) if id==2 & year==2001
assert missing(dev_kdd) if id==2 & year==2001
assert missing(z_kdd) if id==2 & year==2001
assert missing(dev_heatdays) if id==2 & year==2001
assert missing(z_heatdays) if id==2 & year==2001
assert missing(dev_pct_heatdays) if id==2 & year==2001
assert missing(z_pct_heatdays) if id==2 & year==2001
assert missing(dev_heat_start) if id==2 & year==2001
assert missing(z_heat_start) if id==2 & year==2001
assert missing(dev_heat) if id==2 & year==2001
assert missing(z_heat) if id==2 & year==2001
assert missing(dev_heat_end) if id==2 & year==2001
assert missing(z_heat_end) if id==2 & year==2001
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2002
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2002
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(skew) if id==2 & year==2002
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2002
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2002
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2002
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2002
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_gdd) if id==2 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_kdd) if id==2 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_heatdays) if id==2 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_pct_heatdays) if id==2 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_heat_start) if id==2 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_heat) if id==2 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_heat_end) if id==2 & year==2002
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2003
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2003
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(skew) if id==2 & year==2003
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2003
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2003
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2003
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_gdd) if id==2 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_kdd) if id==2 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_heatdays) if id==2 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_pct_heatdays) if id==2 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_heat_start) if id==2 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_heat) if id==2 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_heat_end) if id==2 & year==2003
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2004
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2004
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(skew) if id==2 & year==2004
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2004
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2004
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2004
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2004
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_gdd) if id==2 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_kdd) if id==2 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_heatdays) if id==2 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_pct_heatdays) if id==2 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_heat_start) if id==2 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_heat) if id==2 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_heat_end) if id==2 & year==2004
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(mean) & abs(mean - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2005
assert !missing(median) & abs(median - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2005
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(skew) if id==2 & year==2005
assert !missing(max) & abs(max - (35)) <= 1e-9 * max(1,abs(35)) if id==2 & year==2005
assert !missing(gdd) & abs(gdd - (240)) <= 1e-9 * max(1,abs(240)) if id==2 & year==2005
assert !missing(kdd) & abs(kdd - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2005
assert !missing(heatdays) & abs(heatdays - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2005
assert !missing(heat_start) & abs(heat_start - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(heat) & abs(heat - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(heat_end) & abs(heat_end - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert !missing(cut04) & abs(cut04 - (12)) <= 1e-9 * max(1,abs(12)) if id==2 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_gdd) if id==2 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_kdd) if id==2 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_heatdays) if id==2 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_pct_heatdays) if id==2 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_heat_start) if id==2 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_heat) if id==2 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2005
assert missing(z_heat_end) if id==2 & year==2005
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2000
assert missing(mean) if id==3 & year==2000
assert missing(median) if id==3 & year==2000
assert missing(var) if id==3 & year==2000
assert missing(sd) if id==3 & year==2000
assert missing(skew) if id==3 & year==2000
assert missing(max) if id==3 & year==2000
assert missing(gdd) if id==3 & year==2000
assert missing(kdd) if id==3 & year==2000
assert missing(heatdays) if id==3 & year==2000
assert missing(pct_heatdays) if id==3 & year==2000
assert missing(heat_start) if id==3 & year==2000
assert missing(heat) if id==3 & year==2000
assert missing(heat_end) if id==3 & year==2000
assert missing(cut01) if id==3 & year==2000
assert missing(cut02) if id==3 & year==2000
assert missing(cut03) if id==3 & year==2000
assert missing(cut04) if id==3 & year==2000
assert missing(dev_gdd) if id==3 & year==2000
assert missing(z_gdd) if id==3 & year==2000
assert missing(dev_kdd) if id==3 & year==2000
assert missing(z_kdd) if id==3 & year==2000
assert missing(dev_heatdays) if id==3 & year==2000
assert missing(z_heatdays) if id==3 & year==2000
assert missing(dev_pct_heatdays) if id==3 & year==2000
assert missing(z_pct_heatdays) if id==3 & year==2000
assert missing(dev_heat_start) if id==3 & year==2000
assert missing(z_heat_start) if id==3 & year==2000
assert missing(dev_heat) if id==3 & year==2000
assert missing(z_heat) if id==3 & year==2000
assert missing(dev_heat_end) if id==3 & year==2000
assert missing(z_heat_end) if id==3 & year==2000
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2001
assert missing(mean) if id==3 & year==2001
assert missing(median) if id==3 & year==2001
assert missing(var) if id==3 & year==2001
assert missing(sd) if id==3 & year==2001
assert missing(skew) if id==3 & year==2001
assert missing(max) if id==3 & year==2001
assert missing(gdd) if id==3 & year==2001
assert missing(kdd) if id==3 & year==2001
assert missing(heatdays) if id==3 & year==2001
assert missing(pct_heatdays) if id==3 & year==2001
assert missing(heat_start) if id==3 & year==2001
assert missing(heat) if id==3 & year==2001
assert missing(heat_end) if id==3 & year==2001
assert missing(cut01) if id==3 & year==2001
assert missing(cut02) if id==3 & year==2001
assert missing(cut03) if id==3 & year==2001
assert missing(cut04) if id==3 & year==2001
assert missing(dev_gdd) if id==3 & year==2001
assert missing(z_gdd) if id==3 & year==2001
assert missing(dev_kdd) if id==3 & year==2001
assert missing(z_kdd) if id==3 & year==2001
assert missing(dev_heatdays) if id==3 & year==2001
assert missing(z_heatdays) if id==3 & year==2001
assert missing(dev_pct_heatdays) if id==3 & year==2001
assert missing(z_pct_heatdays) if id==3 & year==2001
assert missing(dev_heat_start) if id==3 & year==2001
assert missing(z_heat_start) if id==3 & year==2001
assert missing(dev_heat) if id==3 & year==2001
assert missing(z_heat) if id==3 & year==2001
assert missing(dev_heat_end) if id==3 & year==2001
assert missing(z_heat_end) if id==3 & year==2001
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2002
assert missing(mean) if id==3 & year==2002
assert missing(median) if id==3 & year==2002
assert missing(var) if id==3 & year==2002
assert missing(sd) if id==3 & year==2002
assert missing(skew) if id==3 & year==2002
assert missing(max) if id==3 & year==2002
assert missing(gdd) if id==3 & year==2002
assert missing(kdd) if id==3 & year==2002
assert missing(heatdays) if id==3 & year==2002
assert missing(pct_heatdays) if id==3 & year==2002
assert missing(heat_start) if id==3 & year==2002
assert missing(heat) if id==3 & year==2002
assert missing(heat_end) if id==3 & year==2002
assert missing(cut01) if id==3 & year==2002
assert missing(cut02) if id==3 & year==2002
assert missing(cut03) if id==3 & year==2002
assert missing(cut04) if id==3 & year==2002
assert missing(dev_gdd) if id==3 & year==2002
assert missing(z_gdd) if id==3 & year==2002
assert missing(dev_kdd) if id==3 & year==2002
assert missing(z_kdd) if id==3 & year==2002
assert missing(dev_heatdays) if id==3 & year==2002
assert missing(z_heatdays) if id==3 & year==2002
assert missing(dev_pct_heatdays) if id==3 & year==2002
assert missing(z_pct_heatdays) if id==3 & year==2002
assert missing(dev_heat_start) if id==3 & year==2002
assert missing(z_heat_start) if id==3 & year==2002
assert missing(dev_heat) if id==3 & year==2002
assert missing(z_heat) if id==3 & year==2002
assert missing(dev_heat_end) if id==3 & year==2002
assert missing(z_heat_end) if id==3 & year==2002
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2003
assert missing(mean) if id==3 & year==2003
assert missing(median) if id==3 & year==2003
assert missing(var) if id==3 & year==2003
assert missing(sd) if id==3 & year==2003
assert missing(skew) if id==3 & year==2003
assert missing(max) if id==3 & year==2003
assert missing(gdd) if id==3 & year==2003
assert missing(kdd) if id==3 & year==2003
assert missing(heatdays) if id==3 & year==2003
assert missing(pct_heatdays) if id==3 & year==2003
assert missing(heat_start) if id==3 & year==2003
assert missing(heat) if id==3 & year==2003
assert missing(heat_end) if id==3 & year==2003
assert missing(cut01) if id==3 & year==2003
assert missing(cut02) if id==3 & year==2003
assert missing(cut03) if id==3 & year==2003
assert missing(cut04) if id==3 & year==2003
assert missing(dev_gdd) if id==3 & year==2003
assert missing(z_gdd) if id==3 & year==2003
assert missing(dev_kdd) if id==3 & year==2003
assert missing(z_kdd) if id==3 & year==2003
assert missing(dev_heatdays) if id==3 & year==2003
assert missing(z_heatdays) if id==3 & year==2003
assert missing(dev_pct_heatdays) if id==3 & year==2003
assert missing(z_pct_heatdays) if id==3 & year==2003
assert missing(dev_heat_start) if id==3 & year==2003
assert missing(z_heat_start) if id==3 & year==2003
assert missing(dev_heat) if id==3 & year==2003
assert missing(z_heat) if id==3 & year==2003
assert missing(dev_heat_end) if id==3 & year==2003
assert missing(z_heat_end) if id==3 & year==2003
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2004
assert missing(mean) if id==3 & year==2004
assert missing(median) if id==3 & year==2004
assert missing(var) if id==3 & year==2004
assert missing(sd) if id==3 & year==2004
assert missing(skew) if id==3 & year==2004
assert missing(max) if id==3 & year==2004
assert missing(gdd) if id==3 & year==2004
assert missing(kdd) if id==3 & year==2004
assert missing(heatdays) if id==3 & year==2004
assert missing(pct_heatdays) if id==3 & year==2004
assert missing(heat_start) if id==3 & year==2004
assert missing(heat) if id==3 & year==2004
assert missing(heat_end) if id==3 & year==2004
assert missing(cut01) if id==3 & year==2004
assert missing(cut02) if id==3 & year==2004
assert missing(cut03) if id==3 & year==2004
assert missing(cut04) if id==3 & year==2004
assert missing(dev_gdd) if id==3 & year==2004
assert missing(z_gdd) if id==3 & year==2004
assert missing(dev_kdd) if id==3 & year==2004
assert missing(z_kdd) if id==3 & year==2004
assert missing(dev_heatdays) if id==3 & year==2004
assert missing(z_heatdays) if id==3 & year==2004
assert missing(dev_pct_heatdays) if id==3 & year==2004
assert missing(z_pct_heatdays) if id==3 & year==2004
assert missing(dev_heat_start) if id==3 & year==2004
assert missing(z_heat_start) if id==3 & year==2004
assert missing(dev_heat) if id==3 & year==2004
assert missing(z_heat) if id==3 & year==2004
assert missing(dev_heat_end) if id==3 & year==2004
assert missing(z_heat_end) if id==3 & year==2004
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2005
assert missing(mean) if id==3 & year==2005
assert missing(median) if id==3 & year==2005
assert missing(var) if id==3 & year==2005
assert missing(sd) if id==3 & year==2005
assert missing(skew) if id==3 & year==2005
assert missing(max) if id==3 & year==2005
assert missing(gdd) if id==3 & year==2005
assert missing(kdd) if id==3 & year==2005
assert missing(heatdays) if id==3 & year==2005
assert missing(pct_heatdays) if id==3 & year==2005
assert missing(heat_start) if id==3 & year==2005
assert missing(heat) if id==3 & year==2005
assert missing(heat_end) if id==3 & year==2005
assert missing(cut01) if id==3 & year==2005
assert missing(cut02) if id==3 & year==2005
assert missing(cut03) if id==3 & year==2005
assert missing(cut04) if id==3 & year==2005
assert missing(dev_gdd) if id==3 & year==2005
assert missing(z_gdd) if id==3 & year==2005
assert missing(dev_kdd) if id==3 & year==2005
assert missing(z_kdd) if id==3 & year==2005
assert missing(dev_heatdays) if id==3 & year==2005
assert missing(z_heatdays) if id==3 & year==2005
assert missing(dev_pct_heatdays) if id==3 & year==2005
assert missing(z_pct_heatdays) if id==3 & year==2005
assert missing(dev_heat_start) if id==3 & year==2005
assert missing(z_heat_start) if id==3 & year==2005
assert missing(dev_heat) if id==3 & year==2005
assert missing(z_heat) if id==3 & year==2005
assert missing(dev_heat_end) if id==3 & year==2005
assert missing(z_heat_end) if id==3 & year==2005
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2000
assert !missing(mean) & abs(mean - (15.111111111111111)) <= 1e-9 * max(1,abs(15.111111111111111)) if id==4 & year==2000
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2000
assert !missing(var) & abs(var - (377.11111111111109)) <= 1e-9 * max(1,abs(377.11111111111109)) if id==4 & year==2000
assert !missing(sd) & abs(sd - (19.419348884839344)) <= 1e-9 * max(1,abs(19.419348884839344)) if id==4 & year==2000
assert !missing(skew) & abs(skew - (-0.12106686293883019)) <= 1e-9 * max(1,abs(-0.12106686293883019)) if id==4 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2000
assert !missing(gdd) & abs(gdd - (80)) <= 1e-9 * max(1,abs(80)) if id==4 & year==2000
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2000
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==4 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert missing(dev_gdd) if id==4 & year==2000
assert missing(z_gdd) if id==4 & year==2000
assert missing(dev_kdd) if id==4 & year==2000
assert missing(z_kdd) if id==4 & year==2000
assert missing(dev_heatdays) if id==4 & year==2000
assert missing(z_heatdays) if id==4 & year==2000
assert missing(dev_pct_heatdays) if id==4 & year==2000
assert missing(z_pct_heatdays) if id==4 & year==2000
assert missing(dev_heat_start) if id==4 & year==2000
assert missing(z_heat_start) if id==4 & year==2000
assert missing(dev_heat) if id==4 & year==2000
assert missing(z_heat) if id==4 & year==2000
assert missing(dev_heat_end) if id==4 & year==2000
assert missing(z_heat_end) if id==4 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2001
assert !missing(mean) & abs(mean - (25.149999999999999)) <= 1e-9 * max(1,abs(25.149999999999999)) if id==4 & year==2001
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==4 & year==2001
assert !missing(var) & abs(var - (296.55833333333334)) <= 1e-9 * max(1,abs(296.55833333333334)) if id==4 & year==2001
assert !missing(sd) & abs(sd - (17.220869122472692)) <= 1e-9 * max(1,abs(17.220869122472692)) if id==4 & year==2001
assert !missing(skew) & abs(skew - (-1.3330571445419375)) <= 1e-9 * max(1,abs(-1.3330571445419375)) if id==4 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2001
assert !missing(gdd) & abs(gdd - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==4 & year==2001
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==4 & year==2001
assert !missing(heatdays) & abs(heatdays - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==4 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(heat) & abs(heat - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2001
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2001
assert missing(dev_gdd) if id==4 & year==2001
assert missing(z_gdd) if id==4 & year==2001
assert missing(dev_kdd) if id==4 & year==2001
assert missing(z_kdd) if id==4 & year==2001
assert missing(dev_heatdays) if id==4 & year==2001
assert missing(z_heatdays) if id==4 & year==2001
assert missing(dev_pct_heatdays) if id==4 & year==2001
assert missing(z_pct_heatdays) if id==4 & year==2001
assert missing(dev_heat_start) if id==4 & year==2001
assert missing(z_heat_start) if id==4 & year==2001
assert missing(dev_heat) if id==4 & year==2001
assert missing(z_heat) if id==4 & year==2001
assert missing(dev_heat_end) if id==4 & year==2001
assert missing(z_heat_end) if id==4 & year==2001
assert !missing(nobs) & abs(nobs - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2002
assert !missing(mean) & abs(mean - (29.071428571428573)) <= 1e-9 * max(1,abs(29.071428571428573)) if id==4 & year==2002
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==4 & year==2002
assert !missing(var) & abs(var - (117.03571428571429)) <= 1e-9 * max(1,abs(117.03571428571429)) if id==4 & year==2002
assert !missing(sd) & abs(sd - (10.818304593868408)) <= 1e-9 * max(1,abs(10.818304593868408)) if id==4 & year==2002
assert !missing(skew) & abs(skew - (-0.92556371690935979)) <= 1e-9 * max(1,abs(-0.92556371690935979)) if id==4 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2002
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==4 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==4 & year==2002
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==4 & year==2002
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (-5.25)) <= 1e-9 * max(1,abs(-5.25)) if id==4 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (-0.10682908204976617)) <= 1e-9 * max(1,abs(-0.10682908204976617)) if id==4 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.049206349206349254)) <= 1e-9 * max(1,abs(0.049206349206349254)) if id==4 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.44735326973026518)) <= 1e-9 * max(1,abs(0.44735326973026518)) if id==4 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert missing(z_heat_start) if id==4 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2002
assert !missing(z_heat) & abs(z_heat - (-0.35355339059327373)) <= 1e-9 * max(1,abs(-0.35355339059327373)) if id==4 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2003
assert !missing(mean) & abs(mean - (14)) <= 1e-9 * max(1,abs(14)) if id==4 & year==2003
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==4 & year==2003
assert !missing(var) & abs(var - (248.88888888888889)) <= 1e-9 * max(1,abs(248.88888888888889)) if id==4 & year==2003
assert !missing(sd) & abs(sd - (15.77621275493231)) <= 1e-9 * max(1,abs(15.77621275493231)) if id==4 & year==2003
assert !missing(skew) & abs(skew - (0.22921036149445248)) <= 1e-9 * max(1,abs(0.22921036149445248)) if id==4 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2003
assert !missing(gdd) & abs(gdd - (70)) <= 1e-9 * max(1,abs(70)) if id==4 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2003
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==4 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-59.5)) <= 1e-9 * max(1,abs(-59.5)) if id==4 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-2.1036426740299787)) <= 1e-9 * max(1,abs(-2.1036426740299787)) if id==4 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (-12)) <= 1e-9 * max(1,abs(-12)) if id==4 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==4 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==4 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.28571428571428564)) <= 1e-9 * max(1,abs(-0.28571428571428564)) if id==4 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-14.142135623730942)) <= 1e-9 * max(1,abs(-14.142135623730942)) if id==4 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==4 & year==2003
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==4 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2003
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2003
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==4 & year==2004
assert !missing(mean) & abs(mean - (26.875)) <= 1e-9 * max(1,abs(26.875)) if id==4 & year==2004
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==4 & year==2004
assert !missing(var) & abs(var - (244.6875)) <= 1e-9 * max(1,abs(244.6875)) if id==4 & year==2004
assert !missing(sd) & abs(sd - (15.642490210960657)) <= 1e-9 * max(1,abs(15.642490210960657)) if id==4 & year==2004
assert !missing(skew) & abs(skew - (-1.7780723688313773)) <= 1e-9 * max(1,abs(-1.7780723688313773)) if id==4 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2004
assert !missing(gdd) & abs(gdd - (198.5)) <= 1e-9 * max(1,abs(198.5)) if id==4 & year==2004
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==4 & year==2004
assert !missing(heatdays) & abs(heatdays - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.58333333333333337)) <= 1e-9 * max(1,abs(0.58333333333333337)) if id==4 & year==2004
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2004
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (108.75)) <= 1e-9 * max(1,abs(108.75)) if id==4 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (3.8935626559006096)) <= 1e-9 * max(1,abs(3.8935626559006096)) if id==4 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==4 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==4 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==4 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (4.9497474683058327)) <= 1e-9 * max(1,abs(4.9497474683058327)) if id==4 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.14761904761904765)) <= 1e-9 * max(1,abs(0.14761904761904765)) if id==4 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.76913369181694669)) <= 1e-9 * max(1,abs(0.76913369181694669)) if id==4 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert missing(z_heat) if id==4 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==4 & year==2004
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2005
assert !missing(mean) & abs(mean - (14.875)) <= 1e-9 * max(1,abs(14.875)) if id==4 & year==2005
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==4 & year==2005
assert !missing(var) & abs(var - (452.91071428571428)) <= 1e-9 * max(1,abs(452.91071428571428)) if id==4 & year==2005
assert !missing(sd) & abs(sd - (21.281699046028123)) <= 1e-9 * max(1,abs(21.281699046028123)) if id==4 & year==2005
assert !missing(skew) & abs(skew - (-0.40439801546761928)) <= 1e-9 * max(1,abs(-0.40439801546761928)) if id==4 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==4 & year==2005
assert !missing(gdd) & abs(gdd - (89)) <= 1e-9 * max(1,abs(89)) if id==4 & year==2005
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2005
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==4 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (-45.25)) <= 1e-9 * max(1,abs(-45.25)) if id==4 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (-0.49800127390959187)) <= 1e-9 * max(1,abs(-0.49800127390959187)) if id==4 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==4 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (-3)) <= 1e-9 * max(1,abs(-3)) if id==4 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (-1.0606601717798212)) <= 1e-9 * max(1,abs(-1.0606601717798212)) if id==4 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.19166666666666665)) <= 1e-9 * max(1,abs(-0.19166666666666665)) if id==4 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.95667388042885815)) <= 1e-9 * max(1,abs(-0.95667388042885815)) if id==4 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2005
assert missing(z_heat) if id==4 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2000
assert !missing(mean) & abs(mean - (13.4)) <= 1e-9 * max(1,abs(13.4)) if id==5 & year==2000
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2000
assert !missing(var) & abs(var - (528.04444444444448)) <= 1e-9 * max(1,abs(528.04444444444448)) if id==5 & year==2000
assert !missing(sd) & abs(sd - (22.979217663890225)) <= 1e-9 * max(1,abs(22.979217663890225)) if id==5 & year==2000
assert !missing(skew) & abs(skew - (0.016350684974998902)) <= 1e-9 * max(1,abs(0.016350684974998902)) if id==5 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2000
assert !missing(gdd) & abs(gdd - (100)) <= 1e-9 * max(1,abs(100)) if id==5 & year==2000
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2000
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2000
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2000
assert missing(dev_gdd) if id==5 & year==2000
assert missing(z_gdd) if id==5 & year==2000
assert missing(dev_kdd) if id==5 & year==2000
assert missing(z_kdd) if id==5 & year==2000
assert missing(dev_heatdays) if id==5 & year==2000
assert missing(z_heatdays) if id==5 & year==2000
assert missing(dev_pct_heatdays) if id==5 & year==2000
assert missing(z_pct_heatdays) if id==5 & year==2000
assert missing(dev_heat_start) if id==5 & year==2000
assert missing(z_heat_start) if id==5 & year==2000
assert missing(dev_heat) if id==5 & year==2000
assert missing(z_heat) if id==5 & year==2000
assert missing(dev_heat_end) if id==5 & year==2000
assert missing(z_heat_end) if id==5 & year==2000
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==5 & year==2001
assert !missing(mean) & abs(mean - (15.409090909090908)) <= 1e-9 * max(1,abs(15.409090909090908)) if id==5 & year==2001
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==5 & year==2001
assert !missing(var) & abs(var - (325.84090909090907)) <= 1e-9 * max(1,abs(325.84090909090907)) if id==5 & year==2001
assert !missing(sd) & abs(sd - (18.05106393238108)) <= 1e-9 * max(1,abs(18.05106393238108)) if id==5 & year==2001
assert !missing(skew) & abs(skew - (-0.27431615229346823)) <= 1e-9 * max(1,abs(-0.27431615229346823)) if id==5 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2001
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==5 & year==2001
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2001
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==5 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2001
assert missing(dev_gdd) if id==5 & year==2001
assert missing(z_gdd) if id==5 & year==2001
assert missing(dev_kdd) if id==5 & year==2001
assert missing(z_kdd) if id==5 & year==2001
assert missing(dev_heatdays) if id==5 & year==2001
assert missing(z_heatdays) if id==5 & year==2001
assert missing(dev_pct_heatdays) if id==5 & year==2001
assert missing(z_pct_heatdays) if id==5 & year==2001
assert missing(dev_heat_start) if id==5 & year==2001
assert missing(z_heat_start) if id==5 & year==2001
assert missing(dev_heat) if id==5 & year==2001
assert missing(z_heat) if id==5 & year==2001
assert missing(dev_heat_end) if id==5 & year==2001
assert missing(z_heat_end) if id==5 & year==2001
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2002
assert !missing(mean) & abs(mean - (27.333333333333332)) <= 1e-9 * max(1,abs(27.333333333333332)) if id==5 & year==2002
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==5 & year==2002
assert !missing(var) & abs(var - (231)) <= 1e-9 * max(1,abs(231)) if id==5 & year==2002
assert !missing(sd) & abs(sd - (15.198684153570664)) <= 1e-9 * max(1,abs(15.198684153570664)) if id==5 & year==2002
assert !missing(skew) & abs(skew - (-2.1982178335501876)) <= 1e-9 * max(1,abs(-2.1982178335501876)) if id==5 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2002
assert !missing(gdd) & abs(gdd - (150)) <= 1e-9 * max(1,abs(150)) if id==5 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2002
assert !missing(heatdays) & abs(heatdays - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.77777777777777779)) <= 1e-9 * max(1,abs(0.77777777777777779)) if id==5 & year==2002
assert !missing(heat_start) & abs(heat_start - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (45.25)) <= 1e-9 * max(1,abs(45.25)) if id==5 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (6.7361224944613207)) <= 1e-9 * max(1,abs(6.7361224944613207)) if id==5 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==5 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==5 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.34595959595959597)) <= 1e-9 * max(1,abs(0.34595959595959597)) if id==5 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (3.5879121860206302)) <= 1e-9 * max(1,abs(3.5879121860206302)) if id==5 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2002
assert missing(z_heat_start) if id==5 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==5 & year==2002
assert !missing(z_heat) & abs(z_heat - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==5 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2002
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==5 & year==2003
assert !missing(mean) & abs(mean - (10.791666666666666)) <= 1e-9 * max(1,abs(10.791666666666666)) if id==5 & year==2003
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2003
assert !missing(var) & abs(var - (315.7026515151515)) <= 1e-9 * max(1,abs(315.7026515151515)) if id==5 & year==2003
assert !missing(sd) & abs(sd - (17.768023286656046)) <= 1e-9 * max(1,abs(17.768023286656046)) if id==5 & year==2003
assert !missing(skew) & abs(skew - (0.19761311142920251)) <= 1e-9 * max(1,abs(0.19761311142920251)) if id==5 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2003
assert !missing(gdd) & abs(gdd - (89.5)) <= 1e-9 * max(1,abs(89.5)) if id==5 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==5 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2003
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-40.25)) <= 1e-9 * max(1,abs(-40.25)) if id==5 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-1.4054838490251129)) <= 1e-9 * max(1,abs(-1.4054838490251129)) if id==5 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==5 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==5 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==5 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.40404040404040409)) <= 1e-9 * max(1,abs(-0.40404040404040409)) if id==5 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.3797205486566781)) <= 1e-9 * max(1,abs(-1.3797205486566781)) if id==5 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (-2)) <= 1e-9 * max(1,abs(-2)) if id==5 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5 & year==2003
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2003
assert missing(z_heat_end) if id==5 & year==2003
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==5 & year==2004
assert !missing(mean) & abs(mean - (21.958333333333332)) <= 1e-9 * max(1,abs(21.958333333333332)) if id==5 & year==2004
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==5 & year==2004
assert !missing(var) & abs(var - (202.92992424242425)) <= 1e-9 * max(1,abs(202.92992424242425)) if id==5 & year==2004
assert !missing(sd) & abs(sd - (14.245347459518994)) <= 1e-9 * max(1,abs(14.245347459518994)) if id==5 & year==2004
assert !missing(skew) & abs(skew - (-0.37326203156596477)) <= 1e-9 * max(1,abs(-0.37326203156596477)) if id==5 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2004
assert !missing(gdd) & abs(gdd - (139.5)) <= 1e-9 * max(1,abs(139.5)) if id==5 & year==2004
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2004
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==5 & year==2004
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==5 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (0.46166475796477074)) <= 1e-9 * max(1,abs(0.46166475796477074)) if id==5 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (0.1414213562373095)) <= 1e-9 * max(1,abs(0.1414213562373095)) if id==5 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.055555555555555525)) <= 1e-9 * max(1,abs(-0.055555555555555525)) if id==5 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.12856486930664493)) <= 1e-9 * max(1,abs(-0.12856486930664493)) if id==5 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (-0.35355339059327373)) <= 1e-9 * max(1,abs(-0.35355339059327373)) if id==5 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert missing(z_heat) if id==5 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==5 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==5 & year==2004
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2005
assert !missing(mean) & abs(mean - (16.25)) <= 1e-9 * max(1,abs(16.25)) if id==5 & year==2005
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2005
assert !missing(var) & abs(var - (483.92857142857144)) <= 1e-9 * max(1,abs(483.92857142857144)) if id==5 & year==2005
assert !missing(sd) & abs(sd - (21.998376563477848)) <= 1e-9 * max(1,abs(21.998376563477848)) if id==5 & year==2005
assert !missing(skew) & abs(skew - (-0.0083870664040166312)) <= 1e-9 * max(1,abs(-0.0083870664040166312)) if id==5 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2005
assert !missing(gdd) & abs(gdd - (70)) <= 1e-9 * max(1,abs(70)) if id==5 & year==2005
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==5 & year==2005
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==5 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2005
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2005
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (-44.5)) <= 1e-9 * max(1,abs(-44.5)) if id==5 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (-1.2586500705120545)) <= 1e-9 * max(1,abs(-1.2586500705120545)) if id==5 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==5 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==5 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==5 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.083333333333333315)) <= 1e-9 * max(1,abs(0.083333333333333315)) if id==5 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.47140452079103157)) <= 1e-9 * max(1,abs(0.47140452079103157)) if id==5 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(z_heat) & abs(z_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2000
assert !missing(mean) & abs(mean - (19.100000000000001)) <= 1e-9 * max(1,abs(19.100000000000001)) if id==6 & year==2000
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==6 & year==2000
assert !missing(var) & abs(var - (435.15555555555557)) <= 1e-9 * max(1,abs(435.15555555555557)) if id==6 & year==2000
assert !missing(sd) & abs(sd - (20.860382440299496)) <= 1e-9 * max(1,abs(20.860382440299496)) if id==6 & year==2000
assert !missing(skew) & abs(skew - (-0.76464423228965139)) <= 1e-9 * max(1,abs(-0.76464423228965139)) if id==6 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==6 & year==2000
assert !missing(gdd) & abs(gdd - (129)) <= 1e-9 * max(1,abs(129)) if id==6 & year==2000
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==6 & year==2000
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==6 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2000
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert missing(dev_gdd) if id==6 & year==2000
assert missing(z_gdd) if id==6 & year==2000
assert missing(dev_kdd) if id==6 & year==2000
assert missing(z_kdd) if id==6 & year==2000
assert missing(dev_heatdays) if id==6 & year==2000
assert missing(z_heatdays) if id==6 & year==2000
assert missing(dev_pct_heatdays) if id==6 & year==2000
assert missing(z_pct_heatdays) if id==6 & year==2000
assert missing(dev_heat_start) if id==6 & year==2000
assert missing(z_heat_start) if id==6 & year==2000
assert missing(dev_heat) if id==6 & year==2000
assert missing(z_heat) if id==6 & year==2000
assert missing(dev_heat_end) if id==6 & year==2000
assert missing(z_heat_end) if id==6 & year==2000
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==6 & year==2001
assert !missing(mean) & abs(mean - (21.818181818181817)) <= 1e-9 * max(1,abs(21.818181818181817)) if id==6 & year==2001
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==6 & year==2001
assert !missing(var) & abs(var - (156.86363636363637)) <= 1e-9 * max(1,abs(156.86363636363637)) if id==6 & year==2001
assert !missing(sd) & abs(sd - (12.524521402578079)) <= 1e-9 * max(1,abs(12.524521402578079)) if id==6 & year==2001
assert !missing(skew) & abs(skew - (-1.1487134243603756)) <= 1e-9 * max(1,abs(-1.1487134243603756)) if id==6 & year==2001
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==6 & year==2001
assert !missing(gdd) & abs(gdd - (148)) <= 1e-9 * max(1,abs(148)) if id==6 & year==2001
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==6 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(cut02) & abs(cut02 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert missing(dev_gdd) if id==6 & year==2001
assert missing(z_gdd) if id==6 & year==2001
assert missing(dev_kdd) if id==6 & year==2001
assert missing(z_kdd) if id==6 & year==2001
assert missing(dev_heatdays) if id==6 & year==2001
assert missing(z_heatdays) if id==6 & year==2001
assert missing(dev_pct_heatdays) if id==6 & year==2001
assert missing(z_pct_heatdays) if id==6 & year==2001
assert missing(dev_heat_start) if id==6 & year==2001
assert missing(z_heat_start) if id==6 & year==2001
assert missing(dev_heat) if id==6 & year==2001
assert missing(z_heat) if id==6 & year==2001
assert missing(dev_heat_end) if id==6 & year==2001
assert missing(z_heat_end) if id==6 & year==2001
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==6 & year==2002
assert !missing(mean) & abs(mean - (9.9583333333333339)) <= 1e-9 * max(1,abs(9.9583333333333339)) if id==6 & year==2002
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2002
assert !missing(var) & abs(var - (307.29356060606062)) <= 1e-9 * max(1,abs(307.29356060606062)) if id==6 & year==2002
assert !missing(sd) & abs(sd - (17.529790660645684)) <= 1e-9 * max(1,abs(17.529790660645684)) if id==6 & year==2002
assert !missing(skew) & abs(skew - (0.36123517495002216)) <= 1e-9 * max(1,abs(0.36123517495002216)) if id==6 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==6 & year==2002
assert !missing(gdd) & abs(gdd - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==6 & year==2002
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2002
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==6 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2002
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (-59)) <= 1e-9 * max(1,abs(-59)) if id==6 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (-4.3915052726322426)) <= 1e-9 * max(1,abs(-4.3915052726322426)) if id==6 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==6 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==6 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.16969696969696971)) <= 1e-9 * max(1,abs(-0.16969696969696971)) if id==6 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.8856180831641263)) <= 1e-9 * max(1,abs(-1.8856180831641263)) if id==6 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert missing(z_heat_start) if id==6 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2002
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2002
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==6 & year==2003
assert !missing(mean) & abs(mean - (17.833333333333332)) <= 1e-9 * max(1,abs(17.833333333333332)) if id==6 & year==2003
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2003
assert !missing(var) & abs(var - (284.69696969696969)) <= 1e-9 * max(1,abs(284.69696969696969)) if id==6 & year==2003
assert !missing(sd) & abs(sd - (16.872965646174052)) <= 1e-9 * max(1,abs(16.872965646174052)) if id==6 & year==2003
assert !missing(skew) & abs(skew - (-0.11505063093089786)) <= 1e-9 * max(1,abs(-0.11505063093089786)) if id==6 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==6 & year==2003
assert !missing(gdd) & abs(gdd - (110)) <= 1e-9 * max(1,abs(110)) if id==6 & year==2003
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==6 & year==2003
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==6 & year==2003
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2003
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-3.75)) <= 1e-9 * max(1,abs(-3.75)) if id==6 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-0.07742045049487746)) <= 1e-9 * max(1,abs(-0.07742045049487746)) if id==6 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==6 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==6 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==6 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.19696969696969702)) <= 1e-9 * max(1,abs(0.19696969696969702)) if id==6 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (2.6263966158357492)) <= 1e-9 * max(1,abs(2.6263966158357492)) if id==6 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert missing(z_heat_start) if id==6 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert missing(z_heat) if id==6 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert missing(z_heat_end) if id==6 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==6 & year==2004
assert !missing(mean) & abs(mean - (19.333333333333332)) <= 1e-9 * max(1,abs(19.333333333333332)) if id==6 & year==2004
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==6 & year==2004
assert !missing(var) & abs(var - (273)) <= 1e-9 * max(1,abs(273)) if id==6 & year==2004
assert !missing(sd) & abs(sd - (16.522711641858304)) <= 1e-9 * max(1,abs(16.522711641858304)) if id==6 & year==2004
assert !missing(skew) & abs(skew - (-0.68313751332632477)) <= 1e-9 * max(1,abs(-0.68313751332632477)) if id==6 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==6 & year==2004
assert !missing(gdd) & abs(gdd - (100)) <= 1e-9 * max(1,abs(100)) if id==6 & year==2004
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2004
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==6 & year==2004
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2004
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (5.25)) <= 1e-9 * max(1,abs(5.25)) if id==6 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (0.24343020335930324)) <= 1e-9 * max(1,abs(0.24343020335930324)) if id==6 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==6 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==6 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.15277777777777773)) <= 1e-9 * max(1,abs(0.15277777777777773)) if id==6 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.86424162145022443)) <= 1e-9 * max(1,abs(0.86424162145022443)) if id==6 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2004
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2005
assert !missing(mean) & abs(mean - (20.949999999999999)) <= 1e-9 * max(1,abs(20.949999999999999)) if id==6 & year==2005
assert !missing(median) & abs(median - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==6 & year==2005
assert !missing(var) & abs(var - (364.58055555555558)) <= 1e-9 * max(1,abs(364.58055555555558)) if id==6 & year==2005
assert !missing(sd) & abs(sd - (19.093992656214038)) <= 1e-9 * max(1,abs(19.093992656214038)) if id==6 & year==2005
assert !missing(skew) & abs(skew - (-0.52877048626865519)) <= 1e-9 * max(1,abs(-0.52877048626865519)) if id==6 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==6 & year==2005
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==6 & year==2005
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==6 & year==2005
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2005
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2005
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2005
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (14.5)) <= 1e-9 * max(1,abs(14.5)) if id==6 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (2.0506096654409878)) <= 1e-9 * max(1,abs(2.0506096654409878)) if id==6 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==6 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.06944444444444442)) <= 1e-9 * max(1,abs(0.06944444444444442)) if id==6 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (3.5355339059327417)) <= 1e-9 * max(1,abs(3.5355339059327417)) if id==6 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6 & year==2005
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2005
assert missing(z_heat_end) if id==6 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2000
assert !missing(mean) & abs(mean - (23.149999999999999)) <= 1e-9 * max(1,abs(23.149999999999999)) if id==7 & year==2000
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==7 & year==2000
assert !missing(var) & abs(var - (181.66944444444445)) <= 1e-9 * max(1,abs(181.66944444444445)) if id==7 & year==2000
assert !missing(sd) & abs(sd - (13.478480791411339)) <= 1e-9 * max(1,abs(13.478480791411339)) if id==7 & year==2000
assert !missing(skew) & abs(skew - (-0.35043262004278369)) <= 1e-9 * max(1,abs(-0.35043262004278369)) if id==7 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==7 & year==2000
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==7 & year==2000
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==7 & year==2000
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==7 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2000
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2000
assert missing(dev_gdd) if id==7 & year==2000
assert missing(z_gdd) if id==7 & year==2000
assert missing(dev_kdd) if id==7 & year==2000
assert missing(z_kdd) if id==7 & year==2000
assert missing(dev_heatdays) if id==7 & year==2000
assert missing(z_heatdays) if id==7 & year==2000
assert missing(dev_pct_heatdays) if id==7 & year==2000
assert missing(z_pct_heatdays) if id==7 & year==2000
assert missing(dev_heat_start) if id==7 & year==2000
assert missing(z_heat_start) if id==7 & year==2000
assert missing(dev_heat) if id==7 & year==2000
assert missing(z_heat) if id==7 & year==2000
assert missing(dev_heat_end) if id==7 & year==2000
assert missing(z_heat_end) if id==7 & year==2000
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2001
assert !missing(mean) & abs(mean - (10.5)) <= 1e-9 * max(1,abs(10.5)) if id==7 & year==2001
assert !missing(median) & abs(median - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(var) & abs(var - (423.71428571428572)) <= 1e-9 * max(1,abs(423.71428571428572)) if id==7 & year==2001
assert !missing(sd) & abs(sd - (20.584321356660894)) <= 1e-9 * max(1,abs(20.584321356660894)) if id==7 & year==2001
assert !missing(skew) & abs(skew - (0.54260965536182759)) <= 1e-9 * max(1,abs(0.54260965536182759)) if id==7 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==7 & year==2001
assert !missing(gdd) & abs(gdd - (60)) <= 1e-9 * max(1,abs(60)) if id==7 & year==2001
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2001
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==7 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2001
assert missing(dev_gdd) if id==7 & year==2001
assert missing(z_gdd) if id==7 & year==2001
assert missing(dev_kdd) if id==7 & year==2001
assert missing(z_kdd) if id==7 & year==2001
assert missing(dev_heatdays) if id==7 & year==2001
assert missing(z_heatdays) if id==7 & year==2001
assert missing(dev_pct_heatdays) if id==7 & year==2001
assert missing(z_pct_heatdays) if id==7 & year==2001
assert missing(dev_heat_start) if id==7 & year==2001
assert missing(z_heat_start) if id==7 & year==2001
assert missing(dev_heat) if id==7 & year==2001
assert missing(z_heat) if id==7 & year==2001
assert missing(dev_heat_end) if id==7 & year==2001
assert missing(z_heat_end) if id==7 & year==2001
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==7 & year==2002
assert !missing(mean) & abs(mean - (14.083333333333334)) <= 1e-9 * max(1,abs(14.083333333333334)) if id==7 & year==2002
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==7 & year==2002
assert !missing(var) & abs(var - (350.94696969696969)) <= 1e-9 * max(1,abs(350.94696969696969)) if id==7 & year==2002
assert !missing(sd) & abs(sd - (18.733578667648359)) <= 1e-9 * max(1,abs(18.733578667648359)) if id==7 & year==2002
assert !missing(skew) & abs(skew - (-0.037788374951321771)) <= 1e-9 * max(1,abs(-0.037788374951321771)) if id==7 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==7 & year==2002
assert !missing(gdd) & abs(gdd - (99)) <= 1e-9 * max(1,abs(99)) if id==7 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==7 & year==2002
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==7 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2002
assert !missing(cut02) & abs(cut02 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (9.25)) <= 1e-9 * max(1,abs(9.25)) if id==7 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (0.21985673028489294)) <= 1e-9 * max(1,abs(0.21985673028489294)) if id==7 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==7 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==7 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.22083333333333335)) <= 1e-9 * max(1,abs(-0.22083333333333335)) if id==7 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-12.492219800962328)) <= 1e-9 * max(1,abs(-12.492219800962328)) if id==7 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert missing(z_heat_start) if id==7 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2002
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert missing(z_heat_end) if id==7 & year==2002
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==7 & year==2003
assert !missing(mean) & abs(mean - (19.772727272727273)) <= 1e-9 * max(1,abs(19.772727272727273)) if id==7 & year==2003
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==7 & year==2003
assert !missing(var) & abs(var - (286.56818181818181)) <= 1e-9 * max(1,abs(286.56818181818181)) if id==7 & year==2003
assert !missing(sd) & abs(sd - (16.928324837921259)) <= 1e-9 * max(1,abs(16.928324837921259)) if id==7 & year==2003
assert !missing(skew) & abs(skew - (-0.66203013004704425)) <= 1e-9 * max(1,abs(-0.66203013004704425)) if id==7 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==7 & year==2003
assert !missing(gdd) & abs(gdd - (129.5)) <= 1e-9 * max(1,abs(129.5)) if id==7 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2003
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==7 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2003
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (50)) <= 1e-9 * max(1,abs(50)) if id==7 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (1.8130943107347373)) <= 1e-9 * max(1,abs(1.8130943107347373)) if id==7 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==7 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==7 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==7 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.18371212121212122)) <= 1e-9 * max(1,abs(0.18371212121212122)) if id==7 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.2470792322744566)) <= 1e-9 * max(1,abs(1.2470792322744566)) if id==7 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert missing(z_heat_start) if id==7 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2003
assert missing(z_heat) if id==7 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert missing(z_heat_end) if id==7 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2004
assert !missing(mean) & abs(mean - (13.949999999999999)) <= 1e-9 * max(1,abs(13.949999999999999)) if id==7 & year==2004
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==7 & year==2004
assert !missing(var) & abs(var - (269.35833333333335)) <= 1e-9 * max(1,abs(269.35833333333335)) if id==7 & year==2004
assert !missing(sd) & abs(sd - (16.412139815798955)) <= 1e-9 * max(1,abs(16.412139815798955)) if id==7 & year==2004
assert !missing(skew) & abs(skew - (-0.43759859207713253)) <= 1e-9 * max(1,abs(-0.43759859207713253)) if id==7 & year==2004
assert !missing(max) & abs(max - (30)) <= 1e-9 * max(1,abs(30)) if id==7 & year==2004
assert !missing(gdd) & abs(gdd - (89.5)) <= 1e-9 * max(1,abs(89.5)) if id==7 & year==2004
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==7 & year==2004
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2004
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (-24.75)) <= 1e-9 * max(1,abs(-24.75)) if id==7 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (-1.1475995301224295)) <= 1e-9 * max(1,abs(-1.1475995301224295)) if id==7 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (-12)) <= 1e-9 * max(1,abs(-12)) if id==7 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==7 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==7 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.010606060606060619)) <= 1e-9 * max(1,abs(-0.010606060606060619)) if id==7 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.052102604929535147)) <= 1e-9 * max(1,abs(-0.052102604929535147)) if id==7 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert missing(z_heat_start) if id==7 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2004
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2004
assert missing(z_heat_end) if id==7 & year==2004
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2005
assert !missing(mean) & abs(mean - (26.375)) <= 1e-9 * max(1,abs(26.375)) if id==7 & year==2005
assert !missing(median) & abs(median - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==7 & year==2005
assert !missing(var) & abs(var - (199.91071428571428)) <= 1e-9 * max(1,abs(199.91071428571428)) if id==7 & year==2005
assert !missing(sd) & abs(sd - (14.138978544637313)) <= 1e-9 * max(1,abs(14.138978544637313)) if id==7 & year==2005
assert !missing(skew) & abs(skew - (-1.1720882355854161)) <= 1e-9 * max(1,abs(-1.1720882355854161)) if id==7 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==7 & year==2005
assert !missing(gdd) & abs(gdd - (119)) <= 1e-9 * max(1,abs(119)) if id==7 & year==2005
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==7 & year==2005
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2005
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2005
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2005
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==7 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (0.33587572106361008)) <= 1e-9 * max(1,abs(0.33587572106361008)) if id==7 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==7 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==7 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.12272727272727274)) <= 1e-9 * max(1,abs(0.12272727272727274)) if id==7 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.1230519465903992)) <= 1e-9 * max(1,abs(1.1230519465903992)) if id==7 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2005
assert missing(z_heat_start) if id==7 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2005
assert missing(z_heat) if id==7 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2000
assert !missing(mean) & abs(mean - (17.399999999999999)) <= 1e-9 * max(1,abs(17.399999999999999)) if id==8 & year==2000
assert !missing(median) & abs(median - (25)) <= 1e-9 * max(1,abs(25)) if id==8 & year==2000
assert !missing(var) & abs(var - (346.71111111111111)) <= 1e-9 * max(1,abs(346.71111111111111)) if id==8 & year==2000
assert !missing(sd) & abs(sd - (18.620180211563774)) <= 1e-9 * max(1,abs(18.620180211563774)) if id==8 & year==2000
assert !missing(skew) & abs(skew - (-0.53846991581140757)) <= 1e-9 * max(1,abs(-0.53846991581140757)) if id==8 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2000
assert !missing(gdd) & abs(gdd - (110)) <= 1e-9 * max(1,abs(110)) if id==8 & year==2000
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2000
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2000
assert missing(dev_gdd) if id==8 & year==2000
assert missing(z_gdd) if id==8 & year==2000
assert missing(dev_kdd) if id==8 & year==2000
assert missing(z_kdd) if id==8 & year==2000
assert missing(dev_heatdays) if id==8 & year==2000
assert missing(z_heatdays) if id==8 & year==2000
assert missing(dev_pct_heatdays) if id==8 & year==2000
assert missing(z_pct_heatdays) if id==8 & year==2000
assert missing(dev_heat_start) if id==8 & year==2000
assert missing(z_heat_start) if id==8 & year==2000
assert missing(dev_heat) if id==8 & year==2000
assert missing(z_heat) if id==8 & year==2000
assert missing(dev_heat_end) if id==8 & year==2000
assert missing(z_heat_end) if id==8 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2001
assert !missing(mean) & abs(mean - (19)) <= 1e-9 * max(1,abs(19)) if id==8 & year==2001
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==8 & year==2001
assert !missing(var) & abs(var - (276.66666666666669)) <= 1e-9 * max(1,abs(276.66666666666669)) if id==8 & year==2001
assert !missing(sd) & abs(sd - (16.633299933166199)) <= 1e-9 * max(1,abs(16.633299933166199)) if id==8 & year==2001
assert !missing(skew) & abs(skew - (-0.34768401660268994)) <= 1e-9 * max(1,abs(-0.34768401660268994)) if id==8 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2001
assert !missing(gdd) & abs(gdd - (100)) <= 1e-9 * max(1,abs(100)) if id==8 & year==2001
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==8 & year==2001
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8 & year==2001
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2001
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert missing(dev_gdd) if id==8 & year==2001
assert missing(z_gdd) if id==8 & year==2001
assert missing(dev_kdd) if id==8 & year==2001
assert missing(z_kdd) if id==8 & year==2001
assert missing(dev_heatdays) if id==8 & year==2001
assert missing(z_heatdays) if id==8 & year==2001
assert missing(dev_pct_heatdays) if id==8 & year==2001
assert missing(z_pct_heatdays) if id==8 & year==2001
assert missing(dev_heat_start) if id==8 & year==2001
assert missing(z_heat_start) if id==8 & year==2001
assert missing(dev_heat) if id==8 & year==2001
assert missing(z_heat) if id==8 & year==2001
assert missing(dev_heat_end) if id==8 & year==2001
assert missing(z_heat_end) if id==8 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2002
assert !missing(mean) & abs(mean - (13.199999999999999)) <= 1e-9 * max(1,abs(13.199999999999999)) if id==8 & year==2002
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2002
assert !missing(var) & abs(var - (409.06666666666666)) <= 1e-9 * max(1,abs(409.06666666666666)) if id==8 & year==2002
assert !missing(sd) & abs(sd - (20.225396576252013)) <= 1e-9 * max(1,abs(20.225396576252013)) if id==8 & year==2002
assert !missing(skew) & abs(skew - (0.3017815034523546)) <= 1e-9 * max(1,abs(0.3017815034523546)) if id==8 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2002
assert !missing(gdd) & abs(gdd - (80)) <= 1e-9 * max(1,abs(80)) if id==8 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==8 & year==2002
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2002
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (-25)) <= 1e-9 * max(1,abs(-25)) if id==8 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==8 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==8 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==8 & year==2002
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert missing(z_heat_end) if id==8 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2003
assert !missing(mean) & abs(mean - (12.9)) <= 1e-9 * max(1,abs(12.9)) if id==8 & year==2003
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==8 & year==2003
assert !missing(var) & abs(var - (375.15555555555557)) <= 1e-9 * max(1,abs(375.15555555555557)) if id==8 & year==2003
assert !missing(sd) & abs(sd - (19.368932741778924)) <= 1e-9 * max(1,abs(19.368932741778924)) if id==8 & year==2003
assert !missing(skew) & abs(skew - (-0.072419313491673826)) <= 1e-9 * max(1,abs(-0.072419313491673826)) if id==8 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2003
assert !missing(gdd) & abs(gdd - (89)) <= 1e-9 * max(1,abs(89)) if id==8 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2003
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8 & year==2003
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2003
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-0.070710678118654752)) <= 1e-9 * max(1,abs(-0.070710678118654752)) if id==8 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (-8)) <= 1e-9 * max(1,abs(-8)) if id==8 & year==2003
assert missing(z_kdd) if id==8 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8 & year==2003
assert missing(z_heatdays) if id==8 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==8 & year==2003
assert missing(z_pct_heatdays) if id==8 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert missing(z_heat) if id==8 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2003
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(mean) & abs(mean - (20.550000000000001)) <= 1e-9 * max(1,abs(20.550000000000001)) if id==8 & year==2004
assert !missing(median) & abs(median - (30.75)) <= 1e-9 * max(1,abs(30.75)) if id==8 & year==2004
assert !missing(var) & abs(var - (368.80277777777781)) <= 1e-9 * max(1,abs(368.80277777777781)) if id==8 & year==2004
assert !missing(sd) & abs(sd - (19.204238536786033)) <= 1e-9 * max(1,abs(19.204238536786033)) if id==8 & year==2004
assert !missing(skew) & abs(skew - (-0.77335733493123016)) <= 1e-9 * max(1,abs(-0.77335733493123016)) if id==8 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2004
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==8 & year==2004
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==8 & year==2004
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8 & year==2004
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (35)) <= 1e-9 * max(1,abs(35)) if id==8 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (5.4997194092287032)) <= 1e-9 * max(1,abs(5.4997194092287032)) if id==8 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==8 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.19999999999999996)) <= 1e-9 * max(1,abs(0.19999999999999996)) if id==8 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.4142135623730947)) <= 1e-9 * max(1,abs(1.4142135623730947)) if id==8 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert missing(z_heat) if id==8 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2005
assert !missing(mean) & abs(mean - (28.600000000000001)) <= 1e-9 * max(1,abs(28.600000000000001)) if id==8 & year==2005
assert !missing(median) & abs(median - (32)) <= 1e-9 * max(1,abs(32)) if id==8 & year==2005
assert !missing(var) & abs(var - (132.48888888888888)) <= 1e-9 * max(1,abs(132.48888888888888)) if id==8 & year==2005
assert !missing(sd) & abs(sd - (11.510381787277471)) <= 1e-9 * max(1,abs(11.510381787277471)) if id==8 & year==2005
assert !missing(skew) & abs(skew - (-0.81425259754603385)) <= 1e-9 * max(1,abs(-0.81425259754603385)) if id==8 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==8 & year==2005
assert !missing(gdd) & abs(gdd - (150)) <= 1e-9 * max(1,abs(150)) if id==8 & year==2005
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==8 & year==2005
assert !missing(heatdays) & abs(heatdays - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.69999999999999996)) <= 1e-9 * max(1,abs(0.69999999999999996)) if id==8 & year==2005
assert !missing(heat_start) & abs(heat_start - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2005
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (45.75)) <= 1e-9 * max(1,abs(45.75)) if id==8 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==8 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==8 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (1.649915822768611)) <= 1e-9 * max(1,abs(1.649915822768611)) if id==8 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.34999999999999998)) <= 1e-9 * max(1,abs(0.34999999999999998)) if id==8 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.6499158227686108)) <= 1e-9 * max(1,abs(1.6499158227686108)) if id==8 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2005
assert missing(z_heat) if id==8 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2005
assert missing(z_heat_end) if id==8 & year==2005
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2000
assert !missing(mean) & abs(mean - (17.227272727272727)) <= 1e-9 * max(1,abs(17.227272727272727)) if id==9 & year==2000
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==9 & year==2000
assert !missing(var) & abs(var - (520.56818181818187)) <= 1e-9 * max(1,abs(520.56818181818187)) if id==9 & year==2000
assert !missing(sd) & abs(sd - (22.815963311203451)) <= 1e-9 * max(1,abs(22.815963311203451)) if id==9 & year==2000
assert !missing(skew) & abs(skew - (-0.20175769748330527)) <= 1e-9 * max(1,abs(-0.20175769748330527)) if id==9 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9 & year==2000
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9 & year==2000
assert !missing(kdd) & abs(kdd - (32)) <= 1e-9 * max(1,abs(32)) if id==9 & year==2000
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==9 & year==2000
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2000
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2000
assert missing(dev_gdd) if id==9 & year==2000
assert missing(z_gdd) if id==9 & year==2000
assert missing(dev_kdd) if id==9 & year==2000
assert missing(z_kdd) if id==9 & year==2000
assert missing(dev_heatdays) if id==9 & year==2000
assert missing(z_heatdays) if id==9 & year==2000
assert missing(dev_pct_heatdays) if id==9 & year==2000
assert missing(z_pct_heatdays) if id==9 & year==2000
assert missing(dev_heat_start) if id==9 & year==2000
assert missing(z_heat_start) if id==9 & year==2000
assert missing(dev_heat) if id==9 & year==2000
assert missing(z_heat) if id==9 & year==2000
assert missing(dev_heat_end) if id==9 & year==2000
assert missing(z_heat_end) if id==9 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2001
assert !missing(mean) & abs(mean - (21.300000000000001)) <= 1e-9 * max(1,abs(21.300000000000001)) if id==9 & year==2001
assert !missing(median) & abs(median - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==9 & year==2001
assert !missing(var) & abs(var - (305.73333333333335)) <= 1e-9 * max(1,abs(305.73333333333335)) if id==9 & year==2001
assert !missing(sd) & abs(sd - (17.485231863871103)) <= 1e-9 * max(1,abs(17.485231863871103)) if id==9 & year==2001
assert !missing(skew) & abs(skew - (-1.0024050159618094)) <= 1e-9 * max(1,abs(-1.0024050159618094)) if id==9 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9 & year==2001
assert !missing(gdd) & abs(gdd - (139)) <= 1e-9 * max(1,abs(139)) if id==9 & year==2001
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9 & year==2001
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2001
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert missing(dev_gdd) if id==9 & year==2001
assert missing(z_gdd) if id==9 & year==2001
assert missing(dev_kdd) if id==9 & year==2001
assert missing(z_kdd) if id==9 & year==2001
assert missing(dev_heatdays) if id==9 & year==2001
assert missing(z_heatdays) if id==9 & year==2001
assert missing(dev_pct_heatdays) if id==9 & year==2001
assert missing(z_pct_heatdays) if id==9 & year==2001
assert missing(dev_heat_start) if id==9 & year==2001
assert missing(z_heat_start) if id==9 & year==2001
assert missing(dev_heat) if id==9 & year==2001
assert missing(z_heat) if id==9 & year==2001
assert missing(dev_heat_end) if id==9 & year==2001
assert missing(z_heat_end) if id==9 & year==2001
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2002
assert !missing(mean) & abs(mean - (12.318181818181818)) <= 1e-9 * max(1,abs(12.318181818181818)) if id==9 & year==2002
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==9 & year==2002
assert !missing(var) & abs(var - (397.31363636363636)) <= 1e-9 * max(1,abs(397.31363636363636)) if id==9 & year==2002
assert !missing(sd) & abs(sd - (19.932727770268585)) <= 1e-9 * max(1,abs(19.932727770268585)) if id==9 & year==2002
assert !missing(skew) & abs(skew - (-0.19151592989138055)) <= 1e-9 * max(1,abs(-0.19151592989138055)) if id==9 & year==2002
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==9 & year==2002
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==9 & year==2002
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==9 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (-19.75)) <= 1e-9 * max(1,abs(-19.75)) if id==9 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (-1.4323445054804425)) <= 1e-9 * max(1,abs(-1.4323445054804425)) if id==9 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (-20)) <= 1e-9 * max(1,abs(-20)) if id==9 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==9 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert missing(z_heatdays) if id==9 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.11363636363636365)) <= 1e-9 * max(1,abs(-0.11363636363636365)) if id==9 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-3.5355339059327369)) <= 1e-9 * max(1,abs(-3.5355339059327369)) if id==9 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert missing(z_heat_start) if id==9 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(z_heat) & abs(z_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2003
assert !missing(mean) & abs(mean - (13.949999999999999)) <= 1e-9 * max(1,abs(13.949999999999999)) if id==9 & year==2003
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==9 & year==2003
assert !missing(var) & abs(var - (269.35833333333335)) <= 1e-9 * max(1,abs(269.35833333333335)) if id==9 & year==2003
assert !missing(sd) & abs(sd - (16.412139815798955)) <= 1e-9 * max(1,abs(16.412139815798955)) if id==9 & year==2003
assert !missing(skew) & abs(skew - (0.12791674069679965)) <= 1e-9 * max(1,abs(0.12791674069679965)) if id==9 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9 & year==2003
assert !missing(gdd) & abs(gdd - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==9 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2003
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-44.75)) <= 1e-9 * max(1,abs(-44.75)) if id==9 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-2.1452900649557964)) <= 1e-9 * max(1,abs(-2.1452900649557964)) if id==9 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==9 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==9 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.23181818181818181)) <= 1e-9 * max(1,abs(-0.23181818181818181)) if id==9 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-2.4041630560342617)) <= 1e-9 * max(1,abs(-2.4041630560342617)) if id==9 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2003
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(z_heat_end) & abs(z_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2004
assert !missing(mean) & abs(mean - (19.149999999999999)) <= 1e-9 * max(1,abs(19.149999999999999)) if id==9 & year==2004
assert !missing(median) & abs(median - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==9 & year==2004
assert !missing(var) & abs(var - (303.00277777777779)) <= 1e-9 * max(1,abs(303.00277777777779)) if id==9 & year==2004
assert !missing(sd) & abs(sd - (17.406974974928232)) <= 1e-9 * max(1,abs(17.406974974928232)) if id==9 & year==2004
assert !missing(skew) & abs(skew - (-0.93361927906382847)) <= 1e-9 * max(1,abs(-0.93361927906382847)) if id==9 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9 & year==2004
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9 & year==2004
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2004
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==9 & year==2004
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(heat_end) & abs(heat_end - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (25)) <= 1e-9 * max(1,abs(25)) if id==9 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (1.1785113019775793)) <= 1e-9 * max(1,abs(1.1785113019775793)) if id==9 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.11818181818181817)) <= 1e-9 * max(1,abs(0.11818181818181817)) if id==9 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (1.0213764617139018)) <= 1e-9 * max(1,abs(1.0213764617139018)) if id==9 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert missing(z_heat_start) if id==9 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2004
assert !missing(z_heat) & abs(z_heat - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==9 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==9 & year==2004
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==9 & year==2005
assert !missing(mean) & abs(mean - (12.166666666666666)) <= 1e-9 * max(1,abs(12.166666666666666)) if id==9 & year==2005
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==9 & year==2005
assert !missing(var) & abs(var - (292.25)) <= 1e-9 * max(1,abs(292.25)) if id==9 & year==2005
assert !missing(sd) & abs(sd - (17.095320997278758)) <= 1e-9 * max(1,abs(17.095320997278758)) if id==9 & year==2005
assert !missing(skew) & abs(skew - (0.13273547579360423)) <= 1e-9 * max(1,abs(0.13273547579360423)) if id==9 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==9 & year==2005
assert !missing(gdd) & abs(gdd - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==9 & year==2005
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2005
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.1111111111111111)) <= 1e-9 * max(1,abs(0.1111111111111111)) if id==9 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2005
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (-40)) <= 1e-9 * max(1,abs(-40)) if id==9 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==9 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert missing(z_kdd) if id==9 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==9 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==9 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.18888888888888894)) <= 1e-9 * max(1,abs(-0.18888888888888894)) if id==9 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.3356461422412569)) <= 1e-9 * max(1,abs(-1.3356461422412569)) if id==9 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2005
assert missing(z_heat) if id==9 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==9 & year==2005
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2000
assert !missing(mean) & abs(mean - (21.444444444444443)) <= 1e-9 * max(1,abs(21.444444444444443)) if id==10 & year==2000
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==10 & year==2000
assert !missing(var) & abs(var - (368.71527777777777)) <= 1e-9 * max(1,abs(368.71527777777777)) if id==10 & year==2000
assert !missing(sd) & abs(sd - (19.201960258728217)) <= 1e-9 * max(1,abs(19.201960258728217)) if id==10 & year==2000
assert !missing(skew) & abs(skew - (-0.78627940156471854)) <= 1e-9 * max(1,abs(-0.78627940156471854)) if id==10 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10 & year==2000
assert !missing(gdd) & abs(gdd - (119)) <= 1e-9 * max(1,abs(119)) if id==10 & year==2000
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==10 & year==2000
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==10 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2000
assert missing(dev_gdd) if id==10 & year==2000
assert missing(z_gdd) if id==10 & year==2000
assert missing(dev_kdd) if id==10 & year==2000
assert missing(z_kdd) if id==10 & year==2000
assert missing(dev_heatdays) if id==10 & year==2000
assert missing(z_heatdays) if id==10 & year==2000
assert missing(dev_pct_heatdays) if id==10 & year==2000
assert missing(z_pct_heatdays) if id==10 & year==2000
assert missing(dev_heat_start) if id==10 & year==2000
assert missing(z_heat_start) if id==10 & year==2000
assert missing(dev_heat) if id==10 & year==2000
assert missing(z_heat) if id==10 & year==2000
assert missing(dev_heat_end) if id==10 & year==2000
assert missing(z_heat_end) if id==10 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2001
assert !missing(mean) & abs(mean - (14.1)) <= 1e-9 * max(1,abs(14.1)) if id==10 & year==2001
assert !missing(median) & abs(median - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==10 & year==2001
assert !missing(var) & abs(var - (408.48888888888888)) <= 1e-9 * max(1,abs(408.48888888888888)) if id==10 & year==2001
assert !missing(sd) & abs(sd - (20.211108056929707)) <= 1e-9 * max(1,abs(20.211108056929707)) if id==10 & year==2001
assert !missing(skew) & abs(skew - (-0.17548119014852609)) <= 1e-9 * max(1,abs(-0.17548119014852609)) if id==10 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10 & year==2001
assert !missing(gdd) & abs(gdd - (99)) <= 1e-9 * max(1,abs(99)) if id==10 & year==2001
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2001
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==10 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert missing(dev_gdd) if id==10 & year==2001
assert missing(z_gdd) if id==10 & year==2001
assert missing(dev_kdd) if id==10 & year==2001
assert missing(z_kdd) if id==10 & year==2001
assert missing(dev_heatdays) if id==10 & year==2001
assert missing(z_heatdays) if id==10 & year==2001
assert missing(dev_pct_heatdays) if id==10 & year==2001
assert missing(z_pct_heatdays) if id==10 & year==2001
assert missing(dev_heat_start) if id==10 & year==2001
assert missing(z_heat_start) if id==10 & year==2001
assert missing(dev_heat) if id==10 & year==2001
assert missing(z_heat) if id==10 & year==2001
assert missing(dev_heat_end) if id==10 & year==2001
assert missing(z_heat_end) if id==10 & year==2001
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2002
assert !missing(mean) & abs(mean - (27.9375)) <= 1e-9 * max(1,abs(27.9375)) if id==10 & year==2002
assert !missing(median) & abs(median - (31)) <= 1e-9 * max(1,abs(31)) if id==10 & year==2002
assert !missing(var) & abs(var - (139.17410714285714)) <= 1e-9 * max(1,abs(139.17410714285714)) if id==10 & year==2002
assert !missing(sd) & abs(sd - (11.797207599379488)) <= 1e-9 * max(1,abs(11.797207599379488)) if id==10 & year==2002
assert !missing(skew) & abs(skew - (-0.91486589347277592)) <= 1e-9 * max(1,abs(-0.91486589347277592)) if id==10 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10 & year==2002
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==10 & year==2002
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==10 & year==2002
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==10 & year==2002
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2002
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (10.5)) <= 1e-9 * max(1,abs(10.5)) if id==10 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (0.74246212024587488)) <= 1e-9 * max(1,abs(0.74246212024587488)) if id==10 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.25277777777777777)) <= 1e-9 * max(1,abs(0.25277777777777777)) if id==10 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (2.4748737341529163)) <= 1e-9 * max(1,abs(2.4748737341529163)) if id==10 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert missing(z_heat_start) if id==10 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10 & year==2002
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10 & year==2002
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==10 & year==2003
assert !missing(mean) & abs(mean - (21.045454545454547)) <= 1e-9 * max(1,abs(21.045454545454547)) if id==10 & year==2003
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==10 & year==2003
assert !missing(var) & abs(var - (432.2227272727273)) <= 1e-9 * max(1,abs(432.2227272727273)) if id==10 & year==2003
assert !missing(sd) & abs(sd - (20.789966985849865)) <= 1e-9 * max(1,abs(20.789966985849865)) if id==10 & year==2003
assert !missing(skew) & abs(skew - (-0.89747552862823643)) <= 1e-9 * max(1,abs(-0.89747552862823643)) if id==10 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10 & year==2003
assert !missing(gdd) & abs(gdd - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==10 & year==2003
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==10 & year==2003
assert !missing(heatdays) & abs(heatdays - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==10 & year==2003
assert !missing(heat_start) & abs(heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (40.25)) <= 1e-9 * max(1,abs(40.25)) if id==10 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (2.7766876041715647)) <= 1e-9 * max(1,abs(2.7766876041715647)) if id==10 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==10 & year==2003
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==10 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.082954545454545392)) <= 1e-9 * max(1,abs(0.082954545454545392)) if id==10 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (0.36097059459173375)) <= 1e-9 * max(1,abs(0.36097059459173375)) if id==10 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert missing(z_heat_start) if id==10 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert missing(z_heat) if id==10 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10 & year==2003
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==10 & year==2004
assert !missing(mean) & abs(mean - (12.909090909090908)) <= 1e-9 * max(1,abs(12.909090909090908)) if id==10 & year==2004
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2004
assert !missing(var) & abs(var - (229.09090909090909)) <= 1e-9 * max(1,abs(229.09090909090909)) if id==10 & year==2004
assert !missing(sd) & abs(sd - (15.135749373285391)) <= 1e-9 * max(1,abs(15.135749373285391)) if id==10 & year==2004
assert !missing(skew) & abs(skew - (-0.30370649536116029)) <= 1e-9 * max(1,abs(-0.30370649536116029)) if id==10 & year==2004
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==10 & year==2004
assert !missing(gdd) & abs(gdd - (80)) <= 1e-9 * max(1,abs(80)) if id==10 & year==2004
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==10 & year==2004
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (-54.5)) <= 1e-9 * max(1,abs(-54.5)) if id==10 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (-2.5691546383111228)) <= 1e-9 * max(1,abs(-2.5691546383111228)) if id==10 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (-20)) <= 1e-9 * max(1,abs(-20)) if id==10 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==10 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==10 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==10 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.3125)) <= 1e-9 * max(1,abs(-0.3125)) if id==10 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-5.5558389950371563)) <= 1e-9 * max(1,abs(-5.5558389950371563)) if id==10 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert missing(z_heat) if id==10 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2004
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==10 & year==2005
assert !missing(mean) & abs(mean - (18)) <= 1e-9 * max(1,abs(18)) if id==10 & year==2005
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==10 & year==2005
assert !missing(var) & abs(var - (251.69999999999999)) <= 1e-9 * max(1,abs(251.69999999999999)) if id==10 & year==2005
assert !missing(sd) & abs(sd - (15.865055940651454)) <= 1e-9 * max(1,abs(15.865055940651454)) if id==10 & year==2005
assert !missing(skew) & abs(skew - (-0.53197058440628175)) <= 1e-9 * max(1,abs(-0.53197058440628175)) if id==10 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==10 & year==2005
assert !missing(gdd) & abs(gdd - (118)) <= 1e-9 * max(1,abs(118)) if id==10 & year==2005
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2005
assert !missing(heatdays) & abs(heatdays - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.090909090909090912)) <= 1e-9 * max(1,abs(0.090909090909090912)) if id==10 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2005
assert !missing(cut02) & abs(cut02 - (7)) <= 1e-9 * max(1,abs(7)) if id==10 & year==2005
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (3.25)) <= 1e-9 * max(1,abs(3.25)) if id==10 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (0.066132288887950488)) <= 1e-9 * max(1,abs(0.066132288887950488)) if id==10 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==10 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==10 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==10 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==10 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.31818181818181812)) <= 1e-9 * max(1,abs(-0.31818181818181812)) if id==10 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-1.6499158227686106)) <= 1e-9 * max(1,abs(-1.6499158227686106)) if id==10 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2005
assert missing(z_heat) if id==10 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2005
assert missing(z_heat_end) if id==10 & year==2005
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==11 & year==2000
assert !missing(mean) & abs(mean - (20.399999999999999)) <= 1e-9 * max(1,abs(20.399999999999999)) if id==11 & year==2000
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==11 & year==2000
assert !missing(var) & abs(var - (320.71111111111111)) <= 1e-9 * max(1,abs(320.71111111111111)) if id==11 & year==2000
assert !missing(sd) & abs(sd - (17.908408949739535)) <= 1e-9 * max(1,abs(17.908408949739535)) if id==11 & year==2000
assert !missing(skew) & abs(skew - (-1.0642196750410116)) <= 1e-9 * max(1,abs(-1.0642196750410116)) if id==11 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==11 & year==2000
assert !missing(gdd) & abs(gdd - (130)) <= 1e-9 * max(1,abs(130)) if id==11 & year==2000
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2000
assert !missing(heatdays) & abs(heatdays - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11 & year==2000
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(heat_end) & abs(heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2000
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2000
assert missing(dev_gdd) if id==11 & year==2000
assert missing(z_gdd) if id==11 & year==2000
assert missing(dev_kdd) if id==11 & year==2000
assert missing(z_kdd) if id==11 & year==2000
assert missing(dev_heatdays) if id==11 & year==2000
assert missing(z_heatdays) if id==11 & year==2000
assert missing(dev_pct_heatdays) if id==11 & year==2000
assert missing(z_pct_heatdays) if id==11 & year==2000
assert missing(dev_heat_start) if id==11 & year==2000
assert missing(z_heat_start) if id==11 & year==2000
assert missing(dev_heat) if id==11 & year==2000
assert missing(z_heat) if id==11 & year==2000
assert missing(dev_heat_end) if id==11 & year==2000
assert missing(z_heat_end) if id==11 & year==2000
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==11 & year==2001
assert !missing(mean) & abs(mean - (18.454545454545453)) <= 1e-9 * max(1,abs(18.454545454545453)) if id==11 & year==2001
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==11 & year==2001
assert !missing(var) & abs(var - (164.22272727272727)) <= 1e-9 * max(1,abs(164.22272727272727)) if id==11 & year==2001
assert !missing(sd) & abs(sd - (12.814941563375436)) <= 1e-9 * max(1,abs(12.814941563375436)) if id==11 & year==2001
assert !missing(skew) & abs(skew - (-0.3005274246465261)) <= 1e-9 * max(1,abs(-0.3005274246465261)) if id==11 & year==2001
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==11 & year==2001
assert !missing(gdd) & abs(gdd - (109)) <= 1e-9 * max(1,abs(109)) if id==11 & year==2001
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==11 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(cut02) & abs(cut02 - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert missing(dev_gdd) if id==11 & year==2001
assert missing(z_gdd) if id==11 & year==2001
assert missing(dev_kdd) if id==11 & year==2001
assert missing(z_kdd) if id==11 & year==2001
assert missing(dev_heatdays) if id==11 & year==2001
assert missing(z_heatdays) if id==11 & year==2001
assert missing(dev_pct_heatdays) if id==11 & year==2001
assert missing(z_pct_heatdays) if id==11 & year==2001
assert missing(dev_heat_start) if id==11 & year==2001
assert missing(z_heat_start) if id==11 & year==2001
assert missing(dev_heat) if id==11 & year==2001
assert missing(z_heat) if id==11 & year==2001
assert missing(dev_heat_end) if id==11 & year==2001
assert missing(z_heat_end) if id==11 & year==2001
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2002
assert !missing(mean) & abs(mean - (19.166666666666668)) <= 1e-9 * max(1,abs(19.166666666666668)) if id==11 & year==2002
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==11 & year==2002
assert !missing(var) & abs(var - (244.0625)) <= 1e-9 * max(1,abs(244.0625)) if id==11 & year==2002
assert !missing(sd) & abs(sd - (15.622499799967994)) <= 1e-9 * max(1,abs(15.622499799967994)) if id==11 & year==2002
assert !missing(skew) & abs(skew - (-1.0573632651909481)) <= 1e-9 * max(1,abs(-1.0573632651909481)) if id==11 & year==2002
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==11 & year==2002
assert !missing(gdd) & abs(gdd - (108.5)) <= 1e-9 * max(1,abs(108.5)) if id==11 & year==2002
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==11 & year==2002
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (-11)) <= 1e-9 * max(1,abs(-11)) if id==11 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (-0.7407785326716213)) <= 1e-9 * max(1,abs(-0.7407785326716213)) if id==11 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11 & year==2002
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==11 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==11 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.21414141414141413)) <= 1e-9 * max(1,abs(-0.21414141414141413)) if id==11 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.92534961488609913)) <= 1e-9 * max(1,abs(-0.92534961488609913)) if id==11 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert missing(z_heat_start) if id==11 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11 & year==2002
assert missing(z_heat) if id==11 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11 & year==2002
assert !missing(nobs) & abs(nobs - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2003
assert !missing(mean) & abs(mean - (19.9375)) <= 1e-9 * max(1,abs(19.9375)) if id==11 & year==2003
assert !missing(median) & abs(median - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==11 & year==2003
assert !missing(var) & abs(var - (370.03125)) <= 1e-9 * max(1,abs(370.03125)) if id==11 & year==2003
assert !missing(sd) & abs(sd - (19.236196349590529)) <= 1e-9 * max(1,abs(19.236196349590529)) if id==11 & year==2003
assert !missing(skew) & abs(skew - (-1.1147324269792853)) <= 1e-9 * max(1,abs(-1.1147324269792853)) if id==11 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==11 & year==2003
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==11 & year==2003
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2003
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11 & year==2003
assert !missing(heat_start) & abs(heat_start - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(heat) & abs(heat - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==11 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2003
assert missing(z_kdd) if id==11 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.25252525252525254)) <= 1e-9 * max(1,abs(0.25252525252525254)) if id==11 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (7.0710678118654764)) <= 1e-9 * max(1,abs(7.0710678118654764)) if id==11 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==11 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==11 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11 & year==2003
assert !missing(z_heat) & abs(z_heat - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==11 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert missing(z_heat_end) if id==11 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2004
assert !missing(mean) & abs(mean - (11.333333333333334)) <= 1e-9 * max(1,abs(11.333333333333334)) if id==11 & year==2004
assert !missing(median) & abs(median - (10)) <= 1e-9 * max(1,abs(10)) if id==11 & year==2004
assert !missing(var) & abs(var - (246)) <= 1e-9 * max(1,abs(246)) if id==11 & year==2004
assert !missing(sd) & abs(sd - (15.684387141358123)) <= 1e-9 * max(1,abs(15.684387141358123)) if id==11 & year==2004
assert !missing(skew) & abs(skew - (-0.17683312320502373)) <= 1e-9 * max(1,abs(-0.17683312320502373)) if id==11 & year==2004
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==11 & year==2004
assert !missing(gdd) & abs(gdd - (60)) <= 1e-9 * max(1,abs(60)) if id==11 & year==2004
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(heatdays) & abs(heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==11 & year==2004
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (-49)) <= 1e-9 * max(1,abs(-49)) if id==11 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (-69.296464556281649)) <= 1e-9 * max(1,abs(-69.296464556281649)) if id==11 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11 & year==2004
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.1388888888888889)) <= 1e-9 * max(1,abs(-0.1388888888888889)) if id==11 & year==2004
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==11 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11 & year==2004
assert !missing(z_heat) & abs(z_heat - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2004
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2005
assert !missing(mean) & abs(mean - (12.444444444444445)) <= 1e-9 * max(1,abs(12.444444444444445)) if id==11 & year==2005
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==11 & year==2005
assert !missing(var) & abs(var - (328.77777777777777)) <= 1e-9 * max(1,abs(328.77777777777777)) if id==11 & year==2005
assert !missing(sd) & abs(sd - (18.132230358612198)) <= 1e-9 * max(1,abs(18.132230358612198)) if id==11 & year==2005
assert !missing(skew) & abs(skew - (-0.39822895903975669)) <= 1e-9 * max(1,abs(-0.39822895903975669)) if id==11 & year==2005
assert !missing(max) & abs(max - (32)) <= 1e-9 * max(1,abs(32)) if id==11 & year==2005
assert !missing(gdd) & abs(gdd - (80)) <= 1e-9 * max(1,abs(80)) if id==11 & year==2005
assert !missing(kdd) & abs(kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(heatdays) & abs(heatdays - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==11 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2005
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2005
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (-4.75)) <= 1e-9 * max(1,abs(-4.75)) if id==11 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (-0.13570736204590306)) <= 1e-9 * max(1,abs(-0.13570736204590306)) if id==11 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(z_heatdays) & abs(z_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.02777777777777779)) <= 1e-9 * max(1,abs(-0.02777777777777779)) if id==11 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.14142135623730956)) <= 1e-9 * max(1,abs(-0.14142135623730956)) if id==11 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11 & year==2005
assert !missing(z_heat) & abs(z_heat - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11 & year==2005
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==12 & year==2000
assert !missing(mean) & abs(mean - (17.458333333333332)) <= 1e-9 * max(1,abs(17.458333333333332)) if id==12 & year==2000
assert !missing(median) & abs(median - (15)) <= 1e-9 * max(1,abs(15)) if id==12 & year==2000
assert !missing(var) & abs(var - (201.15719696969697)) <= 1e-9 * max(1,abs(201.15719696969697)) if id==12 & year==2000
assert !missing(sd) & abs(sd - (14.182989704914016)) <= 1e-9 * max(1,abs(14.182989704914016)) if id==12 & year==2000
assert !missing(skew) & abs(skew - (0.073662554445579315)) <= 1e-9 * max(1,abs(0.073662554445579315)) if id==12 & year==2000
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2000
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==12 & year==2000
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2000
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2000
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==12 & year==2000
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2000
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2000
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2000
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2000
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert missing(dev_gdd) if id==12 & year==2000
assert missing(z_gdd) if id==12 & year==2000
assert missing(dev_kdd) if id==12 & year==2000
assert missing(z_kdd) if id==12 & year==2000
assert missing(dev_heatdays) if id==12 & year==2000
assert missing(z_heatdays) if id==12 & year==2000
assert missing(dev_pct_heatdays) if id==12 & year==2000
assert missing(z_pct_heatdays) if id==12 & year==2000
assert missing(dev_heat_start) if id==12 & year==2000
assert missing(z_heat_start) if id==12 & year==2000
assert missing(dev_heat) if id==12 & year==2000
assert missing(z_heat) if id==12 & year==2000
assert missing(dev_heat_end) if id==12 & year==2000
assert missing(z_heat_end) if id==12 & year==2000
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2001
assert !missing(mean) & abs(mean - (23.149999999999999)) <= 1e-9 * max(1,abs(23.149999999999999)) if id==12 & year==2001
assert !missing(median) & abs(median - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==12 & year==2001
assert !missing(var) & abs(var - (137.22499999999999)) <= 1e-9 * max(1,abs(137.22499999999999)) if id==12 & year==2001
assert !missing(sd) & abs(sd - (11.714307491268956)) <= 1e-9 * max(1,abs(11.714307491268956)) if id==12 & year==2001
assert !missing(skew) & abs(skew - (-0.20720374960923399)) <= 1e-9 * max(1,abs(-0.20720374960923399)) if id==12 & year==2001
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2001
assert !missing(gdd) & abs(gdd - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==12 & year==2001
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2001
assert !missing(heatdays) & abs(heatdays - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2001
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2001
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(heat) & abs(heat - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(heat_end) & abs(heat_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2001
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2001
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2001
assert missing(dev_gdd) if id==12 & year==2001
assert missing(z_gdd) if id==12 & year==2001
assert missing(dev_kdd) if id==12 & year==2001
assert missing(z_kdd) if id==12 & year==2001
assert missing(dev_heatdays) if id==12 & year==2001
assert missing(z_heatdays) if id==12 & year==2001
assert missing(dev_pct_heatdays) if id==12 & year==2001
assert missing(z_pct_heatdays) if id==12 & year==2001
assert missing(dev_heat_start) if id==12 & year==2001
assert missing(z_heat_start) if id==12 & year==2001
assert missing(dev_heat) if id==12 & year==2001
assert missing(z_heat) if id==12 & year==2001
assert missing(dev_heat_end) if id==12 & year==2001
assert missing(z_heat_end) if id==12 & year==2001
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2002
assert !missing(mean) & abs(mean - (18.300000000000001)) <= 1e-9 * max(1,abs(18.300000000000001)) if id==12 & year==2002
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12 & year==2002
assert !missing(var) & abs(var - (404.39999999999998)) <= 1e-9 * max(1,abs(404.39999999999998)) if id==12 & year==2002
assert !missing(sd) & abs(sd - (20.109699152399074)) <= 1e-9 * max(1,abs(20.109699152399074)) if id==12 & year==2002
assert !missing(skew) & abs(skew - (-0.82349585384406243)) <= 1e-9 * max(1,abs(-0.82349585384406243)) if id==12 & year==2002
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2002
assert !missing(gdd) & abs(gdd - (129)) <= 1e-9 * max(1,abs(129)) if id==12 & year==2002
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2002
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2002
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==12 & year==2002
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(heat) & abs(heat - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2002
assert !missing(dev_gdd) & abs(dev_gdd - (14.5)) <= 1e-9 * max(1,abs(14.5)) if id==12 & year==2002
assert !missing(z_gdd) & abs(z_gdd - (2.0506096654409878)) <= 1e-9 * max(1,abs(2.0506096654409878)) if id==12 & year==2002
assert !missing(dev_kdd) & abs(dev_kdd - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert missing(z_kdd) if id==12 & year==2002
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2002
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2002
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.016666666666666607)) <= 1e-9 * max(1,abs(-0.016666666666666607)) if id==12 & year==2002
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.14142135623730898)) <= 1e-9 * max(1,abs(-0.14142135623730898)) if id==12 & year==2002
assert !missing(dev_heat_start) & abs(dev_heat_start - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2002
assert !missing(z_heat_start) & abs(z_heat_start - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12 & year==2002
assert !missing(dev_heat) & abs(dev_heat - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2002
assert !missing(z_heat) & abs(z_heat - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12 & year==2002
assert !missing(dev_heat_end) & abs(dev_heat_end - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2002
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2002
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2003
assert !missing(mean) & abs(mean - (21.199999999999999)) <= 1e-9 * max(1,abs(21.199999999999999)) if id==12 & year==2003
assert !missing(median) & abs(median - (20)) <= 1e-9 * max(1,abs(20)) if id==12 & year==2003
assert !missing(var) & abs(var - (192.17777777777778)) <= 1e-9 * max(1,abs(192.17777777777778)) if id==12 & year==2003
assert !missing(sd) & abs(sd - (13.862819979274699)) <= 1e-9 * max(1,abs(13.862819979274699)) if id==12 & year==2003
assert !missing(skew) & abs(skew - (0.077373719629164311)) <= 1e-9 * max(1,abs(0.077373719629164311)) if id==12 & year==2003
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2003
assert !missing(gdd) & abs(gdd - (100)) <= 1e-9 * max(1,abs(100)) if id==12 & year==2003
assert !missing(kdd) & abs(kdd - (16)) <= 1e-9 * max(1,abs(16)) if id==12 & year==2003
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2003
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==12 & year==2003
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(heat) & abs(heat - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(heat_end) & abs(heat_end - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(dev_gdd) & abs(dev_gdd - (-24.25)) <= 1e-9 * max(1,abs(-24.25)) if id==12 & year==2003
assert !missing(z_gdd) & abs(z_gdd - (-3.6099661986892162)) <= 1e-9 * max(1,abs(-3.6099661986892162)) if id==12 & year==2003
assert !missing(dev_kdd) & abs(dev_kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2003
assert missing(z_kdd) if id==12 & year==2003
assert !missing(dev_heatdays) & abs(dev_heatdays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2003
assert !missing(z_heatdays) & abs(z_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2003
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==12 & year==2003
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2003
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2003
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2003
assert !missing(dev_heat) & abs(dev_heat - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12 & year==2003
assert !missing(z_heat) & abs(z_heat - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==12 & year==2003
assert !missing(dev_heat_end) & abs(dev_heat_end - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==12 & year==2003
assert !missing(z_heat_end) & abs(z_heat_end - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==12 & year==2003
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2004
assert !missing(mean) & abs(mean - (23.5)) <= 1e-9 * max(1,abs(23.5)) if id==12 & year==2004
assert !missing(median) & abs(median - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12 & year==2004
assert !missing(var) & abs(var - (303)) <= 1e-9 * max(1,abs(303)) if id==12 & year==2004
assert !missing(sd) & abs(sd - (17.406895185529212)) <= 1e-9 * max(1,abs(17.406895185529212)) if id==12 & year==2004
assert !missing(skew) & abs(skew - (-0.86088952453744727)) <= 1e-9 * max(1,abs(-0.86088952453744727)) if id==12 & year==2004
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2004
assert !missing(gdd) & abs(gdd - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==12 & year==2004
assert !missing(kdd) & abs(kdd - (24)) <= 1e-9 * max(1,abs(24)) if id==12 & year==2004
assert !missing(heatdays) & abs(heatdays - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==12 & year==2004
assert !missing(heat_start) & abs(heat_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(heat) & abs(heat - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2004
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(dev_gdd) & abs(dev_gdd - (-5)) <= 1e-9 * max(1,abs(-5)) if id==12 & year==2004
assert !missing(z_gdd) & abs(z_gdd - (-0.24382992454708538)) <= 1e-9 * max(1,abs(-0.24382992454708538)) if id==12 & year==2004
assert !missing(dev_kdd) & abs(dev_kdd - (12)) <= 1e-9 * max(1,abs(12)) if id==12 & year==2004
assert !missing(z_kdd) & abs(z_kdd - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==12 & year==2004
assert !missing(dev_heatdays) & abs(dev_heatdays - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert missing(z_heatdays) if id==12 & year==2004
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.044444444444444398)) <= 1e-9 * max(1,abs(0.044444444444444398)) if id==12 & year==2004
assert missing(z_pct_heatdays) if id==12 & year==2004
assert !missing(dev_heat_start) & abs(dev_heat_start - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12 & year==2004
assert !missing(z_heat_start) & abs(z_heat_start - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12 & year==2004
assert !missing(dev_heat) & abs(dev_heat - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==12 & year==2004
assert !missing(z_heat) & abs(z_heat - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==12 & year==2004
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2004
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==12 & year==2004
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2005
assert !missing(mean) & abs(mean - (25.100000000000001)) <= 1e-9 * max(1,abs(25.100000000000001)) if id==12 & year==2005
assert !missing(median) & abs(median - (30)) <= 1e-9 * max(1,abs(30)) if id==12 & year==2005
assert !missing(var) & abs(var - (207.15555555555557)) <= 1e-9 * max(1,abs(207.15555555555557)) if id==12 & year==2005
assert !missing(sd) & abs(sd - (14.392899483966238)) <= 1e-9 * max(1,abs(14.392899483966238)) if id==12 & year==2005
assert !missing(skew) & abs(skew - (-1.9755202126322406)) <= 1e-9 * max(1,abs(-1.9755202126322406)) if id==12 & year==2005
assert !missing(max) & abs(max - (40)) <= 1e-9 * max(1,abs(40)) if id==12 & year==2005
assert !missing(gdd) & abs(gdd - (159)) <= 1e-9 * max(1,abs(159)) if id==12 & year==2005
assert !missing(kdd) & abs(kdd - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2005
assert !missing(heatdays) & abs(heatdays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2005
assert !missing(pct_heatdays) & abs(pct_heatdays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==12 & year==2005
assert !missing(heat_start) & abs(heat_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2005
assert !missing(heat) & abs(heat - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2005
assert !missing(heat_end) & abs(heat_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2005
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2005
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2005
assert !missing(cut03) & abs(cut03 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2005
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2005
assert !missing(dev_gdd) & abs(dev_gdd - (54.25)) <= 1e-9 * max(1,abs(54.25)) if id==12 & year==2005
assert !missing(z_gdd) & abs(z_gdd - (8.0759037640779372)) <= 1e-9 * max(1,abs(8.0759037640779372)) if id==12 & year==2005
assert !missing(dev_kdd) & abs(dev_kdd - (-12)) <= 1e-9 * max(1,abs(-12)) if id==12 & year==2005
assert !missing(z_kdd) & abs(z_kdd - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12 & year==2005
assert !missing(dev_heatdays) & abs(dev_heatdays - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2005
assert missing(z_heatdays) if id==12 & year==2005
assert !missing(dev_pct_heatdays) & abs(dev_pct_heatdays - (0.17777777777777776)) <= 1e-9 * max(1,abs(0.17777777777777776)) if id==12 & year==2005
assert !missing(z_pct_heatdays) & abs(z_pct_heatdays - (5.656854249492385)) <= 1e-9 * max(1,abs(5.656854249492385)) if id==12 & year==2005
assert !missing(dev_heat_start) & abs(dev_heat_start - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12 & year==2005
assert !missing(z_heat_start) & abs(z_heat_start - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12 & year==2005
assert !missing(dev_heat) & abs(dev_heat - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2005
assert !missing(z_heat) & abs(z_heat - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==12 & year==2005
assert !missing(dev_heat_end) & abs(dev_heat_end - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12 & year==2005
assert !missing(z_heat_end) & abs(z_heat_end - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==12 & year==2005
assert _N==72
