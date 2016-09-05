def mod_exp(n, e, mod)
  fail ArgumentError, 'negative exponent' if e < 0
  prod = 1
  base = n % mod
  until e.zero?
    prod = (prod * base) % mod if e.odd?
    e >>= 1
    base = (base * base) % mod
  end
  prod
end

def miller_rabin_prime?(n, g)
  d = n - 1
  s = 0
  while d % 2 == 0
    d /= 2
    s += 1
  end
  g.times do
    a = 2 + rand(n - 4)
    x = mod_exp(a, d, n) # x = (a**d) % n
    next if x == 1 || x == n - 1
    for r in (1..s - 1)
      x = mod_exp(x, 2, n) # x = (x**2) % n
      return false if x == 1
      break if x == n - 1
    end
    return false if x != n - 1
  end
  true # probably
end

puts miller_rabin_prime?(123, 20)