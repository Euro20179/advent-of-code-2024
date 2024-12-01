#!/bin/nvim -S
"score -2

read ./puzzle1

1,$sort
let row1 = []

g/^\d/let row1 = add(row1, str2nr(expand("<cword>"))) | norm 0dw
1d
1,$sort
g/^\d/execute 'norm cc' .. string(abs(expand("<cword>") - row1[line('.') - 1]))

let dist = 0

g/^\d/let dist += expand("<cword>")

echo dist .. "\n"
w! ./puzzle1.editing | q!
