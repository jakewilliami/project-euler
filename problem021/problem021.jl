# Amicable numbers
# https://projecteuler.net/problem=21
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are amicable pairs, and each of a and
# b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, and 110;
# therefore, d(220) = 284.  The proper divisors of 284 are 1, 2, 4, 71, and 142; so
# d(284) = 220.
#
# Evaluate the sum of all amicable numbers under 10000.
#
#
# Note: I understand that as amicable numbers come in pairs, it may be more efficient to
# keep track of which onces we've seen and not recompute the pair of an earlier-seen
# amicable number, however this solution runs is a short amount of time so I don't have to
# do this.

using Primes

proper_divisors(n::Int) = reshape(map(prod, Iterators.product((p.^(0:m) for (p, m) in eachfactor(n))...)), :)

d(n::Int) = sum(proper_divisors(n)) - n

function is_amicable(a::Int)
    b = d(a)
    a == b && return false
    return d(b) == a
end

solve() = sum(d(i) for i in 1:(10_000 - 1) if is_amicable(i))

function main()
    solution = solve()
    println("Problem 21 solution: $solution")
end

main()
