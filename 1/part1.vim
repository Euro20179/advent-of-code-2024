#!/bin/nvim -S
"score -13

!cp ./puzzle1 ./puzzle1.editing
e ./puzzle1.editing
let row1 = []
let row2 = []
g/^\d/let row1 = add(row1, expand("<cword>"))
g/^\d/s/\s\+\(\d\+\)/\=add(row2, submatch(1)) != [] && submatch(0)

let row1 = sort(row1)
let row2 = sort(row2)

norm ggdG
let lines = join(row1, "\n")
0put =lines

g/^\d/execute 'norm A ' . row2[line(".") - 1]
g/^\d/s/^\(\d\+\)\s\+\(\d\+\)$/\=abs(submatch(2) - submatch(1))

let dist = 0

g/^\d/let dist += expand("<cword>")

echo dist .. "\n"
w
q!
