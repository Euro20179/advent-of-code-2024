#!/bin/nvim -S
"score -3

read ./puzzle1

let count = 0
g/^\d/let count += expand("<cword>") *
            \ searchcount(#{pattern: '\s\+' .. expand("<cword>")}).total

echo count .. "\n"

w! ./puzzle1.editing
q
