# Longest Collatz sequence
# https://projecteuler.net/problem=14
#
# The following iterative sequence is defined for the set of positive integers:
#
#   n → n ÷ 2 (n is even)
#   n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting
# numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# Note that once the chain starts the terms are allowed to go above one million.
#
#
# Note: I created a struct for the Collatz sequence and implemented some of the iterator
# interface, as I always get confused when implementing this interface in Julia, and need
# more practice!

struct CollatzSequence
    start::Integer  # start of the sequence
    P::Integer      # modulus used to divide n if and only if n is equivalent to 0 mod P
    a::Integer      # factor by which to multiply n
    b::Integer      # value to add to the scaled value of n

    function CollatzSequence(start::Integer, P::Integer, a::Integer, b::Integer)
        return new(start, P, a, b)
    end
end

CollatzSequence(start::T) where {T <: Integer} = CollatzSequence(start, 2, 3, 1)

Base.iterate(C::CollatzSequence) = C.start, C.start
function Base.iterate(::CollatzSequence, prev::T) where {T <: Integer}
    isone(prev) && return nothing
    next = iszero(mod(prev, 2)) ? prev ÷ 2 : 3prev + 1
    return next, next
end

Base.length(C::CollatzSequence) = sum(1 for _ in C)

function solve()
    max_len, ans = 0, 0
    for n in 1:(1_000_000 - 1)
        len = length(CollatzSequence(n))
        if len > max_len
            max_len = len
            ans = n
        end
    end
    @assert !iszero(ans)
    return ans
end

function main()
    solution = solve()
    @assert length(CollatzSequence(13)) == 10
    println("Problem 14 solution: $solution")
end

main()
