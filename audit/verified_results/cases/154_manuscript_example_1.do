version 15.1
set type double
tempfile paper_save
use "C:/Users/annal/Downloads/wxsum/rain.dta", clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) ///
    fin_day(15) rain_threshold(1) keep(hhid) ///
    save("`paper_save'")
