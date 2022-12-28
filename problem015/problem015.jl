# Lattice paths
# https://projecteuler.net/problem=15
#
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right
# and down, there are exactly 6 routs to the bottom right corner:
#   - Right, right, down, down;
#   - Right, down, right, down;
#   - Right, down, down, right;
#   - Down, right, right, down;
#   - Down, right, down, right; and
#   - Down, down, right, right.
#
# How many such routes are there through a 20×20 grid?
#
#
# Note: I am thinking of it this way: how many unique ways are there to move across n
# positions and down n positions in an n×n grid?  Because the grid is square, we know we
# must move the same number of positions across as we do down.  Overall, we have 2n moves.
# From there, we can simply calculate the length of the multiset permutation (permutation
# with duplicate elements).

using Combinatorics

@enum Move right=0 down n_moves

function solve(n::Int = 20)
    moves = (Move(mod(i, Int(n_moves))) for i in 1:2n)
    return length(multiset_permutations(moves, 2n))
end

function main()
    solution = solve()
    @assert solve(2) == 6
    println("Problem 15 solution: $solution")
end

main()
