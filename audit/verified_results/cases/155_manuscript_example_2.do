version 15.1
set type double
tempfile paper_save
use "C:/Users/annal/Downloads/wxsum/temp.dta", clear
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8)  ///
    gdd_hi(32) kdd_base(32) keep(hhid)
