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
	attr_accessor :route

	def initialize (first_station, last_station)
	 @first = first_station
   @last = last_station
   @route = [first_station, last_station]
   puts "Появился новый маршрут от #{first_station.name} до #{last_station.name}"
	end

  def first_station
    route.first
  end

  def last_station
    route.last
  end

	def add_station(station)
    @station = station
		@route.insert(-2, station)
		puts "К маршруту добавлена станция #{station.name} "
	end

  def remove_station(station)
    if station == @first || station == @last
      puts "Первую и последнюю станцию удалять нельзя "
    else @route.include?(station) 
      @route.delete(station)
      puts "Станция #{station.name} удалена из маршрута"
    end
  end

	def show_station 
     @route.each {|station| puts station.name}
  end
  
end


class Train
	attr_accessor :number, :amount_carriage, :speed, :train_route
	attr_reader :type

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
    train_route.first_station.get_train(self)
  end 

  def next_station
    
  end

  def previous_station

  end

  def show_train_route
    

  end


end






