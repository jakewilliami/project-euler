# 1000-digit Fibonacci number
# https://projecteuler.net/problem=25
#
# The Fibonacci sequence is defined by the recurrence relation:
#
#     Fₙ = Fₙ₋₁ + Fₙ₋₂, where F₁ = 1 and F₂ = 1.
#
# Hence the first 12 terms will be:
#
#     F₁ = 1
#     F₂ = 1
#     F₃ = 2
#     F₄ = 3
#     F₅ = 5
#     F₆ = 8
#     F₇ = 13
#     F₈ = 21
#     F₉ = 34
#     F₁₀ = 55
#     F₁₁ = 89
#     F₁₂ = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
#
#
# Note: I am using Combinatoric's implementation of getting the nᵗʰ Fibonacci number, as it
# uses an optimised C implementation (libgmp) which I didn't want to write myself.  (If you
# want to write this yourself, see [here](https://discourse.julialang.org/t/18123/5).)

using Combinatorics

function solve(m::Int = 1000)
    n = 1
    while true
        Fₙ =  fibonaccinum(n)
        ndigits(Fₙ) >= m && return n
        n += 1
    end
end

function main()
    solution = solve()
    @assert solve(3) == 12
    println("Problem 25 solution: $solution")
end

main()
