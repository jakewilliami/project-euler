# Maximum path sum I
# https://projecteuler.net/problem=18
#
# By starting at the top of the triangle below and moving to adjacent numbers on the row
# below, the maximum total from top to bottom is 23.
#
#      𝟛
#     𝟟 4
#    2 𝟜 6
#   8 5 𝟡 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in the triangle below:
#                75
#               95 64
#              17 47 82
#             18 35 87 10
#            20 04 82 47 65
#           19 01 23 75 03 34
#          88 02 77 73 07 63 67
#         99 65 04 28 06 16 70 92
#        41 41 26 56 83 40 80 70 33
#       41 48 72 33 47 32 37 16 94 29
#      53 71 44 65 25 43 91 52 97 51 14
#     70 11 33 28 77 73 17 78 39 68 17 57
#    91 71 52 38 17 14 91 43 58 50 27 29 48
#   63 66 04 68 89 53 67 30 73 16 69 87 40 31
#  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
# Note that as there are only 1634 routes, it is possible to solve the problem by trying
# every route.  However, problem 67 is the same challenge with a triangle containing one-
# hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)
#
#
# Note: from the example, it looks like you can simply choose the largest adjacent number in
# the next row until you get to the bottom.  However, I tested this method and it was not
# the correct answer, so I did just brute force it using a DFS...

using DataStructures

function parse_triangle(s::String)
    V = []
    for line in eachsplit(s, '\n')
        W = parse.(Int, split(line))
        push!(V, W)
    end
    return V
end

const S = """\
                  75
                 95 64
                17 47 82
               18 35 87 10
              20 04 82 47 65
             19 01 23 75 03 34
            88 02 77 73 07 63 67
           99 65 04 28 06 16 70 92
          41 41 26 56 83 40 80 70 33
         41 48 72 33 47 32 37 16 94 29
        53 71 44 65 25 43 91 52 97 51 14
       70 11 33 28 77 73 17 78 39 68 17 57
      91 71 52 38 17 14 91 43 58 50 27 29 48
     63 66 04 68 89 53 67 30 73 16 69 87 40 31
    04 62 98 27 23 09 70 98 73 93 38 53 60 04 23\
"""

const TRIANGLE = parse_triangle(S)

function solve()
    S = Stack{Vector{Tuple{Int, Int}}}()  # Queue contains path of is and js
    push!(S, Tuple{Int, Int}[(1, 1)])
    ans = 0

    # Perform DFS on triangle
    while !isempty(S)
        P = pop!(S)
        i, j = last(P)

        # If we are near the end of the triangle, don't push
        if i < length(TRIANGLE)
            push!(S, vcat(P, (i + 1, j)))
            push!(S, vcat(P, (i + 1, j + 1)))
            continue
        end

        # Otherwise, we can check if this path is maximal
        ans = max(ans, sum(TRIANGLE[i′][j′] for (i′, j′) in P))
    end

    @assert !iszero(ans)
    return ans
end

function main()
    solution = solve()
    println("Problem 18 solution: $solution")
end

main()
