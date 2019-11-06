module Display
  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. Поезд №#{train.number}, тип - #{train.type}"
      puts "Количество вагонов - #{train.carriages.count}"
    end
  end

  def show_stations
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end

  def show_train_route
    train = select_train
    puts "Маршрут = #{train.route.stations}"
  end

  def show_train_carriages(train)
    blank_line
    puts "Вагоны поезда №#{train.number}:" unless train.carriages.nil?
    train.carriages.each.with_index(1) do |carriage, _index|
      carriage_info(carriage)
      blank_line
    end
  end

  def carriage_info(carriage)
    output_info = place_info(carriage.type)
    puts "Вагон номер: #{carriage.number}"
    puts "#{output_info[:free_place]}: #{carriage.free_place}"
    puts "#{output_info[:occupied_place]}: #{carriage.occupied_place}"
  end

  def trains_on_station
    @stations.each do |station|
      if !station.trains.empty?
        trains = []
        puts "Станция: #{station.name}"
        puts 'Поезда на станции:'
        station.trains.each do |train|
          trains << train
          show_trains
          blank_line
        end
      else
        puts "Станция: #{station.name}"
        puts '- Поездов нет.'
        blank_line
      end
    end
  end

  def display_menu(*options, extra_lines)
    blank_line
    puts 'Введите: '
    num = 1
    options[0].each do |option|
      puts "#{num} - #{option}"
      num += 1
    end

    puts '0 - для выхода в главное меню' if extra_lines
    print '> ' if extra_lines
  end

  def blank_line
    puts ''
  end

  def enter_another_value
    puts 'Введите другое значение'
    blank_line
  end
end
