# Largest palindrome product
# https://projecteuler.net/problem=4
#
# A palindromic number reads the same both ways. The largest palindrome made from the
# product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
#
# Note: see also:
# https://github.com/jakewilliami/scripts/tree/master/julia/Other/IntegralPalindromes.jl


function solve(R::UnitRange{Int} = 100:999)
    ans = 0
    for n in R, m in R
        p = n * m
        s = string(p)
        if s == reverse(s) && p > ans
            ans = p
        end
    end
    @assert !iszero(ans)
    return ans
end

function main()
    solution = solve()
    @assert solve(10:99) == 9009
    println("Problem 4 solution: $solution")
end

main()
