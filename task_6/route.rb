require_relative "instance_counter"

class Route
  include InstanceCounter

  STATION_ERROR = "Одна станция не может быть начальной и конечной"

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
    validate!
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
    return if station == stations.first || station == stations.last
    @stations.delete(station) if stations.include?(station)
  end

  def show_station 
    @stations.each { |station| puts station }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    raise STATION_ERROR if first_station == last_station
  end
end
