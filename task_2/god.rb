=begin
Находим суммарное количество дней за месяцы, 
предшествующие указанному. Так, если месяц равен 3-м, 
то надо сложить количество дней за первый и второй месяц.
Добавляем к найденной сумме количество дней в указанном месяце. 
Так, если было указан 10-й день 3-го месяца, то надо 
к сумме дней первых двух месяцев прибавить 10.
Если год високосный, то надо добавить один день, 
если месяц больше 2-го. Високосный год - это год, который делится 
на 4, но если он делится на 100, то должен делиться и на 400. 
Например, 1900 год - невисокосный, а 2000 - високосный, все года между ними, 
делящиеся на 4, - високосные.


=end









puts "Введите день "
d = gets.chomp.to_i
while
d > 31 || d < 1
puts "Неверный формат!!! Введите день от 01 до 31 "
d = gets.chomp.to_i 
end


puts "Введите месяц "
m = gets.chomp.to_i   #как сделать проверку вводу только числа?
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
for i in 0..m - 2 do # -2 я определил методом научного тыка
sum += dm[i]
end
sum += d
puts "Порядковый номер даты: #{sum}"



