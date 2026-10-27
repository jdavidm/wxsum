version 15.1
set type double
clear
set obs 3
gen id=1
gen double v=_n
gen double d=cofC(clock("01jan2020 01:00:00","DMYhms"))+(_n-1)*86400000
format d %tC
wxprep towide v, id(id) date(d) stub(x_) clear 
assert x_20200101==1 & x_20200102==2 & x_20200103==3
