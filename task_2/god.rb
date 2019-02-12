puts "Введите день "
day = gets.chomp.to_i
while day > 31 || day < 1
  puts "Неверный формат!!! Введите день от 01 до 31 "
  day = gets.chomp.to_i
end

puts "Введите месяц "
month = gets.chomp.to_i
while month > 12 || month < 1
  puts "Неверный формат!!! Введите месяц от 01 до 12 "
  month = gets.chomp.to_i
end

puts "Введите год "
year = gets.chomp.to_i
day_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
if year % 400 == 0 || year % 4 ==0 && year % 100 != 0
  day_in_month[1] += 1
  puts "#{year} - високосный год"
else
  puts "#{year} - обычный год "
end

sum = 0
day_in_month.take(month - 1).each do |days| 
  sum += days
end

sum += day
puts "Порядковый номер даты: #{sum}"
    