=begin

 F_0 = 0, 
 F_1 = 1, 
 F_n = F_{n-1} + F_{n-2}. 

=end

fib = [0,1]

sum = 0

loop do
  fib_zero = fib[-1] + fib[-2] 
  break if fib_zero >= 100
  fib << fib_zero
  sum += 1
  end

puts fib

