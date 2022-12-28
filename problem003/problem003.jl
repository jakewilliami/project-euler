# Largest prime factor
# https://projecteuler.net/problem=3
#
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143?

using Primes

function solve()
    return first(maximum(factor(600851475143)))
end

function main()
    solution = solve()
    @assert all(n ∈ keys(factor(13195)) for n in (5, 7, 13, 29))
    println("Problem 3 solution: $solution")
end

main()
