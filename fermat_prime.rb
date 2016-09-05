# Calculate a ^ (n - 1) mod n
def mod_exp(a, n)
  base = a
  c = 1
  (n - 1).times do
    c = (c * base) % n
  end
  c
end

def is_prime?(n, k = 20)
  return true if n < 2
  k.times do
    rand_gen = Random.new
    a = rand_gen.rand(2..n-2)
    return false if mod_exp(a, n) != 1
  end
  return true
end

puts is_prime?(7)