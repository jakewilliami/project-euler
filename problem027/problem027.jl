# Quadratic primes
# https://projecteuler.net/problem=27
#
# Euler discovered the remarkable quadratic formula:
#    n² + n + 41
#
# It turns out that the formula will produce 40 primes for the consecuritve integer values
# 0 ≤ n ≤ 39.  However, when n = 40, 40² + 40 + 41 = 40⋅(40 + 1) + 41 is divisible by 41,
# and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 441.
#
# The incredible formula n² - 79n + 1601 was discovered, which produces 80 primes for the
# consecutive gvalues 0 ≤ b ≤ 79.  The produce of the coefficients, −79 and 106, is −126479.
#
# Considering quadratics of the form:
#   n² + aan + b, where |a| < 1000 and |b| < 1000
#   where |n| is the modulus/absolute value of n
#   e.g., |11| = 11 and |-4| = 4
#
# Find the product of the coefficients, a and b, for the quadratic expression that produces
# the maximum number of primes for consecutive values of n, starting with n = 0.

using JuMP, HiGHS

function solve()
    model = Model(HiGHS.Optimizer)

end

function main()
    solution = solve()
    println("Problem 27 solution: $solution")
end

main()
