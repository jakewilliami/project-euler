# Reciprocal cycles
# https://projecteuler.net/problem=26
#
# A unit fraction contains 1 in the numerator. The decimal representation of the unit
# fractions with denominators 2 to 10 are given:
#
#     ¹/₂	=	0.5
#     ¹/₃	=	0.(3)
#     ¹/₄	=	0.25
#     ¹/₅	=	0.2
#     ¹/₆	=	0.1(6)
#     ¹/₇	=	0.(142857)
#     ¹/₈	=	0.125
#     ¹/₉	=	0.(1)
#     ¹/₁₀	=	0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7
# has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its
# decimal fraction part.
#
#
# Note: I spent a _long_ time doing this naively, with modf and substring comparison.  It
# wasn't until I searched up repeating decimals did I actually find an algotirhm
# (https://www.wikiwand.com/en/Repeating_decimal)

function repeating_decimal(n::Int)
    k = 1
    D = Dict{Int, Int}()
    while true
        r = mod(big(10)^k, n)
        iszero(r) && return 0
        if !haskey(D, r)
            D[r] = k
        else
            return k - D[r]
        end
        k += 1
    end
end

solve() = argmax(repeating_decimal(n) for n in 1:1000)

function main()
    solution = solve()
    println("Problem 26 solution: $solution")
end

main()
