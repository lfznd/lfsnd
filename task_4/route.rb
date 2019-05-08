class Route
  attr_accessor :stations
  
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    return if station == first_station || station == last_station
    stations.delete(station) if stations.include?(station)
  end

  def show_route
    stations.each { |station| puts station.name }
  end
end
