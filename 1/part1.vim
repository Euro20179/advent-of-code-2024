"score 1

read ./puzzle1 | 1d

1,$sort
let row1 = []

g/^\d/let row1 = add(row1, str2nr(expand("<cword>"))) | norm 0dw
1d
1,$sort
g/^\d/execute 'norm cc' .. string(abs(expand("<cword>") - row1[line('.') - 1]))

$a|---ANSWER---
0
.
1,$-1g/^\d/call setline("$", str2nr(getline("$")) + str2nr(expand("<cword>")))

w! ./puzzle1.editing
