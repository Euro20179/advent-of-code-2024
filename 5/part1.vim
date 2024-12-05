read input
let rules = {}
let divider = search("^$", "n")
for line in getline("1",  divider - 1)
    let rule = split(line, "|")->map('str2nr(v:val)')
    let l = get(rules, rule[0], [])
    let l = add(l, rule[1])
    let rules[rule[0]] = l
endfor

let validLines = []

for line in getline(divider + 1, "$")
    let numbers = split(line, ",")->map("str2nr(v:val)")

    if len(numbers) == 0
        continue
    endif

    let valid = 1
    for i in range(len(numbers) - 1)
        let n = numbers[i]

        try
            let nRules = rules[n]
        catch /E716/
            let valid = 0
            break
        endtry

        for next in range(i + 1, len(numbers) - 1)
            let next = numbers[i + 1]

            if index(nRules, next) == -1
                let valid = 0
                break
            endif
        endfor

        if valid == 0
            break
        endif
    endfor

    if valid
        let validLines = add(validLines, line)
    endif
endfor

1,$d

for line in validLines
    call append(1, line)
endfor
1d

let i = 1
for line in getline("1", "$")
    let numbers = split(line, ",")
    call setline(i, numbers[len(numbers) / 2])
    let i += 1
endfor

%s/^.\+\(\%$\)\@!\_$/&+
%join
.!bc
