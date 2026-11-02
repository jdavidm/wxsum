version 15.1
set type double
clear
set obs 1
gen old_03jan2020=3
gen old_01jan2020=1
wxprep rename old_*, stub(r_) from(old_) dateformat(DMY)
assert r(n_gaps)==1
assert r_20200101==1 & r_20200103==3
