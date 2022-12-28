# Smallest multiple
# https://projecteuler.net/problem=5
#
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
# without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1
# to 20?
#
# Note: this takes a minute to run.  There must be a better way...

function solve(upper::Int = 20)
    n = 1
    while true
        all(iszero(mod(n, m)) for m in 1:upper) && return n
        n += 1
    end
end

function main()
    solution = solve()
    @assert solve(10) == 2520
    println("Problem 5 solution: $solution")
end

main()
