require_relative ('./instance_counter.rb')
require_relative ('./validate.rb')

class Route
	include InstanceCounter
	include Validate

	attr_accessor :stations

	CHOICE_STATION_ERROR = "Первая и последняя станции не могут совпадать"
	
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
		return if station == first_station || station == last_station
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
