version 15.1
set type double
tempfile paper_save
use "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_export/wxsum/rain.dta", clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) lr_years(20) ///
    keep(hhid)
