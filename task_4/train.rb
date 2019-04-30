class Train

  attr_accessor :carriage, :speed, :station, :route, :type, :carriages
  attr_reader :number

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

  def stop
    @speed = 0
  end

  def go(speed)
    @speed += speed 
  end

  def current_speed
    @speed
  end

  def add_route(route)
    @station = route.stations.first
    @station.get_train(self)
    @route = route
  end

  def next_station
    route.stations[route.stations.index(station) + 1] if @station != route.stations.last
  end

  def prev_station
    route.stations[route.stations.index(station) -1] if @station != route.stations.first
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
