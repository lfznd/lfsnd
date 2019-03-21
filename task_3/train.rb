class Train

  attr_accessor :carriage, :speed, :station, :route
  attr_reader :type, :number

  def initialize (number, type, carriage, speed = 0 )
    @number = number
    @carriage = carriage
    @type = type
    @speed = speed
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

  def add_carriage
    @carriage += 1 if speed.zero?
  end

  def remove_carriage
    @carriage -= 1 if @carriage > 0 && speed.zero?
  end

  def add_route(route)
    @route = route
    @station = route.stations.first
  end 

  def next_station
    route.stations[route.stations.index(station) + 1] if @station != route.stations.last
  end

  def prev_station
    route.stations[route.stations.index(station) -1] if @station != route.stations.first
  end

  def move_next
    if @station != route.stations.last
      @station = next_station
    end
  end

  def move_prev
    if @station != route.stations.first
      @station = prev_station
    end
  end
end
