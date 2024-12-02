"score: -29
read ./input
1d

let i = 1
for line in getline("1", "$")
    let data = split(line, " ")
    let last = str2nr(data[0])

    let inc = str2nr(data[1]) > last ? 'inc' : 'dec'

    let success = v:true

    for nr in data[1:]
        let n = str2nr(nr)
        let diff = n - last

        if inc ==# 'dec' | let diff *= -1 | endif

        if diff <= 0 || diff > 3
            let success = v:false
            break
        endif

        let last = n
    endfor

    call setline(i, line .. ' ' .. success)

    let i += 1
endfor

redir => count
%s/true//n
redir END

call feedkeys("\<CR>")

call append("$", count)
norm! G0xelDO---ANS---
