version 15.1
set type double
tempfile paper_save
use "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_export/wxsum/temp.dta", clear
wxsum tmp_, type(temp) ini_month(04) ini_day(01) fin_month(09) ///
    fin_day(15) gdd_lo(18) gdd_hi(30) kdd_base(32) tmp_bin(15)  ///
    tmp_binlo(0) tmp_binhi(39) keep(hhid)
