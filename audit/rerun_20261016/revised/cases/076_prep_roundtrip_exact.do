version 15.1
set type double
clear
input double (id x_20200101 x_20200102 x_20200103 x_20200104 x_20200105 x_20200106)
1 1.123456789012 16777217 . 3.25 1000000000000.0 -1000000000000.0
2 2 . 4 5 6 7
end
replace x_20200103=.a in 1
gen str2 tag=cond(id==1,"aa","bb")
tempfile orig
save "`orig'"
wxprep tolong x_, id(id tag) generate(v) date(d) clear
assert r(n_days)==6 & r(n_units)==2 & _N==12
wxprep towide v, id(id tag) date(d) stub(x_) clear
sort id
cf _all using "`orig'", all
