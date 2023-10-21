# Names scores
# https://projecteuler.net/problem=22
#
# Using [names.txt](https://projecteuler.net/project/resources/p022_names.txt), a 46K text
# file containing over five-thousand first names, begin by sorting it into alphabetical
# order. Then working out the alphabetical value for each name, multiply this value by its
# alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15
# + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 ×
# 53 = 49714.
#
# What is the total of all the name scores in the file?

parse_input(data_file::String) = sort(String[s[2:(end - 1)] for s in eachsplit(readchomp(data_file), ',')])

score(c::Char) = Int(c - 65 + 1)
score(i::Int, s::S) where {S <: AbstractString} = i * sum(score(c) for c in s)

function solve(data::Vector{String})
    return sum(score(i, n) for (i, n) in enumerate(data))
end

function main()
    data = parse_input("p022_names.txt")
    @assert score(findfirst(==("COLIN"), data), "COLIN") == 49714
    solution = solve(data)
    println("Problem 22 solution: $solution")
end

main()
