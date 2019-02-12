fib = [0,1]

while (fib_zero = fib[-1] + fib[-2]) < 100
  fib << fib_zero
end

puts fib
  