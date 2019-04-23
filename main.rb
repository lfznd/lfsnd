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
		@carriages = []
		choice
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
				create_train
			when "3"
				create_route
			when "4"
				train_route
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

	def create_train
		puts "Выберите тип поезда"
		puts "1 - грузовой"
		puts "2 - пассажирский"
		puts "3 - чтобы посмотреть поезда"
		answer = gets.chomp
		case answer
		when "1"
			puts "Введите номер поезда"
			number = gets.chomp
			train = CargoTrain.new(number)
			@trains.push(train)
			puts "Создан #{train.type} поезд, номер #{number}"
		when "2"
			puts "Введите номер поезда"
			number = gets.chomp
			train = PassTrain.new(number)
			@trains.push(train)
			puts "Создан #{train.type} поезд, номер #{number}"
		when "3"
			 @trains.each { |train| puts train.number }
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
				puts "Укажите первую станцию в маршруте"
				first_station = gets.chomp
				puts "Укажите последнюю станцию в маршруте"
				last_station = gets.chomp
				@route = Route.new(first_station, last_station)
				@routes.push(@route)
				puts "Создан маршрут от #{first_station} до #{last_station}"
			when "2"
				puts "Какую станцию добавить в маршрут?"
				station = gets.chomp
				@routes = @route.add_station(station)
				puts "К маршруту добавлена станция #{station}" 
			when "3"
				puts "Какую станцию удалить из маршрута?"
				station = gets.chomp
				@routes.delete(station)
				puts "Из маршрута удалена станция #{station}" 
			end
		end
	end

	def train_route
		puts "Укажите маршрут"
		route = gets.chomp
		@train.add_route(route)
		puts "Поезду № #{@train.number} добавлен в маршрут "
	end

	def show_trains
		@trains.each { |train| puts train.number }
	end

	def add_carriage
		puts "Введите номер поезда, к которому необходимо прицепить вагон"
		show_trains
		number = gets.chomp.to_i
		if @trains[number].type == "pass"
			pass = PassCar.new()
			@trains[number].carriages.push(pass)
		elsif @trains[number].type == "cargo"
			cargo = CargoCar.new()
			@trains[number].carriages.push(cargo)
		else
			puts "Ничего не просиходит"
		end
	end
		
	def remove_carriage

	end
	
	def move_train
			
	end

	def show_list
		
	end

end

control = Control.new



=begin
	- Создавать станции (нужно еще сделать проверку одинаковости станций)
	- Создавать поезда
	- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
	- Назначать маршрут поезду
	- Добавлять вагоны к поезду
	- Отцеплять вагоны от поезда
	- Перемещать поезд по маршруту вперед и назад
	- Просматривать список станций и список поездов на станции
=end




