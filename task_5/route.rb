require_relative "instance_counter"

class Route
  include InstanceCounter

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
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
end
