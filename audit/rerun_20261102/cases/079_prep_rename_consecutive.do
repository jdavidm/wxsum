version 15.1
set type double
clear
input double (id x_20200228 x_20200229 x_20200301)
1 1 2 3
end
rename (x_20200228 x_20200229 x_20200301) (a b c)
wxprep rename a b c, stub(r_) firstdate(28feb2020)
assert r(n_vars)==3 & r(n_gaps)==0
assert r_20200228==1 & r_20200229==2 & r_20200301==3
