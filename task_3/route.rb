class Route

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    return if station == sation.first || sation == sation.last
    @station.delete(station) if station.include?(station)
  end

  def show_station 
    @stations.each { |station| puts station.name }
  end
end
  