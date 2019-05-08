require_relative ('./station')
require_relative ('./train')
require_relative ('./route')
require_relative ('./passenger')
require_relative ('./cargo')
require_relative ('./carriage')
require_relative ('./car_cargo')
require_relative ('./car_pass')

class Main
  attr_accessor :stations, :trains, :routes, :type, :station

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    loop do
      puts " "
      puts "Введите '1' чтобы создать станцию"  
      puts "Введите '2' чтобы создать поезд"
      puts "Введите '3' чтобы создать маршруты и управлять станциями в нём"
      puts "Введите '4' чтобы назначить маршрут поезду"
      puts "Введите '5' чтобы добавить вагоны к поезду"
      puts "Введите '6' чтобы отцепить вагоны от поезда"
      puts "Введите '7' чтобы перемещать поезд по маршруту"
      puts "Введите '8' чтобы увидеть список станций и список поездов на станции"
      puts "Введите '0' чтобы закончить"
      answer = gets.chomp
      break if answer == "0"
      case answer
      when "1"
        new_station
      when "2"
        new_train
      when "3"
        route_manager
      when "4"
        add_route
      when "5"
        add_carriage
      when "6"
        remove_carriage
      when "7"
        train_move
      when "8"
        show_trains_on_station
      end
    end
  end

  def new_station
    puts "Введите название станции"
    name = gets.chomp
    new_station = Station.new(name)
    @stations.push(new_station)
    puts "Построена станция #{name}"
  end

  def new_train
    puts "Введите тип поезда (cargo / passenger)"
    type = gets.chomp
    puts "Введите номер поезда"
    number = gets.chomp
    if type == "cargo"
      @trains.push(CargoTrain.new(number))
      puts "Создан поезд под номером #{number} грузового типа"
    elsif type == "passenger"
      @trains.push(PassTrain.new(number))
      puts "Создан поезд под номером #{number} пассажирского типа"
    else
      puts "Данного типа поезда не существует"
    end
  end

  def add_carriage
    train = select_train
    if train.type == :cargo
      carriage = CargoCarriage.new
      train.carriages.push(carriage)
      puts "К поезду  №#{train.number} добавлен вагон, всего вагонов у поезда - #{train.carriages.size} " 
    elsif train.type == :passenger
      carriage = PassCarriage.new
      train.carriages.push(carriage)
      puts "К поезду  №#{train.number} добавлен вагон, всего вагонов у поезда - #{train.carriages.size} " 
    else
      puts "Что-то пошло не так :("
    end
  end

  def remove_carriage
    train = select_train
    if speed = 0 && train.carriages.size != 0
      train.carriages.pop
      puts "У поезда  №#{train.number} убран вагон, всего вагонов у поезда - #{train.carriages.size} "
    else
      puts "Нельзя отцепить вагон от поезда если их нет, или поезд в пути"
    end
  end

  def create_route
    puts "Выберите станцию отправления"
    first_station = select_station
    puts "Выберите станцию назначения"
    last_station = select_station
    @new_route = Route.new(first_station, last_station)
    @routes.push(@new_route)
    puts "Создан маршрут от станции #{first_station.name} до станции #{last_station.name}"
  end

  def add_station_to_route
    route = select_route
    puts "Выберите станцию"
    station = select_station
    route.add_station(station)
    puts "Станция #{station.name} добавлена к маршруту"
  end

  def remove_station_from_route
    puts "Выберите станцию"
    station = select_station
    if station == routes.first || station == routes.last
      puts "Нельзя удалить начальную и конечную станции"
    elsif @routes.include?(station)
      @routes.delete(station)
      puts "Станция #{station.name} удалена из маршрута"
    else
      puts "Данной станции нет в маршруте"
    end
  end

  def route_manager
    loop do
      puts " "
      puts "Введите '1' чтобы создать маршрут"
      puts "Введите '2' чтобы добавить станцию в маршрут"
      puts "Введите '3' чтобы удалить станцию из маршрута" 
      puts "Введите '4' чтобы посмотреть маршрут"
      puts "Введите '0' вернуться в меню"
      answer = gets.chomp
      break if answer == "0"
      case answer
      when '1'
        create_route
      when '2'
        add_station_to_route
      when '3'
        remove_station_from_route
      when '4'
        show_routes
      end
    end
  end

  def show_trains
    @trains.each.with_index(1) { |train, x| puts "#{x}. #{train.number}" }
  end

  def show_routes
    @routes.each.with_index(1) { |route, x| print "#{x}. #{route.stations} \n" }
  end

  def show_stations
    @stations.each.with_index(1) { |station, x| puts "#{x}. #{station.name}" }
  end

  def show_train_route
    train = select_train
    puts "Маршрут = #{train.route.stations}"
  end

  def show_trains_on_station
    puts "Выберите станцию"
    station = select_station
    puts "Поезда на станции:"
    station.show_trains
  end

  def select_train
    puts "Выберите поезд:"
    show_trains
    @trains[gets.to_i - 1]
  end

  def select_route
    puts "Выбирете маршрут: \n"
    show_routes
    @routes[gets.to_i - 1]
  end

  def select_station
    show_stations
    @stations[gets.to_i - 1]
  end

  def add_route
    route = select_route
    train = select_train
    train.add_route(route)
    puts "К поезду №#{train.number} добавлен маршрут от станции #{route.first_station.name} до станции #{route.last_station.name}"
  end

  def train_move
    train = select_train
    loop do
      puts "Введите '1' чтобы отправить поезд на следующую станцию"
      puts "Введите '2' чтобы отправить поезд на предыдущую станцию" 
      puts "Введите '3' чтобы вернуться в меню"
      case gets.to_i
      when 1
        train.move_next
        puts "Станция - #{train.station.name}"
        puts "Следующая станция - #{train.next_station.name}" if train.next_station != nil
      when 2
        train.move_previous
        puts "Станция - #{train.station.name}"
        puts "Следующая станция - #{train.previous_station.name}" if train.previous_station != nil
      when 3
        break
      else
        "Введите верное значение"
      end
    end
  end
end

test = Main.new
test.menu
