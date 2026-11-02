version 15.1
set type double
clear
input str2 id double day double v
"b" 20200103 3
"a" 20200101 1
"a" 20200103 .
"b" 20200101 2
end
wxprep towide v, id(id) date(day) stub(x_) clear
assert _N==2
assert r(n_days)==3
assert r(n_filled)==1
assert x_20200101==1 if id=="a"
assert missing(x_20200103) if id=="a"
assert x_20200103==3 if id=="b"
assert missing(x_20200102)
