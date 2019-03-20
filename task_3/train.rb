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
    @speed = speed 
  end

  def current_speed
    @speed
  end

  def add_carriage
    if speed == 0
      @carriage +=1
    end
  end

  def remove_carriage
    if @carriage > 0 && speed == 0
      @carriage -= 1
    end  
  end

  def add_route(route)
    @route = route
    @station = route.stations.first
  end 

  def next_station
    if @station == route.stations.last
    else
      route.stations[route.stations.index(station) + 1]
    end
  end

  def prev_station
    if @station == route.stations.first
    else
      route.stations[route.stations.index(station) -1]
    end
  end

  def move_next
    if @station == route.stations.last
    else
      @station = route.stations[route.stations.index(station) +1]
    end
  end

  def move_prev
    if @station == route.stations.first
    else
      @station = route.stations[route.stations.index(station) -1]
    end
  end
end
