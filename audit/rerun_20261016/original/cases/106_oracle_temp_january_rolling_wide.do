version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261016/original/oracle_temp.csv", clear varnames(1) asdouble
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) ini_month(1) ini_day(1) fin_month(1) fin_day(12) lr_years(2) ref_min(2) minobs(2) shape(wide) keep(id) cuts(10 30 32)
assert !missing(nobs_2000) & abs(nobs_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==1
assert !missing(mean_2000) & abs(mean_2000 - (24.208333333333332)) <= 1e-9 * max(1,abs(24.208333333333332)) if id==1
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1
assert !missing(var_2000) & abs(var_2000 - (191.11174242424244)) <= 1e-9 * max(1,abs(191.11174242424244)) if id==1
assert !missing(sd_2000) & abs(sd_2000 - (13.824317068999916)) <= 1e-9 * max(1,abs(13.824317068999916)) if id==1
assert !missing(skew_2000) & abs(skew_2000 - (-0.91397561861594034)) <= 1e-9 * max(1,abs(-0.91397561861594034)) if id==1
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2000) & abs(gdd_2000 - (168.5)) <= 1e-9 * max(1,abs(168.5)) if id==1
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==1
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==1
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2000) & abs(cut01_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut02_2000) & abs(cut02_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(nobs_2001) & abs(nobs_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(mean_2001) if id==1
assert missing(median_2001) if id==1
assert missing(var_2001) if id==1
assert missing(sd_2001) if id==1
assert missing(skew_2001) if id==1
assert missing(max_2001) if id==1
assert missing(gdd_2001) if id==1
assert missing(kdd_2001) if id==1
assert missing(heatdays_2001) if id==1
assert missing(pct_heatdays_2001) if id==1
assert missing(heat_start_2001) if id==1
assert missing(heat_2001) if id==1
assert missing(heat_end_2001) if id==1
assert missing(cut01_2001) if id==1
assert missing(cut02_2001) if id==1
assert missing(cut03_2001) if id==1
assert missing(cut04_2001) if id==1
assert !missing(nobs_2002) & abs(nobs_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(mean_2002) & abs(mean_2002 - (23.850000000000001)) <= 1e-9 * max(1,abs(23.850000000000001)) if id==1
assert !missing(median_2002) & abs(median_2002 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==1
assert !missing(var_2002) & abs(var_2002 - (158.05833333333334)) <= 1e-9 * max(1,abs(158.05833333333334)) if id==1
assert !missing(sd_2002) & abs(sd_2002 - (12.572125251258569)) <= 1e-9 * max(1,abs(12.572125251258569)) if id==1
assert !missing(skew_2002) & abs(skew_2002 - (-0.51922371338299211)) <= 1e-9 * max(1,abs(-0.51922371338299211)) if id==1
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2002) & abs(gdd_2002 - (128.5)) <= 1e-9 * max(1,abs(128.5)) if id==1
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==1
assert !missing(heatdays_2002) & abs(heatdays_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==1
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2002) & abs(cut01_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut02_2002) & abs(cut02_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert missing(dev_gdd_2002) if id==1
assert missing(z_gdd_2002) if id==1
assert missing(dev_kdd_2002) if id==1
assert missing(z_kdd_2002) if id==1
assert missing(dev_heatdays_2002) if id==1
assert missing(z_heatdays_2002) if id==1
assert missing(dev_pct_heatdays_2002) if id==1
assert missing(z_pct_heatdays_2002) if id==1
assert missing(dev_heat_start_2002) if id==1
assert missing(z_heat_start_2002) if id==1
assert missing(dev_heat_2002) if id==1
assert missing(z_heat_2002) if id==1
assert missing(dev_heat_end_2002) if id==1
assert missing(z_heat_end_2002) if id==1
assert !missing(nobs_2003) & abs(nobs_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==1
assert !missing(mean_2003) & abs(mean_2003 - (18.75)) <= 1e-9 * max(1,abs(18.75)) if id==1
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(var_2003) & abs(var_2003 - (98.214285714285708)) <= 1e-9 * max(1,abs(98.214285714285708)) if id==1
assert !missing(sd_2003) & abs(sd_2003 - (9.9103120896511481)) <= 1e-9 * max(1,abs(9.9103120896511481)) if id==1
assert !missing(skew_2003) & abs(skew_2003 - (-0.86227905520534942)) <= 1e-9 * max(1,abs(-0.86227905520534942)) if id==1
assert !missing(max_2003) & abs(max_2003 - (30)) <= 1e-9 * max(1,abs(30)) if id==1
assert !missing(gdd_2003) & abs(gdd_2003 - (80)) <= 1e-9 * max(1,abs(80)) if id==1
assert !missing(kdd_2003) & abs(kdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays_2003) & abs(heatdays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==1
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2003) & abs(cut01_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2003) & abs(cut04_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(dev_gdd_2003) if id==1
assert missing(z_gdd_2003) if id==1
assert missing(dev_kdd_2003) if id==1
assert missing(z_kdd_2003) if id==1
assert missing(dev_heatdays_2003) if id==1
assert missing(z_heatdays_2003) if id==1
assert missing(dev_pct_heatdays_2003) if id==1
assert missing(z_pct_heatdays_2003) if id==1
assert missing(dev_heat_start_2003) if id==1
assert missing(z_heat_start_2003) if id==1
assert missing(dev_heat_2003) if id==1
assert missing(z_heat_2003) if id==1
assert missing(dev_heat_end_2003) if id==1
assert missing(z_heat_end_2003) if id==1
assert !missing(nobs_2004) & abs(nobs_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==1
assert !missing(mean_2004) & abs(mean_2004 - (19.222222222222221)) <= 1e-9 * max(1,abs(19.222222222222221)) if id==1
assert !missing(median_2004) & abs(median_2004 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==1
assert !missing(var_2004) & abs(var_2004 - (245.38194444444446)) <= 1e-9 * max(1,abs(245.38194444444446)) if id==1
assert !missing(sd_2004) & abs(sd_2004 - (15.664671858817997)) <= 1e-9 * max(1,abs(15.664671858817997)) if id==1
assert !missing(skew_2004) & abs(skew_2004 - (-1.0555000375781902)) <= 1e-9 * max(1,abs(-1.0555000375781902)) if id==1
assert !missing(max_2004) & abs(max_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==1
assert !missing(gdd_2004) & abs(gdd_2004 - (109)) <= 1e-9 * max(1,abs(109)) if id==1
assert !missing(kdd_2004) & abs(kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==1
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2004) & abs(heat_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (4.75)) <= 1e-9 * max(1,abs(4.75)) if id==1
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (0.13850545198499384)) <= 1e-9 * max(1,abs(0.13850545198499384)) if id==1
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-8)) <= 1e-9 * max(1,abs(-8)) if id==1
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert missing(z_heatdays_2004) if id==1
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.10833333333333331)) <= 1e-9 * max(1,abs(0.10833333333333331)) if id==1
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (3.064129385141706)) <= 1e-9 * max(1,abs(3.064129385141706)) if id==1
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_start_2004) if id==1
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert missing(z_heat_2004) if id==1
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_end_2004) if id==1
assert !missing(nobs_2005) & abs(nobs_2005 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(mean_2005) & abs(mean_2005 - (7.2000000000000002)) <= 1e-9 * max(1,abs(7.2000000000000002)) if id==1
assert !missing(median_2005) & abs(median_2005 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(var_2005) & abs(var_2005 - (300.62222222222221)) <= 1e-9 * max(1,abs(300.62222222222221)) if id==1
assert !missing(sd_2005) & abs(sd_2005 - (17.338460780075671)) <= 1e-9 * max(1,abs(17.338460780075671)) if id==1
assert !missing(skew_2005) & abs(skew_2005 - (0.28230515408438117)) <= 1e-9 * max(1,abs(0.28230515408438117)) if id==1
assert !missing(max_2005) & abs(max_2005 - (32)) <= 1e-9 * max(1,abs(32)) if id==1
assert !missing(gdd_2005) & abs(gdd_2005 - (60)) <= 1e-9 * max(1,abs(60)) if id==1
assert !missing(kdd_2005) & abs(kdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays_2005) & abs(heatdays_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==1
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2005) & abs(heat_end_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut01_2005) & abs(cut01_2005 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(cut03_2005) & abs(cut03_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04_2005) & abs(cut04_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (-34.5)) <= 1e-9 * max(1,abs(-34.5)) if id==1
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (-1.6824264793748891)) <= 1e-9 * max(1,abs(-1.6824264793748891)) if id==1
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_kdd_2005) if id==1
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==1
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (-0.091666666666666619)) <= 1e-9 * max(1,abs(-0.091666666666666619)) if id==1
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (-1.5556349186104041)) <= 1e-9 * max(1,abs(-1.5556349186104041)) if id==1
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(z_heat_start_2005) if id==1
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==1
assert !missing(z_heat_2005) & abs(z_heat_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==1
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert missing(z_heat_end_2005) if id==1
assert !missing(nobs_2000) & abs(nobs_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2000) & abs(mean_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2000) & abs(median_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2000) & abs(var_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2000) & abs(sd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2000) if id==2
assert !missing(max_2000) & abs(max_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2000) & abs(gdd_2000 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2000) & abs(kdd_2000 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2000) & abs(heatdays_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2000) & abs(heat_start_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2000) & abs(heat_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2000) & abs(heat_end_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2000) & abs(cut01_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2000) & abs(cut04_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(nobs_2001) & abs(nobs_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2001) & abs(mean_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2001) & abs(median_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2001) & abs(var_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2001) & abs(sd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2001) if id==2
assert !missing(max_2001) & abs(max_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2001) & abs(gdd_2001 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2001) & abs(kdd_2001 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2001) & abs(heatdays_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2001) & abs(heat_start_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2001) & abs(heat_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2001) & abs(heat_end_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2001) & abs(cut01_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2001) & abs(cut02_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2001) & abs(cut04_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(nobs_2002) & abs(nobs_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2002) & abs(mean_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2002) & abs(median_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2002) & abs(var_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2002) & abs(sd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2002) if id==2
assert !missing(max_2002) & abs(max_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2002) & abs(gdd_2002 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2002) & abs(kdd_2002 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2002) & abs(heatdays_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2002) & abs(heat_start_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2002) & abs(heat_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2002) & abs(heat_end_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2002) & abs(cut01_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2002) & abs(cut02_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2002) & abs(cut04_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2002) if id==2
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2002) if id==2
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2002) if id==2
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2002) if id==2
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_start_2002) if id==2
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2002) if id==2
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_end_2002) if id==2
assert !missing(nobs_2003) & abs(nobs_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2003) & abs(mean_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2003) & abs(median_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2003) & abs(var_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2003) & abs(sd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2003) if id==2
assert !missing(max_2003) & abs(max_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2003) & abs(gdd_2003 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2003) & abs(kdd_2003 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2003) & abs(heatdays_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2003) & abs(heat_start_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2003) & abs(heat_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2003) & abs(heat_end_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2003) & abs(cut01_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2003) & abs(cut02_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2003) & abs(cut03_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2003) & abs(cut04_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2003) if id==2
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2003) if id==2
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2003) if id==2
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2003) if id==2
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_start_2003) if id==2
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2003) if id==2
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_end_2003) if id==2
assert !missing(nobs_2004) & abs(nobs_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2004) & abs(mean_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2004) & abs(median_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2004) & abs(var_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2004) & abs(sd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2004) if id==2
assert !missing(max_2004) & abs(max_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2004) & abs(gdd_2004 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2004) & abs(kdd_2004 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2004) & abs(heatdays_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2004) & abs(heat_start_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2004) & abs(heat_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2004) & abs(heat_end_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2004) & abs(cut01_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2004) & abs(cut02_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2004) & abs(cut04_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2004) if id==2
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2004) if id==2
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2004) if id==2
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2004) if id==2
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_start_2004) if id==2
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2004) if id==2
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_end_2004) if id==2
assert !missing(nobs_2005) & abs(nobs_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(mean_2005) & abs(mean_2005 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2005) & abs(median_2005 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2005) & abs(var_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2005) & abs(sd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2005) if id==2
assert !missing(max_2005) & abs(max_2005 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2005) & abs(gdd_2005 - (240)) <= 1e-9 * max(1,abs(240)) if id==2
assert !missing(kdd_2005) & abs(kdd_2005 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(heatdays_2005) & abs(heatdays_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2005) & abs(heat_start_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_2005) & abs(heat_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(heat_end_2005) & abs(heat_end_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(cut01_2005) & abs(cut01_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2005) & abs(cut02_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2005) & abs(cut03_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2005) & abs(cut04_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==2
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2005) if id==2
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2005) if id==2
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2005) if id==2
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2005) if id==2
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_start_2005) if id==2
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2005) if id==2
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_end_2005) if id==2
assert !missing(nobs_2000) & abs(nobs_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2000) if id==3
assert missing(median_2000) if id==3
assert missing(var_2000) if id==3
assert missing(sd_2000) if id==3
assert missing(skew_2000) if id==3
assert missing(max_2000) if id==3
assert missing(gdd_2000) if id==3
assert missing(kdd_2000) if id==3
assert missing(heatdays_2000) if id==3
assert missing(pct_heatdays_2000) if id==3
assert missing(heat_start_2000) if id==3
assert missing(heat_2000) if id==3
assert missing(heat_end_2000) if id==3
assert missing(cut01_2000) if id==3
assert missing(cut02_2000) if id==3
assert missing(cut03_2000) if id==3
assert missing(cut04_2000) if id==3
assert !missing(nobs_2001) & abs(nobs_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2001) if id==3
assert missing(median_2001) if id==3
assert missing(var_2001) if id==3
assert missing(sd_2001) if id==3
assert missing(skew_2001) if id==3
assert missing(max_2001) if id==3
assert missing(gdd_2001) if id==3
assert missing(kdd_2001) if id==3
assert missing(heatdays_2001) if id==3
assert missing(pct_heatdays_2001) if id==3
assert missing(heat_start_2001) if id==3
assert missing(heat_2001) if id==3
assert missing(heat_end_2001) if id==3
assert missing(cut01_2001) if id==3
assert missing(cut02_2001) if id==3
assert missing(cut03_2001) if id==3
assert missing(cut04_2001) if id==3
assert !missing(nobs_2002) & abs(nobs_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2002) if id==3
assert missing(median_2002) if id==3
assert missing(var_2002) if id==3
assert missing(sd_2002) if id==3
assert missing(skew_2002) if id==3
assert missing(max_2002) if id==3
assert missing(gdd_2002) if id==3
assert missing(kdd_2002) if id==3
assert missing(heatdays_2002) if id==3
assert missing(pct_heatdays_2002) if id==3
assert missing(heat_start_2002) if id==3
assert missing(heat_2002) if id==3
assert missing(heat_end_2002) if id==3
assert missing(cut01_2002) if id==3
assert missing(cut02_2002) if id==3
assert missing(cut03_2002) if id==3
assert missing(cut04_2002) if id==3
assert missing(dev_gdd_2002) if id==3
assert missing(z_gdd_2002) if id==3
assert missing(dev_kdd_2002) if id==3
assert missing(z_kdd_2002) if id==3
assert missing(dev_heatdays_2002) if id==3
assert missing(z_heatdays_2002) if id==3
assert missing(dev_pct_heatdays_2002) if id==3
assert missing(z_pct_heatdays_2002) if id==3
assert missing(dev_heat_start_2002) if id==3
assert missing(z_heat_start_2002) if id==3
assert missing(dev_heat_2002) if id==3
assert missing(z_heat_2002) if id==3
assert missing(dev_heat_end_2002) if id==3
assert missing(z_heat_end_2002) if id==3
assert !missing(nobs_2003) & abs(nobs_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2003) if id==3
assert missing(median_2003) if id==3
assert missing(var_2003) if id==3
assert missing(sd_2003) if id==3
assert missing(skew_2003) if id==3
assert missing(max_2003) if id==3
assert missing(gdd_2003) if id==3
assert missing(kdd_2003) if id==3
assert missing(heatdays_2003) if id==3
assert missing(pct_heatdays_2003) if id==3
assert missing(heat_start_2003) if id==3
assert missing(heat_2003) if id==3
assert missing(heat_end_2003) if id==3
assert missing(cut01_2003) if id==3
assert missing(cut02_2003) if id==3
assert missing(cut03_2003) if id==3
assert missing(cut04_2003) if id==3
assert missing(dev_gdd_2003) if id==3
assert missing(z_gdd_2003) if id==3
assert missing(dev_kdd_2003) if id==3
assert missing(z_kdd_2003) if id==3
assert missing(dev_heatdays_2003) if id==3
assert missing(z_heatdays_2003) if id==3
assert missing(dev_pct_heatdays_2003) if id==3
assert missing(z_pct_heatdays_2003) if id==3
assert missing(dev_heat_start_2003) if id==3
assert missing(z_heat_start_2003) if id==3
assert missing(dev_heat_2003) if id==3
assert missing(z_heat_2003) if id==3
assert missing(dev_heat_end_2003) if id==3
assert missing(z_heat_end_2003) if id==3
assert !missing(nobs_2004) & abs(nobs_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2004) if id==3
assert missing(median_2004) if id==3
assert missing(var_2004) if id==3
assert missing(sd_2004) if id==3
assert missing(skew_2004) if id==3
assert missing(max_2004) if id==3
assert missing(gdd_2004) if id==3
assert missing(kdd_2004) if id==3
assert missing(heatdays_2004) if id==3
assert missing(pct_heatdays_2004) if id==3
assert missing(heat_start_2004) if id==3
assert missing(heat_2004) if id==3
assert missing(heat_end_2004) if id==3
assert missing(cut01_2004) if id==3
assert missing(cut02_2004) if id==3
assert missing(cut03_2004) if id==3
assert missing(cut04_2004) if id==3
assert missing(dev_gdd_2004) if id==3
assert missing(z_gdd_2004) if id==3
assert missing(dev_kdd_2004) if id==3
assert missing(z_kdd_2004) if id==3
assert missing(dev_heatdays_2004) if id==3
assert missing(z_heatdays_2004) if id==3
assert missing(dev_pct_heatdays_2004) if id==3
assert missing(z_pct_heatdays_2004) if id==3
assert missing(dev_heat_start_2004) if id==3
assert missing(z_heat_start_2004) if id==3
assert missing(dev_heat_2004) if id==3
assert missing(z_heat_2004) if id==3
assert missing(dev_heat_end_2004) if id==3
assert missing(z_heat_end_2004) if id==3
assert !missing(nobs_2005) & abs(nobs_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2005) if id==3
assert missing(median_2005) if id==3
assert missing(var_2005) if id==3
assert missing(sd_2005) if id==3
assert missing(skew_2005) if id==3
assert missing(max_2005) if id==3
assert missing(gdd_2005) if id==3
assert missing(kdd_2005) if id==3
assert missing(heatdays_2005) if id==3
assert missing(pct_heatdays_2005) if id==3
assert missing(heat_start_2005) if id==3
assert missing(heat_2005) if id==3
assert missing(heat_end_2005) if id==3
assert missing(cut01_2005) if id==3
assert missing(cut02_2005) if id==3
assert missing(cut03_2005) if id==3
assert missing(cut04_2005) if id==3
assert missing(dev_gdd_2005) if id==3
assert missing(z_gdd_2005) if id==3
assert missing(dev_kdd_2005) if id==3
assert missing(z_kdd_2005) if id==3
assert missing(dev_heatdays_2005) if id==3
assert missing(z_heatdays_2005) if id==3
assert missing(dev_pct_heatdays_2005) if id==3
assert missing(z_pct_heatdays_2005) if id==3
assert missing(dev_heat_start_2005) if id==3
assert missing(z_heat_start_2005) if id==3
assert missing(dev_heat_2005) if id==3
assert missing(z_heat_2005) if id==3
assert missing(dev_heat_end_2005) if id==3
assert missing(z_heat_end_2005) if id==3
assert !missing(nobs_2000) & abs(nobs_2000 - (9)) <= 1e-9 * max(1,abs(9)) if id==4
assert !missing(mean_2000) & abs(mean_2000 - (15.111111111111111)) <= 1e-9 * max(1,abs(15.111111111111111)) if id==4
assert !missing(median_2000) & abs(median_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(var_2000) & abs(var_2000 - (377.11111111111109)) <= 1e-9 * max(1,abs(377.11111111111109)) if id==4
assert !missing(sd_2000) & abs(sd_2000 - (19.419348884839344)) <= 1e-9 * max(1,abs(19.419348884839344)) if id==4
assert !missing(skew_2000) & abs(skew_2000 - (-0.12106686293883019)) <= 1e-9 * max(1,abs(-0.12106686293883019)) if id==4
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2000) & abs(gdd_2000 - (80)) <= 1e-9 * max(1,abs(80)) if id==4
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==4
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2000) & abs(heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_end_2000) & abs(heat_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut02_2000) & abs(cut02_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(nobs_2001) & abs(nobs_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(mean_2001) & abs(mean_2001 - (25.149999999999999)) <= 1e-9 * max(1,abs(25.149999999999999)) if id==4
assert !missing(median_2001) & abs(median_2001 - (30)) <= 1e-9 * max(1,abs(30)) if id==4
assert !missing(var_2001) & abs(var_2001 - (296.55833333333334)) <= 1e-9 * max(1,abs(296.55833333333334)) if id==4
assert !missing(sd_2001) & abs(sd_2001 - (17.220869122472692)) <= 1e-9 * max(1,abs(17.220869122472692)) if id==4
assert !missing(skew_2001) & abs(skew_2001 - (-1.3330571445419375)) <= 1e-9 * max(1,abs(-1.3330571445419375)) if id==4
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2001) & abs(gdd_2001 - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==4
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==4
assert !missing(heatdays_2001) & abs(heatdays_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==4
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2001) & abs(heat_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut04_2001) & abs(cut04_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(nobs_2002) & abs(nobs_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(mean_2002) & abs(mean_2002 - (29.071428571428573)) <= 1e-9 * max(1,abs(29.071428571428573)) if id==4
assert !missing(median_2002) & abs(median_2002 - (32)) <= 1e-9 * max(1,abs(32)) if id==4
assert !missing(var_2002) & abs(var_2002 - (117.03571428571429)) <= 1e-9 * max(1,abs(117.03571428571429)) if id==4
assert !missing(sd_2002) & abs(sd_2002 - (10.818304593868408)) <= 1e-9 * max(1,abs(10.818304593868408)) if id==4
assert !missing(skew_2002) & abs(skew_2002 - (-0.92556371690935979)) <= 1e-9 * max(1,abs(-0.92556371690935979)) if id==4
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2002) & abs(gdd_2002 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==4
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==4
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==4
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2002) & abs(cut01_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-5.25)) <= 1e-9 * max(1,abs(-5.25)) if id==4
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-0.10682908204976617)) <= 1e-9 * max(1,abs(-0.10682908204976617)) if id==4
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.049206349206349254)) <= 1e-9 * max(1,abs(0.049206349206349254)) if id==4
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (0.44735326973026518)) <= 1e-9 * max(1,abs(0.44735326973026518)) if id==4
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert missing(z_heat_start_2002) if id==4
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.35355339059327373)) <= 1e-9 * max(1,abs(-0.35355339059327373)) if id==4
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(nobs_2003) & abs(nobs_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(mean_2003) & abs(mean_2003 - (14)) <= 1e-9 * max(1,abs(14)) if id==4
assert !missing(median_2003) & abs(median_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(var_2003) & abs(var_2003 - (248.88888888888889)) <= 1e-9 * max(1,abs(248.88888888888889)) if id==4
assert !missing(sd_2003) & abs(sd_2003 - (15.77621275493231)) <= 1e-9 * max(1,abs(15.77621275493231)) if id==4
assert !missing(skew_2003) & abs(skew_2003 - (0.22921036149445248)) <= 1e-9 * max(1,abs(0.22921036149445248)) if id==4
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2003) & abs(gdd_2003 - (70)) <= 1e-9 * max(1,abs(70)) if id==4
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays_2003) & abs(heatdays_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==4
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-59.5)) <= 1e-9 * max(1,abs(-59.5)) if id==4
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-2.1036426740299787)) <= 1e-9 * max(1,abs(-2.1036426740299787)) if id==4
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-12)) <= 1e-9 * max(1,abs(-12)) if id==4
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==4
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==4
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.28571428571428564)) <= 1e-9 * max(1,abs(-0.28571428571428564)) if id==4
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-14.142135623730942)) <= 1e-9 * max(1,abs(-14.142135623730942)) if id==4
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==4
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==4
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_heat_end_2003) & abs(z_heat_end_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(nobs_2004) & abs(nobs_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==4
assert !missing(mean_2004) & abs(mean_2004 - (26.875)) <= 1e-9 * max(1,abs(26.875)) if id==4
assert !missing(median_2004) & abs(median_2004 - (30)) <= 1e-9 * max(1,abs(30)) if id==4
assert !missing(var_2004) & abs(var_2004 - (244.6875)) <= 1e-9 * max(1,abs(244.6875)) if id==4
assert !missing(sd_2004) & abs(sd_2004 - (15.642490210960657)) <= 1e-9 * max(1,abs(15.642490210960657)) if id==4
assert !missing(skew_2004) & abs(skew_2004 - (-1.7780723688313773)) <= 1e-9 * max(1,abs(-1.7780723688313773)) if id==4
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2004) & abs(gdd_2004 - (198.5)) <= 1e-9 * max(1,abs(198.5)) if id==4
assert !missing(kdd_2004) & abs(kdd_2004 - (24)) <= 1e-9 * max(1,abs(24)) if id==4
assert !missing(heatdays_2004) & abs(heatdays_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.58333333333333337)) <= 1e-9 * max(1,abs(0.58333333333333337)) if id==4
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2004) & abs(heat_end_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut02_2004) & abs(cut02_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut04_2004) & abs(cut04_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (108.75)) <= 1e-9 * max(1,abs(108.75)) if id==4
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (3.8935626559006096)) <= 1e-9 * max(1,abs(3.8935626559006096)) if id==4
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==4
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==4
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==4
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (4.9497474683058327)) <= 1e-9 * max(1,abs(4.9497474683058327)) if id==4
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.14761904761904765)) <= 1e-9 * max(1,abs(0.14761904761904765)) if id==4
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (0.76913369181694669)) <= 1e-9 * max(1,abs(0.76913369181694669)) if id==4
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert missing(z_heat_2004) if id==4
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==4
assert !missing(nobs_2005) & abs(nobs_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(mean_2005) & abs(mean_2005 - (14.875)) <= 1e-9 * max(1,abs(14.875)) if id==4
assert !missing(median_2005) & abs(median_2005 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==4
assert !missing(var_2005) & abs(var_2005 - (452.91071428571428)) <= 1e-9 * max(1,abs(452.91071428571428)) if id==4
assert !missing(sd_2005) & abs(sd_2005 - (21.281699046028123)) <= 1e-9 * max(1,abs(21.281699046028123)) if id==4
assert !missing(skew_2005) & abs(skew_2005 - (-0.40439801546761928)) <= 1e-9 * max(1,abs(-0.40439801546761928)) if id==4
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2005) & abs(gdd_2005 - (89)) <= 1e-9 * max(1,abs(89)) if id==4
assert !missing(kdd_2005) & abs(kdd_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays_2005) & abs(heatdays_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==4
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut03_2005) & abs(cut03_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut04_2005) & abs(cut04_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (-45.25)) <= 1e-9 * max(1,abs(-45.25)) if id==4
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (-0.49800127390959187)) <= 1e-9 * max(1,abs(-0.49800127390959187)) if id==4
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (-8)) <= 1e-9 * max(1,abs(-8)) if id==4
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (-3)) <= 1e-9 * max(1,abs(-3)) if id==4
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (-1.0606601717798212)) <= 1e-9 * max(1,abs(-1.0606601717798212)) if id==4
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (-0.19166666666666665)) <= 1e-9 * max(1,abs(-0.19166666666666665)) if id==4
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (-0.95667388042885815)) <= 1e-9 * max(1,abs(-0.95667388042885815)) if id==4
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert missing(z_heat_2005) if id==4
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert !missing(nobs_2000) & abs(nobs_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(mean_2000) & abs(mean_2000 - (13.4)) <= 1e-9 * max(1,abs(13.4)) if id==5
assert !missing(median_2000) & abs(median_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==5
assert !missing(var_2000) & abs(var_2000 - (528.04444444444448)) <= 1e-9 * max(1,abs(528.04444444444448)) if id==5
assert !missing(sd_2000) & abs(sd_2000 - (22.979217663890225)) <= 1e-9 * max(1,abs(22.979217663890225)) if id==5
assert !missing(skew_2000) & abs(skew_2000 - (0.016350684974998902)) <= 1e-9 * max(1,abs(0.016350684974998902)) if id==5
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2000) & abs(gdd_2000 - (100)) <= 1e-9 * max(1,abs(100)) if id==5
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2000) & abs(heat_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2000) & abs(cut01_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(nobs_2001) & abs(nobs_2001 - (11)) <= 1e-9 * max(1,abs(11)) if id==5
assert !missing(mean_2001) & abs(mean_2001 - (15.409090909090908)) <= 1e-9 * max(1,abs(15.409090909090908)) if id==5
assert !missing(median_2001) & abs(median_2001 - (20)) <= 1e-9 * max(1,abs(20)) if id==5
assert !missing(var_2001) & abs(var_2001 - (325.84090909090907)) <= 1e-9 * max(1,abs(325.84090909090907)) if id==5
assert !missing(sd_2001) & abs(sd_2001 - (18.05106393238108)) <= 1e-9 * max(1,abs(18.05106393238108)) if id==5
assert !missing(skew_2001) & abs(skew_2001 - (-0.27431615229346823)) <= 1e-9 * max(1,abs(-0.27431615229346823)) if id==5
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2001) & abs(gdd_2001 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==5
assert !missing(kdd_2001) & abs(kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(heatdays_2001) & abs(heatdays_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==5
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(heat_end_2001) & abs(heat_end_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut01_2001) & abs(cut01_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(cut02_2001) & abs(cut02_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut03_2001) & abs(cut03_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut04_2001) & abs(cut04_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(nobs_2002) & abs(nobs_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(mean_2002) & abs(mean_2002 - (27.333333333333332)) <= 1e-9 * max(1,abs(27.333333333333332)) if id==5
assert !missing(median_2002) & abs(median_2002 - (32)) <= 1e-9 * max(1,abs(32)) if id==5
assert !missing(var_2002) & abs(var_2002 - (231)) <= 1e-9 * max(1,abs(231)) if id==5
assert !missing(sd_2002) & abs(sd_2002 - (15.198684153570664)) <= 1e-9 * max(1,abs(15.198684153570664)) if id==5
assert !missing(skew_2002) & abs(skew_2002 - (-2.1982178335501876)) <= 1e-9 * max(1,abs(-2.1982178335501876)) if id==5
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2002) & abs(gdd_2002 - (150)) <= 1e-9 * max(1,abs(150)) if id==5
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(heatdays_2002) & abs(heatdays_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.77777777777777779)) <= 1e-9 * max(1,abs(0.77777777777777779)) if id==5
assert !missing(heat_start_2002) & abs(heat_start_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_end_2002) & abs(heat_end_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut01_2002) & abs(cut01_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut02_2002) & abs(cut02_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2002) & abs(cut04_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (45.25)) <= 1e-9 * max(1,abs(45.25)) if id==5
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (6.7361224944613207)) <= 1e-9 * max(1,abs(6.7361224944613207)) if id==5
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==5
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==5
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.34595959595959597)) <= 1e-9 * max(1,abs(0.34595959595959597)) if id==5
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (3.5879121860206302)) <= 1e-9 * max(1,abs(3.5879121860206302)) if id==5
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert missing(z_heat_start_2002) if id==5
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==5
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==5
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(nobs_2003) & abs(nobs_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==5
assert !missing(mean_2003) & abs(mean_2003 - (10.791666666666666)) <= 1e-9 * max(1,abs(10.791666666666666)) if id==5
assert !missing(median_2003) & abs(median_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(var_2003) & abs(var_2003 - (315.7026515151515)) <= 1e-9 * max(1,abs(315.7026515151515)) if id==5
assert !missing(sd_2003) & abs(sd_2003 - (17.768023286656046)) <= 1e-9 * max(1,abs(17.768023286656046)) if id==5
assert !missing(skew_2003) & abs(skew_2003 - (0.19761311142920251)) <= 1e-9 * max(1,abs(0.19761311142920251)) if id==5
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2003) & abs(gdd_2003 - (89.5)) <= 1e-9 * max(1,abs(89.5)) if id==5
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(heatdays_2003) & abs(heatdays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==5
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut01_2003) & abs(cut01_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==5
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-40.25)) <= 1e-9 * max(1,abs(-40.25)) if id==5
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-1.4054838490251129)) <= 1e-9 * max(1,abs(-1.4054838490251129)) if id==5
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==5
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==5
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==5
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.40404040404040409)) <= 1e-9 * max(1,abs(-0.40404040404040409)) if id==5
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-1.3797205486566781)) <= 1e-9 * max(1,abs(-1.3797205486566781)) if id==5
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==5
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert missing(z_heat_end_2003) if id==5
assert !missing(nobs_2004) & abs(nobs_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==5
assert !missing(mean_2004) & abs(mean_2004 - (21.958333333333332)) <= 1e-9 * max(1,abs(21.958333333333332)) if id==5
assert !missing(median_2004) & abs(median_2004 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==5
assert !missing(var_2004) & abs(var_2004 - (202.92992424242425)) <= 1e-9 * max(1,abs(202.92992424242425)) if id==5
assert !missing(sd_2004) & abs(sd_2004 - (14.245347459518994)) <= 1e-9 * max(1,abs(14.245347459518994)) if id==5
assert !missing(skew_2004) & abs(skew_2004 - (-0.37326203156596477)) <= 1e-9 * max(1,abs(-0.37326203156596477)) if id==5
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2004) & abs(gdd_2004 - (139.5)) <= 1e-9 * max(1,abs(139.5)) if id==5
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(heatdays_2004) & abs(heatdays_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==5
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_2004) & abs(heat_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut04_2004) & abs(cut04_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==5
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (0.46166475796477074)) <= 1e-9 * max(1,abs(0.46166475796477074)) if id==5
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (0.1414213562373095)) <= 1e-9 * max(1,abs(0.1414213562373095)) if id==5
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.055555555555555525)) <= 1e-9 * max(1,abs(-0.055555555555555525)) if id==5
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.12856486930664493)) <= 1e-9 * max(1,abs(-0.12856486930664493)) if id==5
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (-0.35355339059327373)) <= 1e-9 * max(1,abs(-0.35355339059327373)) if id==5
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert missing(z_heat_2004) if id==5
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==5
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==5
assert !missing(nobs_2005) & abs(nobs_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(mean_2005) & abs(mean_2005 - (16.25)) <= 1e-9 * max(1,abs(16.25)) if id==5
assert !missing(median_2005) & abs(median_2005 - (15)) <= 1e-9 * max(1,abs(15)) if id==5
assert !missing(var_2005) & abs(var_2005 - (483.92857142857144)) <= 1e-9 * max(1,abs(483.92857142857144)) if id==5
assert !missing(sd_2005) & abs(sd_2005 - (21.998376563477848)) <= 1e-9 * max(1,abs(21.998376563477848)) if id==5
assert !missing(skew_2005) & abs(skew_2005 - (-0.0083870664040166312)) <= 1e-9 * max(1,abs(-0.0083870664040166312)) if id==5
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2005) & abs(gdd_2005 - (70)) <= 1e-9 * max(1,abs(70)) if id==5
assert !missing(kdd_2005) & abs(kdd_2005 - (24)) <= 1e-9 * max(1,abs(24)) if id==5
assert !missing(heatdays_2005) & abs(heatdays_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==5
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2005) & abs(heat_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(heat_end_2005) & abs(heat_end_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut02_2005) & abs(cut02_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut03_2005) & abs(cut03_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut04_2005) & abs(cut04_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (-44.5)) <= 1e-9 * max(1,abs(-44.5)) if id==5
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (-1.2586500705120545)) <= 1e-9 * max(1,abs(-1.2586500705120545)) if id==5
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==5
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==5
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==5
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0.083333333333333315)) <= 1e-9 * max(1,abs(0.083333333333333315)) if id==5
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (0.47140452079103157)) <= 1e-9 * max(1,abs(0.47140452079103157)) if id==5
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==5
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==5
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(z_heat_2005) & abs(z_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==5
assert !missing(nobs_2000) & abs(nobs_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==6
assert !missing(mean_2000) & abs(mean_2000 - (19.100000000000001)) <= 1e-9 * max(1,abs(19.100000000000001)) if id==6
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==6
assert !missing(var_2000) & abs(var_2000 - (435.15555555555557)) <= 1e-9 * max(1,abs(435.15555555555557)) if id==6
assert !missing(sd_2000) & abs(sd_2000 - (20.860382440299496)) <= 1e-9 * max(1,abs(20.860382440299496)) if id==6
assert !missing(skew_2000) & abs(skew_2000 - (-0.76464423228965139)) <= 1e-9 * max(1,abs(-0.76464423228965139)) if id==6
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2000) & abs(gdd_2000 - (129)) <= 1e-9 * max(1,abs(129)) if id==6
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==6
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat_end_2000) & abs(heat_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut02_2000) & abs(cut02_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(nobs_2001) & abs(nobs_2001 - (11)) <= 1e-9 * max(1,abs(11)) if id==6
assert !missing(mean_2001) & abs(mean_2001 - (21.818181818181817)) <= 1e-9 * max(1,abs(21.818181818181817)) if id==6
assert !missing(median_2001) & abs(median_2001 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==6
assert !missing(var_2001) & abs(var_2001 - (156.86363636363637)) <= 1e-9 * max(1,abs(156.86363636363637)) if id==6
assert !missing(sd_2001) & abs(sd_2001 - (12.524521402578079)) <= 1e-9 * max(1,abs(12.524521402578079)) if id==6
assert !missing(skew_2001) & abs(skew_2001 - (-1.1487134243603756)) <= 1e-9 * max(1,abs(-1.1487134243603756)) if id==6
assert !missing(max_2001) & abs(max_2001 - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(gdd_2001) & abs(gdd_2001 - (148)) <= 1e-9 * max(1,abs(148)) if id==6
assert !missing(kdd_2001) & abs(kdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==6
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut02_2001) & abs(cut02_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut04_2001) & abs(cut04_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(nobs_2002) & abs(nobs_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==6
assert !missing(mean_2002) & abs(mean_2002 - (9.9583333333333339)) <= 1e-9 * max(1,abs(9.9583333333333339)) if id==6
assert !missing(median_2002) & abs(median_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(var_2002) & abs(var_2002 - (307.29356060606062)) <= 1e-9 * max(1,abs(307.29356060606062)) if id==6
assert !missing(sd_2002) & abs(sd_2002 - (17.529790660645684)) <= 1e-9 * max(1,abs(17.529790660645684)) if id==6
assert !missing(skew_2002) & abs(skew_2002 - (0.36123517495002216)) <= 1e-9 * max(1,abs(0.36123517495002216)) if id==6
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2002) & abs(gdd_2002 - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==6
assert !missing(kdd_2002) & abs(kdd_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(heatdays_2002) & abs(heatdays_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==6
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(cut02_2002) & abs(cut02_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2002) & abs(cut04_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-59)) <= 1e-9 * max(1,abs(-59)) if id==6
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-4.3915052726322426)) <= 1e-9 * max(1,abs(-4.3915052726322426)) if id==6
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==6
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==6
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.16969696969696971)) <= 1e-9 * max(1,abs(-0.16969696969696971)) if id==6
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-1.8856180831641263)) <= 1e-9 * max(1,abs(-1.8856180831641263)) if id==6
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert missing(z_heat_start_2002) if id==6
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(nobs_2003) & abs(nobs_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==6
assert !missing(mean_2003) & abs(mean_2003 - (17.833333333333332)) <= 1e-9 * max(1,abs(17.833333333333332)) if id==6
assert !missing(median_2003) & abs(median_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==6
assert !missing(var_2003) & abs(var_2003 - (284.69696969696969)) <= 1e-9 * max(1,abs(284.69696969696969)) if id==6
assert !missing(sd_2003) & abs(sd_2003 - (16.872965646174052)) <= 1e-9 * max(1,abs(16.872965646174052)) if id==6
assert !missing(skew_2003) & abs(skew_2003 - (-0.11505063093089786)) <= 1e-9 * max(1,abs(-0.11505063093089786)) if id==6
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2003) & abs(gdd_2003 - (110)) <= 1e-9 * max(1,abs(110)) if id==6
assert !missing(kdd_2003) & abs(kdd_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(heatdays_2003) & abs(heatdays_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.41666666666666669)) <= 1e-9 * max(1,abs(0.41666666666666669)) if id==6
assert !missing(heat_start_2003) & abs(heat_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-3.75)) <= 1e-9 * max(1,abs(-3.75)) if id==6
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-0.07742045049487746)) <= 1e-9 * max(1,abs(-0.07742045049487746)) if id==6
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==6
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==6
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==6
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.19696969696969702)) <= 1e-9 * max(1,abs(0.19696969696969702)) if id==6
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (2.6263966158357492)) <= 1e-9 * max(1,abs(2.6263966158357492)) if id==6
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert missing(z_heat_start_2003) if id==6
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert missing(z_heat_2003) if id==6
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert missing(z_heat_end_2003) if id==6
assert !missing(nobs_2004) & abs(nobs_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==6
assert !missing(mean_2004) & abs(mean_2004 - (19.333333333333332)) <= 1e-9 * max(1,abs(19.333333333333332)) if id==6
assert !missing(median_2004) & abs(median_2004 - (20)) <= 1e-9 * max(1,abs(20)) if id==6
assert !missing(var_2004) & abs(var_2004 - (273)) <= 1e-9 * max(1,abs(273)) if id==6
assert !missing(sd_2004) & abs(sd_2004 - (16.522711641858304)) <= 1e-9 * max(1,abs(16.522711641858304)) if id==6
assert !missing(skew_2004) & abs(skew_2004 - (-0.68313751332632477)) <= 1e-9 * max(1,abs(-0.68313751332632477)) if id==6
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2004) & abs(gdd_2004 - (100)) <= 1e-9 * max(1,abs(100)) if id==6
assert !missing(kdd_2004) & abs(kdd_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(heatdays_2004) & abs(heatdays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==6
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut02_2004) & abs(cut02_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (5.25)) <= 1e-9 * max(1,abs(5.25)) if id==6
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (0.24343020335930324)) <= 1e-9 * max(1,abs(0.24343020335930324)) if id==6
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==6
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (0.23570226039551587)) <= 1e-9 * max(1,abs(0.23570226039551587)) if id==6
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.15277777777777773)) <= 1e-9 * max(1,abs(0.15277777777777773)) if id==6
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (0.86424162145022443)) <= 1e-9 * max(1,abs(0.86424162145022443)) if id==6
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(nobs_2005) & abs(nobs_2005 - (10)) <= 1e-9 * max(1,abs(10)) if id==6
assert !missing(mean_2005) & abs(mean_2005 - (20.949999999999999)) <= 1e-9 * max(1,abs(20.949999999999999)) if id==6
assert !missing(median_2005) & abs(median_2005 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==6
assert !missing(var_2005) & abs(var_2005 - (364.58055555555558)) <= 1e-9 * max(1,abs(364.58055555555558)) if id==6
assert !missing(sd_2005) & abs(sd_2005 - (19.093992656214038)) <= 1e-9 * max(1,abs(19.093992656214038)) if id==6
assert !missing(skew_2005) & abs(skew_2005 - (-0.52877048626865519)) <= 1e-9 * max(1,abs(-0.52877048626865519)) if id==6
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2005) & abs(gdd_2005 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==6
assert !missing(kdd_2005) & abs(kdd_2005 - (24)) <= 1e-9 * max(1,abs(24)) if id==6
assert !missing(heatdays_2005) & abs(heatdays_2005 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(heat_start_2005) & abs(heat_start_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut02_2005) & abs(cut02_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut03_2005) & abs(cut03_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut04_2005) & abs(cut04_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (14.5)) <= 1e-9 * max(1,abs(14.5)) if id==6
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (2.0506096654409878)) <= 1e-9 * max(1,abs(2.0506096654409878)) if id==6
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==6
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==6
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0.06944444444444442)) <= 1e-9 * max(1,abs(0.06944444444444442)) if id==6
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (3.5355339059327417)) <= 1e-9 * max(1,abs(3.5355339059327417)) if id==6
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==6
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==6
assert !missing(z_heat_2005) & abs(z_heat_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==6
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert missing(z_heat_end_2005) if id==6
assert !missing(nobs_2000) & abs(nobs_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(mean_2000) & abs(mean_2000 - (23.149999999999999)) <= 1e-9 * max(1,abs(23.149999999999999)) if id==7
assert !missing(median_2000) & abs(median_2000 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==7
assert !missing(var_2000) & abs(var_2000 - (181.66944444444445)) <= 1e-9 * max(1,abs(181.66944444444445)) if id==7
assert !missing(sd_2000) & abs(sd_2000 - (13.478480791411339)) <= 1e-9 * max(1,abs(13.478480791411339)) if id==7
assert !missing(skew_2000) & abs(skew_2000 - (-0.35043262004278369)) <= 1e-9 * max(1,abs(-0.35043262004278369)) if id==7
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2000) & abs(gdd_2000 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==7
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==7
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2000) & abs(heat_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(heat_end_2000) & abs(heat_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2000) & abs(cut01_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut02_2000) & abs(cut02_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(nobs_2001) & abs(nobs_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(mean_2001) & abs(mean_2001 - (10.5)) <= 1e-9 * max(1,abs(10.5)) if id==7
assert !missing(median_2001) & abs(median_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(var_2001) & abs(var_2001 - (423.71428571428572)) <= 1e-9 * max(1,abs(423.71428571428572)) if id==7
assert !missing(sd_2001) & abs(sd_2001 - (20.584321356660894)) <= 1e-9 * max(1,abs(20.584321356660894)) if id==7
assert !missing(skew_2001) & abs(skew_2001 - (0.54260965536182759)) <= 1e-9 * max(1,abs(0.54260965536182759)) if id==7
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2001) & abs(gdd_2001 - (60)) <= 1e-9 * max(1,abs(60)) if id==7
assert !missing(kdd_2001) & abs(kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==7
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2001) & abs(cut01_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut02_2001) & abs(cut02_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(nobs_2002) & abs(nobs_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==7
assert !missing(mean_2002) & abs(mean_2002 - (14.083333333333334)) <= 1e-9 * max(1,abs(14.083333333333334)) if id==7
assert !missing(median_2002) & abs(median_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==7
assert !missing(var_2002) & abs(var_2002 - (350.94696969696969)) <= 1e-9 * max(1,abs(350.94696969696969)) if id==7
assert !missing(sd_2002) & abs(sd_2002 - (18.733578667648359)) <= 1e-9 * max(1,abs(18.733578667648359)) if id==7
assert !missing(skew_2002) & abs(skew_2002 - (-0.037788374951321771)) <= 1e-9 * max(1,abs(-0.037788374951321771)) if id==7
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2002) & abs(gdd_2002 - (99)) <= 1e-9 * max(1,abs(99)) if id==7
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2002) & abs(heatdays_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==7
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2002) & abs(cut01_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(cut02_2002) & abs(cut02_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (9.25)) <= 1e-9 * max(1,abs(9.25)) if id==7
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.21985673028489294)) <= 1e-9 * max(1,abs(0.21985673028489294)) if id==7
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==7
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==7
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.22083333333333335)) <= 1e-9 * max(1,abs(-0.22083333333333335)) if id==7
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-12.492219800962328)) <= 1e-9 * max(1,abs(-12.492219800962328)) if id==7
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_start_2002) if id==7
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_end_2002) if id==7
assert !missing(nobs_2003) & abs(nobs_2003 - (11)) <= 1e-9 * max(1,abs(11)) if id==7
assert !missing(mean_2003) & abs(mean_2003 - (19.772727272727273)) <= 1e-9 * max(1,abs(19.772727272727273)) if id==7
assert !missing(median_2003) & abs(median_2003 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==7
assert !missing(var_2003) & abs(var_2003 - (286.56818181818181)) <= 1e-9 * max(1,abs(286.56818181818181)) if id==7
assert !missing(sd_2003) & abs(sd_2003 - (16.928324837921259)) <= 1e-9 * max(1,abs(16.928324837921259)) if id==7
assert !missing(skew_2003) & abs(skew_2003 - (-0.66203013004704425)) <= 1e-9 * max(1,abs(-0.66203013004704425)) if id==7
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2003) & abs(gdd_2003 - (129.5)) <= 1e-9 * max(1,abs(129.5)) if id==7
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(heatdays_2003) & abs(heatdays_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==7
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut02_2003) & abs(cut02_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut03_2003) & abs(cut03_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2003) & abs(cut04_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (50)) <= 1e-9 * max(1,abs(50)) if id==7
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (1.8130943107347373)) <= 1e-9 * max(1,abs(1.8130943107347373)) if id==7
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==7
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==7
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==7
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.18371212121212122)) <= 1e-9 * max(1,abs(0.18371212121212122)) if id==7
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (1.2470792322744566)) <= 1e-9 * max(1,abs(1.2470792322744566)) if id==7
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_start_2003) if id==7
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert missing(z_heat_2003) if id==7
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_end_2003) if id==7
assert !missing(nobs_2004) & abs(nobs_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(mean_2004) & abs(mean_2004 - (13.949999999999999)) <= 1e-9 * max(1,abs(13.949999999999999)) if id==7
assert !missing(median_2004) & abs(median_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==7
assert !missing(var_2004) & abs(var_2004 - (269.35833333333335)) <= 1e-9 * max(1,abs(269.35833333333335)) if id==7
assert !missing(sd_2004) & abs(sd_2004 - (16.412139815798955)) <= 1e-9 * max(1,abs(16.412139815798955)) if id==7
assert !missing(skew_2004) & abs(skew_2004 - (-0.43759859207713253)) <= 1e-9 * max(1,abs(-0.43759859207713253)) if id==7
assert !missing(max_2004) & abs(max_2004 - (30)) <= 1e-9 * max(1,abs(30)) if id==7
assert !missing(gdd_2004) & abs(gdd_2004 - (89.5)) <= 1e-9 * max(1,abs(89.5)) if id==7
assert !missing(kdd_2004) & abs(kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==7
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2004) & abs(cut01_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(cut03_2004) & abs(cut03_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut04_2004) & abs(cut04_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-24.75)) <= 1e-9 * max(1,abs(-24.75)) if id==7
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-1.1475995301224295)) <= 1e-9 * max(1,abs(-1.1475995301224295)) if id==7
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-12)) <= 1e-9 * max(1,abs(-12)) if id==7
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==7
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==7
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.010606060606060619)) <= 1e-9 * max(1,abs(-0.010606060606060619)) if id==7
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.052102604929535147)) <= 1e-9 * max(1,abs(-0.052102604929535147)) if id==7
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_start_2004) if id==7
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(z_heat_2004) & abs(z_heat_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==7
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert missing(z_heat_end_2004) if id==7
assert !missing(nobs_2005) & abs(nobs_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(mean_2005) & abs(mean_2005 - (26.375)) <= 1e-9 * max(1,abs(26.375)) if id==7
assert !missing(median_2005) & abs(median_2005 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==7
assert !missing(var_2005) & abs(var_2005 - (199.91071428571428)) <= 1e-9 * max(1,abs(199.91071428571428)) if id==7
assert !missing(sd_2005) & abs(sd_2005 - (14.138978544637313)) <= 1e-9 * max(1,abs(14.138978544637313)) if id==7
assert !missing(skew_2005) & abs(skew_2005 - (-1.1720882355854161)) <= 1e-9 * max(1,abs(-1.1720882355854161)) if id==7
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2005) & abs(gdd_2005 - (119)) <= 1e-9 * max(1,abs(119)) if id==7
assert !missing(kdd_2005) & abs(kdd_2005 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2005) & abs(heatdays_2005 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(heat_start_2005) & abs(heat_start_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_2005) & abs(heat_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2005) & abs(cut01_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut03_2005) & abs(cut03_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut04_2005) & abs(cut04_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==7
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (0.33587572106361008)) <= 1e-9 * max(1,abs(0.33587572106361008)) if id==7
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==7
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==7
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0.12272727272727274)) <= 1e-9 * max(1,abs(0.12272727272727274)) if id==7
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (1.1230519465903992)) <= 1e-9 * max(1,abs(1.1230519465903992)) if id==7
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert missing(z_heat_start_2005) if id==7
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert missing(z_heat_2005) if id==7
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==7
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==7
assert !missing(nobs_2000) & abs(nobs_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2000) & abs(mean_2000 - (17.399999999999999)) <= 1e-9 * max(1,abs(17.399999999999999)) if id==8
assert !missing(median_2000) & abs(median_2000 - (25)) <= 1e-9 * max(1,abs(25)) if id==8
assert !missing(var_2000) & abs(var_2000 - (346.71111111111111)) <= 1e-9 * max(1,abs(346.71111111111111)) if id==8
assert !missing(sd_2000) & abs(sd_2000 - (18.620180211563774)) <= 1e-9 * max(1,abs(18.620180211563774)) if id==8
assert !missing(skew_2000) & abs(skew_2000 - (-0.53846991581140757)) <= 1e-9 * max(1,abs(-0.53846991581140757)) if id==8
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2000) & abs(gdd_2000 - (110)) <= 1e-9 * max(1,abs(110)) if id==8
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut02_2000) & abs(cut02_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(nobs_2001) & abs(nobs_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2001) & abs(mean_2001 - (19)) <= 1e-9 * max(1,abs(19)) if id==8
assert !missing(median_2001) & abs(median_2001 - (20)) <= 1e-9 * max(1,abs(20)) if id==8
assert !missing(var_2001) & abs(var_2001 - (276.66666666666669)) <= 1e-9 * max(1,abs(276.66666666666669)) if id==8
assert !missing(sd_2001) & abs(sd_2001 - (16.633299933166199)) <= 1e-9 * max(1,abs(16.633299933166199)) if id==8
assert !missing(skew_2001) & abs(skew_2001 - (-0.34768401660268994)) <= 1e-9 * max(1,abs(-0.34768401660268994)) if id==8
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2001) & abs(gdd_2001 - (100)) <= 1e-9 * max(1,abs(100)) if id==8
assert !missing(kdd_2001) & abs(kdd_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays_2001) & abs(heatdays_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(heat_start_2001) & abs(heat_start_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut02_2001) & abs(cut02_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(nobs_2002) & abs(nobs_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2002) & abs(mean_2002 - (13.199999999999999)) <= 1e-9 * max(1,abs(13.199999999999999)) if id==8
assert !missing(median_2002) & abs(median_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(var_2002) & abs(var_2002 - (409.06666666666666)) <= 1e-9 * max(1,abs(409.06666666666666)) if id==8
assert !missing(sd_2002) & abs(sd_2002 - (20.225396576252013)) <= 1e-9 * max(1,abs(20.225396576252013)) if id==8
assert !missing(skew_2002) & abs(skew_2002 - (0.3017815034523546)) <= 1e-9 * max(1,abs(0.3017815034523546)) if id==8
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2002) & abs(gdd_2002 - (80)) <= 1e-9 * max(1,abs(80)) if id==8
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end_2002) & abs(heat_end_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut01_2002) & abs(cut01_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(cut02_2002) & abs(cut02_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-25)) <= 1e-9 * max(1,abs(-25)) if id==8
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==8
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==8
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(z_heat_start_2002) & abs(z_heat_start_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==8
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert missing(z_heat_end_2002) if id==8
assert !missing(nobs_2003) & abs(nobs_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2003) & abs(mean_2003 - (12.9)) <= 1e-9 * max(1,abs(12.9)) if id==8
assert !missing(median_2003) & abs(median_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==8
assert !missing(var_2003) & abs(var_2003 - (375.15555555555557)) <= 1e-9 * max(1,abs(375.15555555555557)) if id==8
assert !missing(sd_2003) & abs(sd_2003 - (19.368932741778924)) <= 1e-9 * max(1,abs(19.368932741778924)) if id==8
assert !missing(skew_2003) & abs(skew_2003 - (-0.072419313491673826)) <= 1e-9 * max(1,abs(-0.072419313491673826)) if id==8
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2003) & abs(gdd_2003 - (89)) <= 1e-9 * max(1,abs(89)) if id==8
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(heatdays_2003) & abs(heatdays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8
assert !missing(heat_start_2003) & abs(heat_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-0.070710678118654752)) <= 1e-9 * max(1,abs(-0.070710678118654752)) if id==8
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-8)) <= 1e-9 * max(1,abs(-8)) if id==8
assert missing(z_kdd_2003) if id==8
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8
assert missing(z_heatdays_2003) if id==8
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.20000000000000001)) <= 1e-9 * max(1,abs(-0.20000000000000001)) if id==8
assert missing(z_pct_heatdays_2003) if id==8
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heat_2003) if id==8
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(z_heat_end_2003) & abs(z_heat_end_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(nobs_2004) & abs(nobs_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2004) & abs(mean_2004 - (20.550000000000001)) <= 1e-9 * max(1,abs(20.550000000000001)) if id==8
assert !missing(median_2004) & abs(median_2004 - (30.75)) <= 1e-9 * max(1,abs(30.75)) if id==8
assert !missing(var_2004) & abs(var_2004 - (368.80277777777781)) <= 1e-9 * max(1,abs(368.80277777777781)) if id==8
assert !missing(sd_2004) & abs(sd_2004 - (19.204238536786033)) <= 1e-9 * max(1,abs(19.204238536786033)) if id==8
assert !missing(skew_2004) & abs(skew_2004 - (-0.77335733493123016)) <= 1e-9 * max(1,abs(-0.77335733493123016)) if id==8
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2004) & abs(gdd_2004 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==8
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays_2004) & abs(heatdays_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(heat_start_2004) & abs(heat_start_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut02_2004) & abs(cut02_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut04_2004) & abs(cut04_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==8
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (5.4997194092287032)) <= 1e-9 * max(1,abs(5.4997194092287032)) if id==8
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==8
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.19999999999999996)) <= 1e-9 * max(1,abs(0.19999999999999996)) if id==8
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (1.4142135623730947)) <= 1e-9 * max(1,abs(1.4142135623730947)) if id==8
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heat_2004) if id==8
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==8
assert !missing(nobs_2005) & abs(nobs_2005 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean_2005) & abs(mean_2005 - (28.600000000000001)) <= 1e-9 * max(1,abs(28.600000000000001)) if id==8
assert !missing(median_2005) & abs(median_2005 - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(var_2005) & abs(var_2005 - (132.48888888888888)) <= 1e-9 * max(1,abs(132.48888888888888)) if id==8
assert !missing(sd_2005) & abs(sd_2005 - (11.510381787277471)) <= 1e-9 * max(1,abs(11.510381787277471)) if id==8
assert !missing(skew_2005) & abs(skew_2005 - (-0.81425259754603385)) <= 1e-9 * max(1,abs(-0.81425259754603385)) if id==8
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2005) & abs(gdd_2005 - (150)) <= 1e-9 * max(1,abs(150)) if id==8
assert !missing(kdd_2005) & abs(kdd_2005 - (24)) <= 1e-9 * max(1,abs(24)) if id==8
assert !missing(heatdays_2005) & abs(heatdays_2005 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.69999999999999996)) <= 1e-9 * max(1,abs(0.69999999999999996)) if id==8
assert !missing(heat_start_2005) & abs(heat_start_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_end_2005) & abs(heat_end_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut01_2005) & abs(cut01_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut03_2005) & abs(cut03_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2005) & abs(cut04_2005 - (6)) <= 1e-9 * max(1,abs(6)) if id==8
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (45.75)) <= 1e-9 * max(1,abs(45.75)) if id==8
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (12)) <= 1e-9 * max(1,abs(12)) if id==8
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==8
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (1.649915822768611)) <= 1e-9 * max(1,abs(1.649915822768611)) if id==8
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0.34999999999999998)) <= 1e-9 * max(1,abs(0.34999999999999998)) if id==8
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (1.6499158227686108)) <= 1e-9 * max(1,abs(1.6499158227686108)) if id==8
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heat_2005) if id==8
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert missing(z_heat_end_2005) if id==8
assert !missing(nobs_2000) & abs(nobs_2000 - (11)) <= 1e-9 * max(1,abs(11)) if id==9
assert !missing(mean_2000) & abs(mean_2000 - (17.227272727272727)) <= 1e-9 * max(1,abs(17.227272727272727)) if id==9
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==9
assert !missing(var_2000) & abs(var_2000 - (520.56818181818187)) <= 1e-9 * max(1,abs(520.56818181818187)) if id==9
assert !missing(sd_2000) & abs(sd_2000 - (22.815963311203451)) <= 1e-9 * max(1,abs(22.815963311203451)) if id==9
assert !missing(skew_2000) & abs(skew_2000 - (-0.20175769748330527)) <= 1e-9 * max(1,abs(-0.20175769748330527)) if id==9
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2000) & abs(gdd_2000 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9
assert !missing(kdd_2000) & abs(kdd_2000 - (32)) <= 1e-9 * max(1,abs(32)) if id==9
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.45454545454545453)) <= 1e-9 * max(1,abs(0.45454545454545453)) if id==9
assert !missing(heat_start_2000) & abs(heat_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_2000) & abs(heat_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2000) & abs(cut01_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02_2000) & abs(cut02_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(nobs_2001) & abs(nobs_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==9
assert !missing(mean_2001) & abs(mean_2001 - (21.300000000000001)) <= 1e-9 * max(1,abs(21.300000000000001)) if id==9
assert !missing(median_2001) & abs(median_2001 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==9
assert !missing(var_2001) & abs(var_2001 - (305.73333333333335)) <= 1e-9 * max(1,abs(305.73333333333335)) if id==9
assert !missing(sd_2001) & abs(sd_2001 - (17.485231863871103)) <= 1e-9 * max(1,abs(17.485231863871103)) if id==9
assert !missing(skew_2001) & abs(skew_2001 - (-1.0024050159618094)) <= 1e-9 * max(1,abs(-1.0024050159618094)) if id==9
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2001) & abs(gdd_2001 - (139)) <= 1e-9 * max(1,abs(139)) if id==9
assert !missing(kdd_2001) & abs(kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays_2001) & abs(heatdays_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9
assert !missing(heat_start_2001) & abs(heat_start_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2001) & abs(heat_end_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut01_2001) & abs(cut01_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(nobs_2002) & abs(nobs_2002 - (11)) <= 1e-9 * max(1,abs(11)) if id==9
assert !missing(mean_2002) & abs(mean_2002 - (12.318181818181818)) <= 1e-9 * max(1,abs(12.318181818181818)) if id==9
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var_2002) & abs(var_2002 - (397.31363636363636)) <= 1e-9 * max(1,abs(397.31363636363636)) if id==9
assert !missing(sd_2002) & abs(sd_2002 - (19.932727770268585)) <= 1e-9 * max(1,abs(19.932727770268585)) if id==9
assert !missing(skew_2002) & abs(skew_2002 - (-0.19151592989138055)) <= 1e-9 * max(1,abs(-0.19151592989138055)) if id==9
assert !missing(max_2002) & abs(max_2002 - (32)) <= 1e-9 * max(1,abs(32)) if id==9
assert !missing(gdd_2002) & abs(gdd_2002 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==9
assert !missing(kdd_2002) & abs(kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==9
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2002) & abs(cut01_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-19.75)) <= 1e-9 * max(1,abs(-19.75)) if id==9
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-1.4323445054804425)) <= 1e-9 * max(1,abs(-1.4323445054804425)) if id==9
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (-20)) <= 1e-9 * max(1,abs(-20)) if id==9
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==9
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert missing(z_heatdays_2002) if id==9
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.11363636363636365)) <= 1e-9 * max(1,abs(-0.11363636363636365)) if id==9
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-3.5355339059327369)) <= 1e-9 * max(1,abs(-3.5355339059327369)) if id==9
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert missing(z_heat_start_2002) if id==9
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_heat_2002) & abs(z_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(nobs_2003) & abs(nobs_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==9
assert !missing(mean_2003) & abs(mean_2003 - (13.949999999999999)) <= 1e-9 * max(1,abs(13.949999999999999)) if id==9
assert !missing(median_2003) & abs(median_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(var_2003) & abs(var_2003 - (269.35833333333335)) <= 1e-9 * max(1,abs(269.35833333333335)) if id==9
assert !missing(sd_2003) & abs(sd_2003 - (16.412139815798955)) <= 1e-9 * max(1,abs(16.412139815798955)) if id==9
assert !missing(skew_2003) & abs(skew_2003 - (0.12791674069679965)) <= 1e-9 * max(1,abs(0.12791674069679965)) if id==9
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2003) & abs(gdd_2003 - (79.5)) <= 1e-9 * max(1,abs(79.5)) if id==9
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays_2003) & abs(heatdays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-44.75)) <= 1e-9 * max(1,abs(-44.75)) if id==9
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-2.1452900649557964)) <= 1e-9 * max(1,abs(-2.1452900649557964)) if id==9
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==9
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==9
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.23181818181818181)) <= 1e-9 * max(1,abs(-0.23181818181818181)) if id==9
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-2.4041630560342617)) <= 1e-9 * max(1,abs(-2.4041630560342617)) if id==9
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_heat_end_2003) & abs(z_heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs_2004) & abs(nobs_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==9
assert !missing(mean_2004) & abs(mean_2004 - (19.149999999999999)) <= 1e-9 * max(1,abs(19.149999999999999)) if id==9
assert !missing(median_2004) & abs(median_2004 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==9
assert !missing(var_2004) & abs(var_2004 - (303.00277777777779)) <= 1e-9 * max(1,abs(303.00277777777779)) if id==9
assert !missing(sd_2004) & abs(sd_2004 - (17.406974974928232)) <= 1e-9 * max(1,abs(17.406974974928232)) if id==9
assert !missing(skew_2004) & abs(skew_2004 - (-0.93361927906382847)) <= 1e-9 * max(1,abs(-0.93361927906382847)) if id==9
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2004) & abs(gdd_2004 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9
assert !missing(kdd_2004) & abs(kdd_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays_2004) & abs(heatdays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==9
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2004) & abs(heat_end_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (25)) <= 1e-9 * max(1,abs(25)) if id==9
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (1.1785113019775793)) <= 1e-9 * max(1,abs(1.1785113019775793)) if id==9
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.11818181818181817)) <= 1e-9 * max(1,abs(0.11818181818181817)) if id==9
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (1.0213764617139018)) <= 1e-9 * max(1,abs(1.0213764617139018)) if id==9
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert missing(z_heat_start_2004) if id==9
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==9
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==9
assert !missing(nobs_2005) & abs(nobs_2005 - (9)) <= 1e-9 * max(1,abs(9)) if id==9
assert !missing(mean_2005) & abs(mean_2005 - (12.166666666666666)) <= 1e-9 * max(1,abs(12.166666666666666)) if id==9
assert !missing(median_2005) & abs(median_2005 - (10)) <= 1e-9 * max(1,abs(10)) if id==9
assert !missing(var_2005) & abs(var_2005 - (292.25)) <= 1e-9 * max(1,abs(292.25)) if id==9
assert !missing(sd_2005) & abs(sd_2005 - (17.095320997278758)) <= 1e-9 * max(1,abs(17.095320997278758)) if id==9
assert !missing(skew_2005) & abs(skew_2005 - (0.13273547579360423)) <= 1e-9 * max(1,abs(0.13273547579360423)) if id==9
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2005) & abs(gdd_2005 - (59.5)) <= 1e-9 * max(1,abs(59.5)) if id==9
assert !missing(kdd_2005) & abs(kdd_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(heatdays_2005) & abs(heatdays_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.1111111111111111)) <= 1e-9 * max(1,abs(0.1111111111111111)) if id==9
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(cut02_2005) & abs(cut02_2005 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut03_2005) & abs(cut03_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut04_2005) & abs(cut04_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (-40)) <= 1e-9 * max(1,abs(-40)) if id==9
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==9
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_kdd_2005) if id==9
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==9
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==9
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (-0.18888888888888894)) <= 1e-9 * max(1,abs(-0.18888888888888894)) if id==9
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (-1.3356461422412569)) <= 1e-9 * max(1,abs(-1.3356461422412569)) if id==9
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert missing(z_heat_2005) if id==9
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==9
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==9
assert !missing(nobs_2000) & abs(nobs_2000 - (9)) <= 1e-9 * max(1,abs(9)) if id==10
assert !missing(mean_2000) & abs(mean_2000 - (21.444444444444443)) <= 1e-9 * max(1,abs(21.444444444444443)) if id==10
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==10
assert !missing(var_2000) & abs(var_2000 - (368.71527777777777)) <= 1e-9 * max(1,abs(368.71527777777777)) if id==10
assert !missing(sd_2000) & abs(sd_2000 - (19.201960258728217)) <= 1e-9 * max(1,abs(19.201960258728217)) if id==10
assert !missing(skew_2000) & abs(skew_2000 - (-0.78627940156471854)) <= 1e-9 * max(1,abs(-0.78627940156471854)) if id==10
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2000) & abs(gdd_2000 - (119)) <= 1e-9 * max(1,abs(119)) if id==10
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==10
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2000) & abs(heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(heat_end_2000) & abs(heat_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut02_2000) & abs(cut02_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(nobs_2001) & abs(nobs_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(mean_2001) & abs(mean_2001 - (14.1)) <= 1e-9 * max(1,abs(14.1)) if id==10
assert !missing(median_2001) & abs(median_2001 - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==10
assert !missing(var_2001) & abs(var_2001 - (408.48888888888888)) <= 1e-9 * max(1,abs(408.48888888888888)) if id==10
assert !missing(sd_2001) & abs(sd_2001 - (20.211108056929707)) <= 1e-9 * max(1,abs(20.211108056929707)) if id==10
assert !missing(skew_2001) & abs(skew_2001 - (-0.17548119014852609)) <= 1e-9 * max(1,abs(-0.17548119014852609)) if id==10
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2001) & abs(gdd_2001 - (99)) <= 1e-9 * max(1,abs(99)) if id==10
assert !missing(kdd_2001) & abs(kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==10
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2001) & abs(cut01_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut02_2001) & abs(cut02_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(nobs_2002) & abs(nobs_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(mean_2002) & abs(mean_2002 - (27.9375)) <= 1e-9 * max(1,abs(27.9375)) if id==10
assert !missing(median_2002) & abs(median_2002 - (31)) <= 1e-9 * max(1,abs(31)) if id==10
assert !missing(var_2002) & abs(var_2002 - (139.17410714285714)) <= 1e-9 * max(1,abs(139.17410714285714)) if id==10
assert !missing(sd_2002) & abs(sd_2002 - (11.797207599379488)) <= 1e-9 * max(1,abs(11.797207599379488)) if id==10
assert !missing(skew_2002) & abs(skew_2002 - (-0.91486589347277592)) <= 1e-9 * max(1,abs(-0.91486589347277592)) if id==10
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2002) & abs(gdd_2002 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==10
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(heatdays_2002) & abs(heatdays_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==10
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2002) & abs(cut01_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (10.5)) <= 1e-9 * max(1,abs(10.5)) if id==10
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.74246212024587488)) <= 1e-9 * max(1,abs(0.74246212024587488)) if id==10
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.25277777777777777)) <= 1e-9 * max(1,abs(0.25277777777777777)) if id==10
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (2.4748737341529163)) <= 1e-9 * max(1,abs(2.4748737341529163)) if id==10
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_start_2002) if id==10
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10
assert !missing(z_heat_2002) & abs(z_heat_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==10
assert !missing(nobs_2003) & abs(nobs_2003 - (11)) <= 1e-9 * max(1,abs(11)) if id==10
assert !missing(mean_2003) & abs(mean_2003 - (21.045454545454547)) <= 1e-9 * max(1,abs(21.045454545454547)) if id==10
assert !missing(median_2003) & abs(median_2003 - (30)) <= 1e-9 * max(1,abs(30)) if id==10
assert !missing(var_2003) & abs(var_2003 - (432.2227272727273)) <= 1e-9 * max(1,abs(432.2227272727273)) if id==10
assert !missing(sd_2003) & abs(sd_2003 - (20.789966985849865)) <= 1e-9 * max(1,abs(20.789966985849865)) if id==10
assert !missing(skew_2003) & abs(skew_2003 - (-0.89747552862823643)) <= 1e-9 * max(1,abs(-0.89747552862823643)) if id==10
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2003) & abs(gdd_2003 - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==10
assert !missing(kdd_2003) & abs(kdd_2003 - (24)) <= 1e-9 * max(1,abs(24)) if id==10
assert !missing(heatdays_2003) & abs(heatdays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==10
assert !missing(heat_start_2003) & abs(heat_start_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut02_2003) & abs(cut02_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (40.25)) <= 1e-9 * max(1,abs(40.25)) if id==10
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (2.7766876041715647)) <= 1e-9 * max(1,abs(2.7766876041715647)) if id==10
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (12)) <= 1e-9 * max(1,abs(12)) if id==10
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==10
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==10
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.082954545454545392)) <= 1e-9 * max(1,abs(0.082954545454545392)) if id==10
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (0.36097059459173375)) <= 1e-9 * max(1,abs(0.36097059459173375)) if id==10
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert missing(z_heat_start_2003) if id==10
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2003) if id==10
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10
assert !missing(z_heat_end_2003) & abs(z_heat_end_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(nobs_2004) & abs(nobs_2004 - (11)) <= 1e-9 * max(1,abs(11)) if id==10
assert !missing(mean_2004) & abs(mean_2004 - (12.909090909090908)) <= 1e-9 * max(1,abs(12.909090909090908)) if id==10
assert !missing(median_2004) & abs(median_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(var_2004) & abs(var_2004 - (229.09090909090909)) <= 1e-9 * max(1,abs(229.09090909090909)) if id==10
assert !missing(sd_2004) & abs(sd_2004 - (15.135749373285391)) <= 1e-9 * max(1,abs(15.135749373285391)) if id==10
assert !missing(skew_2004) & abs(skew_2004 - (-0.30370649536116029)) <= 1e-9 * max(1,abs(-0.30370649536116029)) if id==10
assert !missing(max_2004) & abs(max_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==10
assert !missing(gdd_2004) & abs(gdd_2004 - (80)) <= 1e-9 * max(1,abs(80)) if id==10
assert !missing(kdd_2004) & abs(kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==10
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2004) & abs(cut01_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut04_2004) & abs(cut04_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-54.5)) <= 1e-9 * max(1,abs(-54.5)) if id==10
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-2.5691546383111228)) <= 1e-9 * max(1,abs(-2.5691546383111228)) if id==10
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-20)) <= 1e-9 * max(1,abs(-20)) if id==10
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==10
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==10
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==10
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.3125)) <= 1e-9 * max(1,abs(-0.3125)) if id==10
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-5.5558389950371563)) <= 1e-9 * max(1,abs(-5.5558389950371563)) if id==10
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2004) if id==10
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(nobs_2005) & abs(nobs_2005 - (11)) <= 1e-9 * max(1,abs(11)) if id==10
assert !missing(mean_2005) & abs(mean_2005 - (18)) <= 1e-9 * max(1,abs(18)) if id==10
assert !missing(median_2005) & abs(median_2005 - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(var_2005) & abs(var_2005 - (251.69999999999999)) <= 1e-9 * max(1,abs(251.69999999999999)) if id==10
assert !missing(sd_2005) & abs(sd_2005 - (15.865055940651454)) <= 1e-9 * max(1,abs(15.865055940651454)) if id==10
assert !missing(skew_2005) & abs(skew_2005 - (-0.53197058440628175)) <= 1e-9 * max(1,abs(-0.53197058440628175)) if id==10
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2005) & abs(gdd_2005 - (118)) <= 1e-9 * max(1,abs(118)) if id==10
assert !missing(kdd_2005) & abs(kdd_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(heatdays_2005) & abs(heatdays_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.090909090909090912)) <= 1e-9 * max(1,abs(0.090909090909090912)) if id==10
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2005) & abs(heat_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut02_2005) & abs(cut02_2005 - (7)) <= 1e-9 * max(1,abs(7)) if id==10
assert !missing(cut03_2005) & abs(cut03_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04_2005) & abs(cut04_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (3.25)) <= 1e-9 * max(1,abs(3.25)) if id==10
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (0.066132288887950488)) <= 1e-9 * max(1,abs(0.066132288887950488)) if id==10
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==10
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (-0.23570226039551587)) <= 1e-9 * max(1,abs(-0.23570226039551587)) if id==10
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==10
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==10
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (-0.31818181818181812)) <= 1e-9 * max(1,abs(-0.31818181818181812)) if id==10
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (-1.6499158227686106)) <= 1e-9 * max(1,abs(-1.6499158227686106)) if id==10
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert missing(z_heat_2005) if id==10
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_end_2005) if id==10
assert !missing(nobs_2000) & abs(nobs_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==11
assert !missing(mean_2000) & abs(mean_2000 - (20.399999999999999)) <= 1e-9 * max(1,abs(20.399999999999999)) if id==11
assert !missing(median_2000) & abs(median_2000 - (30)) <= 1e-9 * max(1,abs(30)) if id==11
assert !missing(var_2000) & abs(var_2000 - (320.71111111111111)) <= 1e-9 * max(1,abs(320.71111111111111)) if id==11
assert !missing(sd_2000) & abs(sd_2000 - (17.908408949739535)) <= 1e-9 * max(1,abs(17.908408949739535)) if id==11
assert !missing(skew_2000) & abs(skew_2000 - (-1.0642196750410116)) <= 1e-9 * max(1,abs(-1.0642196750410116)) if id==11
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(gdd_2000) & abs(gdd_2000 - (130)) <= 1e-9 * max(1,abs(130)) if id==11
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(heatdays_2000) & abs(heatdays_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_end_2000) & abs(heat_end_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut01_2000) & abs(cut01_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2000) & abs(cut02_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(nobs_2001) & abs(nobs_2001 - (11)) <= 1e-9 * max(1,abs(11)) if id==11
assert !missing(mean_2001) & abs(mean_2001 - (18.454545454545453)) <= 1e-9 * max(1,abs(18.454545454545453)) if id==11
assert !missing(median_2001) & abs(median_2001 - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(var_2001) & abs(var_2001 - (164.22272727272727)) <= 1e-9 * max(1,abs(164.22272727272727)) if id==11
assert !missing(sd_2001) & abs(sd_2001 - (12.814941563375436)) <= 1e-9 * max(1,abs(12.814941563375436)) if id==11
assert !missing(skew_2001) & abs(skew_2001 - (-0.3005274246465261)) <= 1e-9 * max(1,abs(-0.3005274246465261)) if id==11
assert !missing(max_2001) & abs(max_2001 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2001) & abs(gdd_2001 - (109)) <= 1e-9 * max(1,abs(109)) if id==11
assert !missing(kdd_2001) & abs(kdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==11
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2001) & abs(cut02_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(nobs_2002) & abs(nobs_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(mean_2002) & abs(mean_2002 - (19.166666666666668)) <= 1e-9 * max(1,abs(19.166666666666668)) if id==11
assert !missing(median_2002) & abs(median_2002 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==11
assert !missing(var_2002) & abs(var_2002 - (244.0625)) <= 1e-9 * max(1,abs(244.0625)) if id==11
assert !missing(sd_2002) & abs(sd_2002 - (15.622499799967994)) <= 1e-9 * max(1,abs(15.622499799967994)) if id==11
assert !missing(skew_2002) & abs(skew_2002 - (-1.0573632651909481)) <= 1e-9 * max(1,abs(-1.0573632651909481)) if id==11
assert !missing(max_2002) & abs(max_2002 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2002) & abs(gdd_2002 - (108.5)) <= 1e-9 * max(1,abs(108.5)) if id==11
assert !missing(kdd_2002) & abs(kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2002) & abs(heatdays_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==11
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2002) & abs(cut01_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-11)) <= 1e-9 * max(1,abs(-11)) if id==11
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-0.7407785326716213)) <= 1e-9 * max(1,abs(-0.7407785326716213)) if id==11
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==11
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-1.1785113019775793)) <= 1e-9 * max(1,abs(-1.1785113019775793)) if id==11
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.21414141414141413)) <= 1e-9 * max(1,abs(-0.21414141414141413)) if id==11
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.92534961488609913)) <= 1e-9 * max(1,abs(-0.92534961488609913)) if id==11
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert missing(z_heat_start_2002) if id==11
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert missing(z_heat_2002) if id==11
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(nobs_2003) & abs(nobs_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(mean_2003) & abs(mean_2003 - (19.9375)) <= 1e-9 * max(1,abs(19.9375)) if id==11
assert !missing(median_2003) & abs(median_2003 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==11
assert !missing(var_2003) & abs(var_2003 - (370.03125)) <= 1e-9 * max(1,abs(370.03125)) if id==11
assert !missing(sd_2003) & abs(sd_2003 - (19.236196349590529)) <= 1e-9 * max(1,abs(19.236196349590529)) if id==11
assert !missing(skew_2003) & abs(skew_2003 - (-1.1147324269792853)) <= 1e-9 * max(1,abs(-1.1147324269792853)) if id==11
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(gdd_2003) & abs(gdd_2003 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==11
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(heatdays_2003) & abs(heatdays_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(heat_start_2003) & abs(heat_start_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(heat_2003) & abs(heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(cut01_2003) & abs(cut01_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2003) & abs(cut02_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut03_2003) & abs(cut03_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (0.75)) <= 1e-9 * max(1,abs(0.75)) if id==11
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert missing(z_kdd_2003) if id==11
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.25252525252525254)) <= 1e-9 * max(1,abs(0.25252525252525254)) if id==11
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (7.0710678118654764)) <= 1e-9 * max(1,abs(7.0710678118654764)) if id==11
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==11
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==11
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==11
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert missing(z_heat_end_2003) if id==11
assert !missing(nobs_2004) & abs(nobs_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(mean_2004) & abs(mean_2004 - (11.333333333333334)) <= 1e-9 * max(1,abs(11.333333333333334)) if id==11
assert !missing(median_2004) & abs(median_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==11
assert !missing(var_2004) & abs(var_2004 - (246)) <= 1e-9 * max(1,abs(246)) if id==11
assert !missing(sd_2004) & abs(sd_2004 - (15.684387141358123)) <= 1e-9 * max(1,abs(15.684387141358123)) if id==11
assert !missing(skew_2004) & abs(skew_2004 - (-0.17683312320502373)) <= 1e-9 * max(1,abs(-0.17683312320502373)) if id==11
assert !missing(max_2004) & abs(max_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2004) & abs(gdd_2004 - (60)) <= 1e-9 * max(1,abs(60)) if id==11
assert !missing(kdd_2004) & abs(kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2004) & abs(heatdays_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==11
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2004) & abs(cut01_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(cut04_2004) & abs(cut04_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-49)) <= 1e-9 * max(1,abs(-49)) if id==11
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-69.296464556281649)) <= 1e-9 * max(1,abs(-69.296464556281649)) if id==11
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.1388888888888889)) <= 1e-9 * max(1,abs(-0.1388888888888889)) if id==11
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==11
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==11
assert !missing(z_heat_2004) & abs(z_heat_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(nobs_2005) & abs(nobs_2005 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(mean_2005) & abs(mean_2005 - (12.444444444444445)) <= 1e-9 * max(1,abs(12.444444444444445)) if id==11
assert !missing(median_2005) & abs(median_2005 - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(var_2005) & abs(var_2005 - (328.77777777777777)) <= 1e-9 * max(1,abs(328.77777777777777)) if id==11
assert !missing(sd_2005) & abs(sd_2005 - (18.132230358612198)) <= 1e-9 * max(1,abs(18.132230358612198)) if id==11
assert !missing(skew_2005) & abs(skew_2005 - (-0.39822895903975669)) <= 1e-9 * max(1,abs(-0.39822895903975669)) if id==11
assert !missing(max_2005) & abs(max_2005 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2005) & abs(gdd_2005 - (80)) <= 1e-9 * max(1,abs(80)) if id==11
assert !missing(kdd_2005) & abs(kdd_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2005) & abs(heatdays_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==11
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2005) & abs(heat_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2005) & abs(cut01_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut03_2005) & abs(cut03_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2005) & abs(cut04_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (-4.75)) <= 1e-9 * max(1,abs(-4.75)) if id==11
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (-0.13570736204590306)) <= 1e-9 * max(1,abs(-0.13570736204590306)) if id==11
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==11
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_heatdays_2005) & abs(z_heatdays_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (-0.02777777777777779)) <= 1e-9 * max(1,abs(-0.02777777777777779)) if id==11
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (-0.14142135623730956)) <= 1e-9 * max(1,abs(-0.14142135623730956)) if id==11
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==11
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==11
assert !missing(z_heat_2005) & abs(z_heat_2005 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==11
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(nobs_2000) & abs(nobs_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==12
assert !missing(mean_2000) & abs(mean_2000 - (17.458333333333332)) <= 1e-9 * max(1,abs(17.458333333333332)) if id==12
assert !missing(median_2000) & abs(median_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==12
assert !missing(var_2000) & abs(var_2000 - (201.15719696969697)) <= 1e-9 * max(1,abs(201.15719696969697)) if id==12
assert !missing(sd_2000) & abs(sd_2000 - (14.182989704914016)) <= 1e-9 * max(1,abs(14.182989704914016)) if id==12
assert !missing(skew_2000) & abs(skew_2000 - (0.073662554445579315)) <= 1e-9 * max(1,abs(0.073662554445579315)) if id==12
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2000) & abs(gdd_2000 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==12
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==12
assert !missing(heat_start_2000) & abs(heat_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_2000) & abs(heat_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut02_2000) & abs(cut02_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut04_2000) & abs(cut04_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(nobs_2001) & abs(nobs_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(mean_2001) & abs(mean_2001 - (23.149999999999999)) <= 1e-9 * max(1,abs(23.149999999999999)) if id==12
assert !missing(median_2001) & abs(median_2001 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==12
assert !missing(var_2001) & abs(var_2001 - (137.22499999999999)) <= 1e-9 * max(1,abs(137.22499999999999)) if id==12
assert !missing(sd_2001) & abs(sd_2001 - (11.714307491268956)) <= 1e-9 * max(1,abs(11.714307491268956)) if id==12
assert !missing(skew_2001) & abs(skew_2001 - (-0.20720374960923399)) <= 1e-9 * max(1,abs(-0.20720374960923399)) if id==12
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2001) & abs(gdd_2001 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==12
assert !missing(kdd_2001) & abs(kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(heatdays_2001) & abs(heatdays_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2001) & abs(heat_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2001) & abs(cut01_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut02_2001) & abs(cut02_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(cut03_2001) & abs(cut03_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(nobs_2002) & abs(nobs_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(mean_2002) & abs(mean_2002 - (18.300000000000001)) <= 1e-9 * max(1,abs(18.300000000000001)) if id==12
assert !missing(median_2002) & abs(median_2002 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12
assert !missing(var_2002) & abs(var_2002 - (404.39999999999998)) <= 1e-9 * max(1,abs(404.39999999999998)) if id==12
assert !missing(sd_2002) & abs(sd_2002 - (20.109699152399074)) <= 1e-9 * max(1,abs(20.109699152399074)) if id==12
assert !missing(skew_2002) & abs(skew_2002 - (-0.82349585384406243)) <= 1e-9 * max(1,abs(-0.82349585384406243)) if id==12
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2002) & abs(gdd_2002 - (129)) <= 1e-9 * max(1,abs(129)) if id==12
assert !missing(kdd_2002) & abs(kdd_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==12
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2002) & abs(cut01_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (14.5)) <= 1e-9 * max(1,abs(14.5)) if id==12
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (2.0506096654409878)) <= 1e-9 * max(1,abs(2.0506096654409878)) if id==12
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert missing(z_kdd_2002) if id==12
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.016666666666666607)) <= 1e-9 * max(1,abs(-0.016666666666666607)) if id==12
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.14142135623730898)) <= 1e-9 * max(1,abs(-0.14142135623730898)) if id==12
assert !missing(dev_heat_start_2002) & abs(dev_heat_start_2002 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(z_heat_start_2002) & abs(z_heat_start_2002 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12
assert !missing(dev_heat_end_2002) & abs(dev_heat_end_2002 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heat_end_2002) & abs(z_heat_end_2002 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(nobs_2003) & abs(nobs_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(mean_2003) & abs(mean_2003 - (21.199999999999999)) <= 1e-9 * max(1,abs(21.199999999999999)) if id==12
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==12
assert !missing(var_2003) & abs(var_2003 - (192.17777777777778)) <= 1e-9 * max(1,abs(192.17777777777778)) if id==12
assert !missing(sd_2003) & abs(sd_2003 - (13.862819979274699)) <= 1e-9 * max(1,abs(13.862819979274699)) if id==12
assert !missing(skew_2003) & abs(skew_2003 - (0.077373719629164311)) <= 1e-9 * max(1,abs(0.077373719629164311)) if id==12
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2003) & abs(gdd_2003 - (100)) <= 1e-9 * max(1,abs(100)) if id==12
assert !missing(kdd_2003) & abs(kdd_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(heatdays_2003) & abs(heatdays_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==12
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_end_2003) & abs(heat_end_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut01_2003) & abs(cut01_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-24.25)) <= 1e-9 * max(1,abs(-24.25)) if id==12
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-3.6099661986892162)) <= 1e-9 * max(1,abs(-3.6099661986892162)) if id==12
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert missing(z_kdd_2003) if id==12
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.049999999999999989)) <= 1e-9 * max(1,abs(-0.049999999999999989)) if id==12
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_heat_start_2003) & abs(dev_heat_start_2003 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heat_start_2003) & abs(z_heat_start_2003 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==12
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-1.4142135623730949)) <= 1e-9 * max(1,abs(-1.4142135623730949)) if id==12
assert !missing(dev_heat_end_2003) & abs(dev_heat_end_2003 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==12
assert !missing(z_heat_end_2003) & abs(z_heat_end_2003 - (3.5355339059327373)) <= 1e-9 * max(1,abs(3.5355339059327373)) if id==12
assert !missing(nobs_2004) & abs(nobs_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(mean_2004) & abs(mean_2004 - (23.5)) <= 1e-9 * max(1,abs(23.5)) if id==12
assert !missing(median_2004) & abs(median_2004 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12
assert !missing(var_2004) & abs(var_2004 - (303)) <= 1e-9 * max(1,abs(303)) if id==12
assert !missing(sd_2004) & abs(sd_2004 - (17.406895185529212)) <= 1e-9 * max(1,abs(17.406895185529212)) if id==12
assert !missing(skew_2004) & abs(skew_2004 - (-0.86088952453744727)) <= 1e-9 * max(1,abs(-0.86088952453744727)) if id==12
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2004) & abs(gdd_2004 - (109.5)) <= 1e-9 * max(1,abs(109.5)) if id==12
assert !missing(kdd_2004) & abs(kdd_2004 - (24)) <= 1e-9 * max(1,abs(24)) if id==12
assert !missing(heatdays_2004) & abs(heatdays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==12
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_2004) & abs(heat_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2004) & abs(cut01_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut04_2004) & abs(cut04_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-5)) <= 1e-9 * max(1,abs(-5)) if id==12
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-0.24382992454708538)) <= 1e-9 * max(1,abs(-0.24382992454708538)) if id==12
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (12)) <= 1e-9 * max(1,abs(12)) if id==12
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==12
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert missing(z_heatdays_2004) if id==12
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.044444444444444398)) <= 1e-9 * max(1,abs(0.044444444444444398)) if id==12
assert missing(z_pct_heatdays_2004) if id==12
assert !missing(dev_heat_start_2004) & abs(dev_heat_start_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==12
assert !missing(z_heat_start_2004) & abs(z_heat_start_2004 - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==12
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==12
assert !missing(z_heat_2004) & abs(z_heat_2004 - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==12
assert !missing(dev_heat_end_2004) & abs(dev_heat_end_2004 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12
assert !missing(z_heat_end_2004) & abs(z_heat_end_2004 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==12
assert !missing(nobs_2005) & abs(nobs_2005 - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(mean_2005) & abs(mean_2005 - (25.100000000000001)) <= 1e-9 * max(1,abs(25.100000000000001)) if id==12
assert !missing(median_2005) & abs(median_2005 - (30)) <= 1e-9 * max(1,abs(30)) if id==12
assert !missing(var_2005) & abs(var_2005 - (207.15555555555557)) <= 1e-9 * max(1,abs(207.15555555555557)) if id==12
assert !missing(sd_2005) & abs(sd_2005 - (14.392899483966238)) <= 1e-9 * max(1,abs(14.392899483966238)) if id==12
assert !missing(skew_2005) & abs(skew_2005 - (-1.9755202126322406)) <= 1e-9 * max(1,abs(-1.9755202126322406)) if id==12
assert !missing(max_2005) & abs(max_2005 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2005) & abs(gdd_2005 - (159)) <= 1e-9 * max(1,abs(159)) if id==12
assert !missing(kdd_2005) & abs(kdd_2005 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(heatdays_2005) & abs(heatdays_2005 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(pct_heatdays_2005) & abs(pct_heatdays_2005 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==12
assert !missing(heat_start_2005) & abs(heat_start_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2005) & abs(heat_2005 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(heat_end_2005) & abs(heat_end_2005 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2005) & abs(cut01_2005 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut02_2005) & abs(cut02_2005 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut03_2005) & abs(cut03_2005 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut04_2005) & abs(cut04_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dev_gdd_2005) & abs(dev_gdd_2005 - (54.25)) <= 1e-9 * max(1,abs(54.25)) if id==12
assert !missing(z_gdd_2005) & abs(z_gdd_2005 - (8.0759037640779372)) <= 1e-9 * max(1,abs(8.0759037640779372)) if id==12
assert !missing(dev_kdd_2005) & abs(dev_kdd_2005 - (-12)) <= 1e-9 * max(1,abs(-12)) if id==12
assert !missing(z_kdd_2005) & abs(z_kdd_2005 - (-2.1213203435596424)) <= 1e-9 * max(1,abs(-2.1213203435596424)) if id==12
assert !missing(dev_heatdays_2005) & abs(dev_heatdays_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert missing(z_heatdays_2005) if id==12
assert !missing(dev_pct_heatdays_2005) & abs(dev_pct_heatdays_2005 - (0.17777777777777776)) <= 1e-9 * max(1,abs(0.17777777777777776)) if id==12
assert !missing(z_pct_heatdays_2005) & abs(z_pct_heatdays_2005 - (5.656854249492385)) <= 1e-9 * max(1,abs(5.656854249492385)) if id==12
assert !missing(dev_heat_start_2005) & abs(dev_heat_start_2005 - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==12
assert !missing(z_heat_start_2005) & abs(z_heat_start_2005 - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==12
assert !missing(dev_heat_2005) & abs(dev_heat_2005 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(z_heat_2005) & abs(z_heat_2005 - (1.4142135623730949)) <= 1e-9 * max(1,abs(1.4142135623730949)) if id==12
assert !missing(dev_heat_end_2005) & abs(dev_heat_end_2005 - (-1.5)) <= 1e-9 * max(1,abs(-1.5)) if id==12
assert !missing(z_heat_end_2005) & abs(z_heat_end_2005 - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==12
assert _N==12
