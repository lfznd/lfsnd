require_relative "station"
require_relative "route"
require_relative "train"
require_relative "cargo_train"
require_relative "pass_train"
require_relative "carriage"
require_relative "cargo_car"
require_relative "pass_car"


class Control 


  attr_accessor :route, :station

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  
  def choice
    loop do 
      puts "Выберите действие"
      puts "Нажмите 1, чтобы создать станцию"
      puts "Нажмите 2, чтобы создать поезд"
      puts "Нажмите 3, чтобы создавать маршруты и управлять станциями в нем (добавлять, удалять)"
      puts "Нажмите 4, назначить маршрут поезду"
      puts "Нажмите 5, чтобы добавить вагон к поезду"
      puts "Нажмите 6, чтобы отцепить вагон от поезда"
      puts "Нажмите 7, чтобы перемещать поезд по маршруту вперед и назад"
      puts "Нажмите 8, чтобы просматривать список станций и список поездов на станции"
      puts "Нажмите 0, чтобы выйти"
      action = gets.chomp 
      break if action == "0"
      case action
      when "1"
        create_station
      when "2"
        new_train
      when "3"
        create_route
      when "4"
        add_route
      when "5"
        add_carriage
      when "6"
        remove_carriage
      when "7"
        move_train
      when "8"
        show_list
      end
    end
  end

  def create_station
    puts "Введи назывние станции"
    name = gets.chomp
    station = Station.new(name)
    @stations.push(station)
    puts "Создана станция #{name}"
  end

  def new_train
    puts "Введите тип поезда (cargo / pass)"
    type = gets.chomp
    puts "Введите номер поезда"
    number = gets.chomp
    if type == "cargo"
      @trains.push(CargoTrain.new(number))
      puts "Создан поезд под номером #{number} типа #{type}"
    elsif type == "pass"
      @trains.push(PassTrain.new(number))
      puts "Создан поезд под номером #{number} типа #{type}"
    else
      puts "Данного типа поезда не существует"
    end
  end

  def create_route
    loop do
      puts "Выберите действие"
      puts "Нажмите 1, чтобы создать маршрут"
      puts "Нажмите 2, чтобы добавить станцию в маршрут"
      puts "Нажмите 3, чтобы удалить станцию из маршрута"
      puts "Нажмите 0, чтобы вернуться в главное меню"
      action = gets.chomp 
      break if action == "0"
      case action
      when "1"
        create_new_route
      when "2"
        add_station_to_route
      when "3"
        remove_station_from_route
      end
    end
  end

  def create_new_route
    puts "Укажите первую станцию в маршруте"
    first_station = gets.chomp
    puts "Укажите последнюю станцию в маршруте"
    last_station = gets.chomp
    @route = Route.new(first_station, last_station)
    @routes.push(@route)
    puts "Создан маршрут от #{first_station} до #{last_station}"
  end

  def add_station_to_route
    puts "Какую станцию добавить в маршрут?"
    station = gets.chomp
    @routes = @route.add_station(station)
    puts "К маршруту добавлена станция #{station}" 
  end

  def remove_station_from_route
    puts "Какую станцию удалить из маршрута?"
    station = gets.chomp
    @routes.delete(station)
    puts "Из маршрута удалена станция #{station}"     
  end

  def add_route
    train = select_train
    route = select_route
    train.route == route
    puts "К поезду №#{train.number} добавлен маршрут от станции #{route.stations.first} до станции #{route.stations.last}"
  end

  def show_routes
    @routes.each.with_index(1) { |route, x| puts "#{x}. #{route.stations}" }
    #undefined method `stations' for "#station name":String // При последующем добавлении станций в маршрут
  end

  def select_route
    puts "выберите маршрут:"
    show_routes
    @routes[gets.to_i - 1]
  end

  def select_train
    puts "выберите поезд:"
    show_trains
    @trains[gets.to_i - 1]
  end

  def show_trains
    @trains.each.with_index(1) { |train, x| print "#{x}. #{train.number} \n" }
  end

  def add_carriage
    train = select_train
    if train.type == "cargo"
      carriage = CargoCar.new
      train.carriages.push(carriage)
      puts "К поезду №#{train.number} добавлен вагон, всего вагонов у поезда - #{train.carriages.size} " 
    elsif train.type == "pass"
      carriage = PassCar.new
      train.carriages.push(carriage)
      puts "К поезду №#{train.number} добавлен вагон, всего вагонов у поезда - #{train.carriages.size} " 
    else
      puts "Что-то пошло не так :("
    end
  end
 
  def remove_carriage
    train = select_train
    if speed = 0 && train.carriages.size != 0
      train.carriages.pop
      puts "У поезда №#{train.number} убран вагон, всего вагонов у поезда - #{train.carriages.size} "
    else
      puts "Нельзя отцепить вагон от поезда если их нет, или поезд в пути"
    end
  end
  
  def move_train    
  end

  def show_list
  end
end

control = Control.new
control.choice



=begin
  - Создавать станции 
  - Создавать поезда
  - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  - Назначать маршрут поезду
  - Добавлять вагоны к поезду
  - Отцеплять вагоны от поезда
  - Перемещать поезд по маршруту вперед и назад
  - Просматривать список станций и список поездов на станции
=end




