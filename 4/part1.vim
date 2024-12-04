"score -20
read input
1d
let lineLength = len(getline("1"))
let total = searchcount(#{pattern: 'XMAS', maxcount: 0}).total
let total += searchcount(#{pattern: 'SAMX', maxcount: 0}).total

let text = "XMAS"
for i in range(1, lineLength + 1)
    let vert = ""
    let vertBackwards = ""
    let diagLTR = ""
    let diagBackwardsLTR = ""
    let diagRTL = ""
    let diagBackwardsRTL = ""

    for j in range(4)
        let vert ..= '\%' ..  i .. 'c' .. text[j] .. '.*$\n.*'
        let vertBackwards ..= '\%' .. i .. 'c'
                    \ .. text[len(text) - j - 1] .. '.*$\n.*'

        let diagLTR ..= '\%' .. (i + j) .. 'c' .. text[j] .. '.*$\n.*'
        let diagBackwardsLTR ..= '\%' .. (i + j) 
                    \ .. 'c' .. text[len(text) - j - 1] .. '.*$\n.*'

        let diagRTL ..= '\%' ..  (i - 1 + (4 - j)) 
                    \ .. 'c' .. text[j] .. '.*$\n.*'
        let diagBackwardsRTL ..= '\%' .. (i - 1 + (4 - j)) 
                    \ .. 'c' .. text[len(text) - j - 1] .. '.*$\n.*'
    endfor

    let total += searchcount(#{pattern: vert, maxcount: 0}).total
    let total += searchcount(#{pattern: vertBackwards, maxcount: 0}).total
    let total += searchcount(#{pattern: diagLTR, maxcount: 0}).total
    let total += searchcount(#{pattern: diagRTL, maxcount: 0}).total
    let total += searchcount(#{pattern: diagBackwardsLTR, maxcount: 0}).total
    let total += searchcount(#{pattern: diagBackwardsRTL, maxcount: 0}).total
endfor

call append("$", string(total))
$

w! input.solved
