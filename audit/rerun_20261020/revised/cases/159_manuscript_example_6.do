version 15.1
set type double
tempfile paper_save
use "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_export/wxsum/rain.dta", clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) ///
    fin_day(15) rain_threshold(1) keep(hhid) ///
    shape(long)
