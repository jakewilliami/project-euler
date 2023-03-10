# Counting Sundays
# https://projecteuler.net/problem=19
#
# You are given the following information, but you may prefer to do some research for yourself.
#
#    1 Jan 1900 was a Monday.
#    Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is
#      divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901
# to 31 Dec 2000)?

using Dates

function solve()
    ans = 0
    for d in Date(1901, 1, 1):Month(1):Date(2000, 12, 31)
        ans += dayofweek(d) == 7
    end
    @assert !iszero(ans)
    return ans
end

function main()
    solution = solve()
    println("Problem 19 solution: $solution")
end

main()
