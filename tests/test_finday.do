* test_finday.do
clear
set obs 1
gen id = _n

* Create daily temp data for Jan 2000 through March 2000
forvalues d = 14610/14700 {
    local date_str = string(year(`d'), "%04.0f") + string(month(`d'), "%02.0f") + string(day(`d'), "%02.0f")
    gen tmp_`date_str' = 10
}

* Leap year 2000, February has 29 days.
* 10 degrees * 29 days = 290 mean, max, whatever. Sum would be 290.
* Mean will just be 10, but observed_days should be 29. Wait, wxsum doesn't return observed_days directly, but we can verify it doesn't crash and returns 10.
* Let's test a case where we sum. GDD with bounds 0 and 20 will give 10 GDD per day.
* Total GDD for Feb 2000 should be 290.
wxsum tmp_, ini_month(02) fin_month(02) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(20)

* Check that the GDD is exactly 290
assert gdd_2000 == 290

* Now test a non-leap year (e.g. 2001)
clear
set obs 1
gen id = _n
forvalues d = 14976/15065 { /* Jan to Mar 2001 */
    local date_str = string(year(`d'), "%04.0f") + string(month(`d'), "%02.0f") + string(day(`d'), "%02.0f")
    gen tmp_`date_str' = 10
}
wxsum tmp_, ini_month(02) fin_month(02) type(temp) kdd_base(0) gdd_lo(0) gdd_hi(20)

* Check that GDD is 280 (28 days)
assert gdd_2001 == 280

di "fin_day default tests passed!"
