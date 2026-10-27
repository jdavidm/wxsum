version 15.1
set type double
tempfile paper_save
use "C:/Users/annal/Downloads/wxsum/rain.dta", clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) lr_years(20) ///
    keep(hhid)
