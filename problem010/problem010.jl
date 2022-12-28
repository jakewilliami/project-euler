# Summation of primes
# https://projecteuler.net/problem=10
#
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million

using Primes

function solve(upper::Int = 2_000_000)
    return sum(primes(upper))
end

function main()
    solution = solve()
    @assert solve(10) == 17
    println("Problem 10 solution: $solution")
end

main()
