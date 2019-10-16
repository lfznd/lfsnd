require_relative '../other/instance_counter'
require_relative '../other/validate'

class Route
  include InstanceCounter
  include Validate

  attr_accessor :stations, :station

  CHOICE_STATION_ERROR = 'Первая и последняя станции не могут совпадать'.freeze

  def initialize(first_station, last_station)
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
    return if @stations.include?(station)

    stations.delete(station) if stations.include?(station)
  end

  def show_route
    stations.each { |station| puts station.name }
  end

  protected

  def validate!
    raise CHOICE_STATION_ERROR if first_station == last_station
  end
end
