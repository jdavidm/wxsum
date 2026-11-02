version 15.1
set type double
clear
set obs 3
gen id=1
gen double v=_n
gen long d=20200100+_n
wxprep towide v, id(id) date(d) stub(x_) clear 
assert x_20200101==1 & x_20200102==2 & x_20200103==3
