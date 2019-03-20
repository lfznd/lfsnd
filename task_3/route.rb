class Route

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station == stations.first || station == stations.last
    else @stations.include?(station) 
      @stations.delete(station)
    end
  end

  def show_station 
    @stations.each {|station| puts station.name}
  end
end
