# Power digit sum
# https://projecteuler.net/problem=16
#
# 2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2¹⁰⁰⁰?
#
#
# Note: once again, there is likely a better way to do this, except it ran efficiently the 
# naïve way so that's the way I solved it...


function solve(n::Int = 1000)
    m = big(2)^n
    return sum(digits(m))
end

function main()
    solution = solve()
    @assert solve(15) == 26
    println("Problem 16 solution: $solution")
end

main()
