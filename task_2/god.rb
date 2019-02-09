puts "Введите день "
d = gets.chomp.to_i
while
d > 31 || d < 1
puts "Неверный формат!!! Введите день от 01 до 31 "
d = gets.chomp.to_i 
end


puts "Введите месяц "
m = gets.chomp.to_i  
while
m > 12 || m < 1
puts "Неверный формат!!! Введите месяц от 01 до 12 "
m = gets.chomp.to_i 
end



puts "Введите год"
y = gets.chomp.to_i
dm = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
if y % 400 == 0 || y % 4 ==0 && y % 100 != 0
dm[1] += 1
puts "#{y} - високосный год "
else
puts "#{y} - обычный год "
end


sum = 0
for i in 0..m - 2 do 
sum += dm[i]
end
sum += d
puts "Порядковый номер даты: #{sum}"



