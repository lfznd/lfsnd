class Train
  attr_accessor :carriage, :speed, :route, :station, :type, :number, :carriages

  def initialize(number, speed = 0)
    @number = number
    @type = type
    @speed = speed
    @carriages = []
  end

  def add_carriage(carriage)
    @carriages << carriage if speed.zero?
  end

  def remove_carriage(carriage)
    puts "Нельзя отцеплять вагоны когда поезд в пути!" if speed != 0
    @carriages.delete(carriage) if @carriages.include?(carriage)
  end

  def show_carriage
    @carriages.each { |carriage| puts carriage }
  end
  
  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def current_speed
    @current_speed = @speed 
  end

  def add_route(route)
    @route = route
    @station = route.first_station
    station.get_train(self)
  end

  def next_station
    route.stations[route.stations.index(station) + 1] if @station != route.stations.last
  end

  def previous_station
    route.stations[route.stations.index(station) - 1] if @station != route.stations.first
  end

  def move_next
    if next_station
      @station.send_train(self)
      @station = next_station 
      @station.get_train(self)
    else
      return 
    end
  end

  def move_previous
    if previous_station
      @station.send_train(self)
      @station = previous_station
      @station.get_train(self)
    else
      return 
    end
  end
end
