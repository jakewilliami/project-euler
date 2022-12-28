# Special Pythagorean triplet
# https://projecteuler.net/problem=9
#
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#   a² + b² = c²
#
# For example, 3² + 4² = 9 + 16 = 25 = 5².
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product a⋅b⋅c.
#
#
# Note: my soltution hard codes the promitive Pythagorean triplets, and uses the property
# that if (a, b, c) is a Pythagorean triplet, then (k⋅a, k⋅b, k⋅c) is also a Pythagorean
# triplet for any k ∈ ℕ, by looking for multiples of the primitive triplets that sum to the
# goal (1000).  I figured that any non-primitive Pythagorean triplets would have sums too
# large to care about, but I guess I am luck in that sense.

# There are 16 primitive Pythagorean triplets of numbers up to 100:
# https://www.wikiwand.com/en/Pythagorean_triple#Examples
const PRIMITIVE_PYTHAGOREAN_TRIPLETS = (
       (3, 4, 5),  (5, 12, 13),  (8, 15, 17),  (7, 24, 25),
    (20, 21, 29), (12, 35, 37),  (9, 40, 41), (28, 45, 53),
    (11, 60, 61), (16, 63, 65), (33, 56, 65), (48, 55, 73),
    (13, 84, 85), (36, 77, 85), (39, 80, 89), (65, 72, 97),
)

function solve()
    for t in PRIMITIVE_PYTHAGOREAN_TRIPLETS
        m = 1
        while true
            t′ = t .* m
            s = sum(t′)
            s > 1000 && break
            s == 1000 && return prod(t′)
            m += 1
        end
    end
    error("unreachable (hopefully)")
end

function main()
    solution = solve()
    println("Problem 9 solution: $solution")
end

main()
