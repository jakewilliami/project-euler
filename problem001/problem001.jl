# Multiples of 3 or 5
# https://projecteuler.net/problem=1
#
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6
# and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

function solve(upper::Int = 999)
    ans = 0
    for n in 1:upper
        if iszero(mod(n, 3)) || iszero(mod(n, 5))
            ans += n
        end
    end
    return ans
end

function main()
    solution = solve()
    @assert solve(9) == 23
    println("Problem 1 solution: $solution")
end

main()
