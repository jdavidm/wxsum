version 15.1
set type double
clear
input str2 id double day double v
"b" 20200103 3
"a" 20200101 1
"a" 20200103 .
"b" 20200101 2
end
gen int region=1
wxprep towide v, id(region id) date(day) stub(x_) clear
assert _N==2 & region==1
