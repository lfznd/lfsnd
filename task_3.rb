class Station
  
  attr_reader :name, :trains

  def initialize(name)
    @name = name 
    @trains = []
    "Построена станция #{name}"
  end

  def get_train(train)
    @trains << train
    puts "На станцию #{name} прибыл поезд №#{train.number}"
  end

  def send_train(train)
    trains.delete(train)
    puts "Со станции #{name} отправился поезд №#{train.number}"
  end

  def show_train
    trains.each{|train| puts train.number}   
  end

  def show_types(type)
    self.trains.each do |train|
      if train.type == type
        puts "На станции #{name} стоит поезд №#{train.number}, тип -  #{type}" 
      end
    end  
  end
end


class Route

	attr_accessor :route, :name

  def initialize (first_station, last_station)
    @first = first_station
    @last = last_station
    @route = [first_station, last_station]
    puts "Появился новый маршрут от #{first_station} до #{last_station}"
	end

	def add_station(name)
		@route.insert(-2, name)
		puts "К маршруту добавлена станция #{name} "
	end

  def remove_station(name)
    if name == @first || name == @last
      puts "Первую и последнюю станцию удалять нельзя "
    else @route.include?(name) 
      @route.delete(name)
      puts "Станция #{name} удалена из маршрута"
    end
  end

	def show_station 
      @route.each {|station| puts station.name}
  end
end


class Train

	attr_accessor :amount_carriage, :speed, :train_route, :station
	attr_reader :type, :number

	def initialize (number, type, amount_carriage, speed = 0 )
	  @number = number
	  @amount_carriage = amount_carriage
	  @speed = speed
	  @type = type
	  puts "Создан поезд № #{number}, тип #{type} c колличеством вагонов #{amount_carriage}"
	end

	def stop
    self.speed = 0
    puts "Поезд #{number} остановился"
  end

  def go
    self.speed
  end

  def current_speed
    puts "Скорость поезда №#{number} #{speed} км/ч"
  end

  def add_carriage
    if speed == 0
    	self.amount_carriage +=1
    	puts "К поезду № #{number} прицепили вагон. Колличеством вагонов #{amount_carriage}."
    else
    	puts "Поезд движется, вагоны прицеплять нельзя!!! "
    end
  end

  def remove_carriage
    if amount_carriage == 0
    	puts "Вагонов больше нет"
    elsif speed == 0
    	self.amount_carriage -= 1
    	puts "От поезда № #{number} отцепили один вагон. Колличеством вагонов #{amount_carriage}."
    else
    	 puts "Поезд движется, вагоны отцеплять нельзя!!! " 
    end  
  end

  def assign_route(train_route)
    @train_route = train_route
    @station = self.train_route.route.first
  end 

  def next_station
    if @station == train_route.route.last
      puts "тупик"
    else
      self.train_route.route[self.train_route.route.index(self.station) +1]
    end
  end

  def prev_station
    if @station == train_route.route.first
      puts "Начало маршрута"
    else
      self.train_route.route[self.train_route.route.index(self.station) -1]
    end
  end

  def move_next
    if @station == train_route.route.last
      puts "Тупик"
    else
      @station = self.train_route.route[self.train_route.route.index(self.station) +1]
    end
  end

  def move_prev
    if @station == train_route.route.first
      puts "Начало маршрута"
    else
      @station = self.train_route.route[self.train_route.route.index(self.station) -1]
    end
  end
end
