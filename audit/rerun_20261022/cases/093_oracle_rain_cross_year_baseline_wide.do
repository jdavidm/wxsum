version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261022/oracle_rain.csv", clear varnames(1) asdouble
wxsum x_, type(rain) ini_month(12) ini_day(29) fin_month(3) fin_day(2) baseline(2000 2002) ref_min(2) minobs(2) shape(wide) keep(id) cuts(1 2 5)
assert !missing(nobs_2000) & abs(nobs_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(mean_2000) & abs(mean_2000 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1
assert !missing(median_2000) & abs(median_2000 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1
assert !missing(var_2000) & abs(var_2000 - (0.32000000000000001)) <= 1e-9 * max(1,abs(0.32000000000000001)) if id==1
assert !missing(sd_2000) & abs(sd_2000 - (0.56568542494923801)) <= 1e-9 * max(1,abs(0.56568542494923801)) if id==1
assert missing(skew_2000) if id==1
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1
assert !missing(total_2000) & abs(total_2000 - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1
assert !missing(raindays_2000) & abs(raindays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(norain_2000) & abs(norain_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1
assert !missing(dry_start_2000) & abs(dry_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_2000) & abs(dry_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2000) & abs(cut01_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut02_2000) & abs(cut02_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut04_2000) & abs(cut04_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-11.477777777777778)) <= 1e-9 * max(1,abs(-11.477777777777778)) if id==1
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-1.0680901419160094)) <= 1e-9 * max(1,abs(-1.0680901419160094)) if id==1
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-43.533333333333331)) <= 1e-9 * max(1,abs(-43.533333333333331)) if id==1
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.97992059869099135)) <= 1e-9 * max(1,abs(-0.97992059869099135)) if id==1
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (-5.666666666666667)) <= 1e-9 * max(1,abs(-5.666666666666667)) if id==1
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (-1.0288868055369642)) <= 1e-9 * max(1,abs(-1.0288868055369642)) if id==1
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-2.3333333333333335)) <= 1e-9 * max(1,abs(-2.3333333333333335)) if id==1
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-0.92717264994553072)) <= 1e-9 * max(1,abs(-0.92717264994553072)) if id==1
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (-0.11282051282051286)) <= 1e-9 * max(1,abs(-0.11282051282051286)) if id==1
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (-0.69113736774287526)) <= 1e-9 * max(1,abs(-0.69113736774287526)) if id==1
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_dry_2000) & abs(z_dry_2000 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2001) & abs(nobs_2001 - (13)) <= 1e-9 * max(1,abs(13)) if id==1
assert !missing(mean_2001) & abs(mean_2001 - (3.3076923076923075)) <= 1e-9 * max(1,abs(3.3076923076923075)) if id==1
assert !missing(median_2001) & abs(median_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(var_2001) & abs(var_2001 - (37.369102564102562)) <= 1e-9 * max(1,abs(37.369102564102562)) if id==1
assert !missing(sd_2001) & abs(sd_2001 - (6.1130272831145263)) <= 1e-9 * max(1,abs(6.1130272831145263)) if id==1
assert !missing(skew_2001) & abs(skew_2001 - (2.1237997821220285)) <= 1e-9 * max(1,abs(2.1237997821220285)) if id==1
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (14.333333333333334)) <= 1e-9 * max(1,abs(14.333333333333334)) if id==1
assert !missing(total_2001) & abs(total_2001 - (43)) <= 1e-9 * max(1,abs(43)) if id==1
assert !missing(raindays_2001) & abs(raindays_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(norain_2001) & abs(norain_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==1
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dry_2001) & abs(dry_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dry_end_2001) & abs(dry_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut01_2001) & abs(cut01_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(cut02_2001) & abs(cut02_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2001) & abs(cut04_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (1.6555555555555568)) <= 1e-9 * max(1,abs(1.6555555555555568)) if id==1
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (0.15406140478749808)) <= 1e-9 * max(1,abs(0.15406140478749808)) if id==1
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-1.7333333333333343)) <= 1e-9 * max(1,abs(-1.7333333333333343)) if id==1
assert !missing(z_total_2001) & abs(z_total_2001 - (-0.039016746655384058)) <= 1e-9 * max(1,abs(-0.039016746655384058)) if id==1
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==1
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (0.06052275326688019)) <= 1e-9 * max(1,abs(0.06052275326688019)) if id==1
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==1
assert !missing(z_norain_2001) & abs(z_norain_2001 - (1.0596258856520351)) <= 1e-9 * max(1,abs(1.0596258856520351)) if id==1
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.074358974358974428)) <= 1e-9 * max(1,abs(-0.074358974358974428)) if id==1
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-0.45552235601234986)) <= 1e-9 * max(1,abs(-0.45552235601234986)) if id==1
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==1
assert !missing(z_dry_2001) & abs(z_dry_2001 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==1
assert !missing(nobs_2002) & abs(nobs_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==1
assert !missing(mean_2002) & abs(mean_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(median_2002) & abs(median_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(var_2002) & abs(var_2002 - (50.142857142857146)) <= 1e-9 * max(1,abs(50.142857142857146)) if id==1
assert !missing(sd_2002) & abs(sd_2002 - (7.0811621322249882)) <= 1e-9 * max(1,abs(7.0811621322249882)) if id==1
assert !missing(skew_2002) & abs(skew_2002 - (0.96792634662515575)) <= 1e-9 * max(1,abs(0.96792634662515575)) if id==1
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (22.5)) <= 1e-9 * max(1,abs(22.5)) if id==1
assert !missing(total_2002) & abs(total_2002 - (90)) <= 1e-9 * max(1,abs(90)) if id==1
assert !missing(raindays_2002) & abs(raindays_2002 - (12)) <= 1e-9 * max(1,abs(12)) if id==1
assert !missing(norain_2002) & abs(norain_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==1
assert !missing(dry_start_2002) & abs(dry_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(dry_2002) & abs(dry_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end_2002) & abs(dry_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut01_2002) & abs(cut01_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2002) & abs(cut04_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (9.8222222222222229)) <= 1e-9 * max(1,abs(9.8222222222222229)) if id==1
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (0.9140287371285114)) <= 1e-9 * max(1,abs(0.9140287371285114)) if id==1
assert !missing(dev_total_2002) & abs(dev_total_2002 - (45.266666666666666)) <= 1e-9 * max(1,abs(45.266666666666666)) if id==1
assert !missing(z_total_2002) & abs(z_total_2002 - (1.0189373453463755)) <= 1e-9 * max(1,abs(1.0189373453463755)) if id==1
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (5.333333333333333)) <= 1e-9 * max(1,abs(5.333333333333333)) if id==1
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (0.96836405227008382)) <= 1e-9 * max(1,abs(0.96836405227008382)) if id==1
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==1
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.13245323570650444)) <= 1e-9 * max(1,abs(-0.13245323570650444)) if id==1
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (0.18717948717948718)) <= 1e-9 * max(1,abs(0.18717948717948718)) if id==1
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (1.1466597237552245)) <= 1e-9 * max(1,abs(1.1466597237552245)) if id==1
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_dry_2002) & abs(z_dry_2002 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==1
assert !missing(mean_2003) & abs(mean_2003 - (2.3187500000000001)) <= 1e-9 * max(1,abs(2.3187500000000001)) if id==1
assert !missing(median_2003) & abs(median_2003 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1
assert !missing(var_2003) & abs(var_2003 - (17.742958333333334)) <= 1e-9 * max(1,abs(17.742958333333334)) if id==1
assert !missing(sd_2003) & abs(sd_2003 - (4.2122391116048163)) <= 1e-9 * max(1,abs(4.2122391116048163)) if id==1
assert !missing(skew_2003) & abs(skew_2003 - (3.1937322646126645)) <= 1e-9 * max(1,abs(3.1937322646126645)) if id==1
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (9.2750000000000004)) <= 1e-9 * max(1,abs(9.2750000000000004)) if id==1
assert !missing(total_2003) & abs(total_2003 - (37.100000000000001)) <= 1e-9 * max(1,abs(37.100000000000001)) if id==1
assert !missing(raindays_2003) & abs(raindays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==1
assert !missing(norain_2003) & abs(norain_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==1
assert !missing(dry_start_2003) & abs(dry_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_2003) & abs(dry_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dry_end_2003) & abs(dry_end_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut01_2003) & abs(cut01_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(cut02_2003) & abs(cut02_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (-3.4027777777777768)) <= 1e-9 * max(1,abs(-3.4027777777777768)) if id==1
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (-0.31665305514208886)) <= 1e-9 * max(1,abs(-0.31665305514208886)) if id==1
assert !missing(dev_total_2003) & abs(dev_total_2003 - (-7.6333333333333329)) <= 1e-9 * max(1,abs(-7.6333333333333329)) if id==1
assert !missing(z_total_2003) & abs(z_total_2003 - (-0.17182374969390277)) <= 1e-9 * max(1,abs(-0.17182374969390277)) if id==1
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==1
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (-0.12104550653376053)) <= 1e-9 * max(1,abs(-0.12104550653376053)) if id==1
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (6.6666666666666661)) <= 1e-9 * max(1,abs(6.6666666666666661)) if id==1
assert !missing(z_norain_2003) & abs(z_norain_2003 - (2.6490647141300876)) <= 1e-9 * max(1,abs(2.6490647141300876)) if id==1
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (-0.23782051282051286)) <= 1e-9 * max(1,abs(-0.23782051282051286)) if id==1
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (-1.4568861558670834)) <= 1e-9 * max(1,abs(-1.4568861558670834)) if id==1
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==1
assert !missing(z_dry_2003) & abs(z_dry_2003 - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==1
assert !missing(nobs_2004) & abs(nobs_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(mean_2004) & abs(mean_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(median_2004) & abs(median_2004 - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==1
assert !missing(var_2004) & abs(var_2004 - (2.4066666666666667)) <= 1e-9 * max(1,abs(2.4066666666666667)) if id==1
assert !missing(sd_2004) & abs(sd_2004 - (1.5513435037626795)) <= 1e-9 * max(1,abs(1.5513435037626795)) if id==1
assert !missing(skew_2004) & abs(skew_2004 - (2.2500825646046452)) <= 1e-9 * max(1,abs(2.2500825646046452)) if id==1
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1
assert !missing(total_2004) & abs(total_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==1
assert !missing(raindays_2004) & abs(raindays_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(norain_2004) & abs(norain_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==1
assert !missing(dry_start_2004) & abs(dry_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_2004) & abs(dry_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(cut01_2004) & abs(cut01_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(cut02_2004) & abs(cut02_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04_2004) & abs(cut04_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (-10.177777777777777)) <= 1e-9 * max(1,abs(-10.177777777777777)) if id==1
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (-0.94711575023723571)) <= 1e-9 * max(1,abs(-0.94711575023723571)) if id==1
assert !missing(dev_total_2004) & abs(dev_total_2004 - (-34.733333333333334)) <= 1e-9 * max(1,abs(-34.733333333333334)) if id==1
assert !missing(z_total_2004) & abs(z_total_2004 - (-0.78183557720981089)) <= 1e-9 * max(1,abs(-0.78183557720981089)) if id==1
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (-3.666666666666667)) <= 1e-9 * max(1,abs(-3.666666666666667)) if id==1
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (-0.66575028593568275)) <= 1e-9 * max(1,abs(-0.66575028593568275)) if id==1
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (3.6666666666666665)) <= 1e-9 * max(1,abs(3.6666666666666665)) if id==1
assert !missing(z_norain_2004) & abs(z_norain_2004 - (1.4569855927715483)) <= 1e-9 * max(1,abs(1.4569855927715483)) if id==1
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.31282051282051287)) <= 1e-9 * max(1,abs(-0.31282051282051287)) if id==1
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-1.9163354287416083)) <= 1e-9 * max(1,abs(-1.9163354287416083)) if id==1
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1
assert !missing(nobs_2000) & abs(nobs_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2000) & abs(mean_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median_2000) & abs(median_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var_2000) & abs(var_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2000) & abs(sd_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2000) if id==2
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (9)) <= 1e-9 * max(1,abs(9)) if id==2
assert !missing(total_2000) & abs(total_2000 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(raindays_2000) & abs(raindays_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(norain_2000) & abs(norain_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start_2000) & abs(dry_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_2000) & abs(dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01_2000) & abs(cut01_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2000) & abs(cut03_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(cut04_2000) & abs(cut04_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_mean_mo_2000) if id==2
assert !missing(dev_total_2000) & abs(dev_total_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_total_2000) if id==2
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_raindays_2000) if id==2
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain_2000) if id==2
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays_2000) if id==2
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry_2000) if id==2
assert !missing(nobs_2001) & abs(nobs_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2001) & abs(mean_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median_2001) & abs(median_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var_2001) & abs(var_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2001) & abs(sd_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2001) if id==2
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (9)) <= 1e-9 * max(1,abs(9)) if id==2
assert !missing(total_2001) & abs(total_2001 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(raindays_2001) & abs(raindays_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(norain_2001) & abs(norain_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_2001) & abs(dry_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end_2001) & abs(dry_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01_2001) & abs(cut01_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2001) & abs(cut02_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2001) & abs(cut03_2001 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(cut04_2001) & abs(cut04_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_mean_mo_2001) if id==2
assert !missing(dev_total_2001) & abs(dev_total_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_total_2001) if id==2
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_raindays_2001) if id==2
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain_2001) if id==2
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays_2001) if id==2
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry_2001) if id==2
assert !missing(nobs_2002) & abs(nobs_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2002) & abs(mean_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median_2002) & abs(median_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var_2002) & abs(var_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2002) & abs(sd_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2002) if id==2
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==2
assert !missing(total_2002) & abs(total_2002 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(raindays_2002) & abs(raindays_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(norain_2002) & abs(norain_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start_2002) & abs(dry_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_2002) & abs(dry_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01_2002) & abs(cut01_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2002) & abs(cut02_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2002) & abs(cut03_2002 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(cut04_2002) & abs(cut04_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_mean_mo_2002) if id==2
assert !missing(dev_total_2002) & abs(dev_total_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_total_2002) if id==2
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_raindays_2002) if id==2
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain_2002) if id==2
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays_2002) if id==2
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry_2002) if id==2
assert !missing(nobs_2003) & abs(nobs_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(mean_2003) & abs(mean_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median_2003) & abs(median_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var_2003) & abs(var_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2003) & abs(sd_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2003) if id==2
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==2
assert !missing(total_2003) & abs(total_2003 - (38)) <= 1e-9 * max(1,abs(38)) if id==2
assert !missing(raindays_2003) & abs(raindays_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(norain_2003) & abs(norain_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_2003) & abs(dry_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01_2003) & abs(cut01_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2003) & abs(cut02_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2003) & abs(cut03_2003 - (19)) <= 1e-9 * max(1,abs(19)) if id==2
assert !missing(cut04_2003) & abs(cut04_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==2
assert missing(z_mean_mo_2003) if id==2
assert !missing(dev_total_2003) & abs(dev_total_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert missing(z_total_2003) if id==2
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert missing(z_raindays_2003) if id==2
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain_2003) if id==2
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays_2003) if id==2
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry_2003) if id==2
assert !missing(nobs_2004) & abs(nobs_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean_2004) & abs(mean_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median_2004) & abs(median_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var_2004) & abs(var_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd_2004) & abs(sd_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew_2004) if id==2
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==2
assert !missing(total_2004) & abs(total_2004 - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(raindays_2004) & abs(raindays_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(norain_2004) & abs(norain_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_2004) & abs(dry_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01_2004) & abs(cut01_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02_2004) & abs(cut02_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03_2004) & abs(cut03_2004 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(cut04_2004) & abs(cut04_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_mean_mo_2004) if id==2
assert !missing(dev_total_2004) & abs(dev_total_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_total_2004) if id==2
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_raindays_2004) if id==2
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_norain_2004) if id==2
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_pct_raindays_2004) if id==2
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(z_dry_2004) if id==2
assert !missing(nobs_2000) & abs(nobs_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2000) if id==3
assert missing(median_2000) if id==3
assert missing(var_2000) if id==3
assert missing(sd_2000) if id==3
assert missing(skew_2000) if id==3
assert missing(mean_mo_2000) if id==3
assert missing(total_2000) if id==3
assert missing(raindays_2000) if id==3
assert missing(norain_2000) if id==3
assert missing(pct_raindays_2000) if id==3
assert missing(dry_start_2000) if id==3
assert missing(dry_2000) if id==3
assert missing(dry_end_2000) if id==3
assert missing(cut01_2000) if id==3
assert missing(cut02_2000) if id==3
assert missing(cut03_2000) if id==3
assert missing(cut04_2000) if id==3
assert missing(dev_mean_mo_2000) if id==3
assert missing(z_mean_mo_2000) if id==3
assert missing(dev_total_2000) if id==3
assert missing(z_total_2000) if id==3
assert missing(dev_raindays_2000) if id==3
assert missing(z_raindays_2000) if id==3
assert missing(dev_norain_2000) if id==3
assert missing(z_norain_2000) if id==3
assert missing(dev_pct_raindays_2000) if id==3
assert missing(z_pct_raindays_2000) if id==3
assert missing(dev_dry_2000) if id==3
assert missing(z_dry_2000) if id==3
assert !missing(nobs_2001) & abs(nobs_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2001) if id==3
assert missing(median_2001) if id==3
assert missing(var_2001) if id==3
assert missing(sd_2001) if id==3
assert missing(skew_2001) if id==3
assert missing(mean_mo_2001) if id==3
assert missing(total_2001) if id==3
assert missing(raindays_2001) if id==3
assert missing(norain_2001) if id==3
assert missing(pct_raindays_2001) if id==3
assert missing(dry_start_2001) if id==3
assert missing(dry_2001) if id==3
assert missing(dry_end_2001) if id==3
assert missing(cut01_2001) if id==3
assert missing(cut02_2001) if id==3
assert missing(cut03_2001) if id==3
assert missing(cut04_2001) if id==3
assert missing(dev_mean_mo_2001) if id==3
assert missing(z_mean_mo_2001) if id==3
assert missing(dev_total_2001) if id==3
assert missing(z_total_2001) if id==3
assert missing(dev_raindays_2001) if id==3
assert missing(z_raindays_2001) if id==3
assert missing(dev_norain_2001) if id==3
assert missing(z_norain_2001) if id==3
assert missing(dev_pct_raindays_2001) if id==3
assert missing(z_pct_raindays_2001) if id==3
assert missing(dev_dry_2001) if id==3
assert missing(z_dry_2001) if id==3
assert !missing(nobs_2002) & abs(nobs_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2002) if id==3
assert missing(median_2002) if id==3
assert missing(var_2002) if id==3
assert missing(sd_2002) if id==3
assert missing(skew_2002) if id==3
assert missing(mean_mo_2002) if id==3
assert missing(total_2002) if id==3
assert missing(raindays_2002) if id==3
assert missing(norain_2002) if id==3
assert missing(pct_raindays_2002) if id==3
assert missing(dry_start_2002) if id==3
assert missing(dry_2002) if id==3
assert missing(dry_end_2002) if id==3
assert missing(cut01_2002) if id==3
assert missing(cut02_2002) if id==3
assert missing(cut03_2002) if id==3
assert missing(cut04_2002) if id==3
assert missing(dev_mean_mo_2002) if id==3
assert missing(z_mean_mo_2002) if id==3
assert missing(dev_total_2002) if id==3
assert missing(z_total_2002) if id==3
assert missing(dev_raindays_2002) if id==3
assert missing(z_raindays_2002) if id==3
assert missing(dev_norain_2002) if id==3
assert missing(z_norain_2002) if id==3
assert missing(dev_pct_raindays_2002) if id==3
assert missing(z_pct_raindays_2002) if id==3
assert missing(dev_dry_2002) if id==3
assert missing(z_dry_2002) if id==3
assert !missing(nobs_2003) & abs(nobs_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2003) if id==3
assert missing(median_2003) if id==3
assert missing(var_2003) if id==3
assert missing(sd_2003) if id==3
assert missing(skew_2003) if id==3
assert missing(mean_mo_2003) if id==3
assert missing(total_2003) if id==3
assert missing(raindays_2003) if id==3
assert missing(norain_2003) if id==3
assert missing(pct_raindays_2003) if id==3
assert missing(dry_start_2003) if id==3
assert missing(dry_2003) if id==3
assert missing(dry_end_2003) if id==3
assert missing(cut01_2003) if id==3
assert missing(cut02_2003) if id==3
assert missing(cut03_2003) if id==3
assert missing(cut04_2003) if id==3
assert missing(dev_mean_mo_2003) if id==3
assert missing(z_mean_mo_2003) if id==3
assert missing(dev_total_2003) if id==3
assert missing(z_total_2003) if id==3
assert missing(dev_raindays_2003) if id==3
assert missing(z_raindays_2003) if id==3
assert missing(dev_norain_2003) if id==3
assert missing(z_norain_2003) if id==3
assert missing(dev_pct_raindays_2003) if id==3
assert missing(z_pct_raindays_2003) if id==3
assert missing(dev_dry_2003) if id==3
assert missing(z_dry_2003) if id==3
assert !missing(nobs_2004) & abs(nobs_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==3
assert missing(mean_2004) if id==3
assert missing(median_2004) if id==3
assert missing(var_2004) if id==3
assert missing(sd_2004) if id==3
assert missing(skew_2004) if id==3
assert missing(mean_mo_2004) if id==3
assert missing(total_2004) if id==3
assert missing(raindays_2004) if id==3
assert missing(norain_2004) if id==3
assert missing(pct_raindays_2004) if id==3
assert missing(dry_start_2004) if id==3
assert missing(dry_2004) if id==3
assert missing(dry_end_2004) if id==3
assert missing(cut01_2004) if id==3
assert missing(cut02_2004) if id==3
assert missing(cut03_2004) if id==3
assert missing(cut04_2004) if id==3
assert missing(dev_mean_mo_2004) if id==3
assert missing(z_mean_mo_2004) if id==3
assert missing(dev_total_2004) if id==3
assert missing(z_total_2004) if id==3
assert missing(dev_raindays_2004) if id==3
assert missing(z_raindays_2004) if id==3
assert missing(dev_norain_2004) if id==3
assert missing(z_norain_2004) if id==3
assert missing(dev_pct_raindays_2004) if id==3
assert missing(z_pct_raindays_2004) if id==3
assert missing(dev_dry_2004) if id==3
assert missing(z_dry_2004) if id==3
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==4
assert !missing(mean_2000) & abs(mean_2000 - (5.5533333333333337)) <= 1e-9 * max(1,abs(5.5533333333333337)) if id==4
assert !missing(median_2000) & abs(median_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(var_2000) & abs(var_2000 - (38.735523809523812)) <= 1e-9 * max(1,abs(38.735523809523812)) if id==4
assert !missing(sd_2000) & abs(sd_2000 - (6.2237869347788415)) <= 1e-9 * max(1,abs(6.2237869347788415)) if id==4
assert !missing(skew_2000) & abs(skew_2000 - (1.2940101590126338)) <= 1e-9 * max(1,abs(1.2940101590126338)) if id==4
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (20.824999999999999)) <= 1e-9 * max(1,abs(20.824999999999999)) if id==4
assert !missing(total_2000) & abs(total_2000 - (83.299999999999997)) <= 1e-9 * max(1,abs(83.299999999999997)) if id==4
assert !missing(raindays_2000) & abs(raindays_2000 - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(norain_2000) & abs(norain_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.73333333333333328)) <= 1e-9 * max(1,abs(0.73333333333333328)) if id==4
assert !missing(dry_start_2000) & abs(dry_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_2000) & abs(dry_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2000) & abs(cut01_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut04_2000) & abs(cut04_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (5.1500000000000004)) <= 1e-9 * max(1,abs(5.1500000000000004)) if id==4
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (0.74897977396471949)) <= 1e-9 * max(1,abs(0.74897977396471949)) if id==4
assert !missing(dev_total_2000) & abs(dev_total_2000 - (29.333333333333329)) <= 1e-9 * max(1,abs(29.333333333333329)) if id==4
assert !missing(z_total_2000) & abs(z_total_2000 - (0.98224991972284903)) <= 1e-9 * max(1,abs(0.98224991972284903)) if id==4
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==4
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==4
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.15384615384615385)) <= 1e-9 * max(1,abs(0.15384615384615385)) if id==4
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (1.1149412193707497)) <= 1e-9 * max(1,abs(1.1149412193707497)) if id==4
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4
assert !missing(z_dry_2000) & abs(z_dry_2000 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(nobs_2001) & abs(nobs_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==4
assert !missing(mean_2001) & abs(mean_2001 - (1.5733333333333333)) <= 1e-9 * max(1,abs(1.5733333333333333)) if id==4
assert !missing(median_2001) & abs(median_2001 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4
assert !missing(var_2001) & abs(var_2001 - (3.4363809523809525)) <= 1e-9 * max(1,abs(3.4363809523809525)) if id==4
assert !missing(sd_2001) & abs(sd_2001 - (1.8537478125087437)) <= 1e-9 * max(1,abs(1.8537478125087437)) if id==4
assert !missing(skew_2001) & abs(skew_2001 - (1.3380636716760939)) <= 1e-9 * max(1,abs(1.3380636716760939)) if id==4
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (7.8666666666666671)) <= 1e-9 * max(1,abs(7.8666666666666671)) if id==4
assert !missing(total_2001) & abs(total_2001 - (23.600000000000001)) <= 1e-9 * max(1,abs(23.600000000000001)) if id==4
assert !missing(raindays_2001) & abs(raindays_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(norain_2001) & abs(norain_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==4
assert !missing(dry_start_2001) & abs(dry_start_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==4
assert !missing(dry_2001) & abs(dry_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(dry_end_2001) & abs(dry_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2001) & abs(cut01_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==4
assert !missing(cut02_2001) & abs(cut02_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (-7.8083333333333318)) <= 1e-9 * max(1,abs(-7.8083333333333318)) if id==4
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (-1.1355890747652782)) <= 1e-9 * max(1,abs(-1.1355890747652782)) if id==4
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-30.366666666666667)) <= 1e-9 * max(1,abs(-30.366666666666667)) if id==4
assert !missing(z_total_2001) & abs(z_total_2001 - (-1.0168519055312677)) <= 1e-9 * max(1,abs(-1.0168519055312677)) if id==4
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (-1.3333333333333339)) <= 1e-9 * max(1,abs(-1.3333333333333339)) if id==4
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==4
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(z_norain_2001) & abs(z_norain_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.11282051282051275)) <= 1e-9 * max(1,abs(-0.11282051282051275)) if id==4
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-0.81762356087188259)) <= 1e-9 * max(1,abs(-0.81762356087188259)) if id==4
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4
assert !missing(z_dry_2001) & abs(z_dry_2001 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==4
assert !missing(mean_2002) & abs(mean_2002 - (4.2307692307692308)) <= 1e-9 * max(1,abs(4.2307692307692308)) if id==4
assert !missing(median_2002) & abs(median_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(var_2002) & abs(var_2002 - (35.830641025641029)) <= 1e-9 * max(1,abs(35.830641025641029)) if id==4
assert !missing(sd_2002) & abs(sd_2002 - (5.9858701143310009)) <= 1e-9 * max(1,abs(5.9858701143310009)) if id==4
assert !missing(skew_2002) & abs(skew_2002 - (1.734210919117058)) <= 1e-9 * max(1,abs(1.734210919117058)) if id==4
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (18.333333333333332)) <= 1e-9 * max(1,abs(18.333333333333332)) if id==4
assert !missing(total_2002) & abs(total_2002 - (55)) <= 1e-9 * max(1,abs(55)) if id==4
assert !missing(raindays_2002) & abs(raindays_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(norain_2002) & abs(norain_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==4
assert !missing(dry_start_2002) & abs(dry_start_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(dry_2002) & abs(dry_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(dry_end_2002) & abs(dry_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(cut02_2002) & abs(cut02_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut04_2002) & abs(cut04_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==4
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (2.6583333333333332)) <= 1e-9 * max(1,abs(2.6583333333333332)) if id==4
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (0.38660930080055905)) <= 1e-9 * max(1,abs(0.38660930080055905)) if id==4
assert !missing(dev_total_2002) & abs(dev_total_2002 - (1.0333333333333314)) <= 1e-9 * max(1,abs(1.0333333333333314)) if id==4
assert !missing(z_total_2002) & abs(z_total_2002 - (0.034601985808418487)) <= 1e-9 * max(1,abs(0.034601985808418487)) if id==4
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-1.3333333333333339)) <= 1e-9 * max(1,abs(-1.3333333333333339)) if id==4
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==4
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(z_norain_2002) & abs(z_norain_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.041025641025640991)) <= 1e-9 * max(1,abs(-0.041025641025640991)) if id==4
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-0.29731765849886632)) <= 1e-9 * max(1,abs(-0.29731765849886632)) if id==4
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4
assert !missing(z_dry_2002) & abs(z_dry_2002 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4
assert !missing(nobs_2003) & abs(nobs_2003 - (18)) <= 1e-9 * max(1,abs(18)) if id==4
assert !missing(mean_2003) & abs(mean_2003 - (4.4222222222222225)) <= 1e-9 * max(1,abs(4.4222222222222225)) if id==4
assert !missing(median_2003) & abs(median_2003 - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==4
assert !missing(var_2003) & abs(var_2003 - (36.758300653594773)) <= 1e-9 * max(1,abs(36.758300653594773)) if id==4
assert !missing(sd_2003) & abs(sd_2003 - (6.0628624142062444)) <= 1e-9 * max(1,abs(6.0628624142062444)) if id==4
assert !missing(skew_2003) & abs(skew_2003 - (1.6051151924529741)) <= 1e-9 * max(1,abs(1.6051151924529741)) if id==4
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (19.899999999999999)) <= 1e-9 * max(1,abs(19.899999999999999)) if id==4
assert !missing(total_2003) & abs(total_2003 - (79.599999999999994)) <= 1e-9 * max(1,abs(79.599999999999994)) if id==4
assert !missing(raindays_2003) & abs(raindays_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==4
assert !missing(norain_2003) & abs(norain_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==4
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2003) & abs(cut01_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==4
assert !missing(cut02_2003) & abs(cut02_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut04_2003) & abs(cut04_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==4
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (4.2249999999999996)) <= 1e-9 * max(1,abs(4.2249999999999996)) if id==4
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (0.61445428058270668)) <= 1e-9 * max(1,abs(0.61445428058270668)) if id==4
assert !missing(dev_total_2003) & abs(dev_total_2003 - (25.633333333333326)) <= 1e-9 * max(1,abs(25.633333333333326)) if id==4
assert !missing(z_total_2003) & abs(z_total_2003 - (0.85835248666689867)) <= 1e-9 * max(1,abs(0.85835248666689867)) if id==4
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==4
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==4
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(z_norain_2003) & abs(z_norain_2003 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (-0.079487179487179427)) <= 1e-9 * max(1,abs(-0.079487179487179427)) if id==4
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (-0.57605296334155354)) <= 1e-9 * max(1,abs(-0.57605296334155354)) if id==4
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==4
assert !missing(z_dry_2003) & abs(z_dry_2003 - (-0.28867513459481303)) <= 1e-9 * max(1,abs(-0.28867513459481303)) if id==4
assert !missing(nobs_2004) & abs(nobs_2004 - (13)) <= 1e-9 * max(1,abs(13)) if id==4
assert !missing(mean_2004) & abs(mean_2004 - (7.6230769230769226)) <= 1e-9 * max(1,abs(7.6230769230769226)) if id==4
assert !missing(median_2004) & abs(median_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(var_2004) & abs(var_2004 - (60.783589743589744)) <= 1e-9 * max(1,abs(60.783589743589744)) if id==4
assert !missing(sd_2004) & abs(sd_2004 - (7.79638311934385)) <= 1e-9 * max(1,abs(7.79638311934385)) if id==4
assert !missing(skew_2004) & abs(skew_2004 - (0.47321302776390833)) <= 1e-9 * max(1,abs(0.47321302776390833)) if id==4
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (33.033333333333331)) <= 1e-9 * max(1,abs(33.033333333333331)) if id==4
assert !missing(total_2004) & abs(total_2004 - (99.099999999999994)) <= 1e-9 * max(1,abs(99.099999999999994)) if id==4
assert !missing(raindays_2004) & abs(raindays_2004 - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(norain_2004) & abs(norain_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.84615384615384615)) <= 1e-9 * max(1,abs(0.84615384615384615)) if id==4
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dry_2004) & abs(dry_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01_2004) & abs(cut01_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut02_2004) & abs(cut02_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(cut03_2004) & abs(cut03_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut04_2004) & abs(cut04_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==4
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (17.358333333333334)) <= 1e-9 * max(1,abs(17.358333333333334)) if id==4
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (2.5244738983309234)) <= 1e-9 * max(1,abs(2.5244738983309234)) if id==4
assert !missing(dev_total_2004) & abs(dev_total_2004 - (45.133333333333326)) <= 1e-9 * max(1,abs(45.133333333333326)) if id==4
assert !missing(z_total_2004) & abs(z_total_2004 - (1.5113254446644746)) <= 1e-9 * max(1,abs(1.5113254446644746)) if id==4
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==4
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==4
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==4
assert !missing(z_norain_2004) & abs(z_norain_2004 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (0.26666666666666672)) <= 1e-9 * max(1,abs(0.26666666666666672)) if id==4
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (1.9325647802426331)) <= 1e-9 * max(1,abs(1.9325647802426331)) if id==4
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==5
assert !missing(mean_2000) & abs(mean_2000 - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==5
assert !missing(median_2000) & abs(median_2000 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5
assert !missing(var_2000) & abs(var_2000 - (19.189523809523809)) <= 1e-9 * max(1,abs(19.189523809523809)) if id==5
assert !missing(sd_2000) & abs(sd_2000 - (4.3805848707134771)) <= 1e-9 * max(1,abs(4.3805848707134771)) if id==5
assert !missing(skew_2000) & abs(skew_2000 - (2.8170764665843957)) <= 1e-9 * max(1,abs(2.8170764665843957)) if id==5
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(total_2000) & abs(total_2000 - (40)) <= 1e-9 * max(1,abs(40)) if id==5
assert !missing(raindays_2000) & abs(raindays_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==5
assert !missing(norain_2000) & abs(norain_2000 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==5
assert !missing(dry_start_2000) & abs(dry_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dry_2000) & abs(dry_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2000) & abs(cut01_2000 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut03_2000) & abs(cut03_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (0.24166666666666714)) <= 1e-9 * max(1,abs(0.24166666666666714)) if id==5
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (0.52245892048680298)) <= 1e-9 * max(1,abs(0.52245892048680298)) if id==5
assert !missing(dev_total_2000) & abs(dev_total_2000 - (0.96666666666666856)) <= 1e-9 * max(1,abs(0.96666666666666856)) if id==5
assert !missing(z_total_2000) & abs(z_total_2000 - (0.52245892048680298)) <= 1e-9 * max(1,abs(0.52245892048680298)) if id==5
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==5
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==5
assert !missing(z_norain_2000) & abs(z_norain_2000 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==5
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (-0.088888888888888851)) <= 1e-9 * max(1,abs(-0.088888888888888851)) if id==5
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(nobs_2001) & abs(nobs_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==5
assert !missing(mean_2001) & abs(mean_2001 - (2.6800000000000002)) <= 1e-9 * max(1,abs(2.6800000000000002)) if id==5
assert !missing(median_2001) & abs(median_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(var_2001) & abs(var_2001 - (19.140285714285714)) <= 1e-9 * max(1,abs(19.140285714285714)) if id==5
assert !missing(sd_2001) & abs(sd_2001 - (4.3749612243179614)) <= 1e-9 * max(1,abs(4.3749612243179614)) if id==5
assert !missing(skew_2001) & abs(skew_2001 - (2.8191449827198878)) <= 1e-9 * max(1,abs(2.8191449827198878)) if id==5
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (10.050000000000001)) <= 1e-9 * max(1,abs(10.050000000000001)) if id==5
assert !missing(total_2001) & abs(total_2001 - (40.200000000000003)) <= 1e-9 * max(1,abs(40.200000000000003)) if id==5
assert !missing(raindays_2001) & abs(raindays_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(norain_2001) & abs(norain_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dry_2001) & abs(dry_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dry_end_2001) & abs(dry_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2001) & abs(cut01_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2001) & abs(cut04_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (0.29166666666666785)) <= 1e-9 * max(1,abs(0.29166666666666785)) if id==5
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (0.63055386955303938)) <= 1e-9 * max(1,abs(0.63055386955303938)) if id==5
assert !missing(dev_total_2001) & abs(dev_total_2001 - (1.1666666666666714)) <= 1e-9 * max(1,abs(1.1666666666666714)) if id==5
assert !missing(z_total_2001) & abs(z_total_2001 - (0.63055386955303938)) <= 1e-9 * max(1,abs(0.63055386955303938)) if id==5
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5
assert !missing(z_norain_2001) & abs(z_norain_2001 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==5
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (0.044444444444444453)) <= 1e-9 * max(1,abs(0.044444444444444453)) if id==5
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (0.57735026918962595)) <= 1e-9 * max(1,abs(0.57735026918962595)) if id==5
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5
assert !missing(z_dry_2001) & abs(z_dry_2001 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(nobs_2002) & abs(nobs_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==5
assert !missing(mean_2002) & abs(mean_2002 - (2.46)) <= 1e-9 * max(1,abs(2.46)) if id==5
assert !missing(median_2002) & abs(median_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(var_2002) & abs(var_2002 - (18.69257142857143)) <= 1e-9 * max(1,abs(18.69257142857143)) if id==5
assert !missing(sd_2002) & abs(sd_2002 - (4.3234906532304924)) <= 1e-9 * max(1,abs(4.3234906532304924)) if id==5
assert !missing(skew_2002) & abs(skew_2002 - (3.0895692328065056)) <= 1e-9 * max(1,abs(3.0895692328065056)) if id==5
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (9.2249999999999996)) <= 1e-9 * max(1,abs(9.2249999999999996)) if id==5
assert !missing(total_2002) & abs(total_2002 - (36.899999999999999)) <= 1e-9 * max(1,abs(36.899999999999999)) if id==5
assert !missing(raindays_2002) & abs(raindays_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(norain_2002) & abs(norain_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5
assert !missing(dry_start_2002) & abs(dry_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dry_2002) & abs(dry_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2002) & abs(cut01_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (-0.53333333333333321)) <= 1e-9 * max(1,abs(-0.53333333333333321)) if id==5
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (-1.1530127900398386)) <= 1e-9 * max(1,abs(-1.1530127900398386)) if id==5
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-2.1333333333333329)) <= 1e-9 * max(1,abs(-2.1333333333333329)) if id==5
assert !missing(z_total_2002) & abs(z_total_2002 - (-1.1530127900398386)) <= 1e-9 * max(1,abs(-1.1530127900398386)) if id==5
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==5
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (0.044444444444444453)) <= 1e-9 * max(1,abs(0.044444444444444453)) if id==5
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (0.57735026918962595)) <= 1e-9 * max(1,abs(0.57735026918962595)) if id==5
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5
assert !missing(z_dry_2002) & abs(z_dry_2002 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(mean_2003) & abs(mean_2003 - (4.9812500000000002)) <= 1e-9 * max(1,abs(4.9812500000000002)) if id==5
assert !missing(median_2003) & abs(median_2003 - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==5
assert !missing(var_2003) & abs(var_2003 - (52.930958333333336)) <= 1e-9 * max(1,abs(52.930958333333336)) if id==5
assert !missing(sd_2003) & abs(sd_2003 - (7.275366542885199)) <= 1e-9 * max(1,abs(7.275366542885199)) if id==5
assert !missing(skew_2003) & abs(skew_2003 - (1.1776767149919345)) <= 1e-9 * max(1,abs(1.1776767149919345)) if id==5
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (19.925000000000001)) <= 1e-9 * max(1,abs(19.925000000000001)) if id==5
assert !missing(total_2003) & abs(total_2003 - (79.700000000000003)) <= 1e-9 * max(1,abs(79.700000000000003)) if id==5
assert !missing(raindays_2003) & abs(raindays_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(norain_2003) & abs(norain_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dry_2003) & abs(dry_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2003) & abs(cut01_2003 - (8)) <= 1e-9 * max(1,abs(8)) if id==5
assert !missing(cut02_2003) & abs(cut02_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04_2003) & abs(cut04_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==5
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (10.166666666666668)) <= 1e-9 * max(1,abs(10.166666666666668)) if id==5
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (21.979306310134429)) <= 1e-9 * max(1,abs(21.979306310134429)) if id==5
assert !missing(dev_total_2003) & abs(dev_total_2003 - (40.666666666666671)) <= 1e-9 * max(1,abs(40.666666666666671)) if id==5
assert !missing(z_total_2003) & abs(z_total_2003 - (21.979306310134429)) <= 1e-9 * max(1,abs(21.979306310134429)) if id==5
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==5
assert !missing(z_norain_2003) & abs(z_norain_2003 - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==5
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0.011111111111111127)) <= 1e-9 * max(1,abs(0.011111111111111127)) if id==5
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (0.14433756729740668)) <= 1e-9 * max(1,abs(0.14433756729740668)) if id==5
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5
assert !missing(z_dry_2003) & abs(z_dry_2003 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5
assert !missing(nobs_2004) & abs(nobs_2004 - (16)) <= 1e-9 * max(1,abs(16)) if id==5
assert !missing(mean_2004) & abs(mean_2004 - (2.8062499999999999)) <= 1e-9 * max(1,abs(2.8062499999999999)) if id==5
assert !missing(median_2004) & abs(median_2004 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5
assert !missing(var_2004) & abs(var_2004 - (30.941958333333332)) <= 1e-9 * max(1,abs(30.941958333333332)) if id==5
assert !missing(sd_2004) & abs(sd_2004 - (5.5625496252468016)) <= 1e-9 * max(1,abs(5.5625496252468016)) if id==5
assert !missing(skew_2004) & abs(skew_2004 - (2.4703945069762248)) <= 1e-9 * max(1,abs(2.4703945069762248)) if id==5
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==5
assert !missing(total_2004) & abs(total_2004 - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==5
assert !missing(raindays_2004) & abs(raindays_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(norain_2004) & abs(norain_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==5
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut01_2004) & abs(cut01_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==5
assert !missing(cut02_2004) & abs(cut02_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==5
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (1.4666666666666668)) <= 1e-9 * max(1,abs(1.4666666666666668)) if id==5
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (3.1707851726095568)) <= 1e-9 * max(1,abs(3.1707851726095568)) if id==5
assert !missing(dev_total_2004) & abs(dev_total_2004 - (5.8666666666666671)) <= 1e-9 * max(1,abs(5.8666666666666671)) if id==5
assert !missing(z_total_2004) & abs(z_total_2004 - (3.1707851726095568)) <= 1e-9 * max(1,abs(3.1707851726095568)) if id==5
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==5
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (-0.28867513459481264)) <= 1e-9 * max(1,abs(-0.28867513459481264)) if id==5
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==5
assert !missing(z_norain_2004) & abs(z_norain_2004 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==5
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.051388888888888873)) <= 1e-9 * max(1,abs(-0.051388888888888873)) if id==5
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-0.66756124875050471)) <= 1e-9 * max(1,abs(-0.66756124875050471)) if id==5
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5
assert !missing(nobs_2000) & abs(nobs_2000 - (18)) <= 1e-9 * max(1,abs(18)) if id==6
assert !missing(mean_2000) & abs(mean_2000 - (5.083333333333333)) <= 1e-9 * max(1,abs(5.083333333333333)) if id==6
assert !missing(median_2000) & abs(median_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(var_2000) & abs(var_2000 - (45.870882352941173)) <= 1e-9 * max(1,abs(45.870882352941173)) if id==6
assert !missing(sd_2000) & abs(sd_2000 - (6.7728046149982193)) <= 1e-9 * max(1,abs(6.7728046149982193)) if id==6
assert !missing(skew_2000) & abs(skew_2000 - (1.2346728891824617)) <= 1e-9 * max(1,abs(1.2346728891824617)) if id==6
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (22.875)) <= 1e-9 * max(1,abs(22.875)) if id==6
assert !missing(total_2000) & abs(total_2000 - (91.5)) <= 1e-9 * max(1,abs(91.5)) if id==6
assert !missing(raindays_2000) & abs(raindays_2000 - (11)) <= 1e-9 * max(1,abs(11)) if id==6
assert !missing(norain_2000) & abs(norain_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.61111111111111116)) <= 1e-9 * max(1,abs(0.61111111111111116)) if id==6
assert !missing(dry_start_2000) & abs(dry_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry_2000) & abs(dry_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dry_end_2000) & abs(dry_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2000) & abs(cut01_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(cut02_2000) & abs(cut02_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut04_2000) & abs(cut04_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (4.9861111111111107)) <= 1e-9 * max(1,abs(4.9861111111111107)) if id==6
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (1.1005724951015821)) <= 1e-9 * max(1,abs(1.1005724951015821)) if id==6
assert !missing(dev_total_2000) & abs(dev_total_2000 - (25.533333333333331)) <= 1e-9 * max(1,abs(25.533333333333331)) if id==6
assert !missing(z_total_2000) & abs(z_total_2000 - (1.1448966021970559)) <= 1e-9 * max(1,abs(1.1448966021970559)) if id==6
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6
assert !missing(z_norain_2000) & abs(z_norain_2000 - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.039153439153439162)) <= 1e-9 * max(1,abs(0.039153439153439162)) if id==6
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (1.0067328406287921)) <= 1e-9 * max(1,abs(1.0067328406287921)) if id==6
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==6
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==6
assert !missing(nobs_2001) & abs(nobs_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==6
assert !missing(mean_2001) & abs(mean_2001 - (3.7400000000000002)) <= 1e-9 * max(1,abs(3.7400000000000002)) if id==6
assert !missing(median_2001) & abs(median_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var_2001) & abs(var_2001 - (32.264000000000003)) <= 1e-9 * max(1,abs(32.264000000000003)) if id==6
assert !missing(sd_2001) & abs(sd_2001 - (5.6801408433242218)) <= 1e-9 * max(1,abs(5.6801408433242218)) if id==6
assert !missing(skew_2001) & abs(skew_2001 - (1.960991958098907)) <= 1e-9 * max(1,abs(1.960991958098907)) if id==6
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (14.025)) <= 1e-9 * max(1,abs(14.025)) if id==6
assert !missing(total_2001) & abs(total_2001 - (56.100000000000001)) <= 1e-9 * max(1,abs(56.100000000000001)) if id==6
assert !missing(raindays_2001) & abs(raindays_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(norain_2001) & abs(norain_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry_2001) & abs(dry_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dry_end_2001) & abs(dry_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2001) & abs(cut01_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2001) & abs(cut04_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (-3.8638888888888889)) <= 1e-9 * max(1,abs(-3.8638888888888889)) if id==6
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (-0.85286704216507014)) <= 1e-9 * max(1,abs(-0.85286704216507014)) if id==6
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-9.8666666666666671)) <= 1e-9 * max(1,abs(-9.8666666666666671)) if id==6
assert !missing(z_total_2001) & abs(z_total_2001 - (-0.44241435280721747)) <= 1e-9 * max(1,abs(-0.44241435280721747)) if id==6
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6
assert !missing(z_norain_2001) & abs(z_norain_2001 - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.038624338624338672)) <= 1e-9 * max(1,abs(-0.038624338624338672)) if id==6
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-0.9931283427824581)) <= 1e-9 * max(1,abs(-0.9931283427824581)) if id==6
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==6
assert !missing(z_dry_2001) & abs(z_dry_2001 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==6
assert !missing(nobs_2002) & abs(nobs_2002 - (14)) <= 1e-9 * max(1,abs(14)) if id==6
assert !missing(mean_2002) & abs(mean_2002 - (3.592857142857143)) <= 1e-9 * max(1,abs(3.592857142857143)) if id==6
assert !missing(median_2002) & abs(median_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var_2002) & abs(var_2002 - (33.756098901098902)) <= 1e-9 * max(1,abs(33.756098901098902)) if id==6
assert !missing(sd_2002) & abs(sd_2002 - (5.809999905430197)) <= 1e-9 * max(1,abs(5.809999905430197)) if id==6
assert !missing(skew_2002) & abs(skew_2002 - (2.1048860812757262)) <= 1e-9 * max(1,abs(2.1048860812757262)) if id==6
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (16.766666666666666)) <= 1e-9 * max(1,abs(16.766666666666666)) if id==6
assert !missing(total_2002) & abs(total_2002 - (50.299999999999997)) <= 1e-9 * max(1,abs(50.299999999999997)) if id==6
assert !missing(raindays_2002) & abs(raindays_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(norain_2002) & abs(norain_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==6
assert !missing(dry_start_2002) & abs(dry_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry_2002) & abs(dry_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dry_end_2002) & abs(dry_end_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==6
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut03_2002) & abs(cut03_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (-1.1222222222222236)) <= 1e-9 * max(1,abs(-1.1222222222222236)) if id==6
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (-0.24770545293651239)) <= 1e-9 * max(1,abs(-0.24770545293651239)) if id==6
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-15.666666666666671)) <= 1e-9 * max(1,abs(-15.666666666666671)) if id==6
assert !missing(z_total_2002) & abs(z_total_2002 - (-0.70248224938983872)) <= 1e-9 * max(1,abs(-0.70248224938983872)) if id==6
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==6
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-1.1547005383792521)) <= 1e-9 * max(1,abs(-1.1547005383792521)) if id==6
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.00052910052910060124)) <= 1e-9 * max(1,abs(-0.00052910052910060124)) if id==6
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-0.013604497846336881)) <= 1e-9 * max(1,abs(-0.013604497846336881)) if id==6
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==6
assert !missing(z_dry_2002) & abs(z_dry_2002 - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==6
assert !missing(nobs_2003) & abs(nobs_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==6
assert !missing(mean_2003) & abs(mean_2003 - (2.7466666666666666)) <= 1e-9 * max(1,abs(2.7466666666666666)) if id==6
assert !missing(median_2003) & abs(median_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var_2003) & abs(var_2003 - (18.681238095238097)) <= 1e-9 * max(1,abs(18.681238095238097)) if id==6
assert !missing(sd_2003) & abs(sd_2003 - (4.3221797851591157)) <= 1e-9 * max(1,abs(4.3221797851591157)) if id==6
assert !missing(skew_2003) & abs(skew_2003 - (2.8953920715463042)) <= 1e-9 * max(1,abs(2.8953920715463042)) if id==6
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (10.300000000000001)) <= 1e-9 * max(1,abs(10.300000000000001)) if id==6
assert !missing(total_2003) & abs(total_2003 - (41.200000000000003)) <= 1e-9 * max(1,abs(41.200000000000003)) if id==6
assert !missing(raindays_2003) & abs(raindays_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==6
assert !missing(norain_2003) & abs(norain_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==6
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01_2003) & abs(cut01_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==6
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (-7.5888888888888886)) <= 1e-9 * max(1,abs(-7.5888888888888886)) if id==6
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (-1.6750774688677006)) <= 1e-9 * max(1,abs(-1.6750774688677006)) if id==6
assert !missing(dev_total_2003) & abs(dev_total_2003 - (-24.766666666666666)) <= 1e-9 * max(1,abs(-24.766666666666666)) if id==6
assert !missing(z_total_2003) & abs(z_total_2003 - (-1.1105198112694681)) <= 1e-9 * max(1,abs(-1.1105198112694681)) if id==6
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==6
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==6
assert !missing(z_norain_2003) & abs(z_norain_2003 - (-2.8867513459481295)) <= 1e-9 * max(1,abs(-2.8867513459481295)) if id==6
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0.094708994708994632)) <= 1e-9 * max(1,abs(0.094708994708994632)) if id==6
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (2.4352051144939675)) <= 1e-9 * max(1,abs(2.4352051144939675)) if id==6
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==6
assert !missing(z_dry_2003) & abs(z_dry_2003 - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==6
assert !missing(nobs_2004) & abs(nobs_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==6
assert !missing(mean_2004) & abs(mean_2004 - (2.54)) <= 1e-9 * max(1,abs(2.54)) if id==6
assert !missing(median_2004) & abs(median_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(var_2004) & abs(var_2004 - (18.481142857142856)) <= 1e-9 * max(1,abs(18.481142857142856)) if id==6
assert !missing(sd_2004) & abs(sd_2004 - (4.298969976301632)) <= 1e-9 * max(1,abs(4.298969976301632)) if id==6
assert !missing(skew_2004) & abs(skew_2004 - (3.0849106249301164)) <= 1e-9 * max(1,abs(3.0849106249301164)) if id==6
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (9.5250000000000004)) <= 1e-9 * max(1,abs(9.5250000000000004)) if id==6
assert !missing(total_2004) & abs(total_2004 - (38.100000000000001)) <= 1e-9 * max(1,abs(38.100000000000001)) if id==6
assert !missing(raindays_2004) & abs(raindays_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==6
assert !missing(norain_2004) & abs(norain_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dry_2004) & abs(dry_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dry_end_2004) & abs(dry_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(cut01_2004) & abs(cut01_2004 - (7)) <= 1e-9 * max(1,abs(7)) if id==6
assert !missing(cut02_2004) & abs(cut02_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut03_2004) & abs(cut03_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (-8.3638888888888889)) <= 1e-9 * max(1,abs(-8.3638888888888889)) if id==6
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (-1.8461413831481137)) <= 1e-9 * max(1,abs(-1.8461413831481137)) if id==6
assert !missing(dev_total_2004) & abs(dev_total_2004 - (-27.866666666666667)) <= 1e-9 * max(1,abs(-27.866666666666667)) if id==6
assert !missing(z_total_2004) & abs(z_total_2004 - (-1.2495216180636277)) <= 1e-9 * max(1,abs(-1.2495216180636277)) if id==6
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6
assert !missing(z_norain_2004) & abs(z_norain_2004 - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.038624338624338672)) <= 1e-9 * max(1,abs(-0.038624338624338672)) if id==6
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-0.9931283427824581)) <= 1e-9 * max(1,abs(-0.9931283427824581)) if id==6
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-1.6666666666666665)) <= 1e-9 * max(1,abs(-1.6666666666666665)) if id==6
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-2.8867513459481287)) <= 1e-9 * max(1,abs(-2.8867513459481287)) if id==6
assert !missing(nobs_2000) & abs(nobs_2000 - (14)) <= 1e-9 * max(1,abs(14)) if id==7
assert !missing(mean_2000) & abs(mean_2000 - (3.7285714285714286)) <= 1e-9 * max(1,abs(3.7285714285714286)) if id==7
assert !missing(median_2000) & abs(median_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(var_2000) & abs(var_2000 - (35.49296703296703)) <= 1e-9 * max(1,abs(35.49296703296703)) if id==7
assert !missing(sd_2000) & abs(sd_2000 - (5.9575974211897726)) <= 1e-9 * max(1,abs(5.9575974211897726)) if id==7
assert !missing(skew_2000) & abs(skew_2000 - (1.8322500403765247)) <= 1e-9 * max(1,abs(1.8322500403765247)) if id==7
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (13.050000000000001)) <= 1e-9 * max(1,abs(13.050000000000001)) if id==7
assert !missing(total_2000) & abs(total_2000 - (52.200000000000003)) <= 1e-9 * max(1,abs(52.200000000000003)) if id==7
assert !missing(raindays_2000) & abs(raindays_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==7
assert !missing(norain_2000) & abs(norain_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==7
assert !missing(dry_start_2000) & abs(dry_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_2000) & abs(dry_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2000) & abs(cut01_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(cut02_2000) & abs(cut02_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(cut03_2000) & abs(cut03_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut04_2000) & abs(cut04_2000 - (5)) <= 1e-9 * max(1,abs(5)) if id==7
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-3.6416666666666657)) <= 1e-9 * max(1,abs(-3.6416666666666657)) if id==7
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-0.73887912465775485)) <= 1e-9 * max(1,abs(-0.73887912465775485)) if id==7
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-14.566666666666663)) <= 1e-9 * max(1,abs(-14.566666666666663)) if id==7
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.73887912465775485)) <= 1e-9 * max(1,abs(-0.73887912465775485)) if id==7
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.018772893772893706)) <= 1e-9 * max(1,abs(0.018772893772893706)) if id==7
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (0.22527812582758827)) <= 1e-9 * max(1,abs(0.22527812582758827)) if id==7
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==7
assert !missing(z_dry_2000) & abs(z_dry_2000 - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==7
assert !missing(nobs_2001) & abs(nobs_2001 - (13)) <= 1e-9 * max(1,abs(13)) if id==7
assert !missing(mean_2001) & abs(mean_2001 - (4.5307692307692307)) <= 1e-9 * max(1,abs(4.5307692307692307)) if id==7
assert !missing(median_2001) & abs(median_2001 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7
assert !missing(var_2001) & abs(var_2001 - (50.967307692307692)) <= 1e-9 * max(1,abs(50.967307692307692)) if id==7
assert !missing(sd_2001) & abs(sd_2001 - (7.1391391422431099)) <= 1e-9 * max(1,abs(7.1391391422431099)) if id==7
assert !missing(skew_2001) & abs(skew_2001 - (1.4171859413540904)) <= 1e-9 * max(1,abs(1.4171859413540904)) if id==7
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (14.725)) <= 1e-9 * max(1,abs(14.725)) if id==7
assert !missing(total_2001) & abs(total_2001 - (58.899999999999999)) <= 1e-9 * max(1,abs(58.899999999999999)) if id==7
assert !missing(raindays_2001) & abs(raindays_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(norain_2001) & abs(norain_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_2001) & abs(dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(dry_end_2001) & abs(dry_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut01_2001) & abs(cut01_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(cut02_2001) & abs(cut02_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut04_2001) & abs(cut04_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (-1.9666666666666668)) <= 1e-9 * max(1,abs(-1.9666666666666668)) if id==7
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (-0.3990285432934329)) <= 1e-9 * max(1,abs(-0.3990285432934329)) if id==7
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-7.8666666666666671)) <= 1e-9 * max(1,abs(-7.8666666666666671)) if id==7
assert !missing(z_total_2001) & abs(z_total_2001 - (-0.3990285432934329)) <= 1e-9 * max(1,abs(-0.3990285432934329)) if id==7
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7
assert !missing(z_norain_2001) & abs(z_norain_2001 - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.091117216117216127)) <= 1e-9 * max(1,abs(-0.091117216117216127)) if id==7
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-1.0934230985290299)) <= 1e-9 * max(1,abs(-1.0934230985290299)) if id==7
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==7
assert !missing(z_dry_2001) & abs(z_dry_2001 - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==7
assert !missing(nobs_2002) & abs(nobs_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==7
assert !missing(mean_2002) & abs(mean_2002 - (5.5750000000000002)) <= 1e-9 * max(1,abs(5.5750000000000002)) if id==7
assert !missing(median_2002) & abs(median_2002 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==7
assert !missing(var_2002) & abs(var_2002 - (49.42733333333333)) <= 1e-9 * max(1,abs(49.42733333333333)) if id==7
assert !missing(sd_2002) & abs(sd_2002 - (7.0304575479362175)) <= 1e-9 * max(1,abs(7.0304575479362175)) if id==7
assert !missing(skew_2002) & abs(skew_2002 - (1.0668958405616675)) <= 1e-9 * max(1,abs(1.0668958405616675)) if id==7
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (22.300000000000001)) <= 1e-9 * max(1,abs(22.300000000000001)) if id==7
assert !missing(total_2002) & abs(total_2002 - (89.200000000000003)) <= 1e-9 * max(1,abs(89.200000000000003)) if id==7
assert !missing(raindays_2002) & abs(raindays_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==7
assert !missing(norain_2002) & abs(norain_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==7
assert !missing(dry_start_2002) & abs(dry_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_2002) & abs(dry_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut03_2002) & abs(cut03_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut04_2002) & abs(cut04_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (5.6083333333333343)) <= 1e-9 * max(1,abs(5.6083333333333343)) if id==7
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (1.1379076679511881)) <= 1e-9 * max(1,abs(1.1379076679511881)) if id==7
assert !missing(dev_total_2002) & abs(dev_total_2002 - (22.433333333333337)) <= 1e-9 * max(1,abs(22.433333333333337)) if id==7
assert !missing(z_total_2002) & abs(z_total_2002 - (1.1379076679511881)) <= 1e-9 * max(1,abs(1.1379076679511881)) if id==7
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (0.072344322344322309)) <= 1e-9 * max(1,abs(0.072344322344322309)) if id==7
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (0.86814497270144042)) <= 1e-9 * max(1,abs(0.86814497270144042)) if id==7
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7
assert !missing(z_dry_2002) & abs(z_dry_2002 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7
assert !missing(nobs_2003) & abs(nobs_2003 - (13)) <= 1e-9 * max(1,abs(13)) if id==7
assert !missing(mean_2003) & abs(mean_2003 - (3.6000000000000001)) <= 1e-9 * max(1,abs(3.6000000000000001)) if id==7
assert !missing(median_2003) & abs(median_2003 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7
assert !missing(var_2003) & abs(var_2003 - (36.983333333333334)) <= 1e-9 * max(1,abs(36.983333333333334)) if id==7
assert !missing(sd_2003) & abs(sd_2003 - (6.0813923844242561)) <= 1e-9 * max(1,abs(6.0813923844242561)) if id==7
assert !missing(skew_2003) & abs(skew_2003 - (1.9986642921122109)) <= 1e-9 * max(1,abs(1.9986642921122109)) if id==7
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (11.699999999999999)) <= 1e-9 * max(1,abs(11.699999999999999)) if id==7
assert !missing(total_2003) & abs(total_2003 - (46.799999999999997)) <= 1e-9 * max(1,abs(46.799999999999997)) if id==7
assert !missing(raindays_2003) & abs(raindays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(norain_2003) & abs(norain_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2003) & abs(cut01_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==7
assert !missing(cut02_2003) & abs(cut02_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==7
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (-4.9916666666666671)) <= 1e-9 * max(1,abs(-4.9916666666666671)) if id==7
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (-1.0127885484439252)) <= 1e-9 * max(1,abs(-1.0127885484439252)) if id==7
assert !missing(dev_total_2003) & abs(dev_total_2003 - (-19.966666666666669)) <= 1e-9 * max(1,abs(-19.966666666666669)) if id==7
assert !missing(z_total_2003) & abs(z_total_2003 - (-1.0127885484439252)) <= 1e-9 * max(1,abs(-1.0127885484439252)) if id==7
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7
assert !missing(z_norain_2003) & abs(z_norain_2003 - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (-0.091117216117216127)) <= 1e-9 * max(1,abs(-0.091117216117216127)) if id==7
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (-1.0934230985290299)) <= 1e-9 * max(1,abs(-1.0934230985290299)) if id==7
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7
assert !missing(z_dry_2003) & abs(z_dry_2003 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7
assert !missing(nobs_2004) & abs(nobs_2004 - (13)) <= 1e-9 * max(1,abs(13)) if id==7
assert !missing(mean_2004) & abs(mean_2004 - (5.5615384615384613)) <= 1e-9 * max(1,abs(5.5615384615384613)) if id==7
assert !missing(median_2004) & abs(median_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(var_2004) & abs(var_2004 - (45.815897435897433)) <= 1e-9 * max(1,abs(45.815897435897433)) if id==7
assert !missing(sd_2004) & abs(sd_2004 - (6.7687441550037502)) <= 1e-9 * max(1,abs(6.7687441550037502)) if id==7
assert !missing(skew_2004) & abs(skew_2004 - (1.1821402275208197)) <= 1e-9 * max(1,abs(1.1821402275208197)) if id==7
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (18.074999999999999)) <= 1e-9 * max(1,abs(18.074999999999999)) if id==7
assert !missing(total_2004) & abs(total_2004 - (72.299999999999997)) <= 1e-9 * max(1,abs(72.299999999999997)) if id==7
assert !missing(raindays_2004) & abs(raindays_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==7
assert !missing(norain_2004) & abs(norain_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==7
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==7
assert !missing(cut01_2004) & abs(cut01_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==7
assert !missing(cut02_2004) & abs(cut02_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==7
assert !missing(cut04_2004) & abs(cut04_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==7
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (1.3833333333333329)) <= 1e-9 * max(1,abs(1.3833333333333329)) if id==7
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (0.28067261943521116)) <= 1e-9 * max(1,abs(0.28067261943521116)) if id==7
assert !missing(dev_total_2004) & abs(dev_total_2004 - (5.5333333333333314)) <= 1e-9 * max(1,abs(5.5333333333333314)) if id==7
assert !missing(z_total_2004) & abs(z_total_2004 - (0.28067261943521116)) <= 1e-9 * max(1,abs(0.28067261943521116)) if id==7
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==7
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==7
assert !missing(z_norain_2004) & abs(z_norain_2004 - (-4.0414518843273797)) <= 1e-9 * max(1,abs(-4.0414518843273797)) if id==7
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (0.1396520146520146)) <= 1e-9 * max(1,abs(0.1396520146520146)) if id==7
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (1.6758494726198692)) <= 1e-9 * max(1,abs(1.6758494726198692)) if id==7
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==8
assert !missing(mean_2000) & abs(mean_2000 - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==8
assert !missing(median_2000) & abs(median_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(var_2000) & abs(var_2000 - (32.727142857142859)) <= 1e-9 * max(1,abs(32.727142857142859)) if id==8
assert !missing(sd_2000) & abs(sd_2000 - (5.7207641847171828)) <= 1e-9 * max(1,abs(5.7207641847171828)) if id==8
assert !missing(skew_2000) & abs(skew_2000 - (2.0459705163777095)) <= 1e-9 * max(1,abs(2.0459705163777095)) if id==8
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (13.125)) <= 1e-9 * max(1,abs(13.125)) if id==8
assert !missing(total_2000) & abs(total_2000 - (52.5)) <= 1e-9 * max(1,abs(52.5)) if id==8
assert !missing(raindays_2000) & abs(raindays_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==8
assert !missing(norain_2000) & abs(norain_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==8
assert !missing(dry_start_2000) & abs(dry_start_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dry_2000) & abs(dry_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01_2000) & abs(cut01_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(cut02_2000) & abs(cut02_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-3.875)) <= 1e-9 * max(1,abs(-3.875)) if id==8
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-0.9210376979339665)) <= 1e-9 * max(1,abs(-0.9210376979339665)) if id==8
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-15.5)) <= 1e-9 * max(1,abs(-15.5)) if id==8
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.9210376979339665)) <= 1e-9 * max(1,abs(-0.9210376979339665)) if id==8
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(z_norain_2000) & abs(z_norain_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (-0.0045634920634920473)) <= 1e-9 * max(1,abs(-0.0045634920634920473)) if id==8
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (-0.044411559168432584)) <= 1e-9 * max(1,abs(-0.044411559168432584)) if id==8
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(nobs_2001) & abs(nobs_2001 - (14)) <= 1e-9 * max(1,abs(14)) if id==8
assert !missing(mean_2001) & abs(mean_2001 - (6.1357142857142861)) <= 1e-9 * max(1,abs(6.1357142857142861)) if id==8
assert !missing(median_2001) & abs(median_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(var_2001) & abs(var_2001 - (53.108626373626372)) <= 1e-9 * max(1,abs(53.108626373626372)) if id==8
assert !missing(sd_2001) & abs(sd_2001 - (7.287566560493727)) <= 1e-9 * max(1,abs(7.287566560493727)) if id==8
assert !missing(skew_2001) & abs(skew_2001 - (0.92258914387871072)) <= 1e-9 * max(1,abs(0.92258914387871072)) if id==8
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (21.475000000000001)) <= 1e-9 * max(1,abs(21.475000000000001)) if id==8
assert !missing(total_2001) & abs(total_2001 - (85.900000000000006)) <= 1e-9 * max(1,abs(85.900000000000006)) if id==8
assert !missing(raindays_2001) & abs(raindays_2001 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(norain_2001) & abs(norain_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==8
assert !missing(dry_start_2001) & abs(dry_start_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dry_2001) & abs(dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dry_end_2001) & abs(dry_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut01_2001) & abs(cut01_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(cut02_2001) & abs(cut02_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04_2001) & abs(cut04_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==8
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (4.4750000000000014)) <= 1e-9 * max(1,abs(4.4750000000000014)) if id==8
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (1.0636499866463229)) <= 1e-9 * max(1,abs(1.0636499866463229)) if id==8
assert !missing(dev_total_2001) & abs(dev_total_2001 - (17.900000000000006)) <= 1e-9 * max(1,abs(17.900000000000006)) if id==8
assert !missing(z_total_2001) & abs(z_total_2001 - (1.0636499866463229)) <= 1e-9 * max(1,abs(1.0636499866463229)) if id==8
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8
assert !missing(z_norain_2001) & abs(z_norain_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (0.10496031746031753)) <= 1e-9 * max(1,abs(0.10496031746031753)) if id==8
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (1.0214658608739537)) <= 1e-9 * max(1,abs(1.0214658608739537)) if id==8
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==8
assert !missing(z_dry_2001) & abs(z_dry_2001 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==8
assert !missing(nobs_2002) & abs(nobs_2002 - (16)) <= 1e-9 * max(1,abs(16)) if id==8
assert !missing(mean_2002) & abs(mean_2002 - (4.0999999999999996)) <= 1e-9 * max(1,abs(4.0999999999999996)) if id==8
assert !missing(median_2002) & abs(median_2002 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==8
assert !missing(var_2002) & abs(var_2002 - (43.454666666666668)) <= 1e-9 * max(1,abs(43.454666666666668)) if id==8
assert !missing(sd_2002) & abs(sd_2002 - (6.5920153721503612)) <= 1e-9 * max(1,abs(6.5920153721503612)) if id==8
assert !missing(skew_2002) & abs(skew_2002 - (1.5619219099198085)) <= 1e-9 * max(1,abs(1.5619219099198085)) if id==8
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (16.399999999999999)) <= 1e-9 * max(1,abs(16.399999999999999)) if id==8
assert !missing(total_2002) & abs(total_2002 - (65.599999999999994)) <= 1e-9 * max(1,abs(65.599999999999994)) if id==8
assert !missing(raindays_2002) & abs(raindays_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(norain_2002) & abs(norain_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==8
assert !missing(dry_start_2002) & abs(dry_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dry_2002) & abs(dry_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end_2002) & abs(dry_end_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut01_2002) & abs(cut01_2002 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut04_2002) & abs(cut04_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==8
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (-0.60000000000000142)) <= 1e-9 * max(1,abs(-0.60000000000000142)) if id==8
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (-0.14261228871235643)) <= 1e-9 * max(1,abs(-0.14261228871235643)) if id==8
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-2.4000000000000057)) <= 1e-9 * max(1,abs(-2.4000000000000057)) if id==8
assert !missing(z_total_2002) & abs(z_total_2002 - (-0.14261228871235643)) <= 1e-9 * max(1,abs(-0.14261228871235643)) if id==8
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(z_norain_2002) & abs(z_norain_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.10039682539682537)) <= 1e-9 * max(1,abs(-0.10039682539682537)) if id==8
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-0.9770543017055201)) <= 1e-9 * max(1,abs(-0.9770543017055201)) if id==8
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8
assert !missing(z_dry_2002) & abs(z_dry_2002 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(nobs_2003) & abs(nobs_2003 - (15)) <= 1e-9 * max(1,abs(15)) if id==8
assert !missing(mean_2003) & abs(mean_2003 - (1.9199999999999999)) <= 1e-9 * max(1,abs(1.9199999999999999)) if id==8
assert !missing(median_2003) & abs(median_2003 - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8
assert !missing(var_2003) & abs(var_2003 - (19.204571428571427)) <= 1e-9 * max(1,abs(19.204571428571427)) if id==8
assert !missing(sd_2003) & abs(sd_2003 - (4.3823020695259505)) <= 1e-9 * max(1,abs(4.3823020695259505)) if id==8
assert !missing(skew_2003) & abs(skew_2003 - (3.3307804786234221)) <= 1e-9 * max(1,abs(3.3307804786234221)) if id==8
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (7.2000000000000002)) <= 1e-9 * max(1,abs(7.2000000000000002)) if id==8
assert !missing(total_2003) & abs(total_2003 - (28.800000000000001)) <= 1e-9 * max(1,abs(28.800000000000001)) if id==8
assert !missing(raindays_2003) & abs(raindays_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==8
assert !missing(norain_2003) & abs(norain_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end_2003) & abs(dry_end_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut01_2003) & abs(cut01_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==8
assert !missing(cut02_2003) & abs(cut02_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04_2003) & abs(cut04_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (-9.8000000000000007)) <= 1e-9 * max(1,abs(-9.8000000000000007)) if id==8
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (-2.3293340489684833)) <= 1e-9 * max(1,abs(-2.3293340489684833)) if id==8
assert !missing(dev_total_2003) & abs(dev_total_2003 - (-39.200000000000003)) <= 1e-9 * max(1,abs(-39.200000000000003)) if id==8
assert !missing(z_total_2003) & abs(z_total_2003 - (-2.3293340489684833)) <= 1e-9 * max(1,abs(-2.3293340489684833)) if id==8
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(z_norain_2003) & abs(z_norain_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (-0.13789682539682535)) <= 1e-9 * max(1,abs(-0.13789682539682535)) if id==8
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (-1.3420014618287281)) <= 1e-9 * max(1,abs(-1.3420014618287281)) if id==8
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8
assert !missing(z_dry_2003) & abs(z_dry_2003 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==8
assert !missing(mean_2004) & abs(mean_2004 - (3.2071428571428573)) <= 1e-9 * max(1,abs(3.2071428571428573)) if id==8
assert !missing(median_2004) & abs(median_2004 - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==8
assert !missing(var_2004) & abs(var_2004 - (35.820714285714288)) <= 1e-9 * max(1,abs(35.820714285714288)) if id==8
assert !missing(sd_2004) & abs(sd_2004 - (5.9850408758599372)) <= 1e-9 * max(1,abs(5.9850408758599372)) if id==8
assert !missing(skew_2004) & abs(skew_2004 - (2.1009673449073625)) <= 1e-9 * max(1,abs(2.1009673449073625)) if id==8
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==8
assert !missing(total_2004) & abs(total_2004 - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==8
assert !missing(raindays_2004) & abs(raindays_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==8
assert !missing(norain_2004) & abs(norain_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.2857142857142857)) <= 1e-9 * max(1,abs(0.2857142857142857)) if id==8
assert !missing(dry_start_2004) & abs(dry_start_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end_2004) & abs(dry_end_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(cut01_2004) & abs(cut01_2004 - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(cut02_2004) & abs(cut02_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(cut04_2004) & abs(cut04_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (-5.7750000000000004)) <= 1e-9 * max(1,abs(-5.7750000000000004)) if id==8
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (-1.3726432788564276)) <= 1e-9 * max(1,abs(-1.3726432788564276)) if id==8
assert !missing(dev_total_2004) & abs(dev_total_2004 - (-23.100000000000001)) <= 1e-9 * max(1,abs(-23.100000000000001)) if id==8
assert !missing(z_total_2004) & abs(z_total_2004 - (-1.3726432788564276)) <= 1e-9 * max(1,abs(-1.3726432788564276)) if id==8
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==8
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (-4)) <= 1e-9 * max(1,abs(-4)) if id==8
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(z_norain_2004) & abs(z_norain_2004 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.25218253968253967)) <= 1e-9 * max(1,abs(-0.25218253968253967)) if id==8
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-2.4542213783946965)) <= 1e-9 * max(1,abs(-2.4542213783946965)) if id==8
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8
assert !missing(z_dry_2004) & abs(z_dry_2004 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(nobs_2000) & abs(nobs_2000 - (14)) <= 1e-9 * max(1,abs(14)) if id==9
assert !missing(mean_2000) & abs(mean_2000 - (2.5142857142857142)) <= 1e-9 * max(1,abs(2.5142857142857142)) if id==9
assert !missing(median_2000) & abs(median_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(var_2000) & abs(var_2000 - (20.015164835164835)) <= 1e-9 * max(1,abs(20.015164835164835)) if id==9
assert !missing(sd_2000) & abs(sd_2000 - (4.4738311138402214)) <= 1e-9 * max(1,abs(4.4738311138402214)) if id==9
assert !missing(skew_2000) & abs(skew_2000 - (2.9979745415516375)) <= 1e-9 * max(1,abs(2.9979745415516375)) if id==9
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (8.8000000000000007)) <= 1e-9 * max(1,abs(8.8000000000000007)) if id==9
assert !missing(total_2000) & abs(total_2000 - (35.200000000000003)) <= 1e-9 * max(1,abs(35.200000000000003)) if id==9
assert !missing(raindays_2000) & abs(raindays_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(norain_2000) & abs(norain_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==9
assert !missing(dry_start_2000) & abs(dry_start_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_2000) & abs(dry_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_end_2000) & abs(dry_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2000) & abs(cut01_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(cut02_2000) & abs(cut02_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-3.1166666666666654)) <= 1e-9 * max(1,abs(-3.1166666666666654)) if id==9
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-0.68352500646255132)) <= 1e-9 * max(1,abs(-0.68352500646255132)) if id==9
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-12.466666666666661)) <= 1e-9 * max(1,abs(-12.466666666666661)) if id==9
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.68352500646255132)) <= 1e-9 * max(1,abs(-0.68352500646255132)) if id==9
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (-0.33333333333333393)) <= 1e-9 * max(1,abs(-0.33333333333333393)) if id==9
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (-0.13245323570650464)) <= 1e-9 * max(1,abs(-0.13245323570650464)) if id==9
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.022408963585434094)) <= 1e-9 * max(1,abs(0.022408963585434094)) if id==9
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (0.20196611671473075)) <= 1e-9 * max(1,abs(0.20196611671473075)) if id==9
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs_2001) & abs(nobs_2001 - (14)) <= 1e-9 * max(1,abs(14)) if id==9
assert !missing(mean_2001) & abs(mean_2001 - (2.7999999999999998)) <= 1e-9 * max(1,abs(2.7999999999999998)) if id==9
assert !missing(median_2001) & abs(median_2001 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==9
assert !missing(var_2001) & abs(var_2001 - (20.199999999999999)) <= 1e-9 * max(1,abs(20.199999999999999)) if id==9
assert !missing(sd_2001) & abs(sd_2001 - (4.4944410108488464)) <= 1e-9 * max(1,abs(4.4944410108488464)) if id==9
assert !missing(skew_2001) & abs(skew_2001 - (2.7547222793893016)) <= 1e-9 * max(1,abs(2.7547222793893016)) if id==9
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (9.8000000000000007)) <= 1e-9 * max(1,abs(9.8000000000000007)) if id==9
assert !missing(total_2001) & abs(total_2001 - (39.200000000000003)) <= 1e-9 * max(1,abs(39.200000000000003)) if id==9
assert !missing(raindays_2001) & abs(raindays_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(norain_2001) & abs(norain_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.42857142857142855)) <= 1e-9 * max(1,abs(0.42857142857142855)) if id==9
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry_2001) & abs(dry_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==9
assert !missing(dry_end_2001) & abs(dry_end_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut01_2001) & abs(cut01_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==9
assert !missing(cut02_2001) & abs(cut02_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut03_2001) & abs(cut03_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut04_2001) & abs(cut04_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (-2.1166666666666654)) <= 1e-9 * max(1,abs(-2.1166666666666654)) if id==9
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (-0.46421217016440641)) <= 1e-9 * max(1,abs(-0.46421217016440641)) if id==9
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-8.4666666666666615)) <= 1e-9 * max(1,abs(-8.4666666666666615)) if id==9
assert !missing(z_total_2001) & abs(z_total_2001 - (-0.46421217016440641)) <= 1e-9 * max(1,abs(-0.46421217016440641)) if id==9
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (-2.3333333333333339)) <= 1e-9 * max(1,abs(-2.3333333333333339)) if id==9
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (-0.92717264994553095)) <= 1e-9 * max(1,abs(-0.92717264994553095)) if id==9
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==9
assert !missing(z_norain_2001) & abs(z_norain_2001 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==9
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.12044817927170876)) <= 1e-9 * max(1,abs(-0.12044817927170876)) if id==9
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-1.0855678773416824)) <= 1e-9 * max(1,abs(-1.0855678773416824)) if id==9
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(z_dry_2001) & abs(z_dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(nobs_2002) & abs(nobs_2002 - (17)) <= 1e-9 * max(1,abs(17)) if id==9
assert !missing(mean_2002) & abs(mean_2002 - (4.0352941176470587)) <= 1e-9 * max(1,abs(4.0352941176470587)) if id==9
assert !missing(median_2002) & abs(median_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(var_2002) & abs(var_2002 - (39.831176470588233)) <= 1e-9 * max(1,abs(39.831176470588233)) if id==9
assert !missing(sd_2002) & abs(sd_2002 - (6.311194535948661)) <= 1e-9 * max(1,abs(6.311194535948661)) if id==9
assert !missing(skew_2002) & abs(skew_2002 - (1.7114765050354401)) <= 1e-9 * max(1,abs(1.7114765050354401)) if id==9
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (17.149999999999999)) <= 1e-9 * max(1,abs(17.149999999999999)) if id==9
assert !missing(total_2002) & abs(total_2002 - (68.599999999999994)) <= 1e-9 * max(1,abs(68.599999999999994)) if id==9
assert !missing(raindays_2002) & abs(raindays_2002 - (11)) <= 1e-9 * max(1,abs(11)) if id==9
assert !missing(norain_2002) & abs(norain_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.6470588235294118)) <= 1e-9 * max(1,abs(0.6470588235294118)) if id==9
assert !missing(dry_start_2002) & abs(dry_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry_2002) & abs(dry_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2002) & abs(cut01_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==9
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut03_2002) & abs(cut03_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (5.2333333333333325)) <= 1e-9 * max(1,abs(5.2333333333333325)) if id==9
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (1.1477371766269582)) <= 1e-9 * max(1,abs(1.1477371766269582)) if id==9
assert !missing(dev_total_2002) & abs(dev_total_2002 - (20.93333333333333)) <= 1e-9 * max(1,abs(20.93333333333333)) if id==9
assert !missing(z_total_2002) & abs(z_total_2002 - (1.1477371766269582)) <= 1e-9 * max(1,abs(1.1477371766269582)) if id==9
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==9
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (1.0596258856520349)) <= 1e-9 * max(1,abs(1.0596258856520349)) if id==9
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (0.098039215686274495)) <= 1e-9 * max(1,abs(0.098039215686274495)) if id==9
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (0.88360176062695006)) <= 1e-9 * max(1,abs(0.88360176062695006)) if id==9
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert !missing(z_dry_2002) & abs(z_dry_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==9
assert !missing(mean_2003) & abs(mean_2003 - (4.2437500000000004)) <= 1e-9 * max(1,abs(4.2437500000000004)) if id==9
assert !missing(median_2003) & abs(median_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(var_2003) & abs(var_2003 - (28.487958333333335)) <= 1e-9 * max(1,abs(28.487958333333335)) if id==9
assert !missing(sd_2003) & abs(sd_2003 - (5.337411201447134)) <= 1e-9 * max(1,abs(5.337411201447134)) if id==9
assert !missing(skew_2003) & abs(skew_2003 - (1.9081428516968335)) <= 1e-9 * max(1,abs(1.9081428516968335)) if id==9
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (16.975000000000001)) <= 1e-9 * max(1,abs(16.975000000000001)) if id==9
assert !missing(total_2003) & abs(total_2003 - (67.900000000000006)) <= 1e-9 * max(1,abs(67.900000000000006)) if id==9
assert !missing(raindays_2003) & abs(raindays_2003 - (11)) <= 1e-9 * max(1,abs(11)) if id==9
assert !missing(norain_2003) & abs(norain_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.6875)) <= 1e-9 * max(1,abs(0.6875)) if id==9
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2003) & abs(cut01_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02_2003) & abs(cut02_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(cut04_2003) & abs(cut04_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==9
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (5.0583333333333353)) <= 1e-9 * max(1,abs(5.0583333333333353)) if id==9
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (1.1093574302747835)) <= 1e-9 * max(1,abs(1.1093574302747835)) if id==9
assert !missing(dev_total_2003) & abs(dev_total_2003 - (20.233333333333341)) <= 1e-9 * max(1,abs(20.233333333333341)) if id==9
assert !missing(z_total_2003) & abs(z_total_2003 - (1.1093574302747835)) <= 1e-9 * max(1,abs(1.1093574302747835)) if id==9
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==9
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (1.0596258856520349)) <= 1e-9 * max(1,abs(1.0596258856520349)) if id==9
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9
assert !missing(z_norain_2003) & abs(z_norain_2003 - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==9
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0.1384803921568627)) <= 1e-9 * max(1,abs(0.1384803921568627)) if id==9
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (1.2480874868855667)) <= 1e-9 * max(1,abs(1.2480874868855667)) if id==9
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_dry_2003) & abs(z_dry_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs_2004) & abs(nobs_2004 - (14)) <= 1e-9 * max(1,abs(14)) if id==9
assert !missing(mean_2004) & abs(mean_2004 - (3.8642857142857143)) <= 1e-9 * max(1,abs(3.8642857142857143)) if id==9
assert !missing(median_2004) & abs(median_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(var_2004) & abs(var_2004 - (33.599395604395603)) <= 1e-9 * max(1,abs(33.599395604395603)) if id==9
assert !missing(sd_2004) & abs(sd_2004 - (5.7964985641674751)) <= 1e-9 * max(1,abs(5.7964985641674751)) if id==9
assert !missing(skew_2004) & abs(skew_2004 - (1.9529385935308152)) <= 1e-9 * max(1,abs(1.9529385935308152)) if id==9
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (13.525)) <= 1e-9 * max(1,abs(13.525)) if id==9
assert !missing(total_2004) & abs(total_2004 - (54.100000000000001)) <= 1e-9 * max(1,abs(54.100000000000001)) if id==9
assert !missing(raindays_2004) & abs(raindays_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==9
assert !missing(norain_2004) & abs(norain_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==9
assert !missing(dry_start_2004) & abs(dry_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01_2004) & abs(cut01_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02_2004) & abs(cut02_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut03_2004) & abs(cut03_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut04_2004) & abs(cut04_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (1.6083333333333343)) <= 1e-9 * max(1,abs(1.6083333333333343)) if id==9
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9
assert !missing(dev_total_2004) & abs(dev_total_2004 - (6.4333333333333371)) <= 1e-9 * max(1,abs(6.4333333333333371)) if id==9
assert !missing(z_total_2004) & abs(z_total_2004 - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==9
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (0.26490647141300855)) <= 1e-9 * max(1,abs(0.26490647141300855)) if id==9
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9
assert !missing(z_norain_2004) & abs(z_norain_2004 - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==9
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (0.093837535014005602)) <= 1e-9 * max(1,abs(0.093837535014005602)) if id==9
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (0.84573311374293803)) <= 1e-9 * max(1,abs(0.84573311374293803)) if id==9
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_dry_2004) & abs(z_dry_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs_2000) & abs(nobs_2000 - (12)) <= 1e-9 * max(1,abs(12)) if id==10
assert !missing(mean_2000) & abs(mean_2000 - (2.5083333333333333)) <= 1e-9 * max(1,abs(2.5083333333333333)) if id==10
assert !missing(median_2000) & abs(median_2000 - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==10
assert !missing(var_2000) & abs(var_2000 - (22.940833333333334)) <= 1e-9 * max(1,abs(22.940833333333334)) if id==10
assert !missing(sd_2000) & abs(sd_2000 - (4.7896589996922883)) <= 1e-9 * max(1,abs(4.7896589996922883)) if id==10
assert !missing(skew_2000) & abs(skew_2000 - (2.9540936586989566)) <= 1e-9 * max(1,abs(2.9540936586989566)) if id==10
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (7.5250000000000004)) <= 1e-9 * max(1,abs(7.5250000000000004)) if id==10
assert !missing(total_2000) & abs(total_2000 - (30.100000000000001)) <= 1e-9 * max(1,abs(30.100000000000001)) if id==10
assert !missing(raindays_2000) & abs(raindays_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(norain_2000) & abs(norain_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10
assert !missing(dry_start_2000) & abs(dry_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_2000) & abs(dry_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(dry_end_2000) & abs(dry_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut01_2000) & abs(cut01_2000 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(cut02_2000) & abs(cut02_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut04_2000) & abs(cut04_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-1.2083333333333339)) <= 1e-9 * max(1,abs(-1.2083333333333339)) if id==10
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-0.19179843842333633)) <= 1e-9 * max(1,abs(-0.19179843842333633)) if id==10
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-4.8333333333333357)) <= 1e-9 * max(1,abs(-4.8333333333333357)) if id==10
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.19179843842333633)) <= 1e-9 * max(1,abs(-0.19179843842333633)) if id==10
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==10
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.013888888888888895)) <= 1e-9 * max(1,abs(0.013888888888888895)) if id==10
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (0.09491579957524994)) <= 1e-9 * max(1,abs(0.09491579957524994)) if id==10
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(nobs_2001) & abs(nobs_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==10
assert !missing(mean_2001) & abs(mean_2001 - (3.8875000000000002)) <= 1e-9 * max(1,abs(3.8875000000000002)) if id==10
assert !missing(median_2001) & abs(median_2001 - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10
assert !missing(var_2001) & abs(var_2001 - (29.859833333333334)) <= 1e-9 * max(1,abs(29.859833333333334)) if id==10
assert !missing(sd_2001) & abs(sd_2001 - (5.4644151867636612)) <= 1e-9 * max(1,abs(5.4644151867636612)) if id==10
assert !missing(skew_2001) & abs(skew_2001 - (1.9527171276650597)) <= 1e-9 * max(1,abs(1.9527171276650597)) if id==10
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (15.550000000000001)) <= 1e-9 * max(1,abs(15.550000000000001)) if id==10
assert !missing(total_2001) & abs(total_2001 - (62.200000000000003)) <= 1e-9 * max(1,abs(62.200000000000003)) if id==10
assert !missing(raindays_2001) & abs(raindays_2001 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(norain_2001) & abs(norain_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==10
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dry_2001) & abs(dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_end_2001) & abs(dry_end_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut01_2001) & abs(cut01_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut04_2001) & abs(cut04_2001 - (6)) <= 1e-9 * max(1,abs(6)) if id==10
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (6.8166666666666664)) <= 1e-9 * max(1,abs(6.8166666666666664)) if id==10
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (1.0820077422778553)) <= 1e-9 * max(1,abs(1.0820077422778553)) if id==10
assert !missing(dev_total_2001) & abs(dev_total_2001 - (27.266666666666666)) <= 1e-9 * max(1,abs(27.266666666666666)) if id==10
assert !missing(z_total_2001) & abs(z_total_2001 - (1.0820077422778553)) <= 1e-9 * max(1,abs(1.0820077422778553)) if id==10
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (1.1338934190276817)) <= 1e-9 * max(1,abs(1.1338934190276817)) if id==10
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10
assert !missing(z_norain_2001) & abs(z_norain_2001 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (0.1388888888888889)) <= 1e-9 * max(1,abs(0.1388888888888889)) if id==10
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (0.94915799575249904)) <= 1e-9 * max(1,abs(0.94915799575249904)) if id==10
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_dry_2001) & abs(z_dry_2001 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(nobs_2002) & abs(nobs_2002 - (15)) <= 1e-9 * max(1,abs(15)) if id==10
assert !missing(mean_2002) & abs(mean_2002 - (0.83333333333333337)) <= 1e-9 * max(1,abs(0.83333333333333337)) if id==10
assert !missing(median_2002) & abs(median_2002 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10
assert !missing(var_2002) & abs(var_2002 - (1.5123809523809524)) <= 1e-9 * max(1,abs(1.5123809523809524)) if id==10
assert !missing(sd_2002) & abs(sd_2002 - (1.2297889869326983)) <= 1e-9 * max(1,abs(1.2297889869326983)) if id==10
assert !missing(skew_2002) & abs(skew_2002 - (3.0843894119332429)) <= 1e-9 * max(1,abs(3.0843894119332429)) if id==10
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (3.125)) <= 1e-9 * max(1,abs(3.125)) if id==10
assert !missing(total_2002) & abs(total_2002 - (12.5)) <= 1e-9 * max(1,abs(12.5)) if id==10
assert !missing(raindays_2002) & abs(raindays_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(norain_2002) & abs(norain_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10
assert !missing(dry_start_2002) & abs(dry_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_2002) & abs(dry_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2002) & abs(cut01_2002 - (10)) <= 1e-9 * max(1,abs(10)) if id==10
assert !missing(cut02_2002) & abs(cut02_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04_2002) & abs(cut04_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (-5.6083333333333343)) <= 1e-9 * max(1,abs(-5.6083333333333343)) if id==10
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (-0.89020930385451924)) <= 1e-9 * max(1,abs(-0.89020930385451924)) if id==10
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-22.433333333333337)) <= 1e-9 * max(1,abs(-22.433333333333337)) if id==10
assert !missing(z_total_2002) & abs(z_total_2002 - (-0.89020930385451924)) <= 1e-9 * max(1,abs(-0.89020930385451924)) if id==10
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==10
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==10
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==10
assert !missing(z_norain_2002) & abs(z_norain_2002 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.15277777777777779)) <= 1e-9 * max(1,abs(-0.15277777777777779)) if id==10
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-1.044073795327749)) <= 1e-9 * max(1,abs(-1.044073795327749)) if id==10
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(z_dry_2002) & abs(z_dry_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(nobs_2003) & abs(nobs_2003 - (13)) <= 1e-9 * max(1,abs(13)) if id==10
assert !missing(mean_2003) & abs(mean_2003 - (5.0538461538461537)) <= 1e-9 * max(1,abs(5.0538461538461537)) if id==10
assert !missing(median_2003) & abs(median_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(var_2003) & abs(var_2003 - (47.782692307692308)) <= 1e-9 * max(1,abs(47.782692307692308)) if id==10
assert !missing(sd_2003) & abs(sd_2003 - (6.9125026081508505)) <= 1e-9 * max(1,abs(6.9125026081508505)) if id==10
assert !missing(skew_2003) & abs(skew_2003 - (1.3458217207294318)) <= 1e-9 * max(1,abs(1.3458217207294318)) if id==10
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (16.425000000000001)) <= 1e-9 * max(1,abs(16.425000000000001)) if id==10
assert !missing(total_2003) & abs(total_2003 - (65.700000000000003)) <= 1e-9 * max(1,abs(65.700000000000003)) if id==10
assert !missing(raindays_2003) & abs(raindays_2003 - (9)) <= 1e-9 * max(1,abs(9)) if id==10
assert !missing(norain_2003) & abs(norain_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==10
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dry_2003) & abs(dry_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01_2003) & abs(cut01_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(cut02_2003) & abs(cut02_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut04_2003) & abs(cut04_2003 - (4)) <= 1e-9 * max(1,abs(4)) if id==10
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (7.6916666666666664)) <= 1e-9 * max(1,abs(7.6916666666666664)) if id==10
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (1.2208962666533747)) <= 1e-9 * max(1,abs(1.2208962666533747)) if id==10
assert !missing(dev_total_2003) & abs(dev_total_2003 - (30.766666666666666)) <= 1e-9 * max(1,abs(30.766666666666666)) if id==10
assert !missing(z_total_2003) & abs(z_total_2003 - (1.2208962666533747)) <= 1e-9 * max(1,abs(1.2208962666533747)) if id==10
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (0.7559289460184544)) <= 1e-9 * max(1,abs(0.7559289460184544)) if id==10
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (-3.333333333333333)) <= 1e-9 * max(1,abs(-3.333333333333333)) if id==10
assert !missing(z_norain_2003) & abs(z_norain_2003 - (-1.4433756729740643)) <= 1e-9 * max(1,abs(-1.4433756729740643)) if id==10
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0.20619658119658119)) <= 1e-9 * max(1,abs(0.20619658119658119)) if id==10
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (1.4091345629248637)) <= 1e-9 * max(1,abs(1.4091345629248637)) if id==10
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(z_dry_2003) & abs(z_dry_2003 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10
assert !missing(nobs_2004) & abs(nobs_2004 - (17)) <= 1e-9 * max(1,abs(17)) if id==10
assert !missing(mean_2004) & abs(mean_2004 - (4.0411764705882351)) <= 1e-9 * max(1,abs(4.0411764705882351)) if id==10
assert !missing(median_2004) & abs(median_2004 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10
assert !missing(var_2004) & abs(var_2004 - (40.500073529411765)) <= 1e-9 * max(1,abs(40.500073529411765)) if id==10
assert !missing(sd_2004) & abs(sd_2004 - (6.363966807692492)) <= 1e-9 * max(1,abs(6.363966807692492)) if id==10
assert !missing(skew_2004) & abs(skew_2004 - (1.6553223848340348)) <= 1e-9 * max(1,abs(1.6553223848340348)) if id==10
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (22.900000000000002)) <= 1e-9 * max(1,abs(22.900000000000002)) if id==10
assert !missing(total_2004) & abs(total_2004 - (68.700000000000003)) <= 1e-9 * max(1,abs(68.700000000000003)) if id==10
assert !missing(raindays_2004) & abs(raindays_2004 - (8)) <= 1e-9 * max(1,abs(8)) if id==10
assert !missing(norain_2004) & abs(norain_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==10
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.47058823529411764)) <= 1e-9 * max(1,abs(0.47058823529411764)) if id==10
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dry_2004) & abs(dry_2004 - (3)) <= 1e-9 * max(1,abs(3)) if id==10
assert !missing(dry_end_2004) & abs(dry_end_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut01_2004) & abs(cut01_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==10
assert !missing(cut02_2004) & abs(cut02_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(cut03_2004) & abs(cut03_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut04_2004) & abs(cut04_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==10
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (14.166666666666668)) <= 1e-9 * max(1,abs(14.166666666666668)) if id==10
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (2.2486713470322179)) <= 1e-9 * max(1,abs(2.2486713470322179)) if id==10
assert !missing(dev_total_2004) & abs(dev_total_2004 - (33.766666666666666)) <= 1e-9 * max(1,abs(33.766666666666666)) if id==10
assert !missing(z_total_2004) & abs(z_total_2004 - (1.3399435732609626)) <= 1e-9 * max(1,abs(1.3399435732609626)) if id==10
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (0.3779644730092272)) <= 1e-9 * max(1,abs(0.3779644730092272)) if id==10
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==10
assert !missing(z_norain_2004) & abs(z_norain_2004 - (0.72168783648703239)) <= 1e-9 * max(1,abs(0.72168783648703239)) if id==10
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.015522875816993464)) <= 1e-9 * max(1,abs(-0.015522875816993464)) if id==10
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-0.10608236423116166)) <= 1e-9 * max(1,abs(-0.10608236423116166)) if id==10
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(z_dry_2004) & abs(z_dry_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(mean_2000) & abs(mean_2000 - (2.7066666666666666)) <= 1e-9 * max(1,abs(2.7066666666666666)) if id==11
assert !missing(median_2000) & abs(median_2000 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==11
assert !missing(var_2000) & abs(var_2000 - (19.134952380952381)) <= 1e-9 * max(1,abs(19.134952380952381)) if id==11
assert !missing(sd_2000) & abs(sd_2000 - (4.3743516526397803)) <= 1e-9 * max(1,abs(4.3743516526397803)) if id==11
assert !missing(skew_2000) & abs(skew_2000 - (2.7971651436801928)) <= 1e-9 * max(1,abs(2.7971651436801928)) if id==11
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (10.15)) <= 1e-9 * max(1,abs(10.15)) if id==11
assert !missing(total_2000) & abs(total_2000 - (40.600000000000001)) <= 1e-9 * max(1,abs(40.600000000000001)) if id==11
assert !missing(raindays_2000) & abs(raindays_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==11
assert !missing(norain_2000) & abs(norain_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==11
assert !missing(dry_start_2000) & abs(dry_start_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dry_2000) & abs(dry_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end_2000) & abs(dry_end_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2000) & abs(cut01_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(cut02_2000) & abs(cut02_2000 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut03_2000) & abs(cut03_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut04_2000) & abs(cut04_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==11
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (-5.3000000000000007)) <= 1e-9 * max(1,abs(-5.3000000000000007)) if id==11
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (-1.0232594587192219)) <= 1e-9 * max(1,abs(-1.0232594587192219)) if id==11
assert !missing(dev_total_2000) & abs(dev_total_2000 - (-15.966666666666669)) <= 1e-9 * max(1,abs(-15.966666666666669)) if id==11
assert !missing(z_total_2000) & abs(z_total_2000 - (-0.71713899630696654)) <= 1e-9 * max(1,abs(-0.71713899630696654)) if id==11
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==11
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==11
assert !missing(z_norain_2000) & abs(z_norain_2000 - (1.0596258856520353)) <= 1e-9 * max(1,abs(1.0596258856520353)) if id==11
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (-0.16068376068376067)) <= 1e-9 * max(1,abs(-0.16068376068376067)) if id==11
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (-0.96224439864325428)) <= 1e-9 * max(1,abs(-0.96224439864325428)) if id==11
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11
assert !missing(z_dry_2000) & abs(z_dry_2000 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11
assert !missing(nobs_2001) & abs(nobs_2001 - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(mean_2001) & abs(mean_2001 - (5.4666666666666668)) <= 1e-9 * max(1,abs(5.4666666666666668)) if id==11
assert !missing(median_2001) & abs(median_2001 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(var_2001) & abs(var_2001 - (39.55238095238095)) <= 1e-9 * max(1,abs(39.55238095238095)) if id==11
assert !missing(sd_2001) & abs(sd_2001 - (6.2890683691927656)) <= 1e-9 * max(1,abs(6.2890683691927656)) if id==11
assert !missing(skew_2001) & abs(skew_2001 - (1.2757034417289985)) <= 1e-9 * max(1,abs(1.2757034417289985)) if id==11
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (20.5)) <= 1e-9 * max(1,abs(20.5)) if id==11
assert !missing(total_2001) & abs(total_2001 - (82)) <= 1e-9 * max(1,abs(82)) if id==11
assert !missing(raindays_2001) & abs(raindays_2001 - (12)) <= 1e-9 * max(1,abs(12)) if id==11
assert !missing(norain_2001) & abs(norain_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==11
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry_2001) & abs(dry_2001 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dry_end_2001) & abs(dry_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2001) & abs(cut01_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut02_2001) & abs(cut02_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut03_2001) & abs(cut03_2001 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2001) & abs(cut04_2001 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (5.0499999999999989)) <= 1e-9 * max(1,abs(5.0499999999999989)) if id==11
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (0.97499250311925811)) <= 1e-9 * max(1,abs(0.97499250311925811)) if id==11
assert !missing(dev_total_2001) & abs(dev_total_2001 - (25.43333333333333)) <= 1e-9 * max(1,abs(25.43333333333333)) if id==11
assert !missing(z_total_2001) & abs(z_total_2001 - (1.1423320546601572)) <= 1e-9 * max(1,abs(1.1423320546601572)) if id==11
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (1.1338934190276817)) <= 1e-9 * max(1,abs(1.1338934190276817)) if id==11
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==11
assert !missing(z_norain_2001) & abs(z_norain_2001 - (-0.92717264994553061)) <= 1e-9 * max(1,abs(-0.92717264994553061)) if id==11
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (0.1726495726495727)) <= 1e-9 * max(1,abs(0.1726495726495727)) if id==11
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (1.0339008964145608)) <= 1e-9 * max(1,abs(1.0339008964145608)) if id==11
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==11
assert !missing(z_dry_2001) & abs(z_dry_2001 - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==11
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==11
assert !missing(mean_2002) & abs(mean_2002 - (3.6230769230769231)) <= 1e-9 * max(1,abs(3.6230769230769231)) if id==11
assert !missing(median_2002) & abs(median_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var_2002) & abs(var_2002 - (37.016923076923078)) <= 1e-9 * max(1,abs(37.016923076923078)) if id==11
assert !missing(sd_2002) & abs(sd_2002 - (6.0841534396268377)) <= 1e-9 * max(1,abs(6.0841534396268377)) if id==11
assert !missing(skew_2002) & abs(skew_2002 - (1.9784390504014764)) <= 1e-9 * max(1,abs(1.9784390504014764)) if id==11
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (15.700000000000001)) <= 1e-9 * max(1,abs(15.700000000000001)) if id==11
assert !missing(total_2002) & abs(total_2002 - (47.100000000000001)) <= 1e-9 * max(1,abs(47.100000000000001)) if id==11
assert !missing(raindays_2002) & abs(raindays_2002 - (8)) <= 1e-9 * max(1,abs(8)) if id==11
assert !missing(norain_2002) & abs(norain_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.61538461538461542)) <= 1e-9 * max(1,abs(0.61538461538461542)) if id==11
assert !missing(dry_start_2002) & abs(dry_start_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dry_2002) & abs(dry_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2002) & abs(cut01_2002 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut02_2002) & abs(cut02_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut03_2002) & abs(cut03_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2002) & abs(cut04_2002 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==11
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (0.048266955599963281)) <= 1e-9 * max(1,abs(0.048266955599963281)) if id==11
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-9.4666666666666686)) <= 1e-9 * max(1,abs(-9.4666666666666686)) if id==11
assert !missing(z_total_2002) & abs(z_total_2002 - (-0.42519305835319104)) <= 1e-9 * max(1,abs(-0.42519305835319104)) if id==11
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==11
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==11
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.13245323570650427)) <= 1e-9 * max(1,abs(-0.13245323570650427)) if id==11
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.011965811965811923)) <= 1e-9 * max(1,abs(-0.011965811965811923)) if id==11
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-0.071656497771305921)) <= 1e-9 * max(1,abs(-0.071656497771305921)) if id==11
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11
assert !missing(z_dry_2002) & abs(z_dry_2002 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11
assert !missing(nobs_2003) & abs(nobs_2003 - (17)) <= 1e-9 * max(1,abs(17)) if id==11
assert !missing(mean_2003) & abs(mean_2003 - (3.0352941176470587)) <= 1e-9 * max(1,abs(3.0352941176470587)) if id==11
assert !missing(median_2003) & abs(median_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var_2003) & abs(var_2003 - (28.913676470588236)) <= 1e-9 * max(1,abs(28.913676470588236)) if id==11
assert !missing(sd_2003) & abs(sd_2003 - (5.3771438952838366)) <= 1e-9 * max(1,abs(5.3771438952838366)) if id==11
assert !missing(skew_2003) & abs(skew_2003 - (2.4087388708912201)) <= 1e-9 * max(1,abs(2.4087388708912201)) if id==11
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (12.9)) <= 1e-9 * max(1,abs(12.9)) if id==11
assert !missing(total_2003) & abs(total_2003 - (51.600000000000001)) <= 1e-9 * max(1,abs(51.600000000000001)) if id==11
assert !missing(raindays_2003) & abs(raindays_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==11
assert !missing(norain_2003) & abs(norain_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==11
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.58823529411764708)) <= 1e-9 * max(1,abs(0.58823529411764708)) if id==11
assert !missing(dry_start_2003) & abs(dry_start_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end_2003) & abs(dry_end_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2003) & abs(cut01_2003 - (7)) <= 1e-9 * max(1,abs(7)) if id==11
assert !missing(cut02_2003) & abs(cut02_2003 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut03_2003) & abs(cut03_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2003) & abs(cut04_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (-2.5500000000000007)) <= 1e-9 * max(1,abs(-2.5500000000000007)) if id==11
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (-0.49232294711962565)) <= 1e-9 * max(1,abs(-0.49232294711962565)) if id==11
assert !missing(dev_total_2003) & abs(dev_total_2003 - (-4.9666666666666686)) <= 1e-9 * max(1,abs(-4.9666666666666686)) if id==11
assert !missing(z_total_2003) & abs(z_total_2003 - (-0.22307663976980802)) <= 1e-9 * max(1,abs(-0.22307663976980802)) if id==11
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (0.3779644730092272)) <= 1e-9 * max(1,abs(0.3779644730092272)) if id==11
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==11
assert !missing(z_norain_2003) & abs(z_norain_2003 - (0.66226617853252201)) <= 1e-9 * max(1,abs(0.66226617853252201)) if id==11
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (-0.039115133232780264)) <= 1e-9 * max(1,abs(-0.039115133232780264)) if id==11
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (-0.23423846750452171)) <= 1e-9 * max(1,abs(-0.23423846750452171)) if id==11
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11
assert !missing(z_dry_2003) & abs(z_dry_2003 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11
assert !missing(nobs_2004) & abs(nobs_2004 - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(mean_2004) & abs(mean_2004 - (1.5666666666666667)) <= 1e-9 * max(1,abs(1.5666666666666667)) if id==11
assert !missing(median_2004) & abs(median_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var_2004) & abs(var_2004 - (2.1595238095238094)) <= 1e-9 * max(1,abs(2.1595238095238094)) if id==11
assert !missing(sd_2004) & abs(sd_2004 - (1.4695318334503031)) <= 1e-9 * max(1,abs(1.4695318334503031)) if id==11
assert !missing(skew_2004) & abs(skew_2004 - (1.9443939629851632)) <= 1e-9 * max(1,abs(1.9443939629851632)) if id==11
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (7.833333333333333)) <= 1e-9 * max(1,abs(7.833333333333333)) if id==11
assert !missing(total_2004) & abs(total_2004 - (23.5)) <= 1e-9 * max(1,abs(23.5)) if id==11
assert !missing(raindays_2004) & abs(raindays_2004 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(norain_2004) & abs(norain_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11
assert !missing(dry_start_2004) & abs(dry_start_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end_2004) & abs(dry_end_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01_2004) & abs(cut01_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut02_2004) & abs(cut02_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==11
assert !missing(cut03_2004) & abs(cut03_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(cut04_2004) & abs(cut04_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (-7.616666666666668)) <= 1e-9 * max(1,abs(-7.616666666666668)) if id==11
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (-1.4705332472788817)) <= 1e-9 * max(1,abs(-1.4705332472788817)) if id==11
assert !missing(dev_total_2004) & abs(dev_total_2004 - (-33.06666666666667)) <= 1e-9 * max(1,abs(-33.06666666666667)) if id==11
assert !missing(z_total_2004) & abs(z_total_2004 - (-1.4851813869238222)) <= 1e-9 * max(1,abs(-1.4851813869238222)) if id==11
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==11
assert !missing(z_norain_2004) & abs(z_norain_2004 - (0.26490647141300888)) <= 1e-9 * max(1,abs(0.26490647141300888)) if id==11
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (-0.027350427350427364)) <= 1e-9 * max(1,abs(-0.027350427350427364)) if id==11
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (-0.16378628062012848)) <= 1e-9 * max(1,abs(-0.16378628062012848)) if id==11
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11
assert !missing(z_dry_2004) & abs(z_dry_2004 - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11
assert !missing(nobs_2000) & abs(nobs_2000 - (15)) <= 1e-9 * max(1,abs(15)) if id==12
assert !missing(mean_2000) & abs(mean_2000 - (3.0866666666666669)) <= 1e-9 * max(1,abs(3.0866666666666669)) if id==12
assert !missing(median_2000) & abs(median_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(var_2000) & abs(var_2000 - (33.498380952380955)) <= 1e-9 * max(1,abs(33.498380952380955)) if id==12
assert !missing(sd_2000) & abs(sd_2000 - (5.7877785852934069)) <= 1e-9 * max(1,abs(5.7877785852934069)) if id==12
assert !missing(skew_2000) & abs(skew_2000 - (2.2019364321357879)) <= 1e-9 * max(1,abs(2.2019364321357879)) if id==12
assert !missing(mean_mo_2000) & abs(mean_mo_2000 - (11.574999999999999)) <= 1e-9 * max(1,abs(11.574999999999999)) if id==12
assert !missing(total_2000) & abs(total_2000 - (46.299999999999997)) <= 1e-9 * max(1,abs(46.299999999999997)) if id==12
assert !missing(raindays_2000) & abs(raindays_2000 - (8)) <= 1e-9 * max(1,abs(8)) if id==12
assert !missing(norain_2000) & abs(norain_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(pct_raindays_2000) & abs(pct_raindays_2000 - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==12
assert !missing(dry_start_2000) & abs(dry_start_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dry_2000) & abs(dry_2000 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dry_end_2000) & abs(dry_end_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2000) & abs(cut01_2000 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(cut02_2000) & abs(cut02_2000 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(cut03_2000) & abs(cut03_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2000) & abs(cut04_2000 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_mean_mo_2000) & abs(dev_mean_mo_2000 - (1.5250000000000004)) <= 1e-9 * max(1,abs(1.5250000000000004)) if id==12
assert !missing(z_mean_mo_2000) & abs(z_mean_mo_2000 - (1.1542353397281102)) <= 1e-9 * max(1,abs(1.1542353397281102)) if id==12
assert !missing(dev_total_2000) & abs(dev_total_2000 - (6.1000000000000014)) <= 1e-9 * max(1,abs(6.1000000000000014)) if id==12
assert !missing(z_total_2000) & abs(z_total_2000 - (1.1542353397281102)) <= 1e-9 * max(1,abs(1.1542353397281102)) if id==12
assert !missing(dev_raindays_2000) & abs(dev_raindays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(z_raindays_2000) & abs(z_raindays_2000 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dev_norain_2000) & abs(dev_norain_2000 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==12
assert !missing(z_norain_2000) & abs(z_norain_2000 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12
assert !missing(dev_pct_raindays_2000) & abs(dev_pct_raindays_2000 - (0.055876068376068344)) <= 1e-9 * max(1,abs(0.055876068376068344)) if id==12
assert !missing(z_pct_raindays_2000) & abs(z_pct_raindays_2000 - (1.1206493928451402)) <= 1e-9 * max(1,abs(1.1206493928451402)) if id==12
assert !missing(dev_dry_2000) & abs(dev_dry_2000 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12
assert !missing(z_dry_2000) & abs(z_dry_2000 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12
assert !missing(nobs_2001) & abs(nobs_2001 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(mean_2001) & abs(mean_2001 - (2.3125)) <= 1e-9 * max(1,abs(2.3125)) if id==12
assert !missing(median_2001) & abs(median_2001 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12
assert !missing(var_2001) & abs(var_2001 - (18.873166666666666)) <= 1e-9 * max(1,abs(18.873166666666666)) if id==12
assert !missing(sd_2001) & abs(sd_2001 - (4.3443258011648558)) <= 1e-9 * max(1,abs(4.3443258011648558)) if id==12
assert !missing(skew_2001) & abs(skew_2001 - (2.9091292854797488)) <= 1e-9 * max(1,abs(2.9091292854797488)) if id==12
assert !missing(mean_mo_2001) & abs(mean_mo_2001 - (9.25)) <= 1e-9 * max(1,abs(9.25)) if id==12
assert !missing(total_2001) & abs(total_2001 - (37)) <= 1e-9 * max(1,abs(37)) if id==12
assert !missing(raindays_2001) & abs(raindays_2001 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(norain_2001) & abs(norain_2001 - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(pct_raindays_2001) & abs(pct_raindays_2001 - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==12
assert !missing(dry_start_2001) & abs(dry_start_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry_2001) & abs(dry_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dry_end_2001) & abs(dry_end_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2001) & abs(cut01_2001 - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(cut02_2001) & abs(cut02_2001 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut03_2001) & abs(cut03_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut04_2001) & abs(cut04_2001 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_mean_mo_2001) & abs(dev_mean_mo_2001 - (-0.79999999999999893)) <= 1e-9 * max(1,abs(-0.79999999999999893)) if id==12
assert !missing(z_mean_mo_2001) & abs(z_mean_mo_2001 - (-0.60550050608687644)) <= 1e-9 * max(1,abs(-0.60550050608687644)) if id==12
assert !missing(dev_total_2001) & abs(dev_total_2001 - (-3.1999999999999957)) <= 1e-9 * max(1,abs(-3.1999999999999957)) if id==12
assert !missing(z_total_2001) & abs(z_total_2001 - (-0.60550050608687644)) <= 1e-9 * max(1,abs(-0.60550050608687644)) if id==12
assert !missing(dev_raindays_2001) & abs(dev_raindays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(z_raindays_2001) & abs(z_raindays_2001 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dev_norain_2001) & abs(dev_norain_2001 - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==12
assert !missing(z_norain_2001) & abs(z_norain_2001 - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==12
assert !missing(dev_pct_raindays_2001) & abs(dev_pct_raindays_2001 - (-0.039957264957264982)) <= 1e-9 * max(1,abs(-0.039957264957264982)) if id==12
assert !missing(z_pct_raindays_2001) & abs(z_pct_raindays_2001 - (-0.80138216620283542)) <= 1e-9 * max(1,abs(-0.80138216620283542)) if id==12
assert !missing(dev_dry_2001) & abs(dev_dry_2001 - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==12
assert !missing(z_dry_2001) & abs(z_dry_2001 - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==12
assert !missing(nobs_2002) & abs(nobs_2002 - (13)) <= 1e-9 * max(1,abs(13)) if id==12
assert !missing(mean_2002) & abs(mean_2002 - (2.8692307692307693)) <= 1e-9 * max(1,abs(2.8692307692307693)) if id==12
assert !missing(median_2002) & abs(median_2002 - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12
assert !missing(var_2002) & abs(var_2002 - (21.79397435897436)) <= 1e-9 * max(1,abs(21.79397435897436)) if id==12
assert !missing(sd_2002) & abs(sd_2002 - (4.6684016921184446)) <= 1e-9 * max(1,abs(4.6684016921184446)) if id==12
assert !missing(skew_2002) & abs(skew_2002 - (2.6464372055970311)) <= 1e-9 * max(1,abs(2.6464372055970311)) if id==12
assert !missing(mean_mo_2002) & abs(mean_mo_2002 - (9.3249999999999993)) <= 1e-9 * max(1,abs(9.3249999999999993)) if id==12
assert !missing(total_2002) & abs(total_2002 - (37.299999999999997)) <= 1e-9 * max(1,abs(37.299999999999997)) if id==12
assert !missing(raindays_2002) & abs(raindays_2002 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(norain_2002) & abs(norain_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(pct_raindays_2002) & abs(pct_raindays_2002 - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==12
assert !missing(dry_start_2002) & abs(dry_start_2002 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dry_2002) & abs(dry_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dry_end_2002) & abs(dry_end_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01_2002) & abs(cut01_2002 - (7)) <= 1e-9 * max(1,abs(7)) if id==12
assert !missing(cut02_2002) & abs(cut02_2002 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut03_2002) & abs(cut03_2002 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut04_2002) & abs(cut04_2002 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_mean_mo_2002) & abs(dev_mean_mo_2002 - (-0.72499999999999964)) <= 1e-9 * max(1,abs(-0.72499999999999964)) if id==12
assert !missing(z_mean_mo_2002) & abs(z_mean_mo_2002 - (-0.54873483364123232)) <= 1e-9 * max(1,abs(-0.54873483364123232)) if id==12
assert !missing(dev_total_2002) & abs(dev_total_2002 - (-2.8999999999999986)) <= 1e-9 * max(1,abs(-2.8999999999999986)) if id==12
assert !missing(z_total_2002) & abs(z_total_2002 - (-0.54873483364123232)) <= 1e-9 * max(1,abs(-0.54873483364123232)) if id==12
assert !missing(dev_raindays_2002) & abs(dev_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_raindays_2002) & abs(z_raindays_2002 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(dev_norain_2002) & abs(dev_norain_2002 - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==12
assert !missing(z_norain_2002) & abs(z_norain_2002 - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12
assert !missing(dev_pct_raindays_2002) & abs(dev_pct_raindays_2002 - (-0.015918803418803418)) <= 1e-9 * max(1,abs(-0.015918803418803418)) if id==12
assert !missing(z_pct_raindays_2002) & abs(z_pct_raindays_2002 - (-0.31926722664230589)) <= 1e-9 * max(1,abs(-0.31926722664230589)) if id==12
assert !missing(dev_dry_2002) & abs(dev_dry_2002 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12
assert !missing(z_dry_2002) & abs(z_dry_2002 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12
assert !missing(nobs_2003) & abs(nobs_2003 - (16)) <= 1e-9 * max(1,abs(16)) if id==12
assert !missing(mean_2003) & abs(mean_2003 - (6.0562500000000004)) <= 1e-9 * max(1,abs(6.0562500000000004)) if id==12
assert !missing(median_2003) & abs(median_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(var_2003) & abs(var_2003 - (59.410625000000003)) <= 1e-9 * max(1,abs(59.410625000000003)) if id==12
assert !missing(sd_2003) & abs(sd_2003 - (7.7078288123180316)) <= 1e-9 * max(1,abs(7.7078288123180316)) if id==12
assert !missing(skew_2003) & abs(skew_2003 - (0.8246527622246832)) <= 1e-9 * max(1,abs(0.8246527622246832)) if id==12
assert !missing(mean_mo_2003) & abs(mean_mo_2003 - (24.225000000000001)) <= 1e-9 * max(1,abs(24.225000000000001)) if id==12
assert !missing(total_2003) & abs(total_2003 - (96.900000000000006)) <= 1e-9 * max(1,abs(96.900000000000006)) if id==12
assert !missing(raindays_2003) & abs(raindays_2003 - (10)) <= 1e-9 * max(1,abs(10)) if id==12
assert !missing(norain_2003) & abs(norain_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(pct_raindays_2003) & abs(pct_raindays_2003 - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==12
assert !missing(dry_start_2003) & abs(dry_start_2003 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry_2003) & abs(dry_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dry_end_2003) & abs(dry_end_2003 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut01_2003) & abs(cut01_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(cut02_2003) & abs(cut02_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(cut03_2003) & abs(cut03_2003 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04_2003) & abs(cut04_2003 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(dev_mean_mo_2003) & abs(dev_mean_mo_2003 - (14.175000000000002)) <= 1e-9 * max(1,abs(14.175000000000002)) if id==12
assert !missing(z_mean_mo_2003) & abs(z_mean_mo_2003 - (10.728712092226859)) <= 1e-9 * max(1,abs(10.728712092226859)) if id==12
assert !missing(dev_total_2003) & abs(dev_total_2003 - (56.70000000000001)) <= 1e-9 * max(1,abs(56.70000000000001)) if id==12
assert !missing(z_total_2003) & abs(z_total_2003 - (10.728712092226859)) <= 1e-9 * max(1,abs(10.728712092226859)) if id==12
assert !missing(dev_raindays_2003) & abs(dev_raindays_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(z_raindays_2003) & abs(z_raindays_2003 - (3)) <= 1e-9 * max(1,abs(3)) if id==12
assert !missing(dev_norain_2003) & abs(dev_norain_2003 - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12
assert !missing(z_norain_2003) & abs(z_norain_2003 - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==12
assert !missing(dev_pct_raindays_2003) & abs(dev_pct_raindays_2003 - (0.14754273504273502)) <= 1e-9 * max(1,abs(0.14754273504273502)) if id==12
assert !missing(z_pct_raindays_2003) & abs(z_pct_raindays_2003 - (2.959114362369291)) <= 1e-9 * max(1,abs(2.959114362369291)) if id==12
assert !missing(dev_dry_2003) & abs(dev_dry_2003 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12
assert !missing(z_dry_2003) & abs(z_dry_2003 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12
assert !missing(nobs_2004) & abs(nobs_2004 - (11)) <= 1e-9 * max(1,abs(11)) if id==12
assert !missing(mean_2004) & abs(mean_2004 - (3.290909090909091)) <= 1e-9 * max(1,abs(3.290909090909091)) if id==12
assert !missing(median_2004) & abs(median_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(var_2004) & abs(var_2004 - (24.856909090909092)) <= 1e-9 * max(1,abs(24.856909090909092)) if id==12
assert !missing(sd_2004) & abs(sd_2004 - (4.9856703752764373)) <= 1e-9 * max(1,abs(4.9856703752764373)) if id==12
assert !missing(skew_2004) & abs(skew_2004 - (2.4117045295500548)) <= 1e-9 * max(1,abs(2.4117045295500548)) if id==12
assert !missing(mean_mo_2004) & abs(mean_mo_2004 - (12.066666666666668)) <= 1e-9 * max(1,abs(12.066666666666668)) if id==12
assert !missing(total_2004) & abs(total_2004 - (36.200000000000003)) <= 1e-9 * max(1,abs(36.200000000000003)) if id==12
assert !missing(raindays_2004) & abs(raindays_2004 - (6)) <= 1e-9 * max(1,abs(6)) if id==12
assert !missing(norain_2004) & abs(norain_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(pct_raindays_2004) & abs(pct_raindays_2004 - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==12
assert !missing(dry_start_2004) & abs(dry_start_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(dry_2004) & abs(dry_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dry_end_2004) & abs(dry_end_2004 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut01_2004) & abs(cut01_2004 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(cut02_2004) & abs(cut02_2004 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(cut03_2004) & abs(cut03_2004 - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut04_2004) & abs(cut04_2004 - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(dev_mean_mo_2004) & abs(dev_mean_mo_2004 - (2.0166666666666693)) <= 1e-9 * max(1,abs(2.0166666666666693)) if id==12
assert !missing(z_mean_mo_2004) & abs(z_mean_mo_2004 - (1.5263658590940052)) <= 1e-9 * max(1,abs(1.5263658590940052)) if id==12
assert !missing(dev_total_2004) & abs(dev_total_2004 - (-3.9999999999999929)) <= 1e-9 * max(1,abs(-3.9999999999999929)) if id==12
assert !missing(z_total_2004) & abs(z_total_2004 - (-0.75687563260859525)) <= 1e-9 * max(1,abs(-0.75687563260859525)) if id==12
assert !missing(dev_raindays_2004) & abs(dev_raindays_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(z_raindays_2004) & abs(z_raindays_2004 - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12
assert !missing(dev_norain_2004) & abs(dev_norain_2004 - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==12
assert !missing(z_norain_2004) & abs(z_norain_2004 - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==12
assert !missing(dev_pct_raindays_2004) & abs(dev_pct_raindays_2004 - (0.067997280497280432)) <= 1e-9 * max(1,abs(0.067997280497280432)) if id==12
assert !missing(z_pct_raindays_2004) & abs(z_pct_raindays_2004 - (1.3637521987326306)) <= 1e-9 * max(1,abs(1.3637521987326306)) if id==12
assert !missing(dev_dry_2004) & abs(dev_dry_2004 - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12
assert !missing(z_dry_2004) & abs(z_dry_2004 - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12
assert _N==12
