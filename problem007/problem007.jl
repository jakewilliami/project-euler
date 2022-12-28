# 10001st prime
# https://projecteuler.net/problem=7
#
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th
# prime is 13.
#
# What is the 10 001st prime number?

using Primes

function solve(i::Int = 10_001)
    return prime(i)
end

function main()
    solution = solve()
    @assert solve(6) == 13
    println("Problem 7 solution: $solution")
end

main()
