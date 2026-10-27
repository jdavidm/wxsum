version 15.1
set type double
import delimited using "C:/Users/aljos/git/wxsum/audit/rerun_20261021/oracle_rain.csv", clear varnames(1) asdouble
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
wxsum x_, type(rain) start(s) end(e) keep(id s e) minobs(2) ref_min(2) lr_years(2) cuts(1 2 5)
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-16.899999999999999)) <= 1e-9 * max(1,abs(-16.899999999999999)) if id==1
assert !missing(z_mean_mo) & abs(z_mean_mo - (-2.3431577651083626)) <= 1e-9 * max(1,abs(-2.3431577651083626)) if id==1
assert !missing(dev_total) & abs(dev_total - (-16.899999999999999)) <= 1e-9 * max(1,abs(-16.899999999999999)) if id==1
assert !missing(z_total) & abs(z_total - (-2.3431577651083626)) <= 1e-9 * max(1,abs(-2.3431577651083626)) if id==1
assert !missing(dev_raindays) & abs(dev_raindays - (-3.5)) <= 1e-9 * max(1,abs(-3.5)) if id==1
assert !missing(z_raindays) & abs(z_raindays - (-1.649915822768611)) <= 1e-9 * max(1,abs(-1.649915822768611)) if id==1
assert !missing(dev_norain) & abs(dev_norain - (4.5)) <= 1e-9 * max(1,abs(4.5)) if id==1
assert !missing(z_norain) & abs(z_norain - (2.1213203435596428)) <= 1e-9 * max(1,abs(2.1213203435596428)) if id==1
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.38636363636363635)) <= 1e-9 * max(1,abs(-0.38636363636363635)) if id==1
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.8213356485108039)) <= 1e-9 * max(1,abs(-1.8213356485108039)) if id==1
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-0.25)) <= 1e-9 * max(1,abs(-0.25)) if id==2
assert !missing(z_mean_mo) & abs(z_mean_mo - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2
assert !missing(dev_total) & abs(dev_total - (-1)) <= 1e-9 * max(1,abs(-1)) if id==2
assert !missing(z_total) & abs(z_total - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==2
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==2
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (13.667499999999997)) <= 1e-9 * max(1,abs(13.667499999999997)) if id==4
assert !missing(z_mean_mo) & abs(z_mean_mo - (7.6247589206052355)) <= 1e-9 * max(1,abs(7.6247589206052355)) if id==4
assert !missing(dev_total) & abs(dev_total - (46.699999999999989)) <= 1e-9 * max(1,abs(46.699999999999989)) if id==4
assert !missing(z_total) & abs(z_total - (11.386857476348888)) <= 1e-9 * max(1,abs(11.386857476348888)) if id==4
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==4
assert !missing(dev_norain) & abs(dev_norain - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==4
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==4
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.011070234113712329)) <= 1e-9 * max(1,abs(-0.011070234113712329)) if id==4
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-1.3374419689871224)) <= 1e-9 * max(1,abs(-1.3374419689871224)) if id==4
assert !missing(dev_dry) & abs(dev_dry - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==4
assert !missing(z_dry) & abs(z_dry - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==4
assert missing(nobs) if id==5
assert missing(mean) if id==5
assert missing(median) if id==5
assert missing(var) if id==5
assert missing(sd) if id==5
assert missing(skew) if id==5
assert missing(mean_mo) if id==5
assert missing(total) if id==5
assert missing(raindays) if id==5
assert missing(norain) if id==5
assert missing(pct_raindays) if id==5
assert missing(dry_start) if id==5
assert missing(dry) if id==5
assert missing(dry_end) if id==5
assert missing(cut01) if id==5
assert missing(cut02) if id==5
assert missing(cut03) if id==5
assert missing(cut04) if id==5
assert missing(dev_mean_mo) if id==5
assert missing(z_mean_mo) if id==5
assert missing(dev_total) if id==5
assert missing(z_total) if id==5
assert missing(dev_raindays) if id==5
assert missing(z_raindays) if id==5
assert missing(dev_norain) if id==5
assert missing(z_norain) if id==5
assert missing(dev_pct_raindays) if id==5
assert missing(z_pct_raindays) if id==5
assert missing(dev_dry) if id==5
assert missing(z_dry) if id==5
assert missing(nobs) if id==6
assert missing(mean) if id==6
assert missing(median) if id==6
assert missing(var) if id==6
assert missing(sd) if id==6
assert missing(skew) if id==6
assert missing(mean_mo) if id==6
assert missing(total) if id==6
assert missing(raindays) if id==6
assert missing(norain) if id==6
assert missing(pct_raindays) if id==6
assert missing(dry_start) if id==6
assert missing(dry) if id==6
assert missing(dry_end) if id==6
assert missing(cut01) if id==6
assert missing(cut02) if id==6
assert missing(cut03) if id==6
assert missing(cut04) if id==6
assert missing(dev_mean_mo) if id==6
assert missing(z_mean_mo) if id==6
assert missing(dev_total) if id==6
assert missing(z_total) if id==6
assert missing(dev_raindays) if id==6
assert missing(z_raindays) if id==6
assert missing(dev_norain) if id==6
assert missing(z_norain) if id==6
assert missing(dev_pct_raindays) if id==6
assert missing(z_pct_raindays) if id==6
assert missing(dev_dry) if id==6
assert missing(z_dry) if id==6
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-31.649999999999999)) <= 1e-9 * max(1,abs(-31.649999999999999)) if id==8
assert !missing(z_mean_mo) & abs(z_mean_mo - (-3.4697565309386387)) <= 1e-9 * max(1,abs(-3.4697565309386387)) if id==8
assert !missing(dev_total) & abs(dev_total - (-31.649999999999999)) <= 1e-9 * max(1,abs(-31.649999999999999)) if id==8
assert !missing(z_total) & abs(z_total - (-3.4697565309386387)) <= 1e-9 * max(1,abs(-3.4697565309386387)) if id==8
assert !missing(dev_raindays) & abs(dev_raindays - (-2.5)) <= 1e-9 * max(1,abs(-2.5)) if id==8
assert !missing(z_raindays) & abs(z_raindays - (-3.5355339059327373)) <= 1e-9 * max(1,abs(-3.5355339059327373)) if id==8
assert !missing(dev_norain) & abs(dev_norain - (3)) <= 1e-9 * max(1,abs(3)) if id==8
assert !missing(z_norain) & abs(z_norain - (2.1213203435596424)) <= 1e-9 * max(1,abs(2.1213203435596424)) if id==8
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.28522727272727272)) <= 1e-9 * max(1,abs(-0.28522727272727272)) if id==8
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-5.0709657736520946)) <= 1e-9 * max(1,abs(-5.0709657736520946)) if id==8
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==8
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==8
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (-3.5374999999999996)) <= 1e-9 * max(1,abs(-3.5374999999999996)) if id==9
assert !missing(z_mean_mo) & abs(z_mean_mo - (-28.587317010828023)) <= 1e-9 * max(1,abs(-28.587317010828023)) if id==9
assert !missing(dev_total) & abs(dev_total - (-14.149999999999999)) <= 1e-9 * max(1,abs(-14.149999999999999)) if id==9
assert !missing(z_total) & abs(z_total - (-28.587317010828023)) <= 1e-9 * max(1,abs(-28.587317010828023)) if id==9
assert !missing(dev_raindays) & abs(dev_raindays - (-2)) <= 1e-9 * max(1,abs(-2)) if id==9
assert missing(z_raindays) if id==9
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==9
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==9
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.024422268907562938)) <= 1e-9 * max(1,abs(-0.024422268907562938)) if id==9
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.85403806039413943)) <= 1e-9 * max(1,abs(-0.85403806039413943)) if id==9
assert !missing(dev_dry) & abs(dev_dry - (0.5)) <= 1e-9 * max(1,abs(0.5)) if id==9
assert !missing(z_dry) & abs(z_dry - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==9
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (6.9999999999999991)) <= 1e-9 * max(1,abs(6.9999999999999991)) if id==10
assert !missing(z_mean_mo) & abs(z_mean_mo - (3.2998316455372207)) <= 1e-9 * max(1,abs(3.2998316455372207)) if id==10
assert !missing(dev_total) & abs(dev_total - (13.999999999999998)) <= 1e-9 * max(1,abs(13.999999999999998)) if id==10
assert !missing(z_total) & abs(z_total - (3.2998316455372207)) <= 1e-9 * max(1,abs(3.2998316455372207)) if id==10
assert !missing(dev_raindays) & abs(dev_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(z_raindays) & abs(z_raindays - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(dev_norain) & abs(dev_norain - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==10
assert !missing(z_norain) & abs(z_norain - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==10
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (0.16666666666666669)) <= 1e-9 * max(1,abs(0.16666666666666669)) if id==10
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (0.35355339059327379)) <= 1e-9 * max(1,abs(0.35355339059327379)) if id==10
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10
assert !missing(z_dry) & abs(z_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==10
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
assert !missing(dev_mean_mo) & abs(dev_mean_mo - (5.2900000000000027)) <= 1e-9 * max(1,abs(5.2900000000000027)) if id==11
assert !missing(z_mean_mo) & abs(z_mean_mo - (6.9270275416237626)) <= 1e-9 * max(1,abs(6.9270275416237626)) if id==11
assert !missing(dev_total) & abs(dev_total - (3)) <= 1e-9 * max(1,abs(3)) if id==11
assert !missing(z_total) & abs(z_total - (0.78567420131838528)) <= 1e-9 * max(1,abs(0.78567420131838528)) if id==11
assert !missing(dev_raindays) & abs(dev_raindays - (-0.5)) <= 1e-9 * max(1,abs(-0.5)) if id==11
assert !missing(z_raindays) & abs(z_raindays - (-0.70710678118654746)) <= 1e-9 * max(1,abs(-0.70710678118654746)) if id==11
assert !missing(dev_norain) & abs(dev_norain - (1)) <= 1e-9 * max(1,abs(1)) if id==11
assert !missing(z_norain) & abs(z_norain - (0.70710678118654746)) <= 1e-9 * max(1,abs(0.70710678118654746)) if id==11
assert !missing(dev_pct_raindays) & abs(dev_pct_raindays - (-0.035326086956521729)) <= 1e-9 * max(1,abs(-0.035326086956521729)) if id==11
assert !missing(z_pct_raindays) & abs(z_pct_raindays - (-0.70710678118654757)) <= 1e-9 * max(1,abs(-0.70710678118654757)) if id==11
assert !missing(dev_dry) & abs(dev_dry - (0)) <= 1e-9 * max(1,abs(0)) if id==11
assert missing(z_dry) if id==11
assert missing(nobs) if id==12
assert missing(mean) if id==12
assert missing(median) if id==12
assert missing(var) if id==12
assert missing(sd) if id==12
assert missing(skew) if id==12
assert missing(mean_mo) if id==12
assert missing(total) if id==12
assert missing(raindays) if id==12
assert missing(norain) if id==12
assert missing(pct_raindays) if id==12
assert missing(dry_start) if id==12
assert missing(dry) if id==12
assert missing(dry_end) if id==12
assert missing(cut01) if id==12
assert missing(cut02) if id==12
assert missing(cut03) if id==12
assert missing(cut04) if id==12
assert missing(dev_mean_mo) if id==12
assert missing(z_mean_mo) if id==12
assert missing(dev_total) if id==12
assert missing(z_total) if id==12
assert missing(dev_raindays) if id==12
assert missing(z_raindays) if id==12
assert missing(dev_norain) if id==12
assert missing(z_norain) if id==12
assert missing(dev_pct_raindays) if id==12
assert missing(z_pct_raindays) if id==12
assert missing(dev_dry) if id==12
assert missing(z_dry) if id==12
