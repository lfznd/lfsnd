require_relative '../other/instance_counter'
require_relative '../other/validation'
require_relative '../other/accessors'
require_relative 'station'

class Route
  include InstanceCounter
  include Validation
  extend Accessors

  attr_accessor :stations

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    return if first_station == last_station

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
end
