version 15.1
set type double
tempfile paper_save
use "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_export/wxsum/temp.dta", clear
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8)  ///
    gdd_hi(32) kdd_base(32) keep(hhid)
