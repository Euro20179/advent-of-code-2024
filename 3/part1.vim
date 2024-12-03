"score 3
read input

%s/mul(\(\d\{1,3}\),\(\d\{1,3}\))/\="\n" .. submatch(1) * submatch(2) .. "\n"/g
v/^\d\+$/d
v/\%$/norm A+ \
1,$!bc

w! input-1.txt
