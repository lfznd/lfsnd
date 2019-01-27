puts "Как тебя зовут?"
name = gets.chomp.capitalize!


puts "Какой у тебя рост? "
height = gets.to_i
ideal_ves = height - 110

if ideal_ves < 0
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, Ваш идеальный вес: #{ideal_ves}"

end 
