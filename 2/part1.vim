"score: -17
read ./input
1d

fun CkLine(line)
    let data = split(a:line, " ")->map('str2nr(v:val)')
    let last = data[0]

    let inc = data[1] > last ? 'inc' : 'dec'

    for nr in data[1:]
        let n = nr
        let diff = inc ==# 'dec' ? last - n : n - last

        if diff <= 0 || diff > 3
            return v:false
        endif

        let last = n
    endfor

    return v:true
endfun

%s/^.*$/\=CkLine(submatch(0)) ? '1 +' : '0 +'
%join
1!sed 's/+$//' | bc
