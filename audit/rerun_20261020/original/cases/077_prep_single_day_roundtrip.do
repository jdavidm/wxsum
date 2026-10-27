version 15.1
set type double
clear
input double (id x_20200101)
1 17
2 .
end
wxprep tolong x_, id(id) clear
assert _N==2 & date==mdy(1,1,2020)
assert x==17 if id==1
wxprep towide x, id(id) date(date) stub(x_) clear
assert _N==2 & x_20200101==17 if id==1
