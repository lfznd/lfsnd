basket = {}

loop do
puts "Введите название товара"
product = gets.chomp
break if product == "стоп"

puts "Введите цену за единицу товара"
product_price = gets.chomp.to_f 

puts "Введите колличество товара"
product_qty = gets.chomp.to_i
basket[product] = { price: product_price, quantity: product_qty }
end


total_price = 0


puts "Товар в корзине:"
basket.each do |key, value| 
puts ("#{key} #{basket[key]}") 
total_price += value[:price] * value[:quantity]
end

puts "Товара в корзине на сумму #{total_price}."
