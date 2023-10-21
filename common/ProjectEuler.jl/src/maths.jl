module Mathematics

using Nemo
using Primes

σ(n::Int) = iszero(n) ? 0 : Nemo.divisor_sigma(fmpz(n), 1) - n
is_abundant(n::Int) = σ(n) > n

# σ(n::Int) = sum(map(prod, Iterators.product((p.^(0:m) for (p, m) in eachfactor(n))...)))
# is_abundant′(n::Int) = σ(n) > 2n

function proper_divisors(n::Int)
    A = reshape(map(prod, Iterators.product((p.^(0:m) for (p, m) in eachfactor(n))...)), :)
    sort!(A)
    deleteat!(A, length(A))
    return A
end

# is_abundant(n::Int) = sum(proper_divisors(n)) > n

end
