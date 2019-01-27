puts "a"
a = gets.to_i

puts "b"
b = gets.to_i

puts "c"
c = gets.to_i

d = b**2 - 4 * a * c

if d > 0
  sq = Math.sqrt(d)
  x_1 = (-b + sq) / (2 * a)
  x_2 = (-b - sq) / (2 * a)
  puts "x1 =#{x_1.to_i} x2 =#{x_2.to_i}, дискриминант #{d}"
elsif d == 0
  x = -b / (2 * a)
  puts "x =#{x}, дискриминант #{d}"
elsif d < 0
  puts "Корней нет, дискриминант #{d}"
else 
	puts "Error!!!"

end 
 