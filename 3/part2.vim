"score 5
read input

%s/\(do()\|don't()\|mul(\d\+,\d\+)\)/\r&\r/g
v/\(do()\|don't()\|mul(\d\+,\d\+)\)/d

%s/don't()\_.\{-}do()/
g/^$\|do()/d
%s/mul(\(\d\+\),\(\d\+\))/\=submatch(1) * submatch(2)
v/\%$/norm A+
%join
.!bc
