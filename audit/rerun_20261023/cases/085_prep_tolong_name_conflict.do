version 15.1
set type double
clear
input double (id x_20200101 x_20200102)
1 1 2
end
capture wxprep tolong x_, id(id) generate(id) clear
assert _rc==198
