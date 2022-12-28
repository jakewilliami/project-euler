# Factorial digit sum
# https://projecteuler.net/problem=20
#
# n! means n × (n - 1) × … × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × … × 3 × 2 × 1 = 3628800, and the sum of the digits in the
# number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

function solve(n::Int = 100)
    return sum(digits(factorial(big(n))))
end

function main()
    solution = solve()
    @assert solve(10) == 27
    println("Problem 20 solution: $solution")
end

main()
