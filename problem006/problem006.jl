# Sum square difference
# https://projecteuler.net/problem=6
#
#
# The sum of the squares of the first ten natural numbers is,
#
#   1² + 2² + … + 10² = 385
#
# The square of the sum of the first ten natural numbers is,
#
#   (1 + 2 + … + 10)² = 55² = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and
# the square of the sum is
#
#   4025 − 385 = 2640
#
# Find the difference between the sum of the squares of the first one hundred natural
# numbers and the square of the sum.

function solve(upper::Int = 100)
    sum_of_squares = sum(n^2 for n in 1:upper)
    square_of_sum = sum(1:upper)^2
    return square_of_sum - sum_of_squares
end

function main()
    solution = solve()
    @assert solve(10) == 2640
    println("Problem 6 solution: $solution")
end

main()
