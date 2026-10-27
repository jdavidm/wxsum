version 15.1
set type double
clear
input id long d double v
1 20200101 2
1 20200101 6
1 20200102 .
1 20200102 .
2 20200101 7
end
wxprep towide v, id(id) date(d) stub(x_) clear daily(max)
assert r(n_combined)==2
assert x_20200101==6 if id==1
assert missing(x_20200102)
assert x_20200101==7 if id==2
