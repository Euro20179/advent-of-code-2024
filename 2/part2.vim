read ./input
$d

fun s:checkLine(data)
    let increasing = 1
    let decreasing = 1
    for j in range(len(a:data) - 1)
        if a:data[j + 1] == a:data[j]
            return v:false
        endif
        if a:data[j + 1] < a:data[j]
            let increasing = 0
        endif
        if a:data[j + 1] > a:data[j]
            let decreasing = 0
        endif
        if abs(a:data[j + 1] - a:data[j]) > 3
            return v:false
        endif
    endfor
    return increasing == 1 || decreasing == 1
endfun

let i = 1
for line in getline("1", "$")
    let data = split(line, " ")->map("str2nr(v:val)")

    let y = v:false
    for k in range(len(data))
        let copy = copy(data)
        call remove(copy, k)
        if s:checkLine(copy)
            let y = v:true
            break
        endif
    endfor

    call setline(i, line .. ' ' .. y)
    let i += 1
endfor

redir => count
%s/true//n
redir END

call feedkeys("\<CR>")

call append("$", count)
norm! G0xelDO---ANS---
