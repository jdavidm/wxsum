version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261022/oracle_rain.csv", clear varnames(1) asdouble
wxsum x_, type(rain) ini_month(12) ini_day(29) fin_month(3) fin_day(2) baseline(2000 2002) ref_min(2) minobs(2) shape(long) keep(id) cuts(1 2 5)
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2000
assert !missing(mean) & abs(mean - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1 & year==2000
assert !missing(median) & abs(median - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==1 & year==2000
assert !missing(var) & abs(var - (0.32000000000000001)) <= 1e-9 * max(1,abs(0.32000000000000001)) if id==1 & year==2000
assert !missing(sd) & abs(sd - (0.56568542494923801)) <= 1e-9 * max(1,abs(0.56568542494923801)) if id==1 & year==2000
assert missing(skew) if id==1 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1 & year==2000
assert !missing(total) & abs(total - (1.2)) <= 1e-9 * max(1,abs(1.2)) if id==1 & year==2000
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==1 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-11.477777777777778)) <= 1e-9 * max(1,abs(-11.477777777777778)) if id==1 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0680901419160094)) <= 1e-9 * max(1,abs(-1.0680901419160094)) if id==1 & year==2000
assert !missing(dev_total) & abs(dev_total - (-43.533333333333331)) <= 1e-9 * max(1,abs(-43.533333333333331)) if id==1 & year==2000
assert !missing(z_total) & abs(z_total - (-0.97992059869099135)) <= 1e-9 * max(1,abs(-0.97992059869099135)) if id==1 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-5.666666666666667)) <= 1e-9 * max(1,abs(-5.666666666666667)) if id==1 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-1.0288868055369642)) <= 1e-9 * max(1,abs(-1.0288868055369642)) if id==1 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-2.3333333333333335)) <= 1e-9 * max(1,abs(-2.3333333333333335)) if id==1 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.92717264994553072)) <= 1e-9 * max(1,abs(-0.92717264994553072)) if id==1 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.11282051282051286)) <= 1e-9 * max(1,abs(-0.11282051282051286)) if id==1 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.69113736774287526)) <= 1e-9 * max(1,abs(-0.69113736774287526)) if id==1 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1 & year==2000
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==1 & year==2001
assert !missing(mean) & abs(mean - (3.3076923076923075)) <= 1e-9 * max(1,abs(3.3076923076923075)) if id==1 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2001
assert !missing(var) & abs(var - (37.369102564102562)) <= 1e-9 * max(1,abs(37.369102564102562)) if id==1 & year==2001
assert !missing(sd) & abs(sd - (6.1130272831145263)) <= 1e-9 * max(1,abs(6.1130272831145263)) if id==1 & year==2001
assert !missing(skew) & abs(skew - (2.1237997821220285)) <= 1e-9 * max(1,abs(2.1237997821220285)) if id==1 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.333333333333334)) <= 1e-9 * max(1,abs(14.333333333333334)) if id==1 & year==2001
assert !missing(total) & abs(total - (43)) <= 1e-9 * max(1,abs(43)) if id==1 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==1 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.6555555555555568)) <= 1e-9 * max(1,abs(1.6555555555555568)) if id==1 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.15406140478749808)) <= 1e-9 * max(1,abs(0.15406140478749808)) if id==1 & year==2001
assert !missing(dev_total) & abs(dev_total - (-1.7333333333333343)) <= 1e-9 * max(1,abs(-1.7333333333333343)) if id==1 & year==2001
assert !missing(z_total) & abs(z_total - (-0.039016746655384058)) <= 1e-9 * max(1,abs(-0.039016746655384058)) if id==1 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==1 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (0.06052275326688019)) <= 1e-9 * max(1,abs(0.06052275326688019)) if id==1 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==1 & year==2001
assert !missing(z_norain) & abs(z_norain - (1.0596258856520351)) <= 1e-9 * max(1,abs(1.0596258856520351)) if id==1 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.074358974358974428)) <= 1e-9 * max(1,abs(-0.074358974358974428)) if id==1 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.45552235601234986)) <= 1e-9 * max(1,abs(-0.45552235601234986)) if id==1 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666674)) <= 1e-9 * max(1,abs(0.66666666666666674)) if id==1 & year==2001
assert !missing(z_dry) & abs(z_dry - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==1 & year==2001
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==1 & year==2002
assert !missing(mean) & abs(mean - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(var) & abs(var - (50.142857142857146)) <= 1e-9 * max(1,abs(50.142857142857146)) if id==1 & year==2002
assert !missing(sd) & abs(sd - (7.0811621322249882)) <= 1e-9 * max(1,abs(7.0811621322249882)) if id==1 & year==2002
assert !missing(skew) & abs(skew - (0.96792634662515575)) <= 1e-9 * max(1,abs(0.96792634662515575)) if id==1 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (22.5)) <= 1e-9 * max(1,abs(22.5)) if id==1 & year==2002
assert !missing(total) & abs(total - (90)) <= 1e-9 * max(1,abs(90)) if id==1 & year==2002
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==1 & year==2002
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==1 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2002
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2002
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (9.8222222222222229)) <= 1e-9 * max(1,abs(9.8222222222222229)) if id==1 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.9140287371285114)) <= 1e-9 * max(1,abs(0.9140287371285114)) if id==1 & year==2002
assert !missing(dev_total) & abs(dev_total - (45.266666666666666)) <= 1e-9 * max(1,abs(45.266666666666666)) if id==1 & year==2002
assert !missing(z_total) & abs(z_total - (1.0189373453463755)) <= 1e-9 * max(1,abs(1.0189373453463755)) if id==1 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (5.333333333333333)) <= 1e-9 * max(1,abs(5.333333333333333)) if id==1 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (0.96836405227008382)) <= 1e-9 * max(1,abs(0.96836405227008382)) if id==1 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==1 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.13245323570650444)) <= 1e-9 * max(1,abs(-0.13245323570650444)) if id==1 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.18717948717948718)) <= 1e-9 * max(1,abs(0.18717948717948718)) if id==1 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1466597237552245)) <= 1e-9 * max(1,abs(1.1466597237552245)) if id==1 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==1 & year==2003
assert !missing(mean) & abs(mean - (2.3187500000000001)) <= 1e-9 * max(1,abs(2.3187500000000001)) if id==1 & year==2003
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1 & year==2003
assert !missing(var) & abs(var - (17.742958333333334)) <= 1e-9 * max(1,abs(17.742958333333334)) if id==1 & year==2003
assert !missing(sd) & abs(sd - (4.2122391116048163)) <= 1e-9 * max(1,abs(4.2122391116048163)) if id==1 & year==2003
assert !missing(skew) & abs(skew - (3.1937322646126645)) <= 1e-9 * max(1,abs(3.1937322646126645)) if id==1 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (9.2750000000000004)) <= 1e-9 * max(1,abs(9.2750000000000004)) if id==1 & year==2003
assert !missing(total) & abs(total - (37.100000000000001)) <= 1e-9 * max(1,abs(37.100000000000001)) if id==1 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==1 & year==2003
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.375)) <= 1e-9 * max(1,abs(0.375)) if id==1 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2003
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==1 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.4027777777777768)) <= 1e-9 * max(1,abs(-3.4027777777777768)) if id==1 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.31665305514208886)) <= 1e-9 * max(1,abs(-0.31665305514208886)) if id==1 & year==2003
assert !missing(dev_total) & abs(dev_total - (-7.6333333333333329)) <= 1e-9 * max(1,abs(-7.6333333333333329)) if id==1 & year==2003
assert !missing(z_total) & abs(z_total - (-0.17182374969390277)) <= 1e-9 * max(1,abs(-0.17182374969390277)) if id==1 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==1 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-0.12104550653376053)) <= 1e-9 * max(1,abs(-0.12104550653376053)) if id==1 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (6.6666666666666661)) <= 1e-9 * max(1,abs(6.6666666666666661)) if id==1 & year==2003
assert !missing(z_norain) & abs(z_norain - (2.6490647141300876)) <= 1e-9 * max(1,abs(2.6490647141300876)) if id==1 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.23782051282051286)) <= 1e-9 * max(1,abs(-0.23782051282051286)) if id==1 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.4568861558670834)) <= 1e-9 * max(1,abs(-1.4568861558670834)) if id==1 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==1 & year==2003
assert !missing(z_dry) & abs(z_dry - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==1 & year==2003
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2004
assert !missing(mean) & abs(mean - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(median) & abs(median - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==1 & year==2004
assert !missing(var) & abs(var - (2.4066666666666667)) <= 1e-9 * max(1,abs(2.4066666666666667)) if id==1 & year==2004
assert !missing(sd) & abs(sd - (1.5513435037626795)) <= 1e-9 * max(1,abs(1.5513435037626795)) if id==1 & year==2004
assert !missing(skew) & abs(skew - (2.2500825646046452)) <= 1e-9 * max(1,abs(2.2500825646046452)) if id==1 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (2.5)) <= 1e-9 * max(1,abs(2.5)) if id==1 & year==2004
assert !missing(total) & abs(total - (10)) <= 1e-9 * max(1,abs(10)) if id==1 & year==2004
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==1 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==1 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==1 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==1 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==1 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-10.177777777777777)) <= 1e-9 * max(1,abs(-10.177777777777777)) if id==1 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.94711575023723571)) <= 1e-9 * max(1,abs(-0.94711575023723571)) if id==1 & year==2004
assert !missing(dev_total) & abs(dev_total - (-34.733333333333334)) <= 1e-9 * max(1,abs(-34.733333333333334)) if id==1 & year==2004
assert !missing(z_total) & abs(z_total - (-0.78183557720981089)) <= 1e-9 * max(1,abs(-0.78183557720981089)) if id==1 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-3.666666666666667)) <= 1e-9 * max(1,abs(-3.666666666666667)) if id==1 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.66575028593568275)) <= 1e-9 * max(1,abs(-0.66575028593568275)) if id==1 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (3.6666666666666665)) <= 1e-9 * max(1,abs(3.6666666666666665)) if id==1 & year==2004
assert !missing(z_norain) & abs(z_norain - (1.4569855927715483)) <= 1e-9 * max(1,abs(1.4569855927715483)) if id==1 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.31282051282051287)) <= 1e-9 * max(1,abs(-0.31282051282051287)) if id==1 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.9163354287416083)) <= 1e-9 * max(1,abs(-1.9163354287416083)) if id==1 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333326)) <= 1e-9 * max(1,abs(-0.33333333333333326)) if id==1 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==1 & year==2004
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2000
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(skew) if id==2 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2000
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2000
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2000
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_mean_mo) if id==2 & year==2000
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_total) if id==2 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_raindays) if id==2 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_norain) if id==2 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_pct_raindays) if id==2 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2000
assert missing(z_dry) if id==2 & year==2000
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2001
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(skew) if id==2 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2001
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2001
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2001
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_mean_mo) if id==2 & year==2001
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_total) if id==2 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_raindays) if id==2 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_norain) if id==2 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_pct_raindays) if id==2 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2001
assert missing(z_dry) if id==2 & year==2001
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2002
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(skew) if id==2 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2002
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2002
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2002
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_mean_mo) if id==2 & year==2002
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_total) if id==2 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_raindays) if id==2 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_norain) if id==2 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_pct_raindays) if id==2 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2002
assert missing(z_dry) if id==2 & year==2002
assert !missing(nobs) & abs(nobs - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(skew) if id==2 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (9.5)) <= 1e-9 * max(1,abs(9.5)) if id==2 & year==2003
assert !missing(total) & abs(total - (38)) <= 1e-9 * max(1,abs(38)) if id==2 & year==2003
assert !missing(raindays) & abs(raindays - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(cut03) & abs(cut03 - (19)) <= 1e-9 * max(1,abs(19)) if id==2 & year==2003
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==2 & year==2003
assert missing(z_mean_mo) if id==2 & year==2003
assert !missing(dev_total) & abs(dev_total - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2003
assert missing(z_total) if id==2 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2003
assert missing(z_raindays) if id==2 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_norain) if id==2 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_pct_raindays) if id==2 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2003
assert missing(z_dry) if id==2 & year==2003
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2 & year==2004
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(skew) if id==2 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2 & year==2004
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2 & year==2004
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2 & year==2004
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_mean_mo) if id==2 & year==2004
assert !missing(dev_total) & abs(dev_total - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_total) if id==2 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_raindays) if id==2 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_norain) if id==2 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_pct_raindays) if id==2 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2 & year==2004
assert missing(z_dry) if id==2 & year==2004
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2000
assert missing(mean) if id==3 & year==2000
assert missing(median) if id==3 & year==2000
assert missing(var) if id==3 & year==2000
assert missing(sd) if id==3 & year==2000
assert missing(skew) if id==3 & year==2000
assert missing(mean_mo) if id==3 & year==2000
assert missing(total) if id==3 & year==2000
assert missing(raindays) if id==3 & year==2000
assert missing(norain) if id==3 & year==2000
assert missing(pct_raindays) if id==3 & year==2000
assert missing(dry_start) if id==3 & year==2000
assert missing(dry) if id==3 & year==2000
assert missing(dry_end) if id==3 & year==2000
assert missing(cut01) if id==3 & year==2000
assert missing(cut02) if id==3 & year==2000
assert missing(cut03) if id==3 & year==2000
assert missing(cut04) if id==3 & year==2000
assert missing(dev_mean_mo) if id==3 & year==2000
assert missing(z_mean_mo) if id==3 & year==2000
assert missing(dev_total) if id==3 & year==2000
assert missing(z_total) if id==3 & year==2000
assert missing(dev_raindays) if id==3 & year==2000
assert missing(z_raindays) if id==3 & year==2000
assert missing(dev_norain) if id==3 & year==2000
assert missing(z_norain) if id==3 & year==2000
assert missing(dev_pct_raindays) if id==3 & year==2000
assert missing(z_pct_raindays) if id==3 & year==2000
assert missing(dev_dry) if id==3 & year==2000
assert missing(z_dry) if id==3 & year==2000
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2001
assert missing(mean) if id==3 & year==2001
assert missing(median) if id==3 & year==2001
assert missing(var) if id==3 & year==2001
assert missing(sd) if id==3 & year==2001
assert missing(skew) if id==3 & year==2001
assert missing(mean_mo) if id==3 & year==2001
assert missing(total) if id==3 & year==2001
assert missing(raindays) if id==3 & year==2001
assert missing(norain) if id==3 & year==2001
assert missing(pct_raindays) if id==3 & year==2001
assert missing(dry_start) if id==3 & year==2001
assert missing(dry) if id==3 & year==2001
assert missing(dry_end) if id==3 & year==2001
assert missing(cut01) if id==3 & year==2001
assert missing(cut02) if id==3 & year==2001
assert missing(cut03) if id==3 & year==2001
assert missing(cut04) if id==3 & year==2001
assert missing(dev_mean_mo) if id==3 & year==2001
assert missing(z_mean_mo) if id==3 & year==2001
assert missing(dev_total) if id==3 & year==2001
assert missing(z_total) if id==3 & year==2001
assert missing(dev_raindays) if id==3 & year==2001
assert missing(z_raindays) if id==3 & year==2001
assert missing(dev_norain) if id==3 & year==2001
assert missing(z_norain) if id==3 & year==2001
assert missing(dev_pct_raindays) if id==3 & year==2001
assert missing(z_pct_raindays) if id==3 & year==2001
assert missing(dev_dry) if id==3 & year==2001
assert missing(z_dry) if id==3 & year==2001
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2002
assert missing(mean) if id==3 & year==2002
assert missing(median) if id==3 & year==2002
assert missing(var) if id==3 & year==2002
assert missing(sd) if id==3 & year==2002
assert missing(skew) if id==3 & year==2002
assert missing(mean_mo) if id==3 & year==2002
assert missing(total) if id==3 & year==2002
assert missing(raindays) if id==3 & year==2002
assert missing(norain) if id==3 & year==2002
assert missing(pct_raindays) if id==3 & year==2002
assert missing(dry_start) if id==3 & year==2002
assert missing(dry) if id==3 & year==2002
assert missing(dry_end) if id==3 & year==2002
assert missing(cut01) if id==3 & year==2002
assert missing(cut02) if id==3 & year==2002
assert missing(cut03) if id==3 & year==2002
assert missing(cut04) if id==3 & year==2002
assert missing(dev_mean_mo) if id==3 & year==2002
assert missing(z_mean_mo) if id==3 & year==2002
assert missing(dev_total) if id==3 & year==2002
assert missing(z_total) if id==3 & year==2002
assert missing(dev_raindays) if id==3 & year==2002
assert missing(z_raindays) if id==3 & year==2002
assert missing(dev_norain) if id==3 & year==2002
assert missing(z_norain) if id==3 & year==2002
assert missing(dev_pct_raindays) if id==3 & year==2002
assert missing(z_pct_raindays) if id==3 & year==2002
assert missing(dev_dry) if id==3 & year==2002
assert missing(z_dry) if id==3 & year==2002
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2003
assert missing(mean) if id==3 & year==2003
assert missing(median) if id==3 & year==2003
assert missing(var) if id==3 & year==2003
assert missing(sd) if id==3 & year==2003
assert missing(skew) if id==3 & year==2003
assert missing(mean_mo) if id==3 & year==2003
assert missing(total) if id==3 & year==2003
assert missing(raindays) if id==3 & year==2003
assert missing(norain) if id==3 & year==2003
assert missing(pct_raindays) if id==3 & year==2003
assert missing(dry_start) if id==3 & year==2003
assert missing(dry) if id==3 & year==2003
assert missing(dry_end) if id==3 & year==2003
assert missing(cut01) if id==3 & year==2003
assert missing(cut02) if id==3 & year==2003
assert missing(cut03) if id==3 & year==2003
assert missing(cut04) if id==3 & year==2003
assert missing(dev_mean_mo) if id==3 & year==2003
assert missing(z_mean_mo) if id==3 & year==2003
assert missing(dev_total) if id==3 & year==2003
assert missing(z_total) if id==3 & year==2003
assert missing(dev_raindays) if id==3 & year==2003
assert missing(z_raindays) if id==3 & year==2003
assert missing(dev_norain) if id==3 & year==2003
assert missing(z_norain) if id==3 & year==2003
assert missing(dev_pct_raindays) if id==3 & year==2003
assert missing(z_pct_raindays) if id==3 & year==2003
assert missing(dev_dry) if id==3 & year==2003
assert missing(z_dry) if id==3 & year==2003
assert !missing(nobs) & abs(nobs - (0)) <= 1e-9 * max(1,abs(0)) if id==3 & year==2004
assert missing(mean) if id==3 & year==2004
assert missing(median) if id==3 & year==2004
assert missing(var) if id==3 & year==2004
assert missing(sd) if id==3 & year==2004
assert missing(skew) if id==3 & year==2004
assert missing(mean_mo) if id==3 & year==2004
assert missing(total) if id==3 & year==2004
assert missing(raindays) if id==3 & year==2004
assert missing(norain) if id==3 & year==2004
assert missing(pct_raindays) if id==3 & year==2004
assert missing(dry_start) if id==3 & year==2004
assert missing(dry) if id==3 & year==2004
assert missing(dry_end) if id==3 & year==2004
assert missing(cut01) if id==3 & year==2004
assert missing(cut02) if id==3 & year==2004
assert missing(cut03) if id==3 & year==2004
assert missing(cut04) if id==3 & year==2004
assert missing(dev_mean_mo) if id==3 & year==2004
assert missing(z_mean_mo) if id==3 & year==2004
assert missing(dev_total) if id==3 & year==2004
assert missing(z_total) if id==3 & year==2004
assert missing(dev_raindays) if id==3 & year==2004
assert missing(z_raindays) if id==3 & year==2004
assert missing(dev_norain) if id==3 & year==2004
assert missing(z_norain) if id==3 & year==2004
assert missing(dev_pct_raindays) if id==3 & year==2004
assert missing(z_pct_raindays) if id==3 & year==2004
assert missing(dev_dry) if id==3 & year==2004
assert missing(z_dry) if id==3 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==4 & year==2000
assert !missing(mean) & abs(mean - (5.5533333333333337)) <= 1e-9 * max(1,abs(5.5533333333333337)) if id==4 & year==2000
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2000
assert !missing(var) & abs(var - (38.735523809523812)) <= 1e-9 * max(1,abs(38.735523809523812)) if id==4 & year==2000
assert !missing(sd) & abs(sd - (6.2237869347788415)) <= 1e-9 * max(1,abs(6.2237869347788415)) if id==4 & year==2000
assert !missing(skew) & abs(skew - (1.2940101590126338)) <= 1e-9 * max(1,abs(1.2940101590126338)) if id==4 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (20.824999999999999)) <= 1e-9 * max(1,abs(20.824999999999999)) if id==4 & year==2000
assert !missing(total) & abs(total - (83.299999999999997)) <= 1e-9 * max(1,abs(83.299999999999997)) if id==4 & year==2000
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==4 & year==2000
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.73333333333333328)) <= 1e-9 * max(1,abs(0.73333333333333328)) if id==4 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2000
assert !missing(cut04) & abs(cut04 - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.1500000000000004)) <= 1e-9 * max(1,abs(5.1500000000000004)) if id==4 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.74897977396471949)) <= 1e-9 * max(1,abs(0.74897977396471949)) if id==4 & year==2000
assert !missing(dev_total) & abs(dev_total - (29.333333333333329)) <= 1e-9 * max(1,abs(29.333333333333329)) if id==4 & year==2000
assert !missing(z_total) & abs(z_total - (0.98224991972284903)) <= 1e-9 * max(1,abs(0.98224991972284903)) if id==4 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==4 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==4 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2000
assert !missing(z_norain) & abs(z_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==4 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.15384615384615385)) <= 1e-9 * max(1,abs(0.15384615384615385)) if id==4 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1149412193707497)) <= 1e-9 * max(1,abs(1.1149412193707497)) if id==4 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4 & year==2000
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2000
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==4 & year==2001
assert !missing(mean) & abs(mean - (1.5733333333333333)) <= 1e-9 * max(1,abs(1.5733333333333333)) if id==4 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==4 & year==2001
assert !missing(var) & abs(var - (3.4363809523809525)) <= 1e-9 * max(1,abs(3.4363809523809525)) if id==4 & year==2001
assert !missing(sd) & abs(sd - (1.8537478125087437)) <= 1e-9 * max(1,abs(1.8537478125087437)) if id==4 & year==2001
assert !missing(skew) & abs(skew - (1.3380636716760939)) <= 1e-9 * max(1,abs(1.3380636716760939)) if id==4 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (7.8666666666666671)) <= 1e-9 * max(1,abs(7.8666666666666671)) if id==4 & year==2001
assert !missing(total) & abs(total - (23.600000000000001)) <= 1e-9 * max(1,abs(23.600000000000001)) if id==4 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2001
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==4 & year==2001
assert !missing(dry_start) & abs(dry_start - (4)) <= 1e-9 * max(1,abs(4)) if id==4 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2001
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==4 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.8083333333333318)) <= 1e-9 * max(1,abs(-7.8083333333333318)) if id==4 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.1355890747652782)) <= 1e-9 * max(1,abs(-1.1355890747652782)) if id==4 & year==2001
assert !missing(dev_total) & abs(dev_total - (-30.366666666666667)) <= 1e-9 * max(1,abs(-30.366666666666667)) if id==4 & year==2001
assert !missing(z_total) & abs(z_total - (-1.0168519055312677)) <= 1e-9 * max(1,abs(-1.0168519055312677)) if id==4 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-1.3333333333333339)) <= 1e-9 * max(1,abs(-1.3333333333333339)) if id==4 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==4 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2001
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.11282051282051275)) <= 1e-9 * max(1,abs(-0.11282051282051275)) if id==4 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.81762356087188259)) <= 1e-9 * max(1,abs(-0.81762356087188259)) if id==4 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4 & year==2001
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4 & year==2001
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==4 & year==2002
assert !missing(mean) & abs(mean - (4.2307692307692308)) <= 1e-9 * max(1,abs(4.2307692307692308)) if id==4 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(var) & abs(var - (35.830641025641029)) <= 1e-9 * max(1,abs(35.830641025641029)) if id==4 & year==2002
assert !missing(sd) & abs(sd - (5.9858701143310009)) <= 1e-9 * max(1,abs(5.9858701143310009)) if id==4 & year==2002
assert !missing(skew) & abs(skew - (1.734210919117058)) <= 1e-9 * max(1,abs(1.734210919117058)) if id==4 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (18.333333333333332)) <= 1e-9 * max(1,abs(18.333333333333332)) if id==4 & year==2002
assert !missing(total) & abs(total - (55)) <= 1e-9 * max(1,abs(55)) if id==4 & year==2002
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.53846153846153844)) <= 1e-9 * max(1,abs(0.53846153846153844)) if id==4 & year==2002
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2002
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==4 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (2.6583333333333332)) <= 1e-9 * max(1,abs(2.6583333333333332)) if id==4 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.38660930080055905)) <= 1e-9 * max(1,abs(0.38660930080055905)) if id==4 & year==2002
assert !missing(dev_total) & abs(dev_total - (1.0333333333333314)) <= 1e-9 * max(1,abs(1.0333333333333314)) if id==4 & year==2002
assert !missing(z_total) & abs(z_total - (0.034601985808418487)) <= 1e-9 * max(1,abs(0.034601985808418487)) if id==4 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1.3333333333333339)) <= 1e-9 * max(1,abs(-1.3333333333333339)) if id==4 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==4 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.041025641025640991)) <= 1e-9 * max(1,abs(-0.041025641025640991)) if id==4 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.29731765849886632)) <= 1e-9 * max(1,abs(-0.29731765849886632)) if id==4 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==4 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==4 & year==2002
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==4 & year==2003
assert !missing(mean) & abs(mean - (4.4222222222222225)) <= 1e-9 * max(1,abs(4.4222222222222225)) if id==4 & year==2003
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==4 & year==2003
assert !missing(var) & abs(var - (36.758300653594773)) <= 1e-9 * max(1,abs(36.758300653594773)) if id==4 & year==2003
assert !missing(sd) & abs(sd - (6.0628624142062444)) <= 1e-9 * max(1,abs(6.0628624142062444)) if id==4 & year==2003
assert !missing(skew) & abs(skew - (1.6051151924529741)) <= 1e-9 * max(1,abs(1.6051151924529741)) if id==4 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (19.899999999999999)) <= 1e-9 * max(1,abs(19.899999999999999)) if id==4 & year==2003
assert !missing(total) & abs(total - (79.599999999999994)) <= 1e-9 * max(1,abs(79.599999999999994)) if id==4 & year==2003
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2003
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==4 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2003
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==4 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (4.2249999999999996)) <= 1e-9 * max(1,abs(4.2249999999999996)) if id==4 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.61445428058270668)) <= 1e-9 * max(1,abs(0.61445428058270668)) if id==4 & year==2003
assert !missing(dev_total) & abs(dev_total - (25.633333333333326)) <= 1e-9 * max(1,abs(25.633333333333326)) if id==4 & year==2003
assert !missing(z_total) & abs(z_total - (0.85835248666689867)) <= 1e-9 * max(1,abs(0.85835248666689867)) if id==4 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==4 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==4 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2003
assert !missing(z_norain) & abs(z_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==4 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.079487179487179427)) <= 1e-9 * max(1,abs(-0.079487179487179427)) if id==4 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.57605296334155354)) <= 1e-9 * max(1,abs(-0.57605296334155354)) if id==4 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==4 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.28867513459481303)) <= 1e-9 * max(1,abs(-0.28867513459481303)) if id==4 & year==2003
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==4 & year==2004
assert !missing(mean) & abs(mean - (7.6230769230769226)) <= 1e-9 * max(1,abs(7.6230769230769226)) if id==4 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(var) & abs(var - (60.783589743589744)) <= 1e-9 * max(1,abs(60.783589743589744)) if id==4 & year==2004
assert !missing(sd) & abs(sd - (7.79638311934385)) <= 1e-9 * max(1,abs(7.79638311934385)) if id==4 & year==2004
assert !missing(skew) & abs(skew - (0.47321302776390833)) <= 1e-9 * max(1,abs(0.47321302776390833)) if id==4 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (33.033333333333331)) <= 1e-9 * max(1,abs(33.033333333333331)) if id==4 & year==2004
assert !missing(total) & abs(total - (99.099999999999994)) <= 1e-9 * max(1,abs(99.099999999999994)) if id==4 & year==2004
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==4 & year==2004
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.84615384615384615)) <= 1e-9 * max(1,abs(0.84615384615384615)) if id==4 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==4 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4 & year==2004
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==4 & year==2004
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4 & year==2004
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==4 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (17.358333333333334)) <= 1e-9 * max(1,abs(17.358333333333334)) if id==4 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.5244738983309234)) <= 1e-9 * max(1,abs(2.5244738983309234)) if id==4 & year==2004
assert !missing(dev_total) & abs(dev_total - (45.133333333333326)) <= 1e-9 * max(1,abs(45.133333333333326)) if id==4 & year==2004
assert !missing(z_total) & abs(z_total - (1.5113254446644746)) <= 1e-9 * max(1,abs(1.5113254446644746)) if id==4 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==4 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==4 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-4)) <= 1e-9 * max(1,abs(-4)) if id==4 & year==2004
assert !missing(z_norain) & abs(z_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==4 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.26666666666666672)) <= 1e-9 * max(1,abs(0.26666666666666672)) if id==4 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.9325647802426331)) <= 1e-9 * max(1,abs(1.9325647802426331)) if id==4 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==4 & year==2004
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==4 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2000
assert !missing(mean) & abs(mean - (2.6666666666666665)) <= 1e-9 * max(1,abs(2.6666666666666665)) if id==5 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2000
assert !missing(var) & abs(var - (19.189523809523809)) <= 1e-9 * max(1,abs(19.189523809523809)) if id==5 & year==2000
assert !missing(sd) & abs(sd - (4.3805848707134771)) <= 1e-9 * max(1,abs(4.3805848707134771)) if id==5 & year==2000
assert !missing(skew) & abs(skew - (2.8170764665843957)) <= 1e-9 * max(1,abs(2.8170764665843957)) if id==5 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (10)) <= 1e-9 * max(1,abs(10)) if id==5 & year==2000
assert !missing(total) & abs(total - (40)) <= 1e-9 * max(1,abs(40)) if id==5 & year==2000
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==5 & year==2000
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==5 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2000
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.24166666666666714)) <= 1e-9 * max(1,abs(0.24166666666666714)) if id==5 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.52245892048680298)) <= 1e-9 * max(1,abs(0.52245892048680298)) if id==5 & year==2000
assert !missing(dev_total) & abs(dev_total - (0.96666666666666856)) <= 1e-9 * max(1,abs(0.96666666666666856)) if id==5 & year==2000
assert !missing(z_total) & abs(z_total - (0.52245892048680298)) <= 1e-9 * max(1,abs(0.52245892048680298)) if id==5 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==5 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==5 & year==2000
assert !missing(z_norain) & abs(z_norain - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==5 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.088888888888888851)) <= 1e-9 * max(1,abs(-0.088888888888888851)) if id==5 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2000
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2001
assert !missing(mean) & abs(mean - (2.6800000000000002)) <= 1e-9 * max(1,abs(2.6800000000000002)) if id==5 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2001
assert !missing(var) & abs(var - (19.140285714285714)) <= 1e-9 * max(1,abs(19.140285714285714)) if id==5 & year==2001
assert !missing(sd) & abs(sd - (4.3749612243179614)) <= 1e-9 * max(1,abs(4.3749612243179614)) if id==5 & year==2001
assert !missing(skew) & abs(skew - (2.8191449827198878)) <= 1e-9 * max(1,abs(2.8191449827198878)) if id==5 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (10.050000000000001)) <= 1e-9 * max(1,abs(10.050000000000001)) if id==5 & year==2001
assert !missing(total) & abs(total - (40.200000000000003)) <= 1e-9 * max(1,abs(40.200000000000003)) if id==5 & year==2001
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.29166666666666785)) <= 1e-9 * max(1,abs(0.29166666666666785)) if id==5 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.63055386955303938)) <= 1e-9 * max(1,abs(0.63055386955303938)) if id==5 & year==2001
assert !missing(dev_total) & abs(dev_total - (1.1666666666666714)) <= 1e-9 * max(1,abs(1.1666666666666714)) if id==5 & year==2001
assert !missing(z_total) & abs(z_total - (0.63055386955303938)) <= 1e-9 * max(1,abs(0.63055386955303938)) if id==5 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5 & year==2001
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==5 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.044444444444444453)) <= 1e-9 * max(1,abs(0.044444444444444453)) if id==5 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.57735026918962595)) <= 1e-9 * max(1,abs(0.57735026918962595)) if id==5 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5 & year==2001
assert !missing(z_dry) & abs(z_dry - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2001
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==5 & year==2002
assert !missing(mean) & abs(mean - (2.46)) <= 1e-9 * max(1,abs(2.46)) if id==5 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(var) & abs(var - (18.69257142857143)) <= 1e-9 * max(1,abs(18.69257142857143)) if id==5 & year==2002
assert !missing(sd) & abs(sd - (4.3234906532304924)) <= 1e-9 * max(1,abs(4.3234906532304924)) if id==5 & year==2002
assert !missing(skew) & abs(skew - (3.0895692328065056)) <= 1e-9 * max(1,abs(3.0895692328065056)) if id==5 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9.2249999999999996)) <= 1e-9 * max(1,abs(9.2249999999999996)) if id==5 & year==2002
assert !missing(total) & abs(total - (36.899999999999999)) <= 1e-9 * max(1,abs(36.899999999999999)) if id==5 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2002
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==5 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2002
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.53333333333333321)) <= 1e-9 * max(1,abs(-0.53333333333333321)) if id==5 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.1530127900398386)) <= 1e-9 * max(1,abs(-1.1530127900398386)) if id==5 & year==2002
assert !missing(dev_total) & abs(dev_total - (-2.1333333333333329)) <= 1e-9 * max(1,abs(-2.1333333333333329)) if id==5 & year==2002
assert !missing(z_total) & abs(z_total - (-1.1530127900398386)) <= 1e-9 * max(1,abs(-1.1530127900398386)) if id==5 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==5 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==5 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.044444444444444453)) <= 1e-9 * max(1,abs(0.044444444444444453)) if id==5 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.57735026918962595)) <= 1e-9 * max(1,abs(0.57735026918962595)) if id==5 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5 & year==2002
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2003
assert !missing(mean) & abs(mean - (4.9812500000000002)) <= 1e-9 * max(1,abs(4.9812500000000002)) if id==5 & year==2003
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==5 & year==2003
assert !missing(var) & abs(var - (52.930958333333336)) <= 1e-9 * max(1,abs(52.930958333333336)) if id==5 & year==2003
assert !missing(sd) & abs(sd - (7.275366542885199)) <= 1e-9 * max(1,abs(7.275366542885199)) if id==5 & year==2003
assert !missing(skew) & abs(skew - (1.1776767149919345)) <= 1e-9 * max(1,abs(1.1776767149919345)) if id==5 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (19.925000000000001)) <= 1e-9 * max(1,abs(19.925000000000001)) if id==5 & year==2003
assert !missing(total) & abs(total - (79.700000000000003)) <= 1e-9 * max(1,abs(79.700000000000003)) if id==5 & year==2003
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==5 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2003
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==5 & year==2003
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2003
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==5 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (10.166666666666668)) <= 1e-9 * max(1,abs(10.166666666666668)) if id==5 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (21.979306310134429)) <= 1e-9 * max(1,abs(21.979306310134429)) if id==5 & year==2003
assert !missing(dev_total) & abs(dev_total - (40.666666666666671)) <= 1e-9 * max(1,abs(40.666666666666671)) if id==5 & year==2003
assert !missing(z_total) & abs(z_total - (21.979306310134429)) <= 1e-9 * max(1,abs(21.979306310134429)) if id==5 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==5 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==5 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.28867513459481264)) <= 1e-9 * max(1,abs(0.28867513459481264)) if id==5 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.011111111111111127)) <= 1e-9 * max(1,abs(0.011111111111111127)) if id==5 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.14433756729740668)) <= 1e-9 * max(1,abs(0.14433756729740668)) if id==5 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==5 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==5 & year==2003
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==5 & year==2004
assert !missing(mean) & abs(mean - (2.8062499999999999)) <= 1e-9 * max(1,abs(2.8062499999999999)) if id==5 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5 & year==2004
assert !missing(var) & abs(var - (30.941958333333332)) <= 1e-9 * max(1,abs(30.941958333333332)) if id==5 & year==2004
assert !missing(sd) & abs(sd - (5.5625496252468016)) <= 1e-9 * max(1,abs(5.5625496252468016)) if id==5 & year==2004
assert !missing(skew) & abs(skew - (2.4703945069762248)) <= 1e-9 * max(1,abs(2.4703945069762248)) if id==5 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==5 & year==2004
assert !missing(total) & abs(total - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==5 & year==2004
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==5 & year==2004
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==5 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==5 & year==2004
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==5 & year==2004
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==5 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==5 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==5 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.4666666666666668)) <= 1e-9 * max(1,abs(1.4666666666666668)) if id==5 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.1707851726095568)) <= 1e-9 * max(1,abs(3.1707851726095568)) if id==5 & year==2004
assert !missing(dev_total) & abs(dev_total - (5.8666666666666671)) <= 1e-9 * max(1,abs(5.8666666666666671)) if id==5 & year==2004
assert !missing(z_total) & abs(z_total - (3.1707851726095568)) <= 1e-9 * max(1,abs(3.1707851726095568)) if id==5 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==5 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.28867513459481264)) <= 1e-9 * max(1,abs(-0.28867513459481264)) if id==5 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==5 & year==2004
assert !missing(z_norain) & abs(z_norain - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==5 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.051388888888888873)) <= 1e-9 * max(1,abs(-0.051388888888888873)) if id==5 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.66756124875050471)) <= 1e-9 * max(1,abs(-0.66756124875050471)) if id==5 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==5 & year==2004
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==5 & year==2004
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==6 & year==2000
assert !missing(mean) & abs(mean - (5.083333333333333)) <= 1e-9 * max(1,abs(5.083333333333333)) if id==6 & year==2000
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2000
assert !missing(var) & abs(var - (45.870882352941173)) <= 1e-9 * max(1,abs(45.870882352941173)) if id==6 & year==2000
assert !missing(sd) & abs(sd - (6.7728046149982193)) <= 1e-9 * max(1,abs(6.7728046149982193)) if id==6 & year==2000
assert !missing(skew) & abs(skew - (1.2346728891824617)) <= 1e-9 * max(1,abs(1.2346728891824617)) if id==6 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (22.875)) <= 1e-9 * max(1,abs(22.875)) if id==6 & year==2000
assert !missing(total) & abs(total - (91.5)) <= 1e-9 * max(1,abs(91.5)) if id==6 & year==2000
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==6 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.61111111111111116)) <= 1e-9 * max(1,abs(0.61111111111111116)) if id==6 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2000
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2000
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (4.9861111111111107)) <= 1e-9 * max(1,abs(4.9861111111111107)) if id==6 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1005724951015821)) <= 1e-9 * max(1,abs(1.1005724951015821)) if id==6 & year==2000
assert !missing(dev_total) & abs(dev_total - (25.533333333333331)) <= 1e-9 * max(1,abs(25.533333333333331)) if id==6 & year==2000
assert !missing(z_total) & abs(z_total - (1.1448966021970559)) <= 1e-9 * max(1,abs(1.1448966021970559)) if id==6 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6 & year==2000
assert !missing(z_norain) & abs(z_norain - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.039153439153439162)) <= 1e-9 * max(1,abs(0.039153439153439162)) if id==6 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.0067328406287921)) <= 1e-9 * max(1,abs(1.0067328406287921)) if id==6 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==6 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==6 & year==2000
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2001
assert !missing(mean) & abs(mean - (3.7400000000000002)) <= 1e-9 * max(1,abs(3.7400000000000002)) if id==6 & year==2001
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(var) & abs(var - (32.264000000000003)) <= 1e-9 * max(1,abs(32.264000000000003)) if id==6 & year==2001
assert !missing(sd) & abs(sd - (5.6801408433242218)) <= 1e-9 * max(1,abs(5.6801408433242218)) if id==6 & year==2001
assert !missing(skew) & abs(skew - (1.960991958098907)) <= 1e-9 * max(1,abs(1.960991958098907)) if id==6 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.025)) <= 1e-9 * max(1,abs(14.025)) if id==6 & year==2001
assert !missing(total) & abs(total - (56.100000000000001)) <= 1e-9 * max(1,abs(56.100000000000001)) if id==6 & year==2001
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2001
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2001
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.8638888888888889)) <= 1e-9 * max(1,abs(-3.8638888888888889)) if id==6 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.85286704216507014)) <= 1e-9 * max(1,abs(-0.85286704216507014)) if id==6 & year==2001
assert !missing(dev_total) & abs(dev_total - (-9.8666666666666671)) <= 1e-9 * max(1,abs(-9.8666666666666671)) if id==6 & year==2001
assert !missing(z_total) & abs(z_total - (-0.44241435280721747)) <= 1e-9 * max(1,abs(-0.44241435280721747)) if id==6 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6 & year==2001
assert !missing(z_norain) & abs(z_norain - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.038624338624338672)) <= 1e-9 * max(1,abs(-0.038624338624338672)) if id==6 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.9931283427824581)) <= 1e-9 * max(1,abs(-0.9931283427824581)) if id==6 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==6 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==6 & year==2001
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==6 & year==2002
assert !missing(mean) & abs(mean - (3.592857142857143)) <= 1e-9 * max(1,abs(3.592857142857143)) if id==6 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(var) & abs(var - (33.756098901098902)) <= 1e-9 * max(1,abs(33.756098901098902)) if id==6 & year==2002
assert !missing(sd) & abs(sd - (5.809999905430197)) <= 1e-9 * max(1,abs(5.809999905430197)) if id==6 & year==2002
assert !missing(skew) & abs(skew - (2.1048860812757262)) <= 1e-9 * max(1,abs(2.1048860812757262)) if id==6 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (16.766666666666666)) <= 1e-9 * max(1,abs(16.766666666666666)) if id==6 & year==2002
assert !missing(total) & abs(total - (50.299999999999997)) <= 1e-9 * max(1,abs(50.299999999999997)) if id==6 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==6 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==6 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2002
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.1222222222222236)) <= 1e-9 * max(1,abs(-1.1222222222222236)) if id==6 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.24770545293651239)) <= 1e-9 * max(1,abs(-0.24770545293651239)) if id==6 & year==2002
assert !missing(dev_total) & abs(dev_total - (-15.666666666666671)) <= 1e-9 * max(1,abs(-15.666666666666671)) if id==6 & year==2002
assert !missing(z_total) & abs(z_total - (-0.70248224938983872)) <= 1e-9 * max(1,abs(-0.70248224938983872)) if id==6 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==6 & year==2002
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792521)) <= 1e-9 * max(1,abs(-1.1547005383792521)) if id==6 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.00052910052910060124)) <= 1e-9 * max(1,abs(-0.00052910052910060124)) if id==6 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.013604497846336881)) <= 1e-9 * max(1,abs(-0.013604497846336881)) if id==6 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333348)) <= 1e-9 * max(1,abs(0.33333333333333348)) if id==6 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962606)) <= 1e-9 * max(1,abs(0.57735026918962606)) if id==6 & year==2002
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2003
assert !missing(mean) & abs(mean - (2.7466666666666666)) <= 1e-9 * max(1,abs(2.7466666666666666)) if id==6 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(var) & abs(var - (18.681238095238097)) <= 1e-9 * max(1,abs(18.681238095238097)) if id==6 & year==2003
assert !missing(sd) & abs(sd - (4.3221797851591157)) <= 1e-9 * max(1,abs(4.3221797851591157)) if id==6 & year==2003
assert !missing(skew) & abs(skew - (2.8953920715463042)) <= 1e-9 * max(1,abs(2.8953920715463042)) if id==6 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (10.300000000000001)) <= 1e-9 * max(1,abs(10.300000000000001)) if id==6 & year==2003
assert !missing(total) & abs(total - (41.200000000000003)) <= 1e-9 * max(1,abs(41.200000000000003)) if id==6 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==6 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.66666666666666663)) <= 1e-9 * max(1,abs(0.66666666666666663)) if id==6 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==6 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==6 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.5888888888888886)) <= 1e-9 * max(1,abs(-7.5888888888888886)) if id==6 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.6750774688677006)) <= 1e-9 * max(1,abs(-1.6750774688677006)) if id==6 & year==2003
assert !missing(dev_total) & abs(dev_total - (-24.766666666666666)) <= 1e-9 * max(1,abs(-24.766666666666666)) if id==6 & year==2003
assert !missing(z_total) & abs(z_total - (-1.1105198112694681)) <= 1e-9 * max(1,abs(-1.1105198112694681)) if id==6 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==6 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==6 & year==2003
assert !missing(z_norain) & abs(z_norain - (-2.8867513459481295)) <= 1e-9 * max(1,abs(-2.8867513459481295)) if id==6 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.094708994708994632)) <= 1e-9 * max(1,abs(0.094708994708994632)) if id==6 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.4352051144939675)) <= 1e-9 * max(1,abs(2.4352051144939675)) if id==6 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==6 & year==2003
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792512)) <= 1e-9 * max(1,abs(-1.1547005383792512)) if id==6 & year==2003
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==6 & year==2004
assert !missing(mean) & abs(mean - (2.54)) <= 1e-9 * max(1,abs(2.54)) if id==6 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(var) & abs(var - (18.481142857142856)) <= 1e-9 * max(1,abs(18.481142857142856)) if id==6 & year==2004
assert !missing(sd) & abs(sd - (4.298969976301632)) <= 1e-9 * max(1,abs(4.298969976301632)) if id==6 & year==2004
assert !missing(skew) & abs(skew - (3.0849106249301164)) <= 1e-9 * max(1,abs(3.0849106249301164)) if id==6 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (9.5250000000000004)) <= 1e-9 * max(1,abs(9.5250000000000004)) if id==6 & year==2004
assert !missing(total) & abs(total - (38.100000000000001)) <= 1e-9 * max(1,abs(38.100000000000001)) if id==6 & year==2004
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==6 & year==2004
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==6 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==6 & year==2004
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==6 & year==2004
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==6 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==6 & year==2004
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==6 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-8.3638888888888889)) <= 1e-9 * max(1,abs(-8.3638888888888889)) if id==6 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.8461413831481137)) <= 1e-9 * max(1,abs(-1.8461413831481137)) if id==6 & year==2004
assert !missing(dev_total) & abs(dev_total - (-27.866666666666667)) <= 1e-9 * max(1,abs(-27.866666666666667)) if id==6 & year==2004
assert !missing(z_total) & abs(z_total - (-1.2495216180636277)) <= 1e-9 * max(1,abs(-1.2495216180636277)) if id==6 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==6 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-0.57735026918962584)) <= 1e-9 * max(1,abs(-0.57735026918962584)) if id==6 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0.33333333333333304)) <= 1e-9 * max(1,abs(0.33333333333333304)) if id==6 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.57735026918962529)) <= 1e-9 * max(1,abs(0.57735026918962529)) if id==6 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.038624338624338672)) <= 1e-9 * max(1,abs(-0.038624338624338672)) if id==6 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.9931283427824581)) <= 1e-9 * max(1,abs(-0.9931283427824581)) if id==6 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-1.6666666666666665)) <= 1e-9 * max(1,abs(-1.6666666666666665)) if id==6 & year==2004
assert !missing(z_dry) & abs(z_dry - (-2.8867513459481287)) <= 1e-9 * max(1,abs(-2.8867513459481287)) if id==6 & year==2004
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==7 & year==2000
assert !missing(mean) & abs(mean - (3.7285714285714286)) <= 1e-9 * max(1,abs(3.7285714285714286)) if id==7 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2000
assert !missing(var) & abs(var - (35.49296703296703)) <= 1e-9 * max(1,abs(35.49296703296703)) if id==7 & year==2000
assert !missing(sd) & abs(sd - (5.9575974211897726)) <= 1e-9 * max(1,abs(5.9575974211897726)) if id==7 & year==2000
assert !missing(skew) & abs(skew - (1.8322500403765247)) <= 1e-9 * max(1,abs(1.8322500403765247)) if id==7 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (13.050000000000001)) <= 1e-9 * max(1,abs(13.050000000000001)) if id==7 & year==2000
assert !missing(total) & abs(total - (52.200000000000003)) <= 1e-9 * max(1,abs(52.200000000000003)) if id==7 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==7 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==7 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2000
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2000
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==7 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.6416666666666657)) <= 1e-9 * max(1,abs(-3.6416666666666657)) if id==7 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.73887912465775485)) <= 1e-9 * max(1,abs(-0.73887912465775485)) if id==7 & year==2000
assert !missing(dev_total) & abs(dev_total - (-14.566666666666663)) <= 1e-9 * max(1,abs(-14.566666666666663)) if id==7 & year==2000
assert !missing(z_total) & abs(z_total - (-0.73887912465775485)) <= 1e-9 * max(1,abs(-0.73887912465775485)) if id==7 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.018772893772893706)) <= 1e-9 * max(1,abs(0.018772893772893706)) if id==7 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.22527812582758827)) <= 1e-9 * max(1,abs(0.22527812582758827)) if id==7 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (1.6666666666666665)) <= 1e-9 * max(1,abs(1.6666666666666665)) if id==7 & year==2000
assert !missing(z_dry) & abs(z_dry - (1.0910894511799618)) <= 1e-9 * max(1,abs(1.0910894511799618)) if id==7 & year==2000
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2001
assert !missing(mean) & abs(mean - (4.5307692307692307)) <= 1e-9 * max(1,abs(4.5307692307692307)) if id==7 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7 & year==2001
assert !missing(var) & abs(var - (50.967307692307692)) <= 1e-9 * max(1,abs(50.967307692307692)) if id==7 & year==2001
assert !missing(sd) & abs(sd - (7.1391391422431099)) <= 1e-9 * max(1,abs(7.1391391422431099)) if id==7 & year==2001
assert !missing(skew) & abs(skew - (1.4171859413540904)) <= 1e-9 * max(1,abs(1.4171859413540904)) if id==7 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (14.725)) <= 1e-9 * max(1,abs(14.725)) if id==7 & year==2001
assert !missing(total) & abs(total - (58.899999999999999)) <= 1e-9 * max(1,abs(58.899999999999999)) if id==7 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2001
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2001
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.9666666666666668)) <= 1e-9 * max(1,abs(-1.9666666666666668)) if id==7 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.3990285432934329)) <= 1e-9 * max(1,abs(-0.3990285432934329)) if id==7 & year==2001
assert !missing(dev_total) & abs(dev_total - (-7.8666666666666671)) <= 1e-9 * max(1,abs(-7.8666666666666671)) if id==7 & year==2001
assert !missing(z_total) & abs(z_total - (-0.3990285432934329)) <= 1e-9 * max(1,abs(-0.3990285432934329)) if id==7 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7 & year==2001
assert !missing(z_norain) & abs(z_norain - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.091117216117216127)) <= 1e-9 * max(1,abs(-0.091117216117216127)) if id==7 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0934230985290299)) <= 1e-9 * max(1,abs(-1.0934230985290299)) if id==7 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-1.3333333333333335)) <= 1e-9 * max(1,abs(-1.3333333333333335)) if id==7 & year==2001
assert !missing(z_dry) & abs(z_dry - (-0.87287156094396956)) <= 1e-9 * max(1,abs(-0.87287156094396956)) if id==7 & year==2001
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==7 & year==2002
assert !missing(mean) & abs(mean - (5.5750000000000002)) <= 1e-9 * max(1,abs(5.5750000000000002)) if id==7 & year==2002
assert !missing(median) & abs(median - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==7 & year==2002
assert !missing(var) & abs(var - (49.42733333333333)) <= 1e-9 * max(1,abs(49.42733333333333)) if id==7 & year==2002
assert !missing(sd) & abs(sd - (7.0304575479362175)) <= 1e-9 * max(1,abs(7.0304575479362175)) if id==7 & year==2002
assert !missing(skew) & abs(skew - (1.0668958405616675)) <= 1e-9 * max(1,abs(1.0668958405616675)) if id==7 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (22.300000000000001)) <= 1e-9 * max(1,abs(22.300000000000001)) if id==7 & year==2002
assert !missing(total) & abs(total - (89.200000000000003)) <= 1e-9 * max(1,abs(89.200000000000003)) if id==7 & year==2002
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==7 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==7 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.6083333333333343)) <= 1e-9 * max(1,abs(5.6083333333333343)) if id==7 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1379076679511881)) <= 1e-9 * max(1,abs(1.1379076679511881)) if id==7 & year==2002
assert !missing(dev_total) & abs(dev_total - (22.433333333333337)) <= 1e-9 * max(1,abs(22.433333333333337)) if id==7 & year==2002
assert !missing(z_total) & abs(z_total - (1.1379076679511881)) <= 1e-9 * max(1,abs(1.1379076679511881)) if id==7 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==7 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962529)) <= 1e-9 * max(1,abs(-0.57735026918962529)) if id==7 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.072344322344322309)) <= 1e-9 * max(1,abs(0.072344322344322309)) if id==7 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.86814497270144042)) <= 1e-9 * max(1,abs(0.86814497270144042)) if id==7 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2002
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2003
assert !missing(mean) & abs(mean - (3.6000000000000001)) <= 1e-9 * max(1,abs(3.6000000000000001)) if id==7 & year==2003
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==7 & year==2003
assert !missing(var) & abs(var - (36.983333333333334)) <= 1e-9 * max(1,abs(36.983333333333334)) if id==7 & year==2003
assert !missing(sd) & abs(sd - (6.0813923844242561)) <= 1e-9 * max(1,abs(6.0813923844242561)) if id==7 & year==2003
assert !missing(skew) & abs(skew - (1.9986642921122109)) <= 1e-9 * max(1,abs(1.9986642921122109)) if id==7 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (11.699999999999999)) <= 1e-9 * max(1,abs(11.699999999999999)) if id==7 & year==2003
assert !missing(total) & abs(total - (46.799999999999997)) <= 1e-9 * max(1,abs(46.799999999999997)) if id==7 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2003
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==7 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==7 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==7 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.9916666666666671)) <= 1e-9 * max(1,abs(-4.9916666666666671)) if id==7 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0127885484439252)) <= 1e-9 * max(1,abs(-1.0127885484439252)) if id==7 & year==2003
assert !missing(dev_total) & abs(dev_total - (-19.966666666666669)) <= 1e-9 * max(1,abs(-19.966666666666669)) if id==7 & year==2003
assert !missing(z_total) & abs(z_total - (-1.0127885484439252)) <= 1e-9 * max(1,abs(-1.0127885484439252)) if id==7 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==7 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==7 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==7 & year==2003
assert !missing(z_norain) & abs(z_norain - (1.1547005383792521)) <= 1e-9 * max(1,abs(1.1547005383792521)) if id==7 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.091117216117216127)) <= 1e-9 * max(1,abs(-0.091117216117216127)) if id==7 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0934230985290299)) <= 1e-9 * max(1,abs(-1.0934230985290299)) if id==7 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2003
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==7 & year==2004
assert !missing(mean) & abs(mean - (5.5615384615384613)) <= 1e-9 * max(1,abs(5.5615384615384613)) if id==7 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(var) & abs(var - (45.815897435897433)) <= 1e-9 * max(1,abs(45.815897435897433)) if id==7 & year==2004
assert !missing(sd) & abs(sd - (6.7687441550037502)) <= 1e-9 * max(1,abs(6.7687441550037502)) if id==7 & year==2004
assert !missing(skew) & abs(skew - (1.1821402275208197)) <= 1e-9 * max(1,abs(1.1821402275208197)) if id==7 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (18.074999999999999)) <= 1e-9 * max(1,abs(18.074999999999999)) if id==7 & year==2004
assert !missing(total) & abs(total - (72.299999999999997)) <= 1e-9 * max(1,abs(72.299999999999997)) if id==7 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==7 & year==2004
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==7 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==7 & year==2004
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==7 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==7 & year==2004
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==7 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.3833333333333329)) <= 1e-9 * max(1,abs(1.3833333333333329)) if id==7 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.28067261943521116)) <= 1e-9 * max(1,abs(0.28067261943521116)) if id==7 & year==2004
assert !missing(dev_total) & abs(dev_total - (5.5333333333333314)) <= 1e-9 * max(1,abs(5.5333333333333314)) if id==7 & year==2004
assert !missing(z_total) & abs(z_total - (0.28067261943521116)) <= 1e-9 * max(1,abs(0.28067261943521116)) if id==7 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==7 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==7 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==7 & year==2004
assert !missing(z_norain) & abs(z_norain - (-4.0414518843273797)) <= 1e-9 * max(1,abs(-4.0414518843273797)) if id==7 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1396520146520146)) <= 1e-9 * max(1,abs(0.1396520146520146)) if id==7 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.6758494726198692)) <= 1e-9 * max(1,abs(1.6758494726198692)) if id==7 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==7 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.21821789023599247)) <= 1e-9 * max(1,abs(-0.21821789023599247)) if id==7 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==8 & year==2000
assert !missing(mean) & abs(mean - (3.5)) <= 1e-9 * max(1,abs(3.5)) if id==8 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2000
assert !missing(var) & abs(var - (32.727142857142859)) <= 1e-9 * max(1,abs(32.727142857142859)) if id==8 & year==2000
assert !missing(sd) & abs(sd - (5.7207641847171828)) <= 1e-9 * max(1,abs(5.7207641847171828)) if id==8 & year==2000
assert !missing(skew) & abs(skew - (2.0459705163777095)) <= 1e-9 * max(1,abs(2.0459705163777095)) if id==8 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (13.125)) <= 1e-9 * max(1,abs(13.125)) if id==8 & year==2000
assert !missing(total) & abs(total - (52.5)) <= 1e-9 * max(1,abs(52.5)) if id==8 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==8 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==8 & year==2000
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.875)) <= 1e-9 * max(1,abs(-3.875)) if id==8 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.9210376979339665)) <= 1e-9 * max(1,abs(-0.9210376979339665)) if id==8 & year==2000
assert !missing(dev_total) & abs(dev_total - (-15.5)) <= 1e-9 * max(1,abs(-15.5)) if id==8 & year==2000
assert !missing(z_total) & abs(z_total - (-0.9210376979339665)) <= 1e-9 * max(1,abs(-0.9210376979339665)) if id==8 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.0045634920634920473)) <= 1e-9 * max(1,abs(-0.0045634920634920473)) if id==8 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.044411559168432584)) <= 1e-9 * max(1,abs(-0.044411559168432584)) if id==8 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2000
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==8 & year==2001
assert !missing(mean) & abs(mean - (6.1357142857142861)) <= 1e-9 * max(1,abs(6.1357142857142861)) if id==8 & year==2001
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(var) & abs(var - (53.108626373626372)) <= 1e-9 * max(1,abs(53.108626373626372)) if id==8 & year==2001
assert !missing(sd) & abs(sd - (7.287566560493727)) <= 1e-9 * max(1,abs(7.287566560493727)) if id==8 & year==2001
assert !missing(skew) & abs(skew - (0.92258914387871072)) <= 1e-9 * max(1,abs(0.92258914387871072)) if id==8 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (21.475000000000001)) <= 1e-9 * max(1,abs(21.475000000000001)) if id==8 & year==2001
assert !missing(total) & abs(total - (85.900000000000006)) <= 1e-9 * max(1,abs(85.900000000000006)) if id==8 & year==2001
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2001
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==8 & year==2001
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2001
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (4.4750000000000014)) <= 1e-9 * max(1,abs(4.4750000000000014)) if id==8 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.0636499866463229)) <= 1e-9 * max(1,abs(1.0636499866463229)) if id==8 & year==2001
assert !missing(dev_total) & abs(dev_total - (17.900000000000006)) <= 1e-9 * max(1,abs(17.900000000000006)) if id==8 & year==2001
assert !missing(z_total) & abs(z_total - (1.0636499866463229)) <= 1e-9 * max(1,abs(1.0636499866463229)) if id==8 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8 & year==2001
assert !missing(z_norain) & abs(z_norain - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.10496031746031753)) <= 1e-9 * max(1,abs(0.10496031746031753)) if id==8 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.0214658608739537)) <= 1e-9 * max(1,abs(1.0214658608739537)) if id==8 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==8 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==8 & year==2001
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==8 & year==2002
assert !missing(mean) & abs(mean - (4.0999999999999996)) <= 1e-9 * max(1,abs(4.0999999999999996)) if id==8 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==8 & year==2002
assert !missing(var) & abs(var - (43.454666666666668)) <= 1e-9 * max(1,abs(43.454666666666668)) if id==8 & year==2002
assert !missing(sd) & abs(sd - (6.5920153721503612)) <= 1e-9 * max(1,abs(6.5920153721503612)) if id==8 & year==2002
assert !missing(skew) & abs(skew - (1.5619219099198085)) <= 1e-9 * max(1,abs(1.5619219099198085)) if id==8 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (16.399999999999999)) <= 1e-9 * max(1,abs(16.399999999999999)) if id==8 & year==2002
assert !missing(total) & abs(total - (65.599999999999994)) <= 1e-9 * max(1,abs(65.599999999999994)) if id==8 & year==2002
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==8 & year==2002
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==8 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2002
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2002
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==8 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.60000000000000142)) <= 1e-9 * max(1,abs(-0.60000000000000142)) if id==8 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.14261228871235643)) <= 1e-9 * max(1,abs(-0.14261228871235643)) if id==8 & year==2002
assert !missing(dev_total) & abs(dev_total - (-2.4000000000000057)) <= 1e-9 * max(1,abs(-2.4000000000000057)) if id==8 & year==2002
assert !missing(z_total) & abs(z_total - (-0.14261228871235643)) <= 1e-9 * max(1,abs(-0.14261228871235643)) if id==8 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==8 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2002
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.10039682539682537)) <= 1e-9 * max(1,abs(-0.10039682539682537)) if id==8 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.9770543017055201)) <= 1e-9 * max(1,abs(-0.9770543017055201)) if id==8 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2002
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==8 & year==2003
assert !missing(mean) & abs(mean - (1.9199999999999999)) <= 1e-9 * max(1,abs(1.9199999999999999)) if id==8 & year==2003
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8 & year==2003
assert !missing(var) & abs(var - (19.204571428571427)) <= 1e-9 * max(1,abs(19.204571428571427)) if id==8 & year==2003
assert !missing(sd) & abs(sd - (4.3823020695259505)) <= 1e-9 * max(1,abs(4.3823020695259505)) if id==8 & year==2003
assert !missing(skew) & abs(skew - (3.3307804786234221)) <= 1e-9 * max(1,abs(3.3307804786234221)) if id==8 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (7.2000000000000002)) <= 1e-9 * max(1,abs(7.2000000000000002)) if id==8 & year==2003
assert !missing(total) & abs(total - (28.800000000000001)) <= 1e-9 * max(1,abs(28.800000000000001)) if id==8 & year==2003
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==8 & year==2003
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.40000000000000002)) <= 1e-9 * max(1,abs(0.40000000000000002)) if id==8 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==8 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-9.8000000000000007)) <= 1e-9 * max(1,abs(-9.8000000000000007)) if id==8 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.3293340489684833)) <= 1e-9 * max(1,abs(-2.3293340489684833)) if id==8 & year==2003
assert !missing(dev_total) & abs(dev_total - (-39.200000000000003)) <= 1e-9 * max(1,abs(-39.200000000000003)) if id==8 & year==2003
assert !missing(z_total) & abs(z_total - (-2.3293340489684833)) <= 1e-9 * max(1,abs(-2.3293340489684833)) if id==8 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==8 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2003
assert !missing(z_norain) & abs(z_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.13789682539682535)) <= 1e-9 * max(1,abs(-0.13789682539682535)) if id==8 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.3420014618287281)) <= 1e-9 * max(1,abs(-1.3420014618287281)) if id==8 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2003
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==8 & year==2004
assert !missing(mean) & abs(mean - (3.2071428571428573)) <= 1e-9 * max(1,abs(3.2071428571428573)) if id==8 & year==2004
assert !missing(median) & abs(median - (0.55000000000000004)) <= 1e-9 * max(1,abs(0.55000000000000004)) if id==8 & year==2004
assert !missing(var) & abs(var - (35.820714285714288)) <= 1e-9 * max(1,abs(35.820714285714288)) if id==8 & year==2004
assert !missing(sd) & abs(sd - (5.9850408758599372)) <= 1e-9 * max(1,abs(5.9850408758599372)) if id==8 & year==2004
assert !missing(skew) & abs(skew - (2.1009673449073625)) <= 1e-9 * max(1,abs(2.1009673449073625)) if id==8 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (11.225)) <= 1e-9 * max(1,abs(11.225)) if id==8 & year==2004
assert !missing(total) & abs(total - (44.899999999999999)) <= 1e-9 * max(1,abs(44.899999999999999)) if id==8 & year==2004
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==8 & year==2004
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.2857142857142857)) <= 1e-9 * max(1,abs(0.2857142857142857)) if id==8 & year==2004
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8 & year==2004
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==8 & year==2004
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==8 & year==2004
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.7750000000000004)) <= 1e-9 * max(1,abs(-5.7750000000000004)) if id==8 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.3726432788564276)) <= 1e-9 * max(1,abs(-1.3726432788564276)) if id==8 & year==2004
assert !missing(dev_total) & abs(dev_total - (-23.100000000000001)) <= 1e-9 * max(1,abs(-23.100000000000001)) if id==8 & year==2004
assert !missing(z_total) & abs(z_total - (-1.3726432788564276)) <= 1e-9 * max(1,abs(-1.3726432788564276)) if id==8 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-4)) <= 1e-9 * max(1,abs(-4)) if id==8 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-4)) <= 1e-9 * max(1,abs(-4)) if id==8 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8 & year==2004
assert !missing(z_norain) & abs(z_norain - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==8 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25218253968253967)) <= 1e-9 * max(1,abs(-0.25218253968253967)) if id==8 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-2.4542213783946965)) <= 1e-9 * max(1,abs(-2.4542213783946965)) if id==8 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8 & year==2004
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2000
assert !missing(mean) & abs(mean - (2.5142857142857142)) <= 1e-9 * max(1,abs(2.5142857142857142)) if id==9 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(var) & abs(var - (20.015164835164835)) <= 1e-9 * max(1,abs(20.015164835164835)) if id==9 & year==2000
assert !missing(sd) & abs(sd - (4.4738311138402214)) <= 1e-9 * max(1,abs(4.4738311138402214)) if id==9 & year==2000
assert !missing(skew) & abs(skew - (2.9979745415516375)) <= 1e-9 * max(1,abs(2.9979745415516375)) if id==9 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (8.8000000000000007)) <= 1e-9 * max(1,abs(8.8000000000000007)) if id==9 & year==2000
assert !missing(total) & abs(total - (35.200000000000003)) <= 1e-9 * max(1,abs(35.200000000000003)) if id==9 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5714285714285714)) <= 1e-9 * max(1,abs(0.5714285714285714)) if id==9 & year==2000
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2000
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.1166666666666654)) <= 1e-9 * max(1,abs(-3.1166666666666654)) if id==9 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.68352500646255132)) <= 1e-9 * max(1,abs(-0.68352500646255132)) if id==9 & year==2000
assert !missing(dev_total) & abs(dev_total - (-12.466666666666661)) <= 1e-9 * max(1,abs(-12.466666666666661)) if id==9 & year==2000
assert !missing(z_total) & abs(z_total - (-0.68352500646255132)) <= 1e-9 * max(1,abs(-0.68352500646255132)) if id==9 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333393)) <= 1e-9 * max(1,abs(-0.33333333333333393)) if id==9 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.13245323570650464)) <= 1e-9 * max(1,abs(-0.13245323570650464)) if id==9 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.022408963585434094)) <= 1e-9 * max(1,abs(0.022408963585434094)) if id==9 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.20196611671473075)) <= 1e-9 * max(1,abs(0.20196611671473075)) if id==9 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2000
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2001
assert !missing(mean) & abs(mean - (2.7999999999999998)) <= 1e-9 * max(1,abs(2.7999999999999998)) if id==9 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==9 & year==2001
assert !missing(var) & abs(var - (20.199999999999999)) <= 1e-9 * max(1,abs(20.199999999999999)) if id==9 & year==2001
assert !missing(sd) & abs(sd - (4.4944410108488464)) <= 1e-9 * max(1,abs(4.4944410108488464)) if id==9 & year==2001
assert !missing(skew) & abs(skew - (2.7547222793893016)) <= 1e-9 * max(1,abs(2.7547222793893016)) if id==9 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9.8000000000000007)) <= 1e-9 * max(1,abs(9.8000000000000007)) if id==9 & year==2001
assert !missing(total) & abs(total - (39.200000000000003)) <= 1e-9 * max(1,abs(39.200000000000003)) if id==9 & year==2001
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2001
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.42857142857142855)) <= 1e-9 * max(1,abs(0.42857142857142855)) if id==9 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2001
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==9 & year==2001
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==9 & year==2001
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.1166666666666654)) <= 1e-9 * max(1,abs(-2.1166666666666654)) if id==9 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.46421217016440641)) <= 1e-9 * max(1,abs(-0.46421217016440641)) if id==9 & year==2001
assert !missing(dev_total) & abs(dev_total - (-8.4666666666666615)) <= 1e-9 * max(1,abs(-8.4666666666666615)) if id==9 & year==2001
assert !missing(z_total) & abs(z_total - (-0.46421217016440641)) <= 1e-9 * max(1,abs(-0.46421217016440641)) if id==9 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (-2.3333333333333339)) <= 1e-9 * max(1,abs(-2.3333333333333339)) if id==9 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (-0.92717264994553095)) <= 1e-9 * max(1,abs(-0.92717264994553095)) if id==9 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==9 & year==2001
assert !missing(z_norain) & abs(z_norain - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==9 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.12044817927170876)) <= 1e-9 * max(1,abs(-0.12044817927170876)) if id==9 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0855678773416824)) <= 1e-9 * max(1,abs(-1.0855678773416824)) if id==9 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(z_dry) & abs(z_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2001
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==9 & year==2002
assert !missing(mean) & abs(mean - (4.0352941176470587)) <= 1e-9 * max(1,abs(4.0352941176470587)) if id==9 & year==2002
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(var) & abs(var - (39.831176470588233)) <= 1e-9 * max(1,abs(39.831176470588233)) if id==9 & year==2002
assert !missing(sd) & abs(sd - (6.311194535948661)) <= 1e-9 * max(1,abs(6.311194535948661)) if id==9 & year==2002
assert !missing(skew) & abs(skew - (1.7114765050354401)) <= 1e-9 * max(1,abs(1.7114765050354401)) if id==9 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (17.149999999999999)) <= 1e-9 * max(1,abs(17.149999999999999)) if id==9 & year==2002
assert !missing(total) & abs(total - (68.599999999999994)) <= 1e-9 * max(1,abs(68.599999999999994)) if id==9 & year==2002
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2002
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.6470588235294118)) <= 1e-9 * max(1,abs(0.6470588235294118)) if id==9 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2002
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==9 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2002
assert !missing(cut03) & abs(cut03 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.2333333333333325)) <= 1e-9 * max(1,abs(5.2333333333333325)) if id==9 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1477371766269582)) <= 1e-9 * max(1,abs(1.1477371766269582)) if id==9 & year==2002
assert !missing(dev_total) & abs(dev_total - (20.93333333333333)) <= 1e-9 * max(1,abs(20.93333333333333)) if id==9 & year==2002
assert !missing(z_total) & abs(z_total - (1.1477371766269582)) <= 1e-9 * max(1,abs(1.1477371766269582)) if id==9 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==9 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (1.0596258856520349)) <= 1e-9 * max(1,abs(1.0596258856520349)) if id==9 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==9 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==9 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.098039215686274495)) <= 1e-9 * max(1,abs(0.098039215686274495)) if id==9 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.88360176062695006)) <= 1e-9 * max(1,abs(0.88360176062695006)) if id==9 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert !missing(z_dry) & abs(z_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==9 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==9 & year==2003
assert !missing(mean) & abs(mean - (4.2437500000000004)) <= 1e-9 * max(1,abs(4.2437500000000004)) if id==9 & year==2003
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(var) & abs(var - (28.487958333333335)) <= 1e-9 * max(1,abs(28.487958333333335)) if id==9 & year==2003
assert !missing(sd) & abs(sd - (5.337411201447134)) <= 1e-9 * max(1,abs(5.337411201447134)) if id==9 & year==2003
assert !missing(skew) & abs(skew - (1.9081428516968335)) <= 1e-9 * max(1,abs(1.9081428516968335)) if id==9 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (16.975000000000001)) <= 1e-9 * max(1,abs(16.975000000000001)) if id==9 & year==2003
assert !missing(total) & abs(total - (67.900000000000006)) <= 1e-9 * max(1,abs(67.900000000000006)) if id==9 & year==2003
assert !missing(raindays) & abs(raindays - (11)) <= 1e-9 * max(1,abs(11)) if id==9 & year==2003
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.6875)) <= 1e-9 * max(1,abs(0.6875)) if id==9 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2003
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2003
assert !missing(cut04) & abs(cut04 - (7)) <= 1e-9 * max(1,abs(7)) if id==9 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.0583333333333353)) <= 1e-9 * max(1,abs(5.0583333333333353)) if id==9 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1093574302747835)) <= 1e-9 * max(1,abs(1.1093574302747835)) if id==9 & year==2003
assert !missing(dev_total) & abs(dev_total - (20.233333333333341)) <= 1e-9 * max(1,abs(20.233333333333341)) if id==9 & year==2003
assert !missing(z_total) & abs(z_total - (1.1093574302747835)) <= 1e-9 * max(1,abs(1.1093574302747835)) if id==9 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2.6666666666666661)) <= 1e-9 * max(1,abs(2.6666666666666661)) if id==9 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (1.0596258856520349)) <= 1e-9 * max(1,abs(1.0596258856520349)) if id==9 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==9 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1384803921568627)) <= 1e-9 * max(1,abs(0.1384803921568627)) if id==9 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.2480874868855667)) <= 1e-9 * max(1,abs(1.2480874868855667)) if id==9 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2003
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9 & year==2004
assert !missing(mean) & abs(mean - (3.8642857142857143)) <= 1e-9 * max(1,abs(3.8642857142857143)) if id==9 & year==2004
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(var) & abs(var - (33.599395604395603)) <= 1e-9 * max(1,abs(33.599395604395603)) if id==9 & year==2004
assert !missing(sd) & abs(sd - (5.7964985641674751)) <= 1e-9 * max(1,abs(5.7964985641674751)) if id==9 & year==2004
assert !missing(skew) & abs(skew - (1.9529385935308152)) <= 1e-9 * max(1,abs(1.9529385935308152)) if id==9 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (13.525)) <= 1e-9 * max(1,abs(13.525)) if id==9 & year==2004
assert !missing(total) & abs(total - (54.100000000000001)) <= 1e-9 * max(1,abs(54.100000000000001)) if id==9 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==9 & year==2004
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==9 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9 & year==2004
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9 & year==2004
assert !missing(cut03) & abs(cut03 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.6083333333333343)) <= 1e-9 * max(1,abs(1.6083333333333343)) if id==9 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9 & year==2004
assert !missing(dev_total) & abs(dev_total - (6.4333333333333371)) <= 1e-9 * max(1,abs(6.4333333333333371)) if id==9 & year==2004
assert !missing(z_total) & abs(z_total - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==9 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.26490647141300855)) <= 1e-9 * max(1,abs(0.26490647141300855)) if id==9 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9 & year==2004
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==9 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.093837535014005602)) <= 1e-9 * max(1,abs(0.093837535014005602)) if id==9 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.84573311374293803)) <= 1e-9 * max(1,abs(0.84573311374293803)) if id==9 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9 & year==2004
assert !missing(nobs) & abs(nobs - (12)) <= 1e-9 * max(1,abs(12)) if id==10 & year==2000
assert !missing(mean) & abs(mean - (2.5083333333333333)) <= 1e-9 * max(1,abs(2.5083333333333333)) if id==10 & year==2000
assert !missing(median) & abs(median - (0.94999999999999996)) <= 1e-9 * max(1,abs(0.94999999999999996)) if id==10 & year==2000
assert !missing(var) & abs(var - (22.940833333333334)) <= 1e-9 * max(1,abs(22.940833333333334)) if id==10 & year==2000
assert !missing(sd) & abs(sd - (4.7896589996922883)) <= 1e-9 * max(1,abs(4.7896589996922883)) if id==10 & year==2000
assert !missing(skew) & abs(skew - (2.9540936586989566)) <= 1e-9 * max(1,abs(2.9540936586989566)) if id==10 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (7.5250000000000004)) <= 1e-9 * max(1,abs(7.5250000000000004)) if id==10 & year==2000
assert !missing(total) & abs(total - (30.100000000000001)) <= 1e-9 * max(1,abs(30.100000000000001)) if id==10 & year==2000
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2000
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2000
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.2083333333333339)) <= 1e-9 * max(1,abs(-1.2083333333333339)) if id==10 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.19179843842333633)) <= 1e-9 * max(1,abs(-0.19179843842333633)) if id==10 & year==2000
assert !missing(dev_total) & abs(dev_total - (-4.8333333333333357)) <= 1e-9 * max(1,abs(-4.8333333333333357)) if id==10 & year==2000
assert !missing(z_total) & abs(z_total - (-0.19179843842333633)) <= 1e-9 * max(1,abs(-0.19179843842333633)) if id==10 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==10 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.013888888888888895)) <= 1e-9 * max(1,abs(0.013888888888888895)) if id==10 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.09491579957524994)) <= 1e-9 * max(1,abs(0.09491579957524994)) if id==10 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2000
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==10 & year==2001
assert !missing(mean) & abs(mean - (3.8875000000000002)) <= 1e-9 * max(1,abs(3.8875000000000002)) if id==10 & year==2001
assert !missing(median) & abs(median - (1.5)) <= 1e-9 * max(1,abs(1.5)) if id==10 & year==2001
assert !missing(var) & abs(var - (29.859833333333334)) <= 1e-9 * max(1,abs(29.859833333333334)) if id==10 & year==2001
assert !missing(sd) & abs(sd - (5.4644151867636612)) <= 1e-9 * max(1,abs(5.4644151867636612)) if id==10 & year==2001
assert !missing(skew) & abs(skew - (1.9527171276650597)) <= 1e-9 * max(1,abs(1.9527171276650597)) if id==10 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (15.550000000000001)) <= 1e-9 * max(1,abs(15.550000000000001)) if id==10 & year==2001
assert !missing(total) & abs(total - (62.200000000000003)) <= 1e-9 * max(1,abs(62.200000000000003)) if id==10 & year==2001
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2001
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==10 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2001
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2001
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==10 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (6.8166666666666664)) <= 1e-9 * max(1,abs(6.8166666666666664)) if id==10 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.0820077422778553)) <= 1e-9 * max(1,abs(1.0820077422778553)) if id==10 & year==2001
assert !missing(dev_total) & abs(dev_total - (27.266666666666666)) <= 1e-9 * max(1,abs(27.266666666666666)) if id==10 & year==2001
assert !missing(z_total) & abs(z_total - (1.0820077422778553)) <= 1e-9 * max(1,abs(1.0820077422778553)) if id==10 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1.1338934190276817)) <= 1e-9 * max(1,abs(1.1338934190276817)) if id==10 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==10 & year==2001
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==10 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1388888888888889)) <= 1e-9 * max(1,abs(0.1388888888888889)) if id==10 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.94915799575249904)) <= 1e-9 * max(1,abs(0.94915799575249904)) if id==10 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2001
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==10 & year==2002
assert !missing(mean) & abs(mean - (0.83333333333333337)) <= 1e-9 * max(1,abs(0.83333333333333337)) if id==10 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2002
assert !missing(var) & abs(var - (1.5123809523809524)) <= 1e-9 * max(1,abs(1.5123809523809524)) if id==10 & year==2002
assert !missing(sd) & abs(sd - (1.2297889869326983)) <= 1e-9 * max(1,abs(1.2297889869326983)) if id==10 & year==2002
assert !missing(skew) & abs(skew - (3.0843894119332429)) <= 1e-9 * max(1,abs(3.0843894119332429)) if id==10 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (3.125)) <= 1e-9 * max(1,abs(3.125)) if id==10 & year==2002
assert !missing(total) & abs(total - (12.5)) <= 1e-9 * max(1,abs(12.5)) if id==10 & year==2002
assert !missing(raindays) & abs(raindays - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2002
assert !missing(norain) & abs(norain - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==10 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut01) & abs(cut01 - (10)) <= 1e-9 * max(1,abs(10)) if id==10 & year==2002
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2002
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.6083333333333343)) <= 1e-9 * max(1,abs(-5.6083333333333343)) if id==10 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.89020930385451924)) <= 1e-9 * max(1,abs(-0.89020930385451924)) if id==10 & year==2002
assert !missing(dev_total) & abs(dev_total - (-22.433333333333337)) <= 1e-9 * max(1,abs(-22.433333333333337)) if id==10 & year==2002
assert !missing(z_total) & abs(z_total - (-0.89020930385451924)) <= 1e-9 * max(1,abs(-0.89020930385451924)) if id==10 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==10 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==10 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==10 & year==2002
assert !missing(z_norain) & abs(z_norain - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==10 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.15277777777777779)) <= 1e-9 * max(1,abs(-0.15277777777777779)) if id==10 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.044073795327749)) <= 1e-9 * max(1,abs(-1.044073795327749)) if id==10 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(z_dry) & abs(z_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2002
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==10 & year==2003
assert !missing(mean) & abs(mean - (5.0538461538461537)) <= 1e-9 * max(1,abs(5.0538461538461537)) if id==10 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(var) & abs(var - (47.782692307692308)) <= 1e-9 * max(1,abs(47.782692307692308)) if id==10 & year==2003
assert !missing(sd) & abs(sd - (6.9125026081508505)) <= 1e-9 * max(1,abs(6.9125026081508505)) if id==10 & year==2003
assert !missing(skew) & abs(skew - (1.3458217207294318)) <= 1e-9 * max(1,abs(1.3458217207294318)) if id==10 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (16.425000000000001)) <= 1e-9 * max(1,abs(16.425000000000001)) if id==10 & year==2003
assert !missing(total) & abs(total - (65.700000000000003)) <= 1e-9 * max(1,abs(65.700000000000003)) if id==10 & year==2003
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2003
assert !missing(norain) & abs(norain - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.69230769230769229)) <= 1e-9 * max(1,abs(0.69230769230769229)) if id==10 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2003
assert !missing(cut01) & abs(cut01 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==10 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (7.6916666666666664)) <= 1e-9 * max(1,abs(7.6916666666666664)) if id==10 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.2208962666533747)) <= 1e-9 * max(1,abs(1.2208962666533747)) if id==10 & year==2003
assert !missing(dev_total) & abs(dev_total - (30.766666666666666)) <= 1e-9 * max(1,abs(30.766666666666666)) if id==10 & year==2003
assert !missing(z_total) & abs(z_total - (1.2208962666533747)) <= 1e-9 * max(1,abs(1.2208962666533747)) if id==10 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.7559289460184544)) <= 1e-9 * max(1,abs(0.7559289460184544)) if id==10 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-3.333333333333333)) <= 1e-9 * max(1,abs(-3.333333333333333)) if id==10 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740643)) <= 1e-9 * max(1,abs(-1.4433756729740643)) if id==10 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.20619658119658119)) <= 1e-9 * max(1,abs(0.20619658119658119)) if id==10 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.4091345629248637)) <= 1e-9 * max(1,abs(1.4091345629248637)) if id==10 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2003
assert !missing(z_dry) & abs(z_dry - (-1)) <= 1e-9 * max(1,abs(-1)) if id==10 & year==2003
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==10 & year==2004
assert !missing(mean) & abs(mean - (4.0411764705882351)) <= 1e-9 * max(1,abs(4.0411764705882351)) if id==10 & year==2004
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==10 & year==2004
assert !missing(var) & abs(var - (40.500073529411765)) <= 1e-9 * max(1,abs(40.500073529411765)) if id==10 & year==2004
assert !missing(sd) & abs(sd - (6.363966807692492)) <= 1e-9 * max(1,abs(6.363966807692492)) if id==10 & year==2004
assert !missing(skew) & abs(skew - (1.6553223848340348)) <= 1e-9 * max(1,abs(1.6553223848340348)) if id==10 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (22.900000000000002)) <= 1e-9 * max(1,abs(22.900000000000002)) if id==10 & year==2004
assert !missing(total) & abs(total - (68.700000000000003)) <= 1e-9 * max(1,abs(68.700000000000003)) if id==10 & year==2004
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==10 & year==2004
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.47058823529411764)) <= 1e-9 * max(1,abs(0.47058823529411764)) if id==10 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==10 & year==2004
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==10 & year==2004
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==10 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==10 & year==2004
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(cut04) & abs(cut04 - (5)) <= 1e-9 * max(1,abs(5)) if id==10 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.166666666666668)) <= 1e-9 * max(1,abs(14.166666666666668)) if id==10 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (2.2486713470322179)) <= 1e-9 * max(1,abs(2.2486713470322179)) if id==10 & year==2004
assert !missing(dev_total) & abs(dev_total - (33.766666666666666)) <= 1e-9 * max(1,abs(33.766666666666666)) if id==10 & year==2004
assert !missing(z_total) & abs(z_total - (1.3399435732609626)) <= 1e-9 * max(1,abs(1.3399435732609626)) if id==10 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0.3779644730092272)) <= 1e-9 * max(1,abs(0.3779644730092272)) if id==10 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==10 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.72168783648703239)) <= 1e-9 * max(1,abs(0.72168783648703239)) if id==10 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.015522875816993464)) <= 1e-9 * max(1,abs(-0.015522875816993464)) if id==10 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.10608236423116166)) <= 1e-9 * max(1,abs(-0.10608236423116166)) if id==10 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(z_dry) & abs(z_dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2000
assert !missing(mean) & abs(mean - (2.7066666666666666)) <= 1e-9 * max(1,abs(2.7066666666666666)) if id==11 & year==2000
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==11 & year==2000
assert !missing(var) & abs(var - (19.134952380952381)) <= 1e-9 * max(1,abs(19.134952380952381)) if id==11 & year==2000
assert !missing(sd) & abs(sd - (4.3743516526397803)) <= 1e-9 * max(1,abs(4.3743516526397803)) if id==11 & year==2000
assert !missing(skew) & abs(skew - (2.7971651436801928)) <= 1e-9 * max(1,abs(2.7971651436801928)) if id==11 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (10.15)) <= 1e-9 * max(1,abs(10.15)) if id==11 & year==2000
assert !missing(total) & abs(total - (40.600000000000001)) <= 1e-9 * max(1,abs(40.600000000000001)) if id==11 & year==2000
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2000
assert !missing(norain) & abs(norain - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.46666666666666667)) <= 1e-9 * max(1,abs(0.46666666666666667)) if id==11 & year==2000
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2000
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(cut01) & abs(cut01 - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2000
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2000
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2000
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==11 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-5.3000000000000007)) <= 1e-9 * max(1,abs(-5.3000000000000007)) if id==11 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.0232594587192219)) <= 1e-9 * max(1,abs(-1.0232594587192219)) if id==11 & year==2000
assert !missing(dev_total) & abs(dev_total - (-15.966666666666669)) <= 1e-9 * max(1,abs(-15.966666666666669)) if id==11 & year==2000
assert !missing(z_total) & abs(z_total - (-0.71713899630696654)) <= 1e-9 * max(1,abs(-0.71713899630696654)) if id==11 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==11 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (-0.7559289460184544)) <= 1e-9 * max(1,abs(-0.7559289460184544)) if id==11 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (2.666666666666667)) <= 1e-9 * max(1,abs(2.666666666666667)) if id==11 & year==2000
assert !missing(z_norain) & abs(z_norain - (1.0596258856520353)) <= 1e-9 * max(1,abs(1.0596258856520353)) if id==11 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.16068376068376067)) <= 1e-9 * max(1,abs(-0.16068376068376067)) if id==11 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.96224439864325428)) <= 1e-9 * max(1,abs(-0.96224439864325428)) if id==11 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11 & year==2000
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11 & year==2000
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2001
assert !missing(mean) & abs(mean - (5.4666666666666668)) <= 1e-9 * max(1,abs(5.4666666666666668)) if id==11 & year==2001
assert !missing(median) & abs(median - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2001
assert !missing(var) & abs(var - (39.55238095238095)) <= 1e-9 * max(1,abs(39.55238095238095)) if id==11 & year==2001
assert !missing(sd) & abs(sd - (6.2890683691927656)) <= 1e-9 * max(1,abs(6.2890683691927656)) if id==11 & year==2001
assert !missing(skew) & abs(skew - (1.2757034417289985)) <= 1e-9 * max(1,abs(1.2757034417289985)) if id==11 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (20.5)) <= 1e-9 * max(1,abs(20.5)) if id==11 & year==2001
assert !missing(total) & abs(total - (82)) <= 1e-9 * max(1,abs(82)) if id==11 & year==2001
assert !missing(raindays) & abs(raindays - (12)) <= 1e-9 * max(1,abs(12)) if id==11 & year==2001
assert !missing(norain) & abs(norain - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.80000000000000004)) <= 1e-9 * max(1,abs(0.80000000000000004)) if id==11 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2001
assert !missing(cut01) & abs(cut01 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2001
assert !missing(cut04) & abs(cut04 - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.0499999999999989)) <= 1e-9 * max(1,abs(5.0499999999999989)) if id==11 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.97499250311925811)) <= 1e-9 * max(1,abs(0.97499250311925811)) if id==11 & year==2001
assert !missing(dev_total) & abs(dev_total - (25.43333333333333)) <= 1e-9 * max(1,abs(25.43333333333333)) if id==11 & year==2001
assert !missing(z_total) & abs(z_total - (1.1423320546601572)) <= 1e-9 * max(1,abs(1.1423320546601572)) if id==11 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (1.1338934190276817)) <= 1e-9 * max(1,abs(1.1338934190276817)) if id==11 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (-2.333333333333333)) <= 1e-9 * max(1,abs(-2.333333333333333)) if id==11 & year==2001
assert !missing(z_norain) & abs(z_norain - (-0.92717264994553061)) <= 1e-9 * max(1,abs(-0.92717264994553061)) if id==11 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.1726495726495727)) <= 1e-9 * max(1,abs(0.1726495726495727)) if id==11 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.0339008964145608)) <= 1e-9 * max(1,abs(1.0339008964145608)) if id==11 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==11 & year==2001
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==11 & year==2001
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==11 & year==2002
assert !missing(mean) & abs(mean - (3.6230769230769231)) <= 1e-9 * max(1,abs(3.6230769230769231)) if id==11 & year==2002
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2002
assert !missing(var) & abs(var - (37.016923076923078)) <= 1e-9 * max(1,abs(37.016923076923078)) if id==11 & year==2002
assert !missing(sd) & abs(sd - (6.0841534396268377)) <= 1e-9 * max(1,abs(6.0841534396268377)) if id==11 & year==2002
assert !missing(skew) & abs(skew - (1.9784390504014764)) <= 1e-9 * max(1,abs(1.9784390504014764)) if id==11 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (15.700000000000001)) <= 1e-9 * max(1,abs(15.700000000000001)) if id==11 & year==2002
assert !missing(total) & abs(total - (47.100000000000001)) <= 1e-9 * max(1,abs(47.100000000000001)) if id==11 & year==2002
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==11 & year==2002
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.61538461538461542)) <= 1e-9 * max(1,abs(0.61538461538461542)) if id==11 & year==2002
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2002
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2002
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2002
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (0.25)) <= 1e-9 * max(1,abs(0.25)) if id==11 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.048266955599963281)) <= 1e-9 * max(1,abs(0.048266955599963281)) if id==11 & year==2002
assert !missing(dev_total) & abs(dev_total - (-9.4666666666666686)) <= 1e-9 * max(1,abs(-9.4666666666666686)) if id==11 & year==2002
assert !missing(z_total) & abs(z_total - (-0.42519305835319104)) <= 1e-9 * max(1,abs(-0.42519305835319104)) if id==11 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==11 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-0.3779644730092272)) <= 1e-9 * max(1,abs(-0.3779644730092272)) if id==11 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.33333333333333304)) <= 1e-9 * max(1,abs(-0.33333333333333304)) if id==11 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.13245323570650427)) <= 1e-9 * max(1,abs(-0.13245323570650427)) if id==11 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.011965811965811923)) <= 1e-9 * max(1,abs(-0.011965811965811923)) if id==11 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.071656497771305921)) <= 1e-9 * max(1,abs(-0.071656497771305921)) if id==11 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11 & year==2002
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11 & year==2002
assert !missing(nobs) & abs(nobs - (17)) <= 1e-9 * max(1,abs(17)) if id==11 & year==2003
assert !missing(mean) & abs(mean - (3.0352941176470587)) <= 1e-9 * max(1,abs(3.0352941176470587)) if id==11 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(var) & abs(var - (28.913676470588236)) <= 1e-9 * max(1,abs(28.913676470588236)) if id==11 & year==2003
assert !missing(sd) & abs(sd - (5.3771438952838366)) <= 1e-9 * max(1,abs(5.3771438952838366)) if id==11 & year==2003
assert !missing(skew) & abs(skew - (2.4087388708912201)) <= 1e-9 * max(1,abs(2.4087388708912201)) if id==11 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (12.9)) <= 1e-9 * max(1,abs(12.9)) if id==11 & year==2003
assert !missing(total) & abs(total - (51.600000000000001)) <= 1e-9 * max(1,abs(51.600000000000001)) if id==11 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==11 & year==2003
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.58823529411764708)) <= 1e-9 * max(1,abs(0.58823529411764708)) if id==11 & year==2003
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2003
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==11 & year==2003
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2003
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2003
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==11 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-2.5500000000000007)) <= 1e-9 * max(1,abs(-2.5500000000000007)) if id==11 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.49232294711962565)) <= 1e-9 * max(1,abs(-0.49232294711962565)) if id==11 & year==2003
assert !missing(dev_total) & abs(dev_total - (-4.9666666666666686)) <= 1e-9 * max(1,abs(-4.9666666666666686)) if id==11 & year==2003
assert !missing(z_total) & abs(z_total - (-0.22307663976980802)) <= 1e-9 * max(1,abs(-0.22307663976980802)) if id==11 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (0.3779644730092272)) <= 1e-9 * max(1,abs(0.3779644730092272)) if id==11 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (1.666666666666667)) <= 1e-9 * max(1,abs(1.666666666666667)) if id==11 & year==2003
assert !missing(z_norain) & abs(z_norain - (0.66226617853252201)) <= 1e-9 * max(1,abs(0.66226617853252201)) if id==11 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.039115133232780264)) <= 1e-9 * max(1,abs(-0.039115133232780264)) if id==11 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.23423846750452171)) <= 1e-9 * max(1,abs(-0.23423846750452171)) if id==11 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11 & year==2003
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11 & year==2003
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==11 & year==2004
assert !missing(mean) & abs(mean - (1.5666666666666667)) <= 1e-9 * max(1,abs(1.5666666666666667)) if id==11 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(var) & abs(var - (2.1595238095238094)) <= 1e-9 * max(1,abs(2.1595238095238094)) if id==11 & year==2004
assert !missing(sd) & abs(sd - (1.4695318334503031)) <= 1e-9 * max(1,abs(1.4695318334503031)) if id==11 & year==2004
assert !missing(skew) & abs(skew - (1.9443939629851632)) <= 1e-9 * max(1,abs(1.9443939629851632)) if id==11 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (7.833333333333333)) <= 1e-9 * max(1,abs(7.833333333333333)) if id==11 & year==2004
assert !missing(total) & abs(total - (23.5)) <= 1e-9 * max(1,abs(23.5)) if id==11 & year==2004
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==11 & year==2004
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.59999999999999998)) <= 1e-9 * max(1,abs(0.59999999999999998)) if id==11 & year==2004
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==11 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==11 & year==2004
assert !missing(cut02) & abs(cut02 - (5)) <= 1e-9 * max(1,abs(5)) if id==11 & year==2004
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==11 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-7.616666666666668)) <= 1e-9 * max(1,abs(-7.616666666666668)) if id==11 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (-1.4705332472788817)) <= 1e-9 * max(1,abs(-1.4705332472788817)) if id==11 & year==2004
assert !missing(dev_total) & abs(dev_total - (-33.06666666666667)) <= 1e-9 * max(1,abs(-33.06666666666667)) if id==11 & year==2004
assert !missing(z_total) & abs(z_total - (-1.4851813869238222)) <= 1e-9 * max(1,abs(-1.4851813869238222)) if id==11 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==11 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (0.66666666666666696)) <= 1e-9 * max(1,abs(0.66666666666666696)) if id==11 & year==2004
assert !missing(z_norain) & abs(z_norain - (0.26490647141300888)) <= 1e-9 * max(1,abs(0.26490647141300888)) if id==11 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.027350427350427364)) <= 1e-9 * max(1,abs(-0.027350427350427364)) if id==11 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.16378628062012848)) <= 1e-9 * max(1,abs(-0.16378628062012848)) if id==11 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==11 & year==2004
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==11 & year==2004
assert !missing(nobs) & abs(nobs - (15)) <= 1e-9 * max(1,abs(15)) if id==12 & year==2000
assert !missing(mean) & abs(mean - (3.0866666666666669)) <= 1e-9 * max(1,abs(3.0866666666666669)) if id==12 & year==2000
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(var) & abs(var - (33.498380952380955)) <= 1e-9 * max(1,abs(33.498380952380955)) if id==12 & year==2000
assert !missing(sd) & abs(sd - (5.7877785852934069)) <= 1e-9 * max(1,abs(5.7877785852934069)) if id==12 & year==2000
assert !missing(skew) & abs(skew - (2.2019364321357879)) <= 1e-9 * max(1,abs(2.2019364321357879)) if id==12 & year==2000
assert !missing(mean_mo) & abs(mean_mo - (11.574999999999999)) <= 1e-9 * max(1,abs(11.574999999999999)) if id==12 & year==2000
assert !missing(total) & abs(total - (46.299999999999997)) <= 1e-9 * max(1,abs(46.299999999999997)) if id==12 & year==2000
assert !missing(raindays) & abs(raindays - (8)) <= 1e-9 * max(1,abs(8)) if id==12 & year==2000
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2000
assert !missing(pct_raindays) & abs(pct_raindays - (0.53333333333333333)) <= 1e-9 * max(1,abs(0.53333333333333333)) if id==12 & year==2000
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2000
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2000
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2000
assert !missing(cut02) & abs(cut02 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2000
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(cut04) & abs(cut04 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2000
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.5250000000000004)) <= 1e-9 * max(1,abs(1.5250000000000004)) if id==12 & year==2000
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.1542353397281102)) <= 1e-9 * max(1,abs(1.1542353397281102)) if id==12 & year==2000
assert !missing(dev_total) & abs(dev_total - (6.1000000000000014)) <= 1e-9 * max(1,abs(6.1000000000000014)) if id==12 & year==2000
assert !missing(z_total) & abs(z_total - (1.1542353397281102)) <= 1e-9 * max(1,abs(1.1542353397281102)) if id==12 & year==2000
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(z_raindays) & abs(z_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2000
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==12 & year==2000
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12 & year==2000
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.055876068376068344)) <= 1e-9 * max(1,abs(0.055876068376068344)) if id==12 & year==2000
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.1206493928451402)) <= 1e-9 * max(1,abs(1.1206493928451402)) if id==12 & year==2000
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12 & year==2000
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12 & year==2000
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==12 & year==2001
assert !missing(mean) & abs(mean - (2.3125)) <= 1e-9 * max(1,abs(2.3125)) if id==12 & year==2001
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12 & year==2001
assert !missing(var) & abs(var - (18.873166666666666)) <= 1e-9 * max(1,abs(18.873166666666666)) if id==12 & year==2001
assert !missing(sd) & abs(sd - (4.3443258011648558)) <= 1e-9 * max(1,abs(4.3443258011648558)) if id==12 & year==2001
assert !missing(skew) & abs(skew - (2.9091292854797488)) <= 1e-9 * max(1,abs(2.9091292854797488)) if id==12 & year==2001
assert !missing(mean_mo) & abs(mean_mo - (9.25)) <= 1e-9 * max(1,abs(9.25)) if id==12 & year==2001
assert !missing(total) & abs(total - (37)) <= 1e-9 * max(1,abs(37)) if id==12 & year==2001
assert !missing(raindays) & abs(raindays - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2001
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2001
assert !missing(pct_raindays) & abs(pct_raindays - (0.4375)) <= 1e-9 * max(1,abs(0.4375)) if id==12 & year==2001
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(dry) & abs(dry - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==12 & year==2001
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2001
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2001
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.79999999999999893)) <= 1e-9 * max(1,abs(-0.79999999999999893)) if id==12 & year==2001
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.60550050608687644)) <= 1e-9 * max(1,abs(-0.60550050608687644)) if id==12 & year==2001
assert !missing(dev_total) & abs(dev_total - (-3.1999999999999957)) <= 1e-9 * max(1,abs(-3.1999999999999957)) if id==12 & year==2001
assert !missing(z_total) & abs(z_total - (-0.60550050608687644)) <= 1e-9 * max(1,abs(-0.60550050608687644)) if id==12 & year==2001
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2001
assert !missing(dev_norain) & abs(dev_norain - (1.333333333333333)) <= 1e-9 * max(1,abs(1.333333333333333)) if id==12 & year==2001
assert !missing(z_norain) & abs(z_norain - (1.1547005383792512)) <= 1e-9 * max(1,abs(1.1547005383792512)) if id==12 & year==2001
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.039957264957264982)) <= 1e-9 * max(1,abs(-0.039957264957264982)) if id==12 & year==2001
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.80138216620283542)) <= 1e-9 * max(1,abs(-0.80138216620283542)) if id==12 & year==2001
assert !missing(dev_dry) & abs(dev_dry - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==12 & year==2001
assert !missing(z_dry) & abs(z_dry - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==12 & year==2001
assert !missing(nobs) & abs(nobs - (13)) <= 1e-9 * max(1,abs(13)) if id==12 & year==2002
assert !missing(mean) & abs(mean - (2.8692307692307693)) <= 1e-9 * max(1,abs(2.8692307692307693)) if id==12 & year==2002
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12 & year==2002
assert !missing(var) & abs(var - (21.79397435897436)) <= 1e-9 * max(1,abs(21.79397435897436)) if id==12 & year==2002
assert !missing(sd) & abs(sd - (4.6684016921184446)) <= 1e-9 * max(1,abs(4.6684016921184446)) if id==12 & year==2002
assert !missing(skew) & abs(skew - (2.6464372055970311)) <= 1e-9 * max(1,abs(2.6464372055970311)) if id==12 & year==2002
assert !missing(mean_mo) & abs(mean_mo - (9.3249999999999993)) <= 1e-9 * max(1,abs(9.3249999999999993)) if id==12 & year==2002
assert !missing(total) & abs(total - (37.299999999999997)) <= 1e-9 * max(1,abs(37.299999999999997)) if id==12 & year==2002
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2002
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2002
assert !missing(pct_raindays) & abs(pct_raindays - (0.46153846153846156)) <= 1e-9 * max(1,abs(0.46153846153846156)) if id==12 & year==2002
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2002
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==12 & year==2002
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2002
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2002
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2002
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.72499999999999964)) <= 1e-9 * max(1,abs(-0.72499999999999964)) if id==12 & year==2002
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.54873483364123232)) <= 1e-9 * max(1,abs(-0.54873483364123232)) if id==12 & year==2002
assert !missing(dev_total) & abs(dev_total - (-2.8999999999999986)) <= 1e-9 * max(1,abs(-2.8999999999999986)) if id==12 & year==2002
assert !missing(z_total) & abs(z_total - (-0.54873483364123232)) <= 1e-9 * max(1,abs(-0.54873483364123232)) if id==12 & year==2002
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2002
assert !missing(z_raindays) & abs(z_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2002
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666696)) <= 1e-9 * max(1,abs(-0.66666666666666696)) if id==12 & year==2002
assert !missing(z_norain) & abs(z_norain - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==12 & year==2002
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.015918803418803418)) <= 1e-9 * max(1,abs(-0.015918803418803418)) if id==12 & year==2002
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.31926722664230589)) <= 1e-9 * max(1,abs(-0.31926722664230589)) if id==12 & year==2002
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12 & year==2002
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12 & year==2002
assert !missing(nobs) & abs(nobs - (16)) <= 1e-9 * max(1,abs(16)) if id==12 & year==2003
assert !missing(mean) & abs(mean - (6.0562500000000004)) <= 1e-9 * max(1,abs(6.0562500000000004)) if id==12 & year==2003
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(var) & abs(var - (59.410625000000003)) <= 1e-9 * max(1,abs(59.410625000000003)) if id==12 & year==2003
assert !missing(sd) & abs(sd - (7.7078288123180316)) <= 1e-9 * max(1,abs(7.7078288123180316)) if id==12 & year==2003
assert !missing(skew) & abs(skew - (0.8246527622246832)) <= 1e-9 * max(1,abs(0.8246527622246832)) if id==12 & year==2003
assert !missing(mean_mo) & abs(mean_mo - (24.225000000000001)) <= 1e-9 * max(1,abs(24.225000000000001)) if id==12 & year==2003
assert !missing(total) & abs(total - (96.900000000000006)) <= 1e-9 * max(1,abs(96.900000000000006)) if id==12 & year==2003
assert !missing(raindays) & abs(raindays - (10)) <= 1e-9 * max(1,abs(10)) if id==12 & year==2003
assert !missing(norain) & abs(norain - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==12 & year==2003
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2003
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2003
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2003
assert !missing(cut01) & abs(cut01 - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(cut02) & abs(cut02 - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2003
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2003
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (14.175000000000002)) <= 1e-9 * max(1,abs(14.175000000000002)) if id==12 & year==2003
assert !missing(z_mean_mo) & abs(z_mean_mo - (10.728712092226859)) <= 1e-9 * max(1,abs(10.728712092226859)) if id==12 & year==2003
assert !missing(dev_total) & abs(dev_total - (56.70000000000001)) <= 1e-9 * max(1,abs(56.70000000000001)) if id==12 & year==2003
assert !missing(z_total) & abs(z_total - (10.728712092226859)) <= 1e-9 * max(1,abs(10.728712092226859)) if id==12 & year==2003
assert !missing(dev_raindays) & abs(dev_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(z_raindays) & abs(z_raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==12 & year==2003
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12 & year==2003
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==12 & year==2003
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.14754273504273502)) <= 1e-9 * max(1,abs(0.14754273504273502)) if id==12 & year==2003
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (2.959114362369291)) <= 1e-9 * max(1,abs(2.959114362369291)) if id==12 & year==2003
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12 & year==2003
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12 & year==2003
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==12 & year==2004
assert !missing(mean) & abs(mean - (3.290909090909091)) <= 1e-9 * max(1,abs(3.290909090909091)) if id==12 & year==2004
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(var) & abs(var - (24.856909090909092)) <= 1e-9 * max(1,abs(24.856909090909092)) if id==12 & year==2004
assert !missing(sd) & abs(sd - (4.9856703752764373)) <= 1e-9 * max(1,abs(4.9856703752764373)) if id==12 & year==2004
assert !missing(skew) & abs(skew - (2.4117045295500548)) <= 1e-9 * max(1,abs(2.4117045295500548)) if id==12 & year==2004
assert !missing(mean_mo) & abs(mean_mo - (12.066666666666668)) <= 1e-9 * max(1,abs(12.066666666666668)) if id==12 & year==2004
assert !missing(total) & abs(total - (36.200000000000003)) <= 1e-9 * max(1,abs(36.200000000000003)) if id==12 & year==2004
assert !missing(raindays) & abs(raindays - (6)) <= 1e-9 * max(1,abs(6)) if id==12 & year==2004
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2004
assert !missing(pct_raindays) & abs(pct_raindays - (0.54545454545454541)) <= 1e-9 * max(1,abs(0.54545454545454541)) if id==12 & year==2004
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2004
assert !missing(dry_end) & abs(dry_end - (1)) <= 1e-9 * max(1,abs(1)) if id==12 & year==2004
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==12 & year==2004
assert !missing(cut02) & abs(cut02 - (2)) <= 1e-9 * max(1,abs(2)) if id==12 & year==2004
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==12 & year==2004
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==12 & year==2004
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (2.0166666666666693)) <= 1e-9 * max(1,abs(2.0166666666666693)) if id==12 & year==2004
assert !missing(z_mean_mo) & abs(z_mean_mo - (1.5263658590940052)) <= 1e-9 * max(1,abs(1.5263658590940052)) if id==12 & year==2004
assert !missing(dev_total) & abs(dev_total - (-3.9999999999999929)) <= 1e-9 * max(1,abs(-3.9999999999999929)) if id==12 & year==2004
assert !missing(z_total) & abs(z_total - (-0.75687563260859525)) <= 1e-9 * max(1,abs(-0.75687563260859525)) if id==12 & year==2004
assert !missing(dev_raindays) & abs(dev_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2004
assert !missing(z_raindays) & abs(z_raindays - (-1)) <= 1e-9 * max(1,abs(-1)) if id==12 & year==2004
assert !missing(dev_norain) & abs(dev_norain - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==12 & year==2004
assert !missing(z_norain) & abs(z_norain - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==12 & year==2004
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.067997280497280432)) <= 1e-9 * max(1,abs(0.067997280497280432)) if id==12 & year==2004
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (1.3637521987326306)) <= 1e-9 * max(1,abs(1.3637521987326306)) if id==12 & year==2004
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==12 & year==2004
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==12 & year==2004
assert _N==60
