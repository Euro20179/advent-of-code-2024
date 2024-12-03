"score 5
read input

"put each do(), dont(), mul() on it's own line
%s/\(do()\|don't()\|mul(\d\+,\d\+)\)/\r&\r/g
"delete everything else
v/^\(do()\|don't()\|mul(\d\+,\d\+)\)$/d

"delete each section between a dont() and do()
%s/don't()\_.\{-}do()/
"delete the blank lines and remaining do()s
g/^$\|do()/d
"evaluate each mul()
%s/mul(\(\d\+\),\(\d\+\))/\=submatch(1) * submatch(2)
"add a + to the end of each line that isn't the last line
v/\%$/norm A+
"get bc to sum up everything
%join
.!bc

w! input-2.txt
