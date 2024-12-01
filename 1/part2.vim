"#!/bin/nvim -S
"score -2

read ./puzzle1

let cnt = 0
g/^\d/let cnt += expand("<cword>") *
            \ searchcount(#{pattern: '\s\+' .. expand("<cword>")}).total

echo cnt .. "\n"

w! ./puzzle1.editing
