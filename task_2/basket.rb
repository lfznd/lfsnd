basket = {}

loop do
puts "Введите название товара"
tovar = gets.chomp
break if tovar == "стоп"
puts "Введите цену за единицу товара"
tovar_price = gets.chomp.to_f 
puts "Введите колличество товара"
tovar_kol = gets.chomp.to_i
   
 basket[tovar] = { Цена: tovar_price, Колличество: tovar_kol, Итого: (tovar_price * tovar_kol)}
   end

tovar_sum = (0)

puts "Товар в корзине:"

basket.each_key do |key| 

  puts ("#{key} #{basket[key]}")
  
  tovar_sum += basket[key] [:Итого]  

  end

puts "Товара в корзине на сумму #{tovar_sum} р."




