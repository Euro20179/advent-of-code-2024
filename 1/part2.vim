"#!/bin/nvim -S
"score 3

r ./puzzle1

"move all items from the left column to the bottom
g/^\d/norm diwGpo

"collects all occurances of the number from the right column into @a and puts
"them next to the number from the left column (which is now at the bottom)
let @q = ":let @a = \"\"\n:g//let @A = expand(\"<cword>\")
            \.. ' '\n\"_ddO€üR\"€üW€üRaj0"
1002norm 1000@q0

"remove all numbers that occur only once (meaning it was only in the left
"column)
1,$g/^\d\+ $/d

"delete the now unecessary right column
1,1001d

"remove the first number from the line (that's the number from the left column
"that we now dont care about)
%s/^\d\+ //

"add a plus between each number
%s/\zs\d\+\ze /&+/g
%join

"remove the trailing plus and add up the numbers
.!sed 's/+ $//' | bc

""skips the hit-enter prompt that happens after `:d`, etc
call feedkeys("\<CR>")

w! ./puzzle1.editing
