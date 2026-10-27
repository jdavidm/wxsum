version 15.1
set type double
clear
set obs 1
gen a=7
wxprep rename a, stub(x_) firstdate(09990101)
confirm variable x_09990101
