# Non-abundant sums
# https://projecteuler.net/problem=23
#
# A perfect number is a number for which the sum of its proper divisors is exactly equal to
# the number.  For example, the sum of a proper divisors for 28 would be 1 + 2 + 4 + 7 + 14
# = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is
# called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that
# can be written as the sum of two abundant numbers is 24.  By mathematical analysis, it can
# be shown that all integers greater than 28123 can be written as the sum of two abundant
# numbers.  However, this upper limit cannot be reduced any further by analysis even though
# it is known that the greatest number that cannot be expressed as the sum of two abundant
# numbers is less than this limit.
#
# Find the sum of all the positive inteegers which cannot be written as the sum of two
# abundant numbers.
#
#
# Note: this is not the first time in these Euler problems I am using proper divisors.  This
# time, I use Nemo.jl to get the sum of divisors, however it would be easy enough to use
# Primes.jl as I have been previously doing, too.

using Nemo

σ(n::Int) = iszero(n) ? 0 : Nemo.divisor_sigma(fmpz(n), 1)
is_abundant(n::Int) = σ(n) > 2n

const ALL_ABUNDANT_SUMS_LOWER_BOUND = 28_123 + 1
const SMALL_ABUNDANT_NUMBERS =
    Set{Int}(i for i in 1:(ALL_ABUNDANT_SUMS_LOWER_BOUND - 1) if is_abundant(i))

is_abundant_sum(n::Int) =
    any(i ∈ SMALL_ABUNDANT_NUMBERS && (n - i) ∈ SMALL_ABUNDANT_NUMBERS for i in 1:n)

function solve()
    ans = 0
    for i in 1:(ALL_ABUNDANT_SUMS_LOWER_BOUND - 1)
        if !is_abundant_sum(i)
            ans += i
        end
    end
    @assert !iszero(ans)
    return ans
end

function main()
    solution = solve()
    println("Problem 23 solution: $solution")
end

main()
