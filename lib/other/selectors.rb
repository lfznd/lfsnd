require_relative 'display'

module Selectors
  include Display

  def select_train
    blank_line
    puts 'Выберите поезд:'
    show_trains
    @trains[gets.to_i - 1]
  end

  def select_route
    blank_line
    puts 'Выберите маршрут:'
    show_routes
    @routes[gets.to_i - 1]
  end

  def select_station
    show_stations
    @stations[gets.to_i - 1]
  end

  def select_carriage(train)
    blank_line
    train.carriages.each.with_index(1) do |carriage, x|
      puts "#{x}. Вагон № #{carriage.number}. Тип вагона: #{carriage.type}.
      Свободно: #{carriage.free_place}. Занято: #{carriage.occupied_place}"
    end
    @carriages[gets.to_i - 1]
  end
end
