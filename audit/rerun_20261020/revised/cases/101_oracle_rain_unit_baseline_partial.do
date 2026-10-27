version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261020/revised/oracle_rain.csv", clear varnames(1) asdouble
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
wxsum x_, type(rain) start(s) end(e) keep(id s e) minobs(2) ref_min(2) partial baseline(2000 2002) cuts(1 2 5)
assert !missing(nobs) & abs(nobs - (11)) <= 1e-9 * max(1,abs(11)) if id==1
assert !missing(mean) & abs(mean - (2.6363636363636362)) <= 1e-9 * max(1,abs(2.6363636363636362)) if id==1
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==1
assert !missing(var) & abs(var - (24.586545454545455)) <= 1e-9 * max(1,abs(24.586545454545455)) if id==1
assert !missing(sd) & abs(sd - (4.9584821724541328)) <= 1e-9 * max(1,abs(4.9584821724541328)) if id==1
assert !missing(skew) & abs(skew - (2.911188164801624)) <= 1e-9 * max(1,abs(2.911188164801624)) if id==1
assert !missing(mean_mo) & abs(mean_mo - (29)) <= 1e-9 * max(1,abs(29)) if id==1
assert !missing(total) & abs(total - (29)) <= 1e-9 * max(1,abs(29)) if id==1
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==1
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(pct_raindays) & abs(pct_raindays - (0.36363636363636365)) <= 1e-9 * max(1,abs(0.36363636363636365)) if id==1
assert !missing(dry_start) & abs(dry_start - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(dry_end) & abs(dry_end - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==1
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==1
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==1
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-17)) <= 1e-9 * max(1,abs(-17)) if id==1
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.3116952461867886)) <= 1e-9 * max(1,abs(-2.3116952461867886)) if id==1
assert !missing(dev_total) & abs(dev_total - (-17)) <= 1e-9 * max(1,abs(-17)) if id==1
assert !missing(z_total) & abs(z_total - (-2.3116952461867886)) <= 1e-9 * max(1,abs(-2.3116952461867886)) if id==1
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==1
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==1
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==1
assert missing(z_norain) if id==1
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.25454545454545452)) <= 1e-9 * max(1,abs(-0.25454545454545452)) if id==1
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-9.8994949366116618)) <= 1e-9 * max(1,abs(-9.8994949366116618)) if id==1
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==1
assert !missing(nobs) & abs(nobs - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(mean) & abs(mean - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==2
assert !missing(var) & abs(var - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(sd) & abs(sd - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert missing(skew) if id==2
assert !missing(mean_mo) & abs(mean_mo - (9)) <= 1e-9 * max(1,abs(9)) if id==2
assert !missing(total) & abs(total - (36)) <= 1e-9 * max(1,abs(36)) if id==2
assert !missing(raindays) & abs(raindays - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(norain) & abs(norain - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(pct_raindays) & abs(pct_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==2
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry) & abs(dry - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut01) & abs(cut01 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
assert !missing(cut03) & abs(cut03 - (18)) <= 1e-9 * max(1,abs(18)) if id==2
assert !missing(cut04) & abs(cut04 - (0)) <= 1e-9 * max(1,abs(0)) if id==2
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
assert missing(cut01) if id==3
assert missing(cut02) if id==3
assert missing(cut03) if id==3
assert missing(cut04) if id==3
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
assert !missing(nobs) & abs(nobs - (25)) <= 1e-9 * max(1,abs(25)) if id==4
assert !missing(mean) & abs(mean - (4.9400000000000004)) <= 1e-9 * max(1,abs(4.9400000000000004)) if id==4
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==4
assert !missing(var) & abs(var - (40.775833333333331)) <= 1e-9 * max(1,abs(40.775833333333331)) if id==4
assert !missing(sd) & abs(sd - (6.3855957696469741)) <= 1e-9 * max(1,abs(6.3855957696469741)) if id==4
assert !missing(skew) & abs(skew - (1.3398716972357712)) <= 1e-9 * max(1,abs(1.3398716972357712)) if id==4
assert !missing(mean_mo) & abs(mean_mo - (30.875)) <= 1e-9 * max(1,abs(30.875)) if id==4
assert !missing(total) & abs(total - (123.5)) <= 1e-9 * max(1,abs(123.5)) if id==4
assert !missing(raindays) & abs(raindays - (14)) <= 1e-9 * max(1,abs(14)) if id==4
assert !missing(norain) & abs(norain - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(pct_raindays) & abs(pct_raindays - (0.56000000000000005)) <= 1e-9 * max(1,abs(0.56000000000000005)) if id==4
assert !missing(dry_start) & abs(dry_start - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(cut01) & abs(cut01 - (11)) <= 1e-9 * max(1,abs(11)) if id==4
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==4
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==4
assert !missing(cut04) & abs(cut04 - (10)) <= 1e-9 * max(1,abs(10)) if id==4
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (12.109999999999999)) <= 1e-9 * max(1,abs(12.109999999999999)) if id==4
assert !missing(z_mean_mo) & abs(z_mean_mo - (4.0629406585678653)) <= 1e-9 * max(1,abs(4.0629406585678653)) if id==4
assert !missing(dev_total) & abs(dev_total - (35.833333333333329)) <= 1e-9 * max(1,abs(35.833333333333329)) if id==4
assert !missing(z_total) & abs(z_total - (1.881635010152223)) <= 1e-9 * max(1,abs(1.881635010152223)) if id==4
assert !missing(dev_raindays) & abs(dev_raindays - (-0.33333333333333393)) <= 1e-9 * max(1,abs(-0.33333333333333393)) if id==4
assert !missing(z_raindays) & abs(z_raindays - (-0.28867513459481342)) <= 1e-9 * max(1,abs(-0.28867513459481342)) if id==4
assert !missing(dev_norain) & abs(dev_norain - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==4
assert !missing(z_norain) & abs(z_norain - (1.1547005383792506)) <= 1e-9 * max(1,abs(1.1547005383792506)) if id==4
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.020713489409141528)) <= 1e-9 * max(1,abs(-0.020713489409141528)) if id==4
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.1703603225202102)) <= 1e-9 * max(1,abs(-1.1703603225202102)) if id==4
assert !missing(dev_dry) & abs(dev_dry - (-0.33333333333333348)) <= 1e-9 * max(1,abs(-0.33333333333333348)) if id==4
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962606)) <= 1e-9 * max(1,abs(-0.57735026918962606)) if id==4
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==5
assert !missing(mean) & abs(mean - (1.3500000000000001)) <= 1e-9 * max(1,abs(1.3500000000000001)) if id==5
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==5
assert !missing(var) & abs(var - (2.0916666666666668)) <= 1e-9 * max(1,abs(2.0916666666666668)) if id==5
assert !missing(sd) & abs(sd - (1.4462595433277758)) <= 1e-9 * max(1,abs(1.4462595433277758)) if id==5
assert !missing(skew) & abs(skew - (2.0109575402852835)) <= 1e-9 * max(1,abs(2.0109575402852835)) if id==5
assert !missing(mean_mo) & abs(mean_mo - (13.5)) <= 1e-9 * max(1,abs(13.5)) if id==5
assert !missing(total) & abs(total - (13.5)) <= 1e-9 * max(1,abs(13.5)) if id==5
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==5
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dry) & abs(dry - (3)) <= 1e-9 * max(1,abs(3)) if id==5
assert !missing(dry_end) & abs(dry_end - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==5
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==5
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==5
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-1.5333333333333332)) <= 1e-9 * max(1,abs(-1.5333333333333332)) if id==5
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.44536525035550534)) <= 1e-9 * max(1,abs(-0.44536525035550534)) if id==5
assert !missing(dev_total) & abs(dev_total - (-16.566666666666666)) <= 1e-9 * max(1,abs(-16.566666666666666)) if id==5
assert !missing(z_total) & abs(z_total - (-2.4059405372465887)) <= 1e-9 * max(1,abs(-2.4059405372465887)) if id==5
assert !missing(dev_raindays) & abs(dev_raindays - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==5
assert !missing(z_raindays) & abs(z_raindays - (-1.7457431218879391)) <= 1e-9 * max(1,abs(-1.7457431218879391)) if id==5
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==5
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.15085470085470087)) <= 1e-9 * max(1,abs(-0.15085470085470087)) if id==5
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.0921153605531615)) <= 1e-9 * max(1,abs(-1.0921153605531615)) if id==5
assert !missing(dev_dry) & abs(dev_dry - (0.66666666666666652)) <= 1e-9 * max(1,abs(0.66666666666666652)) if id==5
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==5
assert !missing(nobs) & abs(nobs - (3)) <= 1e-9 * max(1,abs(3)) if id==6
assert !missing(mean) & abs(mean - (1.6666666666666667)) <= 1e-9 * max(1,abs(1.6666666666666667)) if id==6
assert !missing(median) & abs(median - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(var) & abs(var - (8.3333333333333339)) <= 1e-9 * max(1,abs(8.3333333333333339)) if id==6
assert !missing(sd) & abs(sd - (2.8867513459481291)) <= 1e-9 * max(1,abs(2.8867513459481291)) if id==6
assert !missing(skew) & abs(skew - (1.7320508075688759)) <= 1e-9 * max(1,abs(1.7320508075688759)) if id==6
assert !missing(mean_mo) & abs(mean_mo - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(total) & abs(total - (5)) <= 1e-9 * max(1,abs(5)) if id==6
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(norain) & abs(norain - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(pct_raindays) & abs(pct_raindays - (0.33333333333333331)) <= 1e-9 * max(1,abs(0.33333333333333331)) if id==6
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut01) & abs(cut01 - (2)) <= 1e-9 * max(1,abs(2)) if id==6
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==6
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-4.3666666666666671)) <= 1e-9 * max(1,abs(-4.3666666666666671)) if id==6
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.66861105427483769)) <= 1e-9 * max(1,abs(-0.66861105427483769)) if id==6
assert !missing(dev_total) & abs(dev_total - (-13.733333333333334)) <= 1e-9 * max(1,abs(-13.733333333333334)) if id==6
assert !missing(z_total) & abs(z_total - (-1.0514036426001265)) <= 1e-9 * max(1,abs(-1.0514036426001265)) if id==6
assert !missing(dev_raindays) & abs(dev_raindays - (-2.3333333333333335)) <= 1e-9 * max(1,abs(-2.3333333333333335)) if id==6
assert !missing(z_raindays) & abs(z_raindays - (-1.5275252316519468)) <= 1e-9 * max(1,abs(-1.5275252316519468)) if id==6
assert !missing(dev_norain) & abs(dev_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(z_norain) & abs(z_norain - (0)) <= 1e-9 * max(1,abs(0)) if id==6
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.27777777777777785)) <= 1e-9 * max(1,abs(-0.27777777777777785)) if id==6
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.2807887989464002)) <= 1e-9 * max(1,abs(-1.2807887989464002)) if id==6
assert !missing(dev_dry) & abs(dev_dry - (1.3333333333333335)) <= 1e-9 * max(1,abs(1.3333333333333335)) if id==6
assert !missing(z_dry) & abs(z_dry - (1.1547005383792517)) <= 1e-9 * max(1,abs(1.1547005383792517)) if id==6
assert missing(nobs) if id==7
assert missing(mean) if id==7
assert missing(median) if id==7
assert missing(var) if id==7
assert missing(sd) if id==7
assert missing(skew) if id==7
assert missing(mean_mo) if id==7
assert missing(total) if id==7
assert missing(raindays) if id==7
assert missing(norain) if id==7
assert missing(pct_raindays) if id==7
assert missing(dry_start) if id==7
assert missing(dry) if id==7
assert missing(dry_end) if id==7
assert missing(cut01) if id==7
assert missing(cut02) if id==7
assert missing(cut03) if id==7
assert missing(cut04) if id==7
assert missing(dev_mean_mo) if id==7
assert missing(z_mean_mo) if id==7
assert missing(dev_total) if id==7
assert missing(z_total) if id==7
assert missing(dev_raindays) if id==7
assert missing(z_raindays) if id==7
assert missing(dev_norain) if id==7
assert missing(z_norain) if id==7
assert missing(dev_pct_raindays) if id==7
assert missing(z_pct_raindays) if id==7
assert missing(dev_dry) if id==7
assert missing(z_dry) if id==7
assert !missing(nobs) & abs(nobs - (10)) <= 1e-9 * max(1,abs(10)) if id==8
assert !missing(mean) & abs(mean - (2.1600000000000001)) <= 1e-9 * max(1,abs(2.1600000000000001)) if id==8
assert !missing(median) & abs(median - (0.20000000000000001)) <= 1e-9 * max(1,abs(0.20000000000000001)) if id==8
assert !missing(var) & abs(var - (27.829333333333334)) <= 1e-9 * max(1,abs(27.829333333333334)) if id==8
assert !missing(sd) & abs(sd - (5.2753514890795037)) <= 1e-9 * max(1,abs(5.2753514890795037)) if id==8
assert !missing(skew) & abs(skew - (3.0323120851199712)) <= 1e-9 * max(1,abs(3.0323120851199712)) if id==8
assert !missing(mean_mo) & abs(mean_mo - (21.600000000000001)) <= 1e-9 * max(1,abs(21.600000000000001)) if id==8
assert !missing(total) & abs(total - (21.600000000000001)) <= 1e-9 * max(1,abs(21.600000000000001)) if id==8
assert !missing(raindays) & abs(raindays - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(norain) & abs(norain - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(pct_raindays) & abs(pct_raindays - (0.29999999999999999)) <= 1e-9 * max(1,abs(0.29999999999999999)) if id==8
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut01) & abs(cut01 - (7)) <= 1e-9 * max(1,abs(7)) if id==8
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==8
assert !missing(cut03) & abs(cut03 - (2)) <= 1e-9 * max(1,abs(2)) if id==8
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==8
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-27.466666666666661)) <= 1e-9 * max(1,abs(-27.466666666666661)) if id==8
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.8807529039821103)) <= 1e-9 * max(1,abs(-3.8807529039821103)) if id==8
assert !missing(dev_total) & abs(dev_total - (-27.466666666666661)) <= 1e-9 * max(1,abs(-27.466666666666661)) if id==8
assert !missing(z_total) & abs(z_total - (-3.8807529039821103)) <= 1e-9 * max(1,abs(-3.8807529039821103)) if id==8
assert !missing(dev_raindays) & abs(dev_raindays - (-2.666666666666667)) <= 1e-9 * max(1,abs(-2.666666666666667)) if id==8
assert !missing(z_raindays) & abs(z_raindays - (-2.3094010767585034)) <= 1e-9 * max(1,abs(-2.3094010767585034)) if id==8
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(z_norain) & abs(z_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.28712121212121217)) <= 1e-9 * max(1,abs(-0.28712121212121217)) if id==8
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-3.7947464013589332)) <= 1e-9 * max(1,abs(-3.7947464013589332)) if id==8
assert !missing(dev_dry) & abs(dev_dry - (0.33333333333333326)) <= 1e-9 * max(1,abs(0.33333333333333326)) if id==8
assert !missing(z_dry) & abs(z_dry - (0.57735026918962562)) <= 1e-9 * max(1,abs(0.57735026918962562)) if id==8
assert !missing(nobs) & abs(nobs - (14)) <= 1e-9 * max(1,abs(14)) if id==9
assert !missing(mean) & abs(mean - (3.8642857142857143)) <= 1e-9 * max(1,abs(3.8642857142857143)) if id==9
assert !missing(median) & abs(median - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(var) & abs(var - (33.599395604395603)) <= 1e-9 * max(1,abs(33.599395604395603)) if id==9
assert !missing(sd) & abs(sd - (5.7964985641674751)) <= 1e-9 * max(1,abs(5.7964985641674751)) if id==9
assert !missing(skew) & abs(skew - (1.9529385935308152)) <= 1e-9 * max(1,abs(1.9529385935308152)) if id==9
assert !missing(mean_mo) & abs(mean_mo - (13.525)) <= 1e-9 * max(1,abs(13.525)) if id==9
assert !missing(total) & abs(total - (54.100000000000001)) <= 1e-9 * max(1,abs(54.100000000000001)) if id==9
assert !missing(raindays) & abs(raindays - (9)) <= 1e-9 * max(1,abs(9)) if id==9
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(pct_raindays) & abs(pct_raindays - (0.6428571428571429)) <= 1e-9 * max(1,abs(0.6428571428571429)) if id==9
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==9
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==9
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==9
assert !missing(cut03) & abs(cut03 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(cut04) & abs(cut04 - (4)) <= 1e-9 * max(1,abs(4)) if id==9
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (1.6083333333333343)) <= 1e-9 * max(1,abs(1.6083333333333343)) if id==9
assert !missing(z_mean_mo) & abs(z_mean_mo - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9
assert !missing(dev_total) & abs(dev_total - (6.4333333333333371)) <= 1e-9 * max(1,abs(6.4333333333333371)) if id==9
assert !missing(z_total) & abs(z_total - (0.35272814504618327)) <= 1e-9 * max(1,abs(0.35272814504618327)) if id==9
assert !missing(dev_raindays) & abs(dev_raindays - (0.66666666666666607)) <= 1e-9 * max(1,abs(0.66666666666666607)) if id==9
assert !missing(z_raindays) & abs(z_raindays - (0.26490647141300855)) <= 1e-9 * max(1,abs(0.26490647141300855)) if id==9
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==9
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==9
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.093837535014005602)) <= 1e-9 * max(1,abs(0.093837535014005602)) if id==9
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.84573311374293803)) <= 1e-9 * max(1,abs(0.84573311374293803)) if id==9
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==9
assert !missing(nobs) & abs(nobs - (2)) <= 1e-9 * max(1,abs(2)) if id==10
assert !missing(mean) & abs(mean - (8.9499999999999993)) <= 1e-9 * max(1,abs(8.9499999999999993)) if id==10
assert !missing(median) & abs(median - (8.9499999999999993)) <= 1e-9 * max(1,abs(8.9499999999999993)) if id==10
assert !missing(var) & abs(var - (129.60499999999999)) <= 1e-9 * max(1,abs(129.60499999999999)) if id==10
assert !missing(sd) & abs(sd - (11.384419177103414)) <= 1e-9 * max(1,abs(11.384419177103414)) if id==10
assert missing(skew) if id==10
assert !missing(mean_mo) & abs(mean_mo - (8.9499999999999993)) <= 1e-9 * max(1,abs(8.9499999999999993)) if id==10
assert !missing(total) & abs(total - (17.899999999999999)) <= 1e-9 * max(1,abs(17.899999999999999)) if id==10
assert !missing(raindays) & abs(raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(norain) & abs(norain - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(pct_raindays) & abs(pct_raindays - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==10
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut01) & abs(cut01 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(cut02) & abs(cut02 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut03) & abs(cut03 - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(cut04) & abs(cut04 - (1)) <= 1e-9 * max(1,abs(1)) if id==10
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (8.0999999999999996)) <= 1e-9 * max(1,abs(8.0999999999999996)) if id==10
assert !missing(z_mean_mo) & abs(z_mean_mo - (23.142857142857139)) <= 1e-9 * max(1,abs(23.142857142857139)) if id==10
assert !missing(dev_total) & abs(dev_total - (16.199999999999999)) <= 1e-9 * max(1,abs(16.199999999999999)) if id==10
assert !missing(z_total) & abs(z_total - (23.142857142857139)) <= 1e-9 * max(1,abs(23.142857142857139)) if id==10
assert !missing(dev_raindays) & abs(dev_raindays - (0.33333333333333337)) <= 1e-9 * max(1,abs(0.33333333333333337)) if id==10
assert !missing(z_raindays) & abs(z_raindays - (0.57735026918962584)) <= 1e-9 * max(1,abs(0.57735026918962584)) if id==10
assert !missing(dev_norain) & abs(dev_norain - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==10
assert !missing(z_norain) & abs(z_norain - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==10
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.22222222222222221)) <= 1e-9 * max(1,abs(0.22222222222222221)) if id==10
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.87287156094396945)) <= 1e-9 * max(1,abs(0.87287156094396945)) if id==10
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666674)) <= 1e-9 * max(1,abs(-0.66666666666666674)) if id==10
assert !missing(z_dry) & abs(z_dry - (-1.1547005383792517)) <= 1e-9 * max(1,abs(-1.1547005383792517)) if id==10
assert !missing(nobs) & abs(nobs - (24)) <= 1e-9 * max(1,abs(24)) if id==11
assert !missing(mean) & abs(mean - (3.9083333333333332)) <= 1e-9 * max(1,abs(3.9083333333333332)) if id==11
assert !missing(median) & abs(median - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(var) & abs(var - (37.420797101449274)) <= 1e-9 * max(1,abs(37.420797101449274)) if id==11
assert !missing(sd) & abs(sd - (6.1172540491178946)) <= 1e-9 * max(1,abs(6.1172540491178946)) if id==11
assert !missing(skew) & abs(skew - (1.7426963307273138)) <= 1e-9 * max(1,abs(1.7426963307273138)) if id==11
assert !missing(mean_mo) & abs(mean_mo - (23.449999999999999)) <= 1e-9 * max(1,abs(23.449999999999999)) if id==11
assert !missing(total) & abs(total - (93.799999999999997)) <= 1e-9 * max(1,abs(93.799999999999997)) if id==11
assert !missing(raindays) & abs(raindays - (15)) <= 1e-9 * max(1,abs(15)) if id==11
assert !missing(norain) & abs(norain - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(pct_raindays) & abs(pct_raindays - (0.625)) <= 1e-9 * max(1,abs(0.625)) if id==11
assert !missing(dry_start) & abs(dry_start - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry) & abs(dry - (2)) <= 1e-9 * max(1,abs(2)) if id==11
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert !missing(cut01) & abs(cut01 - (9)) <= 1e-9 * max(1,abs(9)) if id==11
assert !missing(cut02) & abs(cut02 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(cut03) & abs(cut03 - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(cut04) & abs(cut04 - (6)) <= 1e-9 * max(1,abs(6)) if id==11
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (6.4966666666666661)) <= 1e-9 * max(1,abs(6.4966666666666661)) if id==11
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.0096088312024389)) <= 1e-9 * max(1,abs(3.0096088312024389)) if id==11
assert !missing(dev_total) & abs(dev_total - (9.0333333333333314)) <= 1e-9 * max(1,abs(9.0333333333333314)) if id==11
assert !missing(z_total) & abs(z_total - (0.83694611929795859)) <= 1e-9 * max(1,abs(0.83694611929795859)) if id==11
assert !missing(dev_raindays) & abs(dev_raindays - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(z_raindays) & abs(z_raindays - (0.3779644730092272)) <= 1e-9 * max(1,abs(0.3779644730092272)) if id==11
assert !missing(dev_norain) & abs(dev_norain - (-1.3333333333333339)) <= 1e-9 * max(1,abs(-1.3333333333333339)) if id==11
assert !missing(z_norain) & abs(z_norain - (-0.32025630761017443)) <= 1e-9 * max(1,abs(-0.32025630761017443)) if id==11
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.043756967670011138)) <= 1e-9 * max(1,abs(0.043756967670011138)) if id==11
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.30932868134471309)) <= 1e-9 * max(1,abs(0.30932868134471309)) if id==11
assert !missing(dev_dry) & abs(dev_dry - (-0.66666666666666652)) <= 1e-9 * max(1,abs(-0.66666666666666652)) if id==11
assert !missing(z_dry) & abs(z_dry - (-0.57735026918962562)) <= 1e-9 * max(1,abs(-0.57735026918962562)) if id==11
assert !missing(nobs) & abs(nobs - (9)) <= 1e-9 * max(1,abs(9)) if id==12
assert !missing(mean) & abs(mean - (2.9444444444444446)) <= 1e-9 * max(1,abs(2.9444444444444446)) if id==12
assert !missing(median) & abs(median - (0.90000000000000002)) <= 1e-9 * max(1,abs(0.90000000000000002)) if id==12
assert !missing(var) & abs(var - (30.237777777777779)) <= 1e-9 * max(1,abs(30.237777777777779)) if id==12
assert !missing(sd) & abs(sd - (5.4988887766327643)) <= 1e-9 * max(1,abs(5.4988887766327643)) if id==12
assert !missing(skew) & abs(skew - (2.5915473164997347)) <= 1e-9 * max(1,abs(2.5915473164997347)) if id==12
assert !missing(mean_mo) & abs(mean_mo - (26.5)) <= 1e-9 * max(1,abs(26.5)) if id==12
assert !missing(total) & abs(total - (26.5)) <= 1e-9 * max(1,abs(26.5)) if id==12
assert !missing(raindays) & abs(raindays - (4)) <= 1e-9 * max(1,abs(4)) if id==12
assert !missing(norain) & abs(norain - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(pct_raindays) & abs(pct_raindays - (0.44444444444444442)) <= 1e-9 * max(1,abs(0.44444444444444442)) if id==12
assert !missing(dry_start) & abs(dry_start - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dry) & abs(dry - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(dry_end) & abs(dry_end - (0)) <= 1e-9 * max(1,abs(0)) if id==12
assert !missing(cut01) & abs(cut01 - (5)) <= 1e-9 * max(1,abs(5)) if id==12
assert !missing(cut02) & abs(cut02 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut03) & abs(cut03 - (1)) <= 1e-9 * max(1,abs(1)) if id==12
assert !missing(cut04) & abs(cut04 - (2)) <= 1e-9 * max(1,abs(2)) if id==12
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (8.75)) <= 1e-9 * max(1,abs(8.75)) if id==12
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.4137001265538096)) <= 1e-9 * max(1,abs(3.4137001265538096)) if id==12
assert !missing(dev_total) & abs(dev_total - (-9)) <= 1e-9 * max(1,abs(-9)) if id==12
assert !missing(z_total) & abs(z_total - (-1.7556172079419592)) <= 1e-9 * max(1,abs(-1.7556172079419592)) if id==12
assert !missing(dev_raindays) & abs(dev_raindays - (-1.333333333333333)) <= 1e-9 * max(1,abs(-1.333333333333333)) if id==12
assert !missing(z_raindays) & abs(z_raindays - (-2.3094010767585025)) <= 1e-9 * max(1,abs(-2.3094010767585025)) if id==12
assert !missing(dev_norain) & abs(dev_norain - (-1.666666666666667)) <= 1e-9 * max(1,abs(-1.666666666666667)) if id==12
assert !missing(z_norain) & abs(z_norain - (-1.4433756729740648)) <= 1e-9 * max(1,abs(-1.4433756729740648)) if id==12
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.0019425019425019507)) <= 1e-9 * max(1,abs(-0.0019425019425019507)) if id==12
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.033420339471362387)) <= 1e-9 * max(1,abs(-0.033420339471362387)) if id==12
assert !missing(dev_dry) & abs(dev_dry - (-1.6666666666666665)) <= 1e-9 * max(1,abs(-1.6666666666666665)) if id==12
assert !missing(z_dry) & abs(z_dry - (-1.4433756729740643)) <= 1e-9 * max(1,abs(-1.4433756729740643)) if id==12
