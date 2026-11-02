version 15.1
set type double
clear
input str2 id double day double v
"b" 20200103 3
"a" 20200101 1
"a" 20200103 .
"b" 20200101 2
end
wxprep towide v if id=="b" in 1/3, id(id) date(day) stub(x_) clear
assert _N==1 & id=="b" & x_20200103==3
assert r(n_days)==1
