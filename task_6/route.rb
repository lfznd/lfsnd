require_relative "instance_counter"
require_relative "validate"

class Route
  include InstanceCounter
  include Validate

  STATION_ERROR = "Одна станция не может быть начальной и конечной"

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
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

  protected

  def validate!
    raise STATION_ERROR if first_station == last_station
  end
end
