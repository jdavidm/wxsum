version 15.1
set type double
clear
set obs 1
gen id=1
gen double d=mdy(1,1,999)
assert !missing(d)
format d %td
gen v=7
wxprep towide v, id(id) date(d) stub(x_) clear
confirm variable x_09990101
wxprep tolong x_, id(id) clear
assert x==7 & date==mdy(1,1,999)
