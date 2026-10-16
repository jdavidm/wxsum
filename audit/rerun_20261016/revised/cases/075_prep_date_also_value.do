version 15.1
set type double
clear
input str2 id double day double v
"b" 20200103 3
"a" 20200101 1
"a" 20200103 .
"b" 20200101 2
end
wxprep towide day, id(id) date(day) stub(x_) clear
assert x_20200101==20200101 & x_20200103==20200103
