# Number letters count
# https://projecteuler.net/problem=17
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there
# are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many
# letters would be used in total?
#
# Do not count spaces or hyphens.  For example, 342 (three hundred and forty-two) contains
# 23 letters, and 115 (one hundred and fifteen) contains 20 letters.  The use of "and" when
# writing out numbers is in compliance with British usage.
#
#
# Note: nice that I get to use my own package to solve this!

using SpelledOut

function spelled_out_length(n::Int)
    s = spelled_out(n, lang = :en_GB)
    return sum(1 for c in s if c != ' ' && c != '-')
end

function solve(upper::Int = 1000)
    ans = 0
    for n in 1:upper
        ans += spelled_out_length(n)
    end
    return ans
end

function main()
    solution = solve()
    @assert solve(5) == 19
    @assert spelled_out_length(342) == 23
    @assert spelled_out_length(115) == 20
    println("Problem 17 solution: $solution")
end

main()
