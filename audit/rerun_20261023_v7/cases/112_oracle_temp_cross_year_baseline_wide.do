version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261023_v7/oracle_temp.csv", clear varnames(1) asdouble
wxsum x_, type(temp) gdd_lo(10) gdd_hi(30) heat_threshold(30) kdd_base(32) ini_month(12) ini_day(29) fin_month(3) fin_day(2) baseline(2000 2002) ref_min(2) minobs(2) shape(wide) keep(id) cuts(10 30 32)
assert !missing(nobs_2000) & abs(nobs_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(mean_2000) & abs(mean_2000 - (30)) <= 1e-9 * max(1,abs(30)) if id==1
assert !missing(median_2000) & abs(median_2000 - (30)) <= 1e-9 * max(1,abs(30)) if id==1
assert !missing(var_2000) & abs(var_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(sd_2000) & abs(sd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert missing(skew_2000) if id==1
assert !missing(max_2000) & abs(max_2000 - (30)) <= 1e-9 * max(1,abs(30)) if id==1
assert !missing(gdd_2000) & abs(gdd_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(kdd_2000) & abs(kdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heatdays_2000) & abs(heatdays_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_start_2000) & abs(heat_start_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(heat_end_2000) & abs(heat_end_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut01_2000) & abs(cut01_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2000) & abs(cut04_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (-69.5)) <= 1e-9 * max(1,abs(-69.5)) if id==1
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (-1.1518326249654953)) <= 1e-9 * max(1,abs(-1.1518326249654953)) if id==1
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-10.666666666666666)) <= 1e-9 * max(1,abs(-10.666666666666666)) if id==1
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-0.87287156094396945)) <= 1e-9 * max(1,abs(-0.87287156094396945)) if id==1
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==1
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==1
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.4642857142857143)) <= 1e-9 * max(1,abs(0.4642857142857143)) if id==1
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (1.1445861782233111)) <= 1e-9 * max(1,abs(1.1445861782233111)) if id==1
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==1
assert !missing(z_heat_2000) & abs(z_heat_2000 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==1
assert !missing(nobs_2001) & abs(nobs_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==1
assert !missing(mean_2001) & abs(mean_2001 - (23.208333333333332)) <= 1e-9 * max(1,abs(23.208333333333332)) if id==1
assert !missing(median_2001) & abs(median_2001 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==1
assert !missing(var_2001) & abs(var_2001 - (204.29356060606059)) <= 1e-9 * max(1,abs(204.29356060606059)) if id==1
assert !missing(sd_2001) & abs(sd_2001 - (14.293129839403985)) <= 1e-9 * max(1,abs(14.293129839403985)) if id==1
assert !missing(skew_2001) & abs(skew_2001 - (-0.46527181849679183)) <= 1e-9 * max(1,abs(-0.46527181849679183)) if id==1
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2001) & abs(gdd_2001 - (148.5)) <= 1e-9 * max(1,abs(148.5)) if id==1
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==1
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==1
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut02_2001) & abs(cut02_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (39)) <= 1e-9 * max(1,abs(39)) if id==1
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.64635212048423474)) <= 1e-9 * max(1,abs(0.64635212048423474)) if id==1
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (13.333333333333334)) <= 1e-9 * max(1,abs(13.333333333333334)) if id==1
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==1
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==1
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==1
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.2857142857142857)) <= 1e-9 * max(1,abs(-0.2857142857142857)) if id==1
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.70436072506049896)) <= 1e-9 * max(1,abs(-0.70436072506049896)) if id==1
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2002) & abs(nobs_2002 - (14)) <= 1e-9 * max(1,abs(14)) if id==1
assert !missing(mean_2002) & abs(mean_2002 - (16.428571428571427)) <= 1e-9 * max(1,abs(16.428571428571427)) if id==1
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(var_2002) & abs(var_2002 - (255.49450549450549)) <= 1e-9 * max(1,abs(255.49450549450549)) if id==1
assert !missing(sd_2002) & abs(sd_2002 - (15.984195491000024)) <= 1e-9 * max(1,abs(15.984195491000024)) if id==1
assert !missing(skew_2002) & abs(skew_2002 - (-0.50049437924507556)) <= 1e-9 * max(1,abs(-0.50049437924507556)) if id==1
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2002) & abs(gdd_2002 - (140)) <= 1e-9 * max(1,abs(140)) if id==1
assert !missing(kdd_2002) & abs(kdd_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==1
assert !missing(heatdays_2002) & abs(heatdays_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.35714285714285715)) <= 1e-9 * max(1,abs(0.35714285714285715)) if id==1
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2002) & abs(heat_end_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut01_2002) & abs(cut01_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut03_2002) & abs(cut03_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(cut04_2002) & abs(cut04_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (30.5)) <= 1e-9 * max(1,abs(30.5)) if id==1
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.50548050448126058)) <= 1e-9 * max(1,abs(0.50548050448126058)) if id==1
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (-2.6666666666666661)) <= 1e-9 * max(1,abs(-2.6666666666666661)) if id==1
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==1
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==1
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==1
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.17857142857142855)) <= 1e-9 * max(1,abs(-0.17857142857142855)) if id==1
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.44022545316281186)) <= 1e-9 * max(1,abs(-0.44022545316281186)) if id==1
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2003) & abs(nobs_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==1
assert !missing(mean_2003) & abs(mean_2003 - (14.833333333333334)) <= 1e-9 * max(1,abs(14.833333333333334)) if id==1
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==1
assert !missing(var_2003) & abs(var_2003 - (332.73809523809524)) <= 1e-9 * max(1,abs(332.73809523809524)) if id==1
assert !missing(sd_2003) & abs(sd_2003 - (18.241110033057069)) <= 1e-9 * max(1,abs(18.241110033057069)) if id==1
assert !missing(skew_2003) & abs(skew_2003 - (-0.22675332123028749)) <= 1e-9 * max(1,abs(-0.22675332123028749)) if id==1
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2003) & abs(gdd_2003 - (148.5)) <= 1e-9 * max(1,abs(148.5)) if id==1
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==1
assert !missing(heatdays_2003) & abs(heatdays_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.26666666666666666)) <= 1e-9 * max(1,abs(0.26666666666666666)) if id==1
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2003) & abs(heat_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2003) & abs(cut01_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (39)) <= 1e-9 * max(1,abs(39)) if id==1
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (0.64635212048423474)) <= 1e-9 * max(1,abs(0.64635212048423474)) if id==1
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-2.6666666666666661)) <= 1e-9 * max(1,abs(-2.6666666666666661)) if id==1
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==1
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==1
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (0.43643578047198461)) <= 1e-9 * max(1,abs(0.43643578047198461)) if id==1
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.26904761904761904)) <= 1e-9 * max(1,abs(-0.26904761904761904)) if id==1
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-0.66327301609863654)) <= 1e-9 * max(1,abs(-0.66327301609863654)) if id==1
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==1
assert !missing(z_heat_2003) & abs(z_heat_2003 - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==1
assert !missing(nobs_2004) & abs(nobs_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==1
assert !missing(mean_2004) & abs(mean_2004 - (7.4666666666666668)) <= 1e-9 * max(1,abs(7.4666666666666668)) if id==1
assert !missing(median_2004) & abs(median_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(var_2004) & abs(var_2004 - (313.40952380952382)) <= 1e-9 * max(1,abs(313.40952380952382)) if id==1
assert !missing(sd_2004) & abs(sd_2004 - (17.703376056829494)) <= 1e-9 * max(1,abs(17.703376056829494)) if id==1
assert !missing(skew_2004) & abs(skew_2004 - (0.47888189614623089)) <= 1e-9 * max(1,abs(0.47888189614623089)) if id==1
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==1
assert !missing(gdd_2004) & abs(gdd_2004 - (80)) <= 1e-9 * max(1,abs(80)) if id==1
assert !missing(kdd_2004) & abs(kdd_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==1
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==1
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2004) & abs(cut01_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==1
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-29.5)) <= 1e-9 * max(1,abs(-29.5)) if id==1
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-0.488907373186793)) <= 1e-9 * max(1,abs(-0.488907373186793)) if id==1
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-2.6666666666666661)) <= 1e-9 * max(1,abs(-2.6666666666666661)) if id==1
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-0.21821789023599231)) <= 1e-9 * max(1,abs(-0.21821789023599231)) if id==1
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==1
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==1
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.33571428571428569)) <= 1e-9 * max(1,abs(-0.33571428571428569)) if id==1
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.82762385194608634)) <= 1e-9 * max(1,abs(-0.82762385194608634)) if id==1
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2000) & abs(nobs_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2000) & abs(mean_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2000) & abs(median_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2000) & abs(var_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2000) & abs(sd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2000) if id==2
assert !missing(max_2000) & abs(max_2000 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2000) & abs(gdd_2000 - (360)) <= 1e-9 * max(1,abs(360)) if id==2
assert !missing(kdd_2000) & abs(kdd_2000 - (54)) <= 1e-9 * max(1,abs(54)) if id==2
assert !missing(heatdays_2000) & abs(heatdays_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2000) & abs(heat_start_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_2000) & abs(heat_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end_2000) & abs(heat_end_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert !missing(cut01_2000) & abs(cut01_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2000) & abs(cut04_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2000) if id==2
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2000) if id==2
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2000) if id==2
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2000) if id==2
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2000) if id==2
assert !missing(nobs_2001) & abs(nobs_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2001) & abs(mean_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2001) & abs(median_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2001) & abs(var_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2001) & abs(sd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2001) if id==2
assert !missing(max_2001) & abs(max_2001 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2001) & abs(gdd_2001 - (360)) <= 1e-9 * max(1,abs(360)) if id==2
assert !missing(kdd_2001) & abs(kdd_2001 - (54)) <= 1e-9 * max(1,abs(54)) if id==2
assert !missing(heatdays_2001) & abs(heatdays_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2001) & abs(heat_start_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_2001) & abs(heat_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end_2001) & abs(heat_end_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert !missing(cut01_2001) & abs(cut01_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2001) & abs(cut02_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2001) & abs(cut04_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2001) if id==2
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2001) if id==2
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2001) if id==2
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2001) if id==2
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2001) if id==2
assert !missing(nobs_2002) & abs(nobs_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2002) & abs(mean_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2002) & abs(median_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2002) & abs(var_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2002) & abs(sd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2002) if id==2
assert !missing(max_2002) & abs(max_2002 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2002) & abs(gdd_2002 - (360)) <= 1e-9 * max(1,abs(360)) if id==2
assert !missing(kdd_2002) & abs(kdd_2002 - (54)) <= 1e-9 * max(1,abs(54)) if id==2
assert !missing(heatdays_2002) & abs(heatdays_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2002) & abs(heat_start_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_2002) & abs(heat_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end_2002) & abs(heat_end_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert !missing(cut01_2002) & abs(cut01_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2002) & abs(cut02_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2002) & abs(cut04_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2002) if id==2
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2002) if id==2
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2002) if id==2
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2002) if id==2
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2002) if id==2
assert !missing(nobs_2003) & abs(nobs_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(mean_2003) & abs(mean_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2003) & abs(median_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2003) & abs(var_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2003) & abs(sd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2003) if id==2
assert !missing(max_2003) & abs(max_2003 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2003) & abs(gdd_2003 - (380)) <= 1e-9 * max(1,abs(380)) if id==2
assert !missing(kdd_2003) & abs(kdd_2003 - (57)) <= 1e-9 * max(1,abs(57)) if id==2
assert !missing(heatdays_2003) & abs(heatdays_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2003) & abs(heat_start_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_2003) & abs(heat_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end_2003) & abs(heat_end_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==2
assert !missing(cut01_2003) & abs(cut01_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2003) & abs(cut02_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2003) & abs(cut03_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2003) & abs(cut04_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==2
assert missing(z_gdd_2003) if id==2
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert missing(z_kdd_2003) if id==2
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert missing(z_heatdays_2003) if id==2
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2003) if id==2
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2003) if id==2
assert !missing(nobs_2004) & abs(nobs_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2004) & abs(mean_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(median_2004) & abs(median_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(var_2004) & abs(var_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2004) & abs(sd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2004) if id==2
assert !missing(max_2004) & abs(max_2004 - (35)) <= 1e-9 * max(1,abs(35)) if id==2
assert !missing(gdd_2004) & abs(gdd_2004 - (360)) <= 1e-9 * max(1,abs(360)) if id==2
assert !missing(kdd_2004) & abs(kdd_2004 - (54)) <= 1e-9 * max(1,abs(54)) if id==2
assert !missing(heatdays_2004) & abs(heatdays_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(heat_start_2004) & abs(heat_start_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_2004) & abs(heat_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==2
assert !missing(heat_end_2004) & abs(heat_end_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==2
assert !missing(cut01_2004) & abs(cut01_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2004) & abs(cut02_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut04_2004) & abs(cut04_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_gdd_2004) if id==2
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_kdd_2004) if id==2
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heatdays_2004) if id==2
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_heatdays_2004) if id==2
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_heat_2004) if id==2
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
assert missing(dev_gdd_2000) if id==3
assert missing(z_gdd_2000) if id==3
assert missing(dev_kdd_2000) if id==3
assert missing(z_kdd_2000) if id==3
assert missing(dev_heatdays_2000) if id==3
assert missing(z_heatdays_2000) if id==3
assert missing(dev_pct_heatdays_2000) if id==3
assert missing(z_pct_heatdays_2000) if id==3
assert missing(dev_heat_2000) if id==3
assert missing(z_heat_2000) if id==3
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
assert missing(dev_gdd_2001) if id==3
assert missing(z_gdd_2001) if id==3
assert missing(dev_kdd_2001) if id==3
assert missing(z_kdd_2001) if id==3
assert missing(dev_heatdays_2001) if id==3
assert missing(z_heatdays_2001) if id==3
assert missing(dev_pct_heatdays_2001) if id==3
assert missing(z_pct_heatdays_2001) if id==3
assert missing(dev_heat_2001) if id==3
assert missing(z_heat_2001) if id==3
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
assert missing(dev_heat_2002) if id==3
assert missing(z_heat_2002) if id==3
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
assert missing(dev_heat_2003) if id==3
assert missing(z_heat_2003) if id==3
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
assert missing(dev_heat_2004) if id==3
assert missing(z_heat_2004) if id==3
assert !missing(nobs_2000) & abs(nobs_2000 - (14)) <= 1e-9 * max(1,abs(14)) if id==4
assert !missing(mean_2000) & abs(mean_2000 - (20.107142857142858)) <= 1e-9 * max(1,abs(20.107142857142858)) if id==4
assert !missing(median_2000) & abs(median_2000 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==4
assert !missing(var_2000) & abs(var_2000 - (341.08379120879118)) <= 1e-9 * max(1,abs(341.08379120879118)) if id==4
assert !missing(sd_2000) & abs(sd_2000 - (18.468453947442139)) <= 1e-9 * max(1,abs(18.468453947442139)) if id==4
assert !missing(skew_2000) & abs(skew_2000 - (-0.61032352937029488)) <= 1e-9 * max(1,abs(-0.61032352937029488)) if id==4
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2000) & abs(gdd_2000 - (169.5)) <= 1e-9 * max(1,abs(169.5)) if id==4
assert !missing(kdd_2000) & abs(kdd_2000 - (24)) <= 1e-9 * max(1,abs(24)) if id==4
assert !missing(heatdays_2000) & abs(heatdays_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2000) & abs(heat_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2000) & abs(cut01_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut02_2000) & abs(cut02_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (16.666666666666657)) <= 1e-9 * max(1,abs(16.666666666666657)) if id==4
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.35626011667847762)) <= 1e-9 * max(1,abs(0.35626011667847762)) if id==4
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (5.3333333333333321)) <= 1e-9 * max(1,abs(5.3333333333333321)) if id==4
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==4
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (0.87287156094396923)) <= 1e-9 * max(1,abs(0.87287156094396923)) if id==4
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.064102564102564097)) <= 1e-9 * max(1,abs(0.064102564102564097)) if id==4
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (0.57735026918962573)) <= 1e-9 * max(1,abs(0.57735026918962573)) if id==4
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(z_heat_2000) & abs(z_heat_2000 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==4
assert !missing(nobs_2001) & abs(nobs_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==4
assert !missing(mean_2001) & abs(mean_2001 - (28.75)) <= 1e-9 * max(1,abs(28.75)) if id==4
assert !missing(median_2001) & abs(median_2001 - (30.75)) <= 1e-9 * max(1,abs(30.75)) if id==4
assert !missing(var_2001) & abs(var_2001 - (90.340909090909093)) <= 1e-9 * max(1,abs(90.340909090909093)) if id==4
assert !missing(sd_2001) & abs(sd_2001 - (9.5047834846938564)) <= 1e-9 * max(1,abs(9.5047834846938564)) if id==4
assert !missing(skew_2001) & abs(skew_2001 - (-0.53692924564072508)) <= 1e-9 * max(1,abs(-0.53692924564072508)) if id==4
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2001) & abs(gdd_2001 - (189)) <= 1e-9 * max(1,abs(189)) if id==4
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==4
assert !missing(heatdays_2001) & abs(heatdays_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(heat_start_2001) & abs(heat_start_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2001) & abs(cut01_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut02_2001) & abs(cut02_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut04_2001) & abs(cut04_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (36.166666666666657)) <= 1e-9 * max(1,abs(36.166666666666657)) if id==4
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.77308445319229657)) <= 1e-9 * max(1,abs(0.77308445319229657)) if id==4
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (5.3333333333333321)) <= 1e-9 * max(1,abs(5.3333333333333321)) if id==4
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==4
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (0.21821789023599217)) <= 1e-9 * max(1,abs(0.21821789023599217)) if id==4
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (0.064102564102564097)) <= 1e-9 * max(1,abs(0.064102564102564097)) if id==4
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (0.57735026918962573)) <= 1e-9 * max(1,abs(0.57735026918962573)) if id==4
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==4
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==4
assert !missing(mean_2002) & abs(mean_2002 - (14)) <= 1e-9 * max(1,abs(14)) if id==4
assert !missing(median_2002) & abs(median_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(var_2002) & abs(var_2002 - (264.66666666666669)) <= 1e-9 * max(1,abs(264.66666666666669)) if id==4
assert !missing(sd_2002) & abs(sd_2002 - (16.268579122549905)) <= 1e-9 * max(1,abs(16.268579122549905)) if id==4
assert !missing(skew_2002) & abs(skew_2002 - (-0.029643231869047271)) <= 1e-9 * max(1,abs(-0.029643231869047271)) if id==4
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2002) & abs(gdd_2002 - (100)) <= 1e-9 * max(1,abs(100)) if id==4
assert !missing(kdd_2002) & abs(kdd_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.30769230769230771)) <= 1e-9 * max(1,abs(0.30769230769230771)) if id==4
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2002) & abs(cut01_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-52.833333333333343)) <= 1e-9 * max(1,abs(-52.833333333333343)) if id==4
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-1.1293445698707749)) <= 1e-9 * max(1,abs(-1.1293445698707749)) if id==4
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (-10.666666666666668)) <= 1e-9 * max(1,abs(-10.666666666666668)) if id==4
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==4
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-1.091089451179962)) <= 1e-9 * max(1,abs(-1.091089451179962)) if id==4
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.12820512820512819)) <= 1e-9 * max(1,abs(-0.12820512820512819)) if id==4
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==4
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==4
assert !missing(nobs_2003) & abs(nobs_2003 - (18)) <= 1e-9 * max(1,abs(18)) if id==4
assert !missing(mean_2003) & abs(mean_2003 - (26.444444444444443)) <= 1e-9 * max(1,abs(26.444444444444443)) if id==4
assert !missing(median_2003) & abs(median_2003 - (30)) <= 1e-9 * max(1,abs(30)) if id==4
assert !missing(var_2003) & abs(var_2003 - (252.3202614379085)) <= 1e-9 * max(1,abs(252.3202614379085)) if id==4
assert !missing(sd_2003) & abs(sd_2003 - (15.884591950626509)) <= 1e-9 * max(1,abs(15.884591950626509)) if id==4
assert !missing(skew_2003) & abs(skew_2003 - (-1.7238446369330895)) <= 1e-9 * max(1,abs(-1.7238446369330895)) if id==4
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2003) & abs(gdd_2003 - (298)) <= 1e-9 * max(1,abs(298)) if id==4
assert !missing(kdd_2003) & abs(kdd_2003 - (32)) <= 1e-9 * max(1,abs(32)) if id==4
assert !missing(heatdays_2003) & abs(heatdays_2003 - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.61111111111111116)) <= 1e-9 * max(1,abs(0.61111111111111116)) if id==4
assert !missing(heat_start_2003) & abs(heat_start_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut03_2003) & abs(cut03_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut04_2003) & abs(cut04_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (145.16666666666666)) <= 1e-9 * max(1,abs(145.16666666666666)) if id==4
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (3.1030256162695413)) <= 1e-9 * max(1,abs(3.1030256162695413)) if id==4
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (13.333333333333332)) <= 1e-9 * max(1,abs(13.333333333333332)) if id==4
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (1.4433756729740643)) <= 1e-9 * max(1,abs(1.4433756729740643)) if id==4
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (5.333333333333333)) <= 1e-9 * max(1,abs(5.333333333333333)) if id==4
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (3.4914862437758778)) <= 1e-9 * max(1,abs(3.4914862437758778)) if id==4
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.17521367521367526)) <= 1e-9 * max(1,abs(0.17521367521367526)) if id==4
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (1.5780907357849776)) <= 1e-9 * max(1,abs(1.5780907357849776)) if id==4
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==4
assert !missing(nobs_2004) & abs(nobs_2004 - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(mean_2004) & abs(mean_2004 - (16.40909090909091)) <= 1e-9 * max(1,abs(16.40909090909091)) if id==4
assert !missing(median_2004) & abs(median_2004 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==4
assert !missing(var_2004) & abs(var_2004 - (387.29090909090911)) <= 1e-9 * max(1,abs(387.29090909090911)) if id==4
assert !missing(sd_2004) & abs(sd_2004 - (19.679708054006014)) <= 1e-9 * max(1,abs(19.679708054006014)) if id==4
assert !missing(skew_2004) & abs(skew_2004 - (-0.53670251880332598)) <= 1e-9 * max(1,abs(-0.53670251880332598)) if id==4
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==4
assert !missing(gdd_2004) & abs(gdd_2004 - (128.5)) <= 1e-9 * max(1,abs(128.5)) if id==4
assert !missing(kdd_2004) & abs(kdd_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.27272727272727271)) <= 1e-9 * max(1,abs(0.27272727272727271)) if id==4
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2004) & abs(cut01_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-24.333333333333343)) <= 1e-9 * max(1,abs(-24.333333333333343)) if id==4
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-0.52013977035057779)) <= 1e-9 * max(1,abs(-0.52013977035057779)) if id==4
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-10.666666666666668)) <= 1e-9 * max(1,abs(-10.666666666666668)) if id==4
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==4
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-1.7457431218879391)) <= 1e-9 * max(1,abs(-1.7457431218879391)) if id==4
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.1631701631701632)) <= 1e-9 * max(1,abs(-0.1631701631701632)) if id==4
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-1.4696188670281387)) <= 1e-9 * max(1,abs(-1.4696188670281387)) if id==4
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(nobs_2000) & abs(nobs_2000 - (17)) <= 1e-9 * max(1,abs(17)) if id==5
assert !missing(mean_2000) & abs(mean_2000 - (16.676470588235293)) <= 1e-9 * max(1,abs(16.676470588235293)) if id==5
assert !missing(median_2000) & abs(median_2000 - (20)) <= 1e-9 * max(1,abs(20)) if id==5
assert !missing(var_2000) & abs(var_2000 - (293.15441176470586)) <= 1e-9 * max(1,abs(293.15441176470586)) if id==5
assert !missing(sd_2000) & abs(sd_2000 - (17.121752590336829)) <= 1e-9 * max(1,abs(17.121752590336829)) if id==5
assert !missing(skew_2000) & abs(skew_2000 - (-0.49809921564880549)) <= 1e-9 * max(1,abs(-0.49809921564880549)) if id==5
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2000) & abs(gdd_2000 - (179.5)) <= 1e-9 * max(1,abs(179.5)) if id==5
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(heatdays_2000) & abs(heatdays_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.41176470588235292)) <= 1e-9 * max(1,abs(0.41176470588235292)) if id==5
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(heat_end_2000) & abs(heat_end_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut01_2000) & abs(cut01_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(cut02_2000) & abs(cut02_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(cut03_2000) & abs(cut03_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-8)) <= 1e-9 * max(1,abs(-8)) if id==5
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==5
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (0.13245323570650427)) <= 1e-9 * max(1,abs(0.13245323570650427)) if id==5
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (-0.034690799396681737)) <= 1e-9 * max(1,abs(-0.034690799396681737)) if id==5
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (-0.15051982108786507)) <= 1e-9 * max(1,abs(-0.15051982108786507)) if id==5
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==5
assert !missing(z_heat_2000) & abs(z_heat_2000 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==5
assert !missing(nobs_2001) & abs(nobs_2001 - (13)) <= 1e-9 * max(1,abs(13)) if id==5
assert !missing(mean_2001) & abs(mean_2001 - (25.076923076923077)) <= 1e-9 * max(1,abs(25.076923076923077)) if id==5
assert !missing(median_2001) & abs(median_2001 - (30)) <= 1e-9 * max(1,abs(30)) if id==5
assert !missing(var_2001) & abs(var_2001 - (283.07692307692309)) <= 1e-9 * max(1,abs(283.07692307692309)) if id==5
assert !missing(sd_2001) & abs(sd_2001 - (16.824889987067465)) <= 1e-9 * max(1,abs(16.824889987067465)) if id==5
assert !missing(skew_2001) & abs(skew_2001 - (-1.5561360699501146)) <= 1e-9 * max(1,abs(-1.5561360699501146)) if id==5
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2001) & abs(gdd_2001 - (200)) <= 1e-9 * max(1,abs(200)) if id==5
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==5
assert !missing(heatdays_2001) & abs(heatdays_2001 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==5
assert !missing(heat_start_2001) & abs(heat_start_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_2001) & abs(heat_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut03_2001) & abs(cut03_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut04_2001) & abs(cut04_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==5
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (20.5)) <= 1e-9 * max(1,abs(20.5)) if id==5
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (2.333333333333333)) <= 1e-9 * max(1,abs(2.333333333333333)) if id==5
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (0.92717264994553061)) <= 1e-9 * max(1,abs(0.92717264994553061)) if id==5
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (0.24585218702865763)) <= 1e-9 * max(1,abs(0.24585218702865763)) if id==5
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (1.066727427709653)) <= 1e-9 * max(1,abs(1.066727427709653)) if id==5
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==5
assert !missing(z_heat_2001) & abs(z_heat_2001 - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==5
assert !missing(nobs_2002) & abs(nobs_2002 - (17)) <= 1e-9 * max(1,abs(17)) if id==5
assert !missing(mean_2002) & abs(mean_2002 - (15.235294117647058)) <= 1e-9 * max(1,abs(15.235294117647058)) if id==5
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==5
assert !missing(var_2002) & abs(var_2002 - (299.65992647058823)) <= 1e-9 * max(1,abs(299.65992647058823)) if id==5
assert !missing(sd_2002) & abs(sd_2002 - (17.31068821481654)) <= 1e-9 * max(1,abs(17.31068821481654)) if id==5
assert !missing(skew_2002) & abs(skew_2002 - (-0.21728484366549508)) <= 1e-9 * max(1,abs(-0.21728484366549508)) if id==5
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2002) & abs(gdd_2002 - (159)) <= 1e-9 * max(1,abs(159)) if id==5
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.23529411764705882)) <= 1e-9 * max(1,abs(0.23529411764705882)) if id==5
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==5
assert !missing(cut02_2002) & abs(cut02_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-20.5)) <= 1e-9 * max(1,abs(-20.5)) if id==5
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==5
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==5
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-1.0596258856520353)) <= 1e-9 * max(1,abs(-1.0596258856520353)) if id==5
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.21116138763197584)) <= 1e-9 * max(1,abs(-0.21116138763197584)) if id==5
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.91620760662178757)) <= 1e-9 * max(1,abs(-0.91620760662178757)) if id==5
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==5
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==5
assert !missing(nobs_2003) & abs(nobs_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==5
assert !missing(mean_2003) & abs(mean_2003 - (19.105263157894736)) <= 1e-9 * max(1,abs(19.105263157894736)) if id==5
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==5
assert !missing(var_2003) & abs(var_2003 - (191.84941520467837)) <= 1e-9 * max(1,abs(191.84941520467837)) if id==5
assert !missing(sd_2003) & abs(sd_2003 - (13.850971633956888)) <= 1e-9 * max(1,abs(13.850971633956888)) if id==5
assert !missing(skew_2003) & abs(skew_2003 - (-0.082863837915778601)) <= 1e-9 * max(1,abs(-0.082863837915778601)) if id==5
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2003) & abs(gdd_2003 - (189)) <= 1e-9 * max(1,abs(189)) if id==5
assert !missing(kdd_2003) & abs(kdd_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(heatdays_2003) & abs(heatdays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==5
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.31578947368421051)) <= 1e-9 * max(1,abs(0.31578947368421051)) if id==5
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2003) & abs(heat_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(cut02_2003) & abs(cut02_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==5
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (0.46341463414634149)) <= 1e-9 * max(1,abs(0.46341463414634149)) if id==5
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-0.26490647141300888)) <= 1e-9 * max(1,abs(-0.26490647141300888)) if id==5
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.13066603159482415)) <= 1e-9 * max(1,abs(-0.13066603159482415)) if id==5
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-0.56694651146596331)) <= 1e-9 * max(1,abs(-0.56694651146596331)) if id==5
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==5
assert !missing(z_heat_2003) & abs(z_heat_2003 - (0.43643578047198461)) <= 1e-9 * max(1,abs(0.43643578047198461)) if id==5
assert !missing(nobs_2004) & abs(nobs_2004 - (13)) <= 1e-9 * max(1,abs(13)) if id==5
assert !missing(mean_2004) & abs(mean_2004 - (14.615384615384615)) <= 1e-9 * max(1,abs(14.615384615384615)) if id==5
assert !missing(median_2004) & abs(median_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(var_2004) & abs(var_2004 - (393.58974358974359)) <= 1e-9 * max(1,abs(393.58974358974359)) if id==5
assert !missing(sd_2004) & abs(sd_2004 - (19.83909634004895)) <= 1e-9 * max(1,abs(19.83909634004895)) if id==5
assert !missing(skew_2004) & abs(skew_2004 - (0.067167559196260787)) <= 1e-9 * max(1,abs(0.067167559196260787)) if id==5
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(gdd_2004) & abs(gdd_2004 - (110)) <= 1e-9 * max(1,abs(110)) if id==5
assert !missing(kdd_2004) & abs(kdd_2004 - (24)) <= 1e-9 * max(1,abs(24)) if id==5
assert !missing(heatdays_2004) & abs(heatdays_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.38461538461538464)) <= 1e-9 * max(1,abs(0.38461538461538464)) if id==5
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut01_2004) & abs(cut01_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(cut02_2004) & abs(cut02_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-69.5)) <= 1e-9 * max(1,abs(-69.5)) if id==5
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-3.3902439024390243)) <= 1e-9 * max(1,abs(-3.3902439024390243)) if id==5
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==5
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.66226617853252201)) <= 1e-9 * max(1,abs(-0.66226617853252201)) if id==5
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.061840120663650022)) <= 1e-9 * max(1,abs(-0.061840120663650022)) if id==5
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.26831794193923758)) <= 1e-9 * max(1,abs(-0.26831794193923758)) if id==5
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==5
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==5
assert !missing(nobs_2000) & abs(nobs_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(mean_2000) & abs(mean_2000 - (16.84375)) <= 1e-9 * max(1,abs(16.84375)) if id==6
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==6
assert !missing(var_2000) & abs(var_2000 - (289.05729166666669)) <= 1e-9 * max(1,abs(289.05729166666669)) if id==6
assert !missing(sd_2000) & abs(sd_2000 - (17.001684965516407)) <= 1e-9 * max(1,abs(17.001684965516407)) if id==6
assert !missing(skew_2000) & abs(skew_2000 - (-0.73527423561185501)) <= 1e-9 * max(1,abs(-0.73527423561185501)) if id==6
assert !missing(max_2000) & abs(max_2000 - (32)) <= 1e-9 * max(1,abs(32)) if id==6
assert !missing(gdd_2000) & abs(gdd_2000 - (187.5)) <= 1e-9 * max(1,abs(187.5)) if id==6
assert !missing(kdd_2000) & abs(kdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==6
assert !missing(heat_start_2000) & abs(heat_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_2000) & abs(heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2000) & abs(cut01_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut02_2000) & abs(cut02_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut04_2000) & abs(cut04_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (8.8333333333333428)) <= 1e-9 * max(1,abs(8.8333333333333428)) if id==6
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.24489057017757832)) <= 1e-9 * max(1,abs(0.24489057017757832)) if id==6
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-10.666666666666666)) <= 1e-9 * max(1,abs(-10.666666666666666)) if id==6
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==6
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==6
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (-0.57735026918962595)) <= 1e-9 * max(1,abs(-0.57735026918962595)) if id==6
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (-0.078431372549019607)) <= 1e-9 * max(1,abs(-0.078431372549019607)) if id==6
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (-0.52721792505514942)) <= 1e-9 * max(1,abs(-0.52721792505514942)) if id==6
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==6
assert !missing(z_heat_2000) & abs(z_heat_2000 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6
assert !missing(nobs_2001) & abs(nobs_2001 - (17)) <= 1e-9 * max(1,abs(17)) if id==6
assert !missing(mean_2001) & abs(mean_2001 - (12.411764705882353)) <= 1e-9 * max(1,abs(12.411764705882353)) if id==6
assert !missing(median_2001) & abs(median_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==6
assert !missing(var_2001) & abs(var_2001 - (346.60110294117646)) <= 1e-9 * max(1,abs(346.60110294117646)) if id==6
assert !missing(sd_2001) & abs(sd_2001 - (18.61722597330699)) <= 1e-9 * max(1,abs(18.61722597330699)) if id==6
assert !missing(skew_2001) & abs(skew_2001 - (0.14396740824469784)) <= 1e-9 * max(1,abs(0.14396740824469784)) if id==6
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2001) & abs(gdd_2001 - (139)) <= 1e-9 * max(1,abs(139)) if id==6
assert !missing(kdd_2001) & abs(kdd_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(heatdays_2001) & abs(heatdays_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.23529411764705882)) <= 1e-9 * max(1,abs(0.23529411764705882)) if id==6
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2001) & abs(cut01_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(cut02_2001) & abs(cut02_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (-39.666666666666657)) <= 1e-9 * max(1,abs(-39.666666666666657)) if id==6
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (-1.0996972774011993)) <= 1e-9 * max(1,abs(-1.0996972774011993)) if id==6
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==6
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==6
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==6
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (-0.57735026918962595)) <= 1e-9 * max(1,abs(-0.57735026918962595)) if id==6
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.093137254901960786)) <= 1e-9 * max(1,abs(-0.093137254901960786)) if id==6
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.62607128600298989)) <= 1e-9 * max(1,abs(-0.62607128600298989)) if id==6
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==6
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6
assert !missing(nobs_2002) & abs(nobs_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==6
assert !missing(mean_2002) & abs(mean_2002 - (19.861111111111111)) <= 1e-9 * max(1,abs(19.861111111111111)) if id==6
assert !missing(median_2002) & abs(median_2002 - (29.75)) <= 1e-9 * max(1,abs(29.75)) if id==6
assert !missing(var_2002) & abs(var_2002 - (274.46486928104576)) <= 1e-9 * max(1,abs(274.46486928104576)) if id==6
assert !missing(sd_2002) & abs(sd_2002 - (16.566981296574394)) <= 1e-9 * max(1,abs(16.566981296574394)) if id==6
assert !missing(skew_2002) & abs(skew_2002 - (-0.64453177096943104)) <= 1e-9 * max(1,abs(-0.64453177096943104)) if id==6
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2002) & abs(gdd_2002 - (209.5)) <= 1e-9 * max(1,abs(209.5)) if id==6
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(heatdays_2002) & abs(heatdays_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==6
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==6
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2002) & abs(heat_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(heat_end_2002) & abs(heat_end_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut01_2002) & abs(cut01_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut03_2002) & abs(cut03_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut04_2002) & abs(cut04_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (30.833333333333343)) <= 1e-9 * max(1,abs(30.833333333333343)) if id==6
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.85480670722362173)) <= 1e-9 * max(1,abs(0.85480670722362173)) if id==6
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==6
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==6
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (3.333333333333333)) <= 1e-9 * max(1,abs(3.333333333333333)) if id==6
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (1.1547005383792515)) <= 1e-9 * max(1,abs(1.1547005383792515)) if id==6
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.17156862745098039)) <= 1e-9 * max(1,abs(0.17156862745098039)) if id==6
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (1.1532892110581394)) <= 1e-9 * max(1,abs(1.1532892110581394)) if id==6
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (1.3333333333333333)) <= 1e-9 * max(1,abs(1.3333333333333333)) if id==6
assert !missing(z_heat_2002) & abs(z_heat_2002 - (1.1547005383792515)) <= 1e-9 * max(1,abs(1.1547005383792515)) if id==6
assert !missing(nobs_2003) & abs(nobs_2003 - (13)) <= 1e-9 * max(1,abs(13)) if id==6
assert !missing(mean_2003) & abs(mean_2003 - (19.53846153846154)) <= 1e-9 * max(1,abs(19.53846153846154)) if id==6
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==6
assert !missing(var_2003) & abs(var_2003 - (265.43589743589746)) <= 1e-9 * max(1,abs(265.43589743589746)) if id==6
assert !missing(sd_2003) & abs(sd_2003 - (16.292203578273181)) <= 1e-9 * max(1,abs(16.292203578273181)) if id==6
assert !missing(skew_2003) & abs(skew_2003 - (-0.43571192112814305)) <= 1e-9 * max(1,abs(-0.43571192112814305)) if id==6
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2003) & abs(gdd_2003 - (140)) <= 1e-9 * max(1,abs(140)) if id==6
assert !missing(kdd_2003) & abs(kdd_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(heatdays_2003) & abs(heatdays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==6
assert !missing(heat_start_2003) & abs(heat_start_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut02_2003) & abs(cut02_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-38.666666666666657)) <= 1e-9 * max(1,abs(-38.666666666666657)) if id==6
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-1.071973816626379)) <= 1e-9 * max(1,abs(-1.071973816626379)) if id==6
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==6
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==6
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (0.11547005383792505)) <= 1e-9 * max(1,abs(0.11547005383792505)) if id==6
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.13310708898944196)) <= 1e-9 * max(1,abs(0.13310708898944196)) if id==6
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (0.8947496516560951)) <= 1e-9 * max(1,abs(0.8947496516560951)) if id==6
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==6
assert !missing(z_heat_2003) & abs(z_heat_2003 - (0.28867513459481281)) <= 1e-9 * max(1,abs(0.28867513459481281)) if id==6
assert !missing(nobs_2004) & abs(nobs_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==6
assert !missing(mean_2004) & abs(mean_2004 - (15.53125)) <= 1e-9 * max(1,abs(15.53125)) if id==6
assert !missing(median_2004) & abs(median_2004 - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==6
assert !missing(var_2004) & abs(var_2004 - (396.74895833333335)) <= 1e-9 * max(1,abs(396.74895833333335)) if id==6
assert !missing(sd_2004) & abs(sd_2004 - (19.918558138914907)) <= 1e-9 * max(1,abs(19.918558138914907)) if id==6
assert !missing(skew_2004) & abs(skew_2004 - (-0.15634315245641547)) <= 1e-9 * max(1,abs(-0.15634315245641547)) if id==6
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==6
assert !missing(gdd_2004) & abs(gdd_2004 - (158.5)) <= 1e-9 * max(1,abs(158.5)) if id==6
assert !missing(kdd_2004) & abs(kdd_2004 - (24)) <= 1e-9 * max(1,abs(24)) if id==6
assert !missing(heatdays_2004) & abs(heatdays_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.3125)) <= 1e-9 * max(1,abs(0.3125)) if id==6
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(heat_2004) & abs(heat_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2004) & abs(cut01_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-20.166666666666657)) <= 1e-9 * max(1,abs(-20.166666666666657)) if id==6
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-0.55908979229220623)) <= 1e-9 * max(1,abs(-0.55908979229220623)) if id==6
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (13.333333333333334)) <= 1e-9 * max(1,abs(13.333333333333334)) if id==6
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (1.4433756729740645)) <= 1e-9 * max(1,abs(1.4433756729740645)) if id==6
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==6
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.23094010767585041)) <= 1e-9 * max(1,abs(-0.23094010767585041)) if id==6
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.015931372549019607)) <= 1e-9 * max(1,abs(-0.015931372549019607)) if id==6
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.10709114102682721)) <= 1e-9 * max(1,abs(-0.10709114102682721)) if id==6
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (1.3333333333333333)) <= 1e-9 * max(1,abs(1.3333333333333333)) if id==6
assert !missing(z_heat_2004) & abs(z_heat_2004 - (1.1547005383792515)) <= 1e-9 * max(1,abs(1.1547005383792515)) if id==6
assert !missing(nobs_2000) & abs(nobs_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==7
assert !missing(mean_2000) & abs(mean_2000 - (12.958333333333334)) <= 1e-9 * max(1,abs(12.958333333333334)) if id==7
assert !missing(median_2000) & abs(median_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(var_2000) & abs(var_2000 - (347.92992424242425)) <= 1e-9 * max(1,abs(347.92992424242425)) if id==7
assert !missing(sd_2000) & abs(sd_2000 - (18.652879784162664)) <= 1e-9 * max(1,abs(18.652879784162664)) if id==7
assert !missing(skew_2000) & abs(skew_2000 - (0.20308264273654089)) <= 1e-9 * max(1,abs(0.20308264273654089)) if id==7
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2000) & abs(gdd_2000 - (99.5)) <= 1e-9 * max(1,abs(99.5)) if id==7
assert !missing(kdd_2000) & abs(kdd_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(heatdays_2000) & abs(heatdays_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==7
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2000) & abs(heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2000) & abs(cut01_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(cut02_2000) & abs(cut02_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (-62.666666666666657)) <= 1e-9 * max(1,abs(-62.666666666666657)) if id==7
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (-1.10756990415969)) <= 1e-9 * max(1,abs(-1.10756990415969)) if id==7
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-5.3333333333333339)) <= 1e-9 * max(1,abs(-5.3333333333333339)) if id==7
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==7
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==7
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (-0.41478067789216999)) <= 1e-9 * max(1,abs(-0.41478067789216999)) if id==7
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (-0.020833333333333315)) <= 1e-9 * max(1,abs(-0.020833333333333315)) if id==7
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (-0.10482848367219173)) <= 1e-9 * max(1,abs(-0.10482848367219173)) if id==7
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==7
assert !missing(z_heat_2000) & abs(z_heat_2000 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==7
assert !missing(nobs_2001) & abs(nobs_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==7
assert !missing(mean_2001) & abs(mean_2001 - (16.638888888888889)) <= 1e-9 * max(1,abs(16.638888888888889)) if id==7
assert !missing(median_2001) & abs(median_2001 - (20)) <= 1e-9 * max(1,abs(20)) if id==7
assert !missing(var_2001) & abs(var_2001 - (293.64133986928107)) <= 1e-9 * max(1,abs(293.64133986928107)) if id==7
assert !missing(sd_2001) & abs(sd_2001 - (17.135966265993904)) <= 1e-9 * max(1,abs(17.135966265993904)) if id==7
assert !missing(skew_2001) & abs(skew_2001 - (-0.35465372491927322)) <= 1e-9 * max(1,abs(-0.35465372491927322)) if id==7
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2001) & abs(gdd_2001 - (177.5)) <= 1e-9 * max(1,abs(177.5)) if id==7
assert !missing(kdd_2001) & abs(kdd_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2001) & abs(heatdays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==7
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2001) & abs(cut01_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut02_2001) & abs(cut02_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (15.333333333333343)) <= 1e-9 * max(1,abs(15.333333333333343)) if id==7
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.27100114676247755)) <= 1e-9 * max(1,abs(0.27100114676247755)) if id==7
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==7
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==7
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==7
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (-0.72586618631129751)) <= 1e-9 * max(1,abs(-0.72586618631129751)) if id==7
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.18749999999999997)) <= 1e-9 * max(1,abs(-0.18749999999999997)) if id==7
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.9434563530497263)) <= 1e-9 * max(1,abs(-0.9434563530497263)) if id==7
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==7
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==7
assert !missing(nobs_2002) & abs(nobs_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(mean_2002) & abs(mean_2002 - (21.21875)) <= 1e-9 * max(1,abs(21.21875)) if id==7
assert !missing(median_2002) & abs(median_2002 - (30)) <= 1e-9 * max(1,abs(30)) if id==7
assert !missing(var_2002) & abs(var_2002 - (299.09895833333331)) <= 1e-9 * max(1,abs(299.09895833333331)) if id==7
assert !missing(sd_2002) & abs(sd_2002 - (17.294477683160405)) <= 1e-9 * max(1,abs(17.294477683160405)) if id==7
assert !missing(skew_2002) & abs(skew_2002 - (-0.88279731795856153)) <= 1e-9 * max(1,abs(-0.88279731795856153)) if id==7
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2002) & abs(gdd_2002 - (209.5)) <= 1e-9 * max(1,abs(209.5)) if id==7
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2002) & abs(heatdays_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==7
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.5625)) <= 1e-9 * max(1,abs(0.5625)) if id==7
assert !missing(heat_start_2002) & abs(heat_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2002) & abs(cut01_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut04_2002) & abs(cut04_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (47.333333333333343)) <= 1e-9 * max(1,abs(47.333333333333343)) if id==7
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.83656875739721304)) <= 1e-9 * max(1,abs(0.83656875739721304)) if id==7
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==7
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==7
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (3.666666666666667)) <= 1e-9 * max(1,abs(3.666666666666667)) if id==7
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (1.1406468642034679)) <= 1e-9 * max(1,abs(1.1406468642034679)) if id==7
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.20833333333333337)) <= 1e-9 * max(1,abs(0.20833333333333337)) if id==7
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (1.0482848367219184)) <= 1e-9 * max(1,abs(1.0482848367219184)) if id==7
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7
assert !missing(z_heat_2002) & abs(z_heat_2002 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(mean_2003) & abs(mean_2003 - (14.46875)) <= 1e-9 * max(1,abs(14.46875)) if id==7
assert !missing(median_2003) & abs(median_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==7
assert !missing(var_2003) & abs(var_2003 - (322.98229166666664)) <= 1e-9 * max(1,abs(322.98229166666664)) if id==7
assert !missing(sd_2003) & abs(sd_2003 - (17.97170808984685)) <= 1e-9 * max(1,abs(17.97170808984685)) if id==7
assert !missing(skew_2003) & abs(skew_2003 - (-0.27977664043836553)) <= 1e-9 * max(1,abs(-0.27977664043836553)) if id==7
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2003) & abs(gdd_2003 - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==7
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(heatdays_2003) & abs(heatdays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==7
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2003) & abs(cut01_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut03_2003) & abs(cut03_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(cut04_2003) & abs(cut04_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-12.666666666666657)) <= 1e-9 * max(1,abs(-12.666666666666657)) if id==7
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-0.22387051254291596)) <= 1e-9 * max(1,abs(-0.22387051254291596)) if id==7
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-5.3333333333333339)) <= 1e-9 * max(1,abs(-5.3333333333333339)) if id==7
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==7
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (0.20739033894608513)) <= 1e-9 * max(1,abs(0.20739033894608513)) if id==7
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.02083333333333337)) <= 1e-9 * max(1,abs(0.02083333333333337)) if id==7
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (0.10482848367219201)) <= 1e-9 * max(1,abs(0.10482848367219201)) if id==7
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7
assert !missing(z_heat_2003) & abs(z_heat_2003 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==7
assert !missing(mean_2004) & abs(mean_2004 - (15.75)) <= 1e-9 * max(1,abs(15.75)) if id==7
assert !missing(median_2004) & abs(median_2004 - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==7
assert !missing(var_2004) & abs(var_2004 - (366.29807692307691)) <= 1e-9 * max(1,abs(366.29807692307691)) if id==7
assert !missing(sd_2004) & abs(sd_2004 - (19.138915249383306)) <= 1e-9 * max(1,abs(19.138915249383306)) if id==7
assert !missing(skew_2004) & abs(skew_2004 - (-0.20368346708570376)) <= 1e-9 * max(1,abs(-0.20368346708570376)) if id==7
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==7
assert !missing(gdd_2004) & abs(gdd_2004 - (138.5)) <= 1e-9 * max(1,abs(138.5)) if id==7
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(heatdays_2004) & abs(heatdays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.2857142857142857)) <= 1e-9 * max(1,abs(0.2857142857142857)) if id==7
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(heat_end_2004) & abs(heat_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2004) & abs(cut01_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-23.666666666666657)) <= 1e-9 * max(1,abs(-23.666666666666657)) if id==7
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-0.4182843786986063)) <= 1e-9 * max(1,abs(-0.4182843786986063)) if id==7
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==7
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==7
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==7
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.41478067789216999)) <= 1e-9 * max(1,abs(-0.41478067789216999)) if id==7
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.068452380952380931)) <= 1e-9 * max(1,abs(-0.068452380952380931)) if id==7
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.34443644635148729)) <= 1e-9 * max(1,abs(-0.34443644635148729)) if id==7
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==7
assert !missing(z_heat_2004) & abs(z_heat_2004 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==7
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==8
assert !missing(mean_2000) & abs(mean_2000 - (18.133333333333333)) <= 1e-9 * max(1,abs(18.133333333333333)) if id==8
assert !missing(median_2000) & abs(median_2000 - (20)) <= 1e-9 * max(1,abs(20)) if id==8
assert !missing(var_2000) & abs(var_2000 - (220.83809523809524)) <= 1e-9 * max(1,abs(220.83809523809524)) if id==8
assert !missing(sd_2000) & abs(sd_2000 - (14.860622303190913)) <= 1e-9 * max(1,abs(14.860622303190913)) if id==8
assert !missing(skew_2000) & abs(skew_2000 - (-0.22252475462041754)) <= 1e-9 * max(1,abs(-0.22252475462041754)) if id==8
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2000) & abs(gdd_2000 - (140)) <= 1e-9 * max(1,abs(140)) if id==8
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==8
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut02_2000) & abs(cut02_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (0.33333333333334281)) <= 1e-9 * max(1,abs(0.33333333333334281)) if id==8
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.017092144290167095)) <= 1e-9 * max(1,abs(0.017092144290167095)) if id==8
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heatdays_2000) if id==8
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.013888888888888895)) <= 1e-9 * max(1,abs(0.013888888888888895)) if id==8
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (1.154700538379253)) <= 1e-9 * max(1,abs(1.154700538379253)) if id==8
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==8
assert !missing(z_heat_2000) & abs(z_heat_2000 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==8
assert !missing(nobs_2001) & abs(nobs_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(mean_2001) & abs(mean_2001 - (13.875)) <= 1e-9 * max(1,abs(13.875)) if id==8
assert !missing(median_2001) & abs(median_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(var_2001) & abs(var_2001 - (322.91666666666669)) <= 1e-9 * max(1,abs(322.91666666666669)) if id==8
assert !missing(sd_2001) & abs(sd_2001 - (17.969882210706523)) <= 1e-9 * max(1,abs(17.969882210706523)) if id==8
assert !missing(skew_2001) & abs(skew_2001 - (0.30735297590892763)) <= 1e-9 * max(1,abs(0.30735297590892763)) if id==8
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2001) & abs(gdd_2001 - (120)) <= 1e-9 * max(1,abs(120)) if id==8
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==8
assert !missing(heatdays_2001) & abs(heatdays_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.3125)) <= 1e-9 * max(1,abs(0.3125)) if id==8
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2001) & abs(cut01_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(cut02_2001) & abs(cut02_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2001) & abs(cut04_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (-19.666666666666657)) <= 1e-9 * max(1,abs(-19.666666666666657)) if id==8
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (-1.0084365131198294)) <= 1e-9 * max(1,abs(-1.0084365131198294)) if id==8
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heatdays_2001) if id==8
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.0069444444444444198)) <= 1e-9 * max(1,abs(-0.0069444444444444198)) if id==8
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.57735026918962418)) <= 1e-9 * max(1,abs(-0.57735026918962418)) if id==8
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==8
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==8
assert !missing(nobs_2002) & abs(nobs_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(mean_2002) & abs(mean_2002 - (15.3125)) <= 1e-9 * max(1,abs(15.3125)) if id==8
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==8
assert !missing(var_2002) & abs(var_2002 - (317.39583333333331)) <= 1e-9 * max(1,abs(317.39583333333331)) if id==8
assert !missing(sd_2002) & abs(sd_2002 - (17.815606454267375)) <= 1e-9 * max(1,abs(17.815606454267375)) if id==8
assert !missing(skew_2002) & abs(skew_2002 - (-0.28972780712278712)) <= 1e-9 * max(1,abs(-0.28972780712278712)) if id==8
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2002) & abs(gdd_2002 - (159)) <= 1e-9 * max(1,abs(159)) if id==8
assert !missing(kdd_2002) & abs(kdd_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(heatdays_2002) & abs(heatdays_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.3125)) <= 1e-9 * max(1,abs(0.3125)) if id==8
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(heat_2002) & abs(heat_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(heat_end_2002) & abs(heat_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==8
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (19.333333333333343)) <= 1e-9 * max(1,abs(19.333333333333343)) if id==8
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.9913443688296637)) <= 1e-9 * max(1,abs(0.9913443688296637)) if id==8
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (-8)) <= 1e-9 * max(1,abs(-8)) if id==8
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert missing(z_heatdays_2002) if id==8
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.0069444444444444198)) <= 1e-9 * max(1,abs(-0.0069444444444444198)) if id==8
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.57735026918962418)) <= 1e-9 * max(1,abs(-0.57735026918962418)) if id==8
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==8
assert !missing(z_heat_2002) & abs(z_heat_2002 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==8
assert !missing(nobs_2003) & abs(nobs_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==8
assert !missing(mean_2003) & abs(mean_2003 - (19.300000000000001)) <= 1e-9 * max(1,abs(19.300000000000001)) if id==8
assert !missing(median_2003) & abs(median_2003 - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(var_2003) & abs(var_2003 - (414.49285714285713)) <= 1e-9 * max(1,abs(414.49285714285713)) if id==8
assert !missing(sd_2003) & abs(sd_2003 - (20.359097650506445)) <= 1e-9 * max(1,abs(20.359097650506445)) if id==8
assert !missing(skew_2003) & abs(skew_2003 - (-0.62810491399606672)) <= 1e-9 * max(1,abs(-0.62810491399606672)) if id==8
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2003) & abs(gdd_2003 - (179.5)) <= 1e-9 * max(1,abs(179.5)) if id==8
assert !missing(kdd_2003) & abs(kdd_2003 - (24)) <= 1e-9 * max(1,abs(24)) if id==8
assert !missing(heatdays_2003) & abs(heatdays_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==8
assert !missing(heat_start_2003) & abs(heat_start_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(cut02_2003) & abs(cut02_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut03_2003) & abs(cut03_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut04_2003) & abs(cut04_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (39.833333333333343)) <= 1e-9 * max(1,abs(39.833333333333343)) if id==8
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (2.0425112426749101)) <= 1e-9 * max(1,abs(2.0425112426749101)) if id==8
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert missing(z_heatdays_2003) if id==8
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (0.21388888888888891)) <= 1e-9 * max(1,abs(0.21388888888888891)) if id==8
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (17.78238829104049)) <= 1e-9 * max(1,abs(17.78238829104049)) if id==8
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==8
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==8
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==8
assert !missing(mean_2004) & abs(mean_2004 - (28.392857142857142)) <= 1e-9 * max(1,abs(28.392857142857142)) if id==8
assert !missing(median_2004) & abs(median_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(var_2004) & abs(var_2004 - (129.23763736263737)) <= 1e-9 * max(1,abs(129.23763736263737)) if id==8
assert !missing(sd_2004) & abs(sd_2004 - (11.368273279730628)) <= 1e-9 * max(1,abs(11.368273279730628)) if id==8
assert !missing(skew_2004) & abs(skew_2004 - (-0.78244673315274327)) <= 1e-9 * max(1,abs(-0.78244673315274327)) if id==8
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==8
assert !missing(gdd_2004) & abs(gdd_2004 - (209.5)) <= 1e-9 * max(1,abs(209.5)) if id==8
assert !missing(kdd_2004) & abs(kdd_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==8
assert !missing(heatdays_2004) & abs(heatdays_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==8
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(heat_2004) & abs(heat_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut01_2004) & abs(cut01_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2004) & abs(cut04_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (69.833333333333343)) <= 1e-9 * max(1,abs(69.833333333333343)) if id==8
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (3.5808042287899049)) <= 1e-9 * max(1,abs(3.5808042287899049)) if id==8
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert missing(z_heatdays_2004) if id==8
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.32341269841269848)) <= 1e-9 * max(1,abs(0.32341269841269848)) if id==8
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (26.888026822259743)) <= 1e-9 * max(1,abs(26.888026822259743)) if id==8
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==8
assert !missing(z_heat_2004) & abs(z_heat_2004 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==8
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean_2000) & abs(mean_2000 - (21.533333333333335)) <= 1e-9 * max(1,abs(21.533333333333335)) if id==9
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==9
assert !missing(var_2000) & abs(var_2000 - (245.23095238095237)) <= 1e-9 * max(1,abs(245.23095238095237)) if id==9
assert !missing(sd_2000) & abs(sd_2000 - (15.659851607884168)) <= 1e-9 * max(1,abs(15.659851607884168)) if id==9
assert !missing(skew_2000) & abs(skew_2000 - (-0.78712057186044371)) <= 1e-9 * max(1,abs(-0.78712057186044371)) if id==9
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2000) & abs(gdd_2000 - (189)) <= 1e-9 * max(1,abs(189)) if id==9
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(heatdays_2000) & abs(heatdays_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==9
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==9
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2000) & abs(cut01_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(cut02_2000) & abs(cut02_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (23.333333333333343)) <= 1e-9 * max(1,abs(23.333333333333343)) if id==9
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.92717264994553095)) <= 1e-9 * max(1,abs(0.92717264994553095)) if id==9
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==9
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==9
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==9
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (1.091089451179962)) <= 1e-9 * max(1,abs(1.091089451179962)) if id==9
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.1111111111111111)) <= 1e-9 * max(1,abs(0.1111111111111111)) if id==9
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==9
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==9
assert !missing(z_heat_2000) & abs(z_heat_2000 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==9
assert !missing(nobs_2001) & abs(nobs_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean_2001) & abs(mean_2001 - (15.666666666666666)) <= 1e-9 * max(1,abs(15.666666666666666)) if id==9
assert !missing(median_2001) & abs(median_2001 - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var_2001) & abs(var_2001 - (323.63095238095241)) <= 1e-9 * max(1,abs(323.63095238095241)) if id==9
assert !missing(sd_2001) & abs(sd_2001 - (17.98974575642892)) <= 1e-9 * max(1,abs(17.98974575642892)) if id==9
assert !missing(skew_2001) & abs(skew_2001 - (-0.6650534070405637)) <= 1e-9 * max(1,abs(-0.6650534070405637)) if id==9
assert !missing(max_2001) & abs(max_2001 - (32)) <= 1e-9 * max(1,abs(32)) if id==9
assert !missing(gdd_2001) & abs(gdd_2001 - (169)) <= 1e-9 * max(1,abs(169)) if id==9
assert !missing(kdd_2001) & abs(kdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heatdays_2001) & abs(heatdays_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==9
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2001) & abs(cut01_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02_2001) & abs(cut02_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (3.3333333333333428)) <= 1e-9 * max(1,abs(3.3333333333333428)) if id==9
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.13245323570650475)) <= 1e-9 * max(1,abs(0.13245323570650475)) if id==9
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (-10.666666666666666)) <= 1e-9 * max(1,abs(-10.666666666666666)) if id==9
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (-1.1547005383792515)) <= 1e-9 * max(1,abs(-1.1547005383792515)) if id==9
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==9
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (-0.21821789023599217)) <= 1e-9 * max(1,abs(-0.21821789023599217)) if id==9
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.022222222222222254)) <= 1e-9 * max(1,abs(-0.022222222222222254)) if id==9
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.2182178902359927)) <= 1e-9 * max(1,abs(-0.2182178902359927)) if id==9
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==9
assert !missing(z_heat_2001) & abs(z_heat_2001 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==9
assert !missing(nobs_2002) & abs(nobs_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean_2002) & abs(mean_2002 - (14.6)) <= 1e-9 * max(1,abs(14.6)) if id==9
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var_2002) & abs(var_2002 - (338.79285714285714)) <= 1e-9 * max(1,abs(338.79285714285714)) if id==9
assert !missing(sd_2002) & abs(sd_2002 - (18.406326552108574)) <= 1e-9 * max(1,abs(18.406326552108574)) if id==9
assert !missing(skew_2002) & abs(skew_2002 - (-0.093640268080045622)) <= 1e-9 * max(1,abs(-0.093640268080045622)) if id==9
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2002) & abs(gdd_2002 - (139)) <= 1e-9 * max(1,abs(139)) if id==9
assert !missing(kdd_2002) & abs(kdd_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(heatdays_2002) & abs(heatdays_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.26666666666666666)) <= 1e-9 * max(1,abs(0.26666666666666666)) if id==9
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2002) & abs(heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(cut02_2002) & abs(cut02_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2002) & abs(cut04_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-26.666666666666657)) <= 1e-9 * max(1,abs(-26.666666666666657)) if id==9
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-1.0596258856520346)) <= 1e-9 * max(1,abs(-1.0596258856520346)) if id==9
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==9
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==9
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==9
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-0.87287156094396923)) <= 1e-9 * max(1,abs(-0.87287156094396923)) if id==9
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.088888888888888906)) <= 1e-9 * max(1,abs(-0.088888888888888906)) if id==9
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.87287156094396967)) <= 1e-9 * max(1,abs(-0.87287156094396967)) if id==9
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==9
assert !missing(z_heat_2002) & abs(z_heat_2002 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==9
assert !missing(nobs_2003) & abs(nobs_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean_2003) & abs(mean_2003 - (16.100000000000001)) <= 1e-9 * max(1,abs(16.100000000000001)) if id==9
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var_2003) & abs(var_2003 - (343.29285714285714)) <= 1e-9 * max(1,abs(343.29285714285714)) if id==9
assert !missing(sd_2003) & abs(sd_2003 - (18.528163890220132)) <= 1e-9 * max(1,abs(18.528163890220132)) if id==9
assert !missing(skew_2003) & abs(skew_2003 - (-0.41844408543304157)) <= 1e-9 * max(1,abs(-0.41844408543304157)) if id==9
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2003) & abs(gdd_2003 - (149.5)) <= 1e-9 * max(1,abs(149.5)) if id==9
assert !missing(kdd_2003) & abs(kdd_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(heatdays_2003) & abs(heatdays_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==9
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut02_2003) & abs(cut02_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-16.166666666666657)) <= 1e-9 * max(1,abs(-16.166666666666657)) if id==9
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-0.64239819317654578)) <= 1e-9 * max(1,abs(-0.64239819317654578)) if id==9
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==9
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==9
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==9
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-0.21821789023599217)) <= 1e-9 * max(1,abs(-0.21821789023599217)) if id==9
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.022222222222222254)) <= 1e-9 * max(1,abs(-0.022222222222222254)) if id==9
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-0.2182178902359927)) <= 1e-9 * max(1,abs(-0.2182178902359927)) if id==9
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==9
assert !missing(z_heat_2003) & abs(z_heat_2003 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==9
assert !missing(nobs_2004) & abs(nobs_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==9
assert !missing(mean_2004) & abs(mean_2004 - (15.433333333333334)) <= 1e-9 * max(1,abs(15.433333333333334)) if id==9
assert !missing(median_2004) & abs(median_2004 - (20)) <= 1e-9 * max(1,abs(20)) if id==9
assert !missing(var_2004) & abs(var_2004 - (258.6738095238095)) <= 1e-9 * max(1,abs(258.6738095238095)) if id==9
assert !missing(sd_2004) & abs(sd_2004 - (16.083339501602566)) <= 1e-9 * max(1,abs(16.083339501602566)) if id==9
assert !missing(skew_2004) & abs(skew_2004 - (-0.06680944234391302)) <= 1e-9 * max(1,abs(-0.06680944234391302)) if id==9
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==9
assert !missing(gdd_2004) & abs(gdd_2004 - (119.5)) <= 1e-9 * max(1,abs(119.5)) if id==9
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(heatdays_2004) & abs(heatdays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==9
assert !missing(heat_start_2004) & abs(heat_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2004) & abs(cut01_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut02_2004) & abs(cut02_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-46.166666666666657)) <= 1e-9 * max(1,abs(-46.166666666666657)) if id==9
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-1.8344773145350852)) <= 1e-9 * max(1,abs(-1.8344773145350852)) if id==9
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (5.3333333333333339)) <= 1e-9 * max(1,abs(5.3333333333333339)) if id==9
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==9
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==9
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-1.5275252316519463)) <= 1e-9 * max(1,abs(-1.5275252316519463)) if id==9
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.15555555555555556)) <= 1e-9 * max(1,abs(-0.15555555555555556)) if id==9
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-1.5275252316519465)) <= 1e-9 * max(1,abs(-1.5275252316519465)) if id==9
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==9
assert !missing(z_heat_2004) & abs(z_heat_2004 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==9
assert !missing(nobs_2000) & abs(nobs_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(mean_2000) & abs(mean_2000 - (14.53125)) <= 1e-9 * max(1,abs(14.53125)) if id==10
assert !missing(median_2000) & abs(median_2000 - (19.75)) <= 1e-9 * max(1,abs(19.75)) if id==10
assert !missing(var_2000) & abs(var_2000 - (392.015625)) <= 1e-9 * max(1,abs(392.015625)) if id==10
assert !missing(sd_2000) & abs(sd_2000 - (19.799384460129058)) <= 1e-9 * max(1,abs(19.799384460129058)) if id==10
assert !missing(skew_2000) & abs(skew_2000 - (-0.10682433682608744)) <= 1e-9 * max(1,abs(-0.10682433682608744)) if id==10
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2000) & abs(gdd_2000 - (158.5)) <= 1e-9 * max(1,abs(158.5)) if id==10
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(heatdays_2000) & abs(heatdays_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.3125)) <= 1e-9 * max(1,abs(0.3125)) if id==10
assert !missing(heat_start_2000) & abs(heat_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2000) & abs(cut01_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==10
assert !missing(cut02_2000) & abs(cut02_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (-20.5)) <= 1e-9 * max(1,abs(-20.5)) if id==10
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (-1.1545860699241124)) <= 1e-9 * max(1,abs(-1.1545860699241124)) if id==10
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-5.3333333333333321)) <= 1e-9 * max(1,abs(-5.3333333333333321)) if id==10
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==10
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==10
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (-0.11698717948717946)) <= 1e-9 * max(1,abs(-0.11698717948717946)) if id==10
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (-1.0335133912270611)) <= 1e-9 * max(1,abs(-1.0335133912270611)) if id==10
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2000) if id==10
assert !missing(nobs_2001) & abs(nobs_2001 - (13)) <= 1e-9 * max(1,abs(13)) if id==10
assert !missing(mean_2001) & abs(mean_2001 - (25.76923076923077)) <= 1e-9 * max(1,abs(25.76923076923077)) if id==10
assert !missing(median_2001) & abs(median_2001 - (30)) <= 1e-9 * max(1,abs(30)) if id==10
assert !missing(var_2001) & abs(var_2001 - (214.98397435897436)) <= 1e-9 * max(1,abs(214.98397435897436)) if id==10
assert !missing(sd_2001) & abs(sd_2001 - (14.662331818608333)) <= 1e-9 * max(1,abs(14.662331818608333)) if id==10
assert !missing(skew_2001) & abs(skew_2001 - (-1.3824665054747562)) <= 1e-9 * max(1,abs(-1.3824665054747562)) if id==10
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2001) & abs(gdd_2001 - (189)) <= 1e-9 * max(1,abs(189)) if id==10
assert !missing(kdd_2001) & abs(kdd_2001 - (24)) <= 1e-9 * max(1,abs(24)) if id==10
assert !missing(heatdays_2001) & abs(heatdays_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==10
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==10
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2001) & abs(cut01_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut02_2001) & abs(cut02_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut04_2001) & abs(cut04_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.56321271703615239)) <= 1e-9 * max(1,abs(0.56321271703615239)) if id==10
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (2.6666666666666679)) <= 1e-9 * max(1,abs(2.6666666666666679)) if id==10
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==10
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==10
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==10
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (0.10897435897435898)) <= 1e-9 * max(1,abs(0.10897435897435898)) if id==10
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (0.96272480278685157)) <= 1e-9 * max(1,abs(0.96272480278685157)) if id==10
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2001) if id==10
assert !missing(nobs_2002) & abs(nobs_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(mean_2002) & abs(mean_2002 - (20.21875)) <= 1e-9 * max(1,abs(20.21875)) if id==10
assert !missing(median_2002) & abs(median_2002 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==10
assert !missing(var_2002) & abs(var_2002 - (311.83229166666666)) <= 1e-9 * max(1,abs(311.83229166666666)) if id==10
assert !missing(sd_2002) & abs(sd_2002 - (17.658773787176354)) <= 1e-9 * max(1,abs(17.658773787176354)) if id==10
assert !missing(skew_2002) & abs(skew_2002 - (-0.77146054198001768)) <= 1e-9 * max(1,abs(-0.77146054198001768)) if id==10
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2002) & abs(gdd_2002 - (189.5)) <= 1e-9 * max(1,abs(189.5)) if id==10
assert !missing(kdd_2002) & abs(kdd_2002 - (24)) <= 1e-9 * max(1,abs(24)) if id==10
assert !missing(heatdays_2002) & abs(heatdays_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==10
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==10
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2002) & abs(heat_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2002) & abs(cut01_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut02_2002) & abs(cut02_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut04_2002) & abs(cut04_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (10.5)) <= 1e-9 * max(1,abs(10.5)) if id==10
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.59137335288796)) <= 1e-9 * max(1,abs(0.59137335288796)) if id==10
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (2.6666666666666679)) <= 1e-9 * max(1,abs(2.6666666666666679)) if id==10
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==10
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==10
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==10
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.0080128205128205399)) <= 1e-9 * max(1,abs(0.0080128205128205399)) if id==10
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (0.07078858844020991)) <= 1e-9 * max(1,abs(0.07078858844020991)) if id==10
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2002) if id==10
assert !missing(nobs_2003) & abs(nobs_2003 - (17)) <= 1e-9 * max(1,abs(17)) if id==10
assert !missing(mean_2003) & abs(mean_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(var_2003) & abs(var_2003 - (217)) <= 1e-9 * max(1,abs(217)) if id==10
assert !missing(sd_2003) & abs(sd_2003 - (14.730919862656235)) <= 1e-9 * max(1,abs(14.730919862656235)) if id==10
assert !missing(skew_2003) & abs(skew_2003 - (-0.38822382190227839)) <= 1e-9 * max(1,abs(-0.38822382190227839)) if id==10
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2003) & abs(gdd_2003 - (150)) <= 1e-9 * max(1,abs(150)) if id==10
assert !missing(kdd_2003) & abs(kdd_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(heatdays_2003) & abs(heatdays_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.29411764705882354)) <= 1e-9 * max(1,abs(0.29411764705882354)) if id==10
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2003) & abs(heat_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(heat_end_2003) & abs(heat_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut02_2003) & abs(cut02_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(cut03_2003) & abs(cut03_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut04_2003) & abs(cut04_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-29)) <= 1e-9 * max(1,abs(-29)) if id==10
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-1.6333168794048418)) <= 1e-9 * max(1,abs(-1.6333168794048418)) if id==10
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-13.333333333333332)) <= 1e-9 * max(1,abs(-13.333333333333332)) if id==10
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-2.8867513459481287)) <= 1e-9 * max(1,abs(-2.8867513459481287)) if id==10
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==10
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.13536953242835592)) <= 1e-9 * max(1,abs(-0.13536953242835592)) if id==10
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-1.1959107411781302)) <= 1e-9 * max(1,abs(-1.1959107411781302)) if id==10
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert missing(z_heat_2003) if id==10
assert !missing(nobs_2004) & abs(nobs_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==10
assert !missing(mean_2004) & abs(mean_2004 - (17.866666666666667)) <= 1e-9 * max(1,abs(17.866666666666667)) if id==10
assert !missing(median_2004) & abs(median_2004 - (20)) <= 1e-9 * max(1,abs(20)) if id==10
assert !missing(var_2004) & abs(var_2004 - (270.90952380952382)) <= 1e-9 * max(1,abs(270.90952380952382)) if id==10
assert !missing(sd_2004) & abs(sd_2004 - (16.459329385170097)) <= 1e-9 * max(1,abs(16.459329385170097)) if id==10
assert !missing(skew_2004) & abs(skew_2004 - (-0.501851501127485)) <= 1e-9 * max(1,abs(-0.501851501127485)) if id==10
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==10
assert !missing(gdd_2004) & abs(gdd_2004 - (158)) <= 1e-9 * max(1,abs(158)) if id==10
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(heatdays_2004) & abs(heatdays_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.13333333333333333)) <= 1e-9 * max(1,abs(0.13333333333333333)) if id==10
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(heat_2004) & abs(heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2004) & abs(cut01_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut02_2004) & abs(cut02_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==10
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-21)) <= 1e-9 * max(1,abs(-21)) if id==10
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-1.18274670577592)) <= 1e-9 * max(1,abs(-1.18274670577592)) if id==10
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-5.3333333333333321)) <= 1e-9 * max(1,abs(-5.3333333333333321)) if id==10
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==10
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-4.333333333333333)) <= 1e-9 * max(1,abs(-4.333333333333333)) if id==10
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-3.7527767497325675)) <= 1e-9 * max(1,abs(-3.7527767497325675)) if id==10
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.2961538461538461)) <= 1e-9 * max(1,abs(-0.2961538461538461)) if id==10
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-2.6163462287501491)) <= 1e-9 * max(1,abs(-2.6163462287501491)) if id==10
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert missing(z_heat_2004) if id==10
assert !missing(nobs_2000) & abs(nobs_2000 - (17)) <= 1e-9 * max(1,abs(17)) if id==11
assert !missing(mean_2000) & abs(mean_2000 - (23.911764705882351)) <= 1e-9 * max(1,abs(23.911764705882351)) if id==11
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==11
assert !missing(var_2000) & abs(var_2000 - (167.91360294117646)) <= 1e-9 * max(1,abs(167.91360294117646)) if id==11
assert !missing(sd_2000) & abs(sd_2000 - (12.958148129311397)) <= 1e-9 * max(1,abs(12.958148129311397)) if id==11
assert !missing(skew_2000) & abs(skew_2000 - (-0.78331269229263334)) <= 1e-9 * max(1,abs(-0.78331269229263334)) if id==11
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(gdd_2000) & abs(gdd_2000 - (228.5)) <= 1e-9 * max(1,abs(228.5)) if id==11
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==11
assert !missing(heatdays_2000) & abs(heatdays_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.47058823529411764)) <= 1e-9 * max(1,abs(0.47058823529411764)) if id==11
assert !missing(heat_start_2000) & abs(heat_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_2000) & abs(heat_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_end_2000) & abs(heat_end_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut01_2000) & abs(cut01_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2000) & abs(cut02_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==11
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2000) & abs(cut04_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (30)) <= 1e-9 * max(1,abs(30)) if id==11
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.81619434268641478)) <= 1e-9 * max(1,abs(0.81619434268641478)) if id==11
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==11
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (0.21821789023599231)) <= 1e-9 * max(1,abs(0.21821789023599231)) if id==11
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==11
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (0.44022545316281197)) <= 1e-9 * max(1,abs(0.44022545316281197)) if id==11
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.02740070387129212)) <= 1e-9 * max(1,abs(0.02740070387129212)) if id==11
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (0.10383396651802833)) <= 1e-9 * max(1,abs(0.10383396651802833)) if id==11
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_heat_2000) & abs(z_heat_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(nobs_2001) & abs(nobs_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==11
assert !missing(mean_2001) & abs(mean_2001 - (20.958333333333332)) <= 1e-9 * max(1,abs(20.958333333333332)) if id==11
assert !missing(median_2001) & abs(median_2001 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==11
assert !missing(var_2001) & abs(var_2001 - (193.47537878787878)) <= 1e-9 * max(1,abs(193.47537878787878)) if id==11
assert !missing(sd_2001) & abs(sd_2001 - (13.909542723895663)) <= 1e-9 * max(1,abs(13.909542723895663)) if id==11
assert !missing(skew_2001) & abs(skew_2001 - (-1.393914143709714)) <= 1e-9 * max(1,abs(-1.393914143709714)) if id==11
assert !missing(max_2001) & abs(max_2001 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2001) & abs(gdd_2001 - (157.5)) <= 1e-9 * max(1,abs(157.5)) if id==11
assert !missing(kdd_2001) & abs(kdd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2001) & abs(heatdays_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.16666666666666666)) <= 1e-9 * max(1,abs(0.16666666666666666)) if id==11
assert !missing(heat_start_2001) & abs(heat_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2001) & abs(heat_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_end_2001) & abs(heat_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2001) & abs(cut01_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2001) & abs(cut02_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (-41)) <= 1e-9 * max(1,abs(-41)) if id==11
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (-1.1154656016714335)) <= 1e-9 * max(1,abs(-1.1154656016714335)) if id==11
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (-13.333333333333334)) <= 1e-9 * max(1,abs(-13.333333333333334)) if id==11
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (-1.0910894511799618)) <= 1e-9 * max(1,abs(-1.0910894511799618)) if id==11
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (-4.333333333333333)) <= 1e-9 * max(1,abs(-4.333333333333333)) if id==11
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (-1.1445861782233109)) <= 1e-9 * max(1,abs(-1.1445861782233109)) if id==11
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.27652086475615889)) <= 1e-9 * max(1,abs(-0.27652086475615889)) if id==11
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-1.0478657171544139)) <= 1e-9 * max(1,abs(-1.0478657171544139)) if id==11
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==11
assert !missing(mean_2002) & abs(mean_2002 - (25.5)) <= 1e-9 * max(1,abs(25.5)) if id==11
assert !missing(median_2002) & abs(median_2002 - (30)) <= 1e-9 * max(1,abs(30)) if id==11
assert !missing(var_2002) & abs(var_2002 - (278.41666666666669)) <= 1e-9 * max(1,abs(278.41666666666669)) if id==11
assert !missing(sd_2002) & abs(sd_2002 - (16.685822325155769)) <= 1e-9 * max(1,abs(16.685822325155769)) if id==11
assert !missing(skew_2002) & abs(skew_2002 - (-1.6896886779703375)) <= 1e-9 * max(1,abs(-1.6896886779703375)) if id==11
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==11
assert !missing(gdd_2002) & abs(gdd_2002 - (209.5)) <= 1e-9 * max(1,abs(209.5)) if id==11
assert !missing(kdd_2002) & abs(kdd_2002 - (24)) <= 1e-9 * max(1,abs(24)) if id==11
assert !missing(heatdays_2002) & abs(heatdays_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==11
assert !missing(heat_start_2002) & abs(heat_start_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_2002) & abs(heat_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(heat_end_2002) & abs(heat_end_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut01_2002) & abs(cut01_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut03_2002) & abs(cut03_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (11)) <= 1e-9 * max(1,abs(11)) if id==11
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (0.29927125898501877)) <= 1e-9 * max(1,abs(0.29927125898501877)) if id==11
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (10.666666666666666)) <= 1e-9 * max(1,abs(10.666666666666666)) if id==11
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (0.87287156094396945)) <= 1e-9 * max(1,abs(0.87287156094396945)) if id==11
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==11
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (0.70436072506049918)) <= 1e-9 * max(1,abs(0.70436072506049918)) if id==11
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (0.24912016088486677)) <= 1e-9 * max(1,abs(0.24912016088486677)) if id==11
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (0.94403175063638556)) <= 1e-9 * max(1,abs(0.94403175063638556)) if id==11
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(z_heat_2002) & abs(z_heat_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(nobs_2003) & abs(nobs_2003 - (13)) <= 1e-9 * max(1,abs(13)) if id==11
assert !missing(mean_2003) & abs(mean_2003 - (14)) <= 1e-9 * max(1,abs(14)) if id==11
assert !missing(median_2003) & abs(median_2003 - (20)) <= 1e-9 * max(1,abs(20)) if id==11
assert !missing(var_2003) & abs(var_2003 - (231.33333333333334)) <= 1e-9 * max(1,abs(231.33333333333334)) if id==11
assert !missing(sd_2003) & abs(sd_2003 - (15.209646062066446)) <= 1e-9 * max(1,abs(15.209646062066446)) if id==11
assert !missing(skew_2003) & abs(skew_2003 - (-0.40575163435914696)) <= 1e-9 * max(1,abs(-0.40575163435914696)) if id==11
assert !missing(max_2003) & abs(max_2003 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2003) & abs(gdd_2003 - (110)) <= 1e-9 * max(1,abs(110)) if id==11
assert !missing(kdd_2003) & abs(kdd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2003) & abs(heatdays_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.30769230769230771)) <= 1e-9 * max(1,abs(0.30769230769230771)) if id==11
assert !missing(heat_start_2003) & abs(heat_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_2003) & abs(heat_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut03_2003) & abs(cut03_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut04_2003) & abs(cut04_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (-88.5)) <= 1e-9 * max(1,abs(-88.5)) if id==11
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (-2.4077733109249237)) <= 1e-9 * max(1,abs(-2.4077733109249237)) if id==11
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (-13.333333333333334)) <= 1e-9 * max(1,abs(-13.333333333333334)) if id==11
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (-1.0910894511799618)) <= 1e-9 * max(1,abs(-1.0910894511799618)) if id==11
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==11
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-0.61631563442793658)) <= 1e-9 * max(1,abs(-0.61631563442793658)) if id==11
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.13549522373051781)) <= 1e-9 * max(1,abs(-0.13549522373051781)) if id==11
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-0.51345420140566256)) <= 1e-9 * max(1,abs(-0.51345420140566256)) if id==11
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(z_heat_2003) & abs(z_heat_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==11
assert !missing(mean_2004) & abs(mean_2004 - (11.857142857142858)) <= 1e-9 * max(1,abs(11.857142857142858)) if id==11
assert !missing(median_2004) & abs(median_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(var_2004) & abs(var_2004 - (323.36263736263737)) <= 1e-9 * max(1,abs(323.36263736263737)) if id==11
assert !missing(sd_2004) & abs(sd_2004 - (17.98228676677795)) <= 1e-9 * max(1,abs(17.98228676677795)) if id==11
assert !missing(skew_2004) & abs(skew_2004 - (-0.11677667417941884)) <= 1e-9 * max(1,abs(-0.11677667417941884)) if id==11
assert !missing(max_2004) & abs(max_2004 - (32)) <= 1e-9 * max(1,abs(32)) if id==11
assert !missing(gdd_2004) & abs(gdd_2004 - (120)) <= 1e-9 * max(1,abs(120)) if id==11
assert !missing(kdd_2004) & abs(kdd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heatdays_2004) & abs(heatdays_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.35714285714285715)) <= 1e-9 * max(1,abs(0.35714285714285715)) if id==11
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(heat_2004) & abs(heat_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(cut01_2004) & abs(cut01_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut02_2004) & abs(cut02_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (-78.5)) <= 1e-9 * max(1,abs(-78.5)) if id==11
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (-2.135708530029452)) <= 1e-9 * max(1,abs(-2.135708530029452)) if id==11
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-13.333333333333334)) <= 1e-9 * max(1,abs(-13.333333333333334)) if id==11
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-1.0910894511799618)) <= 1e-9 * max(1,abs(-1.0910894511799618)) if id==11
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==11
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (-0.35218036253024942)) <= 1e-9 * max(1,abs(-0.35218036253024942)) if id==11
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (-0.086044674279968369)) <= 1e-9 * max(1,abs(-0.086044674279968369)) if id==11
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (-0.32606315042882789)) <= 1e-9 * max(1,abs(-0.32606315042882789)) if id==11
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_heat_2004) & abs(z_heat_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(nobs_2000) & abs(nobs_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(mean_2000) & abs(mean_2000 - (21.28125)) <= 1e-9 * max(1,abs(21.28125)) if id==12
assert !missing(median_2000) & abs(median_2000 - (29.5)) <= 1e-9 * max(1,abs(29.5)) if id==12
assert !missing(var_2000) & abs(var_2000 - (252.56562500000001)) <= 1e-9 * max(1,abs(252.56562500000001)) if id==12
assert !missing(sd_2000) & abs(sd_2000 - (15.892313393587481)) <= 1e-9 * max(1,abs(15.892313393587481)) if id==12
assert !missing(skew_2000) & abs(skew_2000 - (-0.91673987964399239)) <= 1e-9 * max(1,abs(-0.91673987964399239)) if id==12
assert !missing(max_2000) & abs(max_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2000) & abs(gdd_2000 - (198.5)) <= 1e-9 * max(1,abs(198.5)) if id==12
assert !missing(kdd_2000) & abs(kdd_2000 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(heatdays_2000) & abs(heatdays_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(pct_heatdays_2000) & abs(pct_heatdays_2000 - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==12
assert !missing(heat_start_2000) & abs(heat_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_2000) & abs(heat_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(heat_end_2000) & abs(heat_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2000) & abs(cut01_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut02_2000) & abs(cut02_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(cut03_2000) & abs(cut03_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_gdd_2000) & abs(dev_gdd_2000 - (26.166666666666657)) <= 1e-9 * max(1,abs(26.166666666666657)) if id==12
assert !missing(z_gdd_2000) & abs(z_gdd_2000 - (0.87049102175461479)) <= 1e-9 * max(1,abs(0.87049102175461479)) if id==12
assert !missing(dev_kdd_2000) & abs(dev_kdd_2000 - (-2.6666666666666679)) <= 1e-9 * max(1,abs(-2.6666666666666679)) if id==12
assert !missing(z_kdd_2000) & abs(z_kdd_2000 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12
assert !missing(dev_heatdays_2000) & abs(dev_heatdays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(z_heatdays_2000) & abs(z_heatdays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dev_pct_heatdays_2000) & abs(dev_pct_heatdays_2000 - (0.038461538461538436)) <= 1e-9 * max(1,abs(0.038461538461538436)) if id==12
assert !missing(z_pct_heatdays_2000) & abs(z_pct_heatdays_2000 - (1.1428571428571421)) <= 1e-9 * max(1,abs(1.1428571428571421)) if id==12
assert !missing(dev_heat_2000) & abs(dev_heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(z_heat_2000) & abs(z_heat_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(nobs_2001) & abs(nobs_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(mean_2001) & abs(mean_2001 - (15.9375)) <= 1e-9 * max(1,abs(15.9375)) if id==12
assert !missing(median_2001) & abs(median_2001 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==12
assert !missing(var_2001) & abs(var_2001 - (409.89583333333331)) <= 1e-9 * max(1,abs(409.89583333333331)) if id==12
assert !missing(sd_2001) & abs(sd_2001 - (20.245884355427236)) <= 1e-9 * max(1,abs(20.245884355427236)) if id==12
assert !missing(skew_2001) & abs(skew_2001 - (-0.39565022095351376)) <= 1e-9 * max(1,abs(-0.39565022095351376)) if id==12
assert !missing(max_2001) & abs(max_2001 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2001) & abs(gdd_2001 - (179)) <= 1e-9 * max(1,abs(179)) if id==12
assert !missing(kdd_2001) & abs(kdd_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(heatdays_2001) & abs(heatdays_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(pct_heatdays_2001) & abs(pct_heatdays_2001 - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==12
assert !missing(heat_start_2001) & abs(heat_start_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(heat_2001) & abs(heat_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(heat_end_2001) & abs(heat_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2001) & abs(cut01_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(cut02_2001) & abs(cut02_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2001) & abs(cut04_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(dev_gdd_2001) & abs(dev_gdd_2001 - (6.6666666666666572)) <= 1e-9 * max(1,abs(6.6666666666666572)) if id==12
assert !missing(z_gdd_2001) & abs(z_gdd_2001 - (0.22178115203939205)) <= 1e-9 * max(1,abs(0.22178115203939205)) if id==12
assert !missing(dev_kdd_2001) & abs(dev_kdd_2001 - (-2.6666666666666679)) <= 1e-9 * max(1,abs(-2.6666666666666679)) if id==12
assert !missing(z_kdd_2001) & abs(z_kdd_2001 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12
assert !missing(dev_heatdays_2001) & abs(dev_heatdays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(z_heatdays_2001) & abs(z_heatdays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_pct_heatdays_2001) & abs(dev_pct_heatdays_2001 - (-0.024038461538461564)) <= 1e-9 * max(1,abs(-0.024038461538461564)) if id==12
assert !missing(z_pct_heatdays_2001) & abs(z_pct_heatdays_2001 - (-0.71428571428571508)) <= 1e-9 * max(1,abs(-0.71428571428571508)) if id==12
assert !missing(dev_heat_2001) & abs(dev_heat_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_heat_2001) & abs(z_heat_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==12
assert !missing(mean_2002) & abs(mean_2002 - (21.653846153846153)) <= 1e-9 * max(1,abs(21.653846153846153)) if id==12
assert !missing(median_2002) & abs(median_2002 - (20)) <= 1e-9 * max(1,abs(20)) if id==12
assert !missing(var_2002) & abs(var_2002 - (216.55769230769232)) <= 1e-9 * max(1,abs(216.55769230769232)) if id==12
assert !missing(sd_2002) & abs(sd_2002 - (14.71589930339605)) <= 1e-9 * max(1,abs(14.71589930339605)) if id==12
assert !missing(skew_2002) & abs(skew_2002 - (-0.13495426069449479)) <= 1e-9 * max(1,abs(-0.13495426069449479)) if id==12
assert !missing(max_2002) & abs(max_2002 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2002) & abs(gdd_2002 - (139.5)) <= 1e-9 * max(1,abs(139.5)) if id==12
assert !missing(kdd_2002) & abs(kdd_2002 - (24)) <= 1e-9 * max(1,abs(24)) if id==12
assert !missing(heatdays_2002) & abs(heatdays_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(pct_heatdays_2002) & abs(pct_heatdays_2002 - (0.38461538461538464)) <= 1e-9 * max(1,abs(0.38461538461538464)) if id==12
assert !missing(heat_start_2002) & abs(heat_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2002) & abs(heat_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(heat_end_2002) & abs(heat_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2002) & abs(cut01_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut02_2002) & abs(cut02_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_gdd_2002) & abs(dev_gdd_2002 - (-32.833333333333343)) <= 1e-9 * max(1,abs(-32.833333333333343)) if id==12
assert !missing(z_gdd_2002) & abs(z_gdd_2002 - (-1.0922721737940078)) <= 1e-9 * max(1,abs(-1.0922721737940078)) if id==12
assert !missing(dev_kdd_2002) & abs(dev_kdd_2002 - (5.3333333333333321)) <= 1e-9 * max(1,abs(5.3333333333333321)) if id==12
assert !missing(z_kdd_2002) & abs(z_kdd_2002 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==12
assert !missing(dev_heatdays_2002) & abs(dev_heatdays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_heatdays_2002) & abs(z_heatdays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(dev_pct_heatdays_2002) & abs(dev_pct_heatdays_2002 - (-0.014423076923076927)) <= 1e-9 * max(1,abs(-0.014423076923076927)) if id==12
assert !missing(z_pct_heatdays_2002) & abs(z_pct_heatdays_2002 - (-0.42857142857142871)) <= 1e-9 * max(1,abs(-0.42857142857142871)) if id==12
assert !missing(dev_heat_2002) & abs(dev_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(z_heat_2002) & abs(z_heat_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(mean_2003) & abs(mean_2003 - (21.28125)) <= 1e-9 * max(1,abs(21.28125)) if id==12
assert !missing(median_2003) & abs(median_2003 - (24.75)) <= 1e-9 * max(1,abs(24.75)) if id==12
assert !missing(var_2003) & abs(var_2003 - (292.56562500000001)) <= 1e-9 * max(1,abs(292.56562500000001)) if id==12
assert !missing(sd_2003) & abs(sd_2003 - (17.104549833304588)) <= 1e-9 * max(1,abs(17.104549833304588)) if id==12
assert !missing(skew_2003) & abs(skew_2003 - (-0.67907506458236933)) <= 1e-9 * max(1,abs(-0.67907506458236933)) if id==12
assert !missing(max_2003) & abs(max_2003 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2003) & abs(gdd_2003 - (188.5)) <= 1e-9 * max(1,abs(188.5)) if id==12
assert !missing(kdd_2003) & abs(kdd_2003 - (32)) <= 1e-9 * max(1,abs(32)) if id==12
assert !missing(heatdays_2003) & abs(heatdays_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(pct_heatdays_2003) & abs(pct_heatdays_2003 - (0.3125)) <= 1e-9 * max(1,abs(0.3125)) if id==12
assert !missing(heat_start_2003) & abs(heat_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2003) & abs(heat_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(heat_end_2003) & abs(heat_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2003) & abs(cut01_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut02_2003) & abs(cut02_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(cut03_2003) & abs(cut03_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut04_2003) & abs(cut04_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(dev_gdd_2003) & abs(dev_gdd_2003 - (16.166666666666657)) <= 1e-9 * max(1,abs(16.166666666666657)) if id==12
assert !missing(z_gdd_2003) & abs(z_gdd_2003 - (0.53781929369552617)) <= 1e-9 * max(1,abs(0.53781929369552617)) if id==12
assert !missing(dev_kdd_2003) & abs(dev_kdd_2003 - (13.333333333333332)) <= 1e-9 * max(1,abs(13.333333333333332)) if id==12
assert !missing(z_kdd_2003) & abs(z_kdd_2003 - (2.8867513459481287)) <= 1e-9 * max(1,abs(2.8867513459481287)) if id==12
assert !missing(dev_heatdays_2003) & abs(dev_heatdays_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_heatdays_2003) & abs(z_heatdays_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(dev_pct_heatdays_2003) & abs(dev_pct_heatdays_2003 - (-0.086538461538461564)) <= 1e-9 * max(1,abs(-0.086538461538461564)) if id==12
assert !missing(z_pct_heatdays_2003) & abs(z_pct_heatdays_2003 - (-2.5714285714285725)) <= 1e-9 * max(1,abs(-2.5714285714285725)) if id==12
assert !missing(dev_heat_2003) & abs(dev_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(z_heat_2003) & abs(z_heat_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==12
assert !missing(mean_2004) & abs(mean_2004 - (24.5)) <= 1e-9 * max(1,abs(24.5)) if id==12
assert !missing(median_2004) & abs(median_2004 - (30)) <= 1e-9 * max(1,abs(30)) if id==12
assert !missing(var_2004) & abs(var_2004 - (214.23076923076923)) <= 1e-9 * max(1,abs(214.23076923076923)) if id==12
assert !missing(sd_2004) & abs(sd_2004 - (14.636624242999792)) <= 1e-9 * max(1,abs(14.636624242999792)) if id==12
assert !missing(skew_2004) & abs(skew_2004 - (-1.4225217012964946)) <= 1e-9 * max(1,abs(-1.4225217012964946)) if id==12
assert !missing(max_2004) & abs(max_2004 - (40)) <= 1e-9 * max(1,abs(40)) if id==12
assert !missing(gdd_2004) & abs(gdd_2004 - (209)) <= 1e-9 * max(1,abs(209)) if id==12
assert !missing(kdd_2004) & abs(kdd_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(heatdays_2004) & abs(heatdays_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(pct_heatdays_2004) & abs(pct_heatdays_2004 - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==12
assert !missing(heat_start_2004) & abs(heat_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(heat_2004) & abs(heat_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(heat_end_2004) & abs(heat_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut03_2004) & abs(cut03_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut04_2004) & abs(cut04_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_gdd_2004) & abs(dev_gdd_2004 - (36.666666666666657)) <= 1e-9 * max(1,abs(36.666666666666657)) if id==12
assert !missing(z_gdd_2004) & abs(z_gdd_2004 - (1.2197963362166577)) <= 1e-9 * max(1,abs(1.2197963362166577)) if id==12
assert !missing(dev_kdd_2004) & abs(dev_kdd_2004 - (-2.6666666666666679)) <= 1e-9 * max(1,abs(-2.6666666666666679)) if id==12
assert !missing(z_kdd_2004) & abs(z_kdd_2004 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12
assert !missing(dev_heatdays_2004) & abs(dev_heatdays_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(z_heatdays_2004) & abs(z_heatdays_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dev_pct_heatdays_2004) & abs(dev_pct_heatdays_2004 - (0.17239010989010983)) <= 1e-9 * max(1,abs(0.17239010989010983)) if id==12
assert !missing(z_pct_heatdays_2004) & abs(z_pct_heatdays_2004 - (5.1224489795918355)) <= 1e-9 * max(1,abs(5.1224489795918355)) if id==12
assert !missing(dev_heat_2004) & abs(dev_heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(z_heat_2004) & abs(z_heat_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert _N==12
