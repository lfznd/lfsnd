require_relative ('./manufacturer.rb')
require_relative ('./instance_counter.rb')
require_relative ('./validate.rb')

class Train
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_accessor :speed, :route, :type, :number, :carriages

  NUMBER_FORMAT = /^[a-zа-яA-ZА-Я\d]{3}[-]?[a-zа-яA-ZА-Я\d]{2}$/i

  @@trains = {}

  def initialize(number, speed = 0)
    @number = number
    @type = type
    @speed = speed
    @carriages = []
    validate!
    @@trains[number] = self
    register_instance
  end

  def each_carriage
    @carriages.each { |carriage| yield(carriage) }
  end

  def add_carriage(carriage)
    @carriages << carriage if speed.zero?
  end

  def remove_carriage(carriage)
    return if speed != 0
    @carriages.delete(carriage) if @carriages.include?(carriage)
  end

  def show_carriage
    @carriages.each { |carriage| puts carriage }
  end
  
  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def current_speed
    @current_speed = @speed 
  end

  def add_route(route)
    @route = route
    @station = route.first_station
    @station.get_train(self)
  end

  def next_station
    route.stations[route.stations.index(station) + 1] if @station != route.stations.last
  end

  def previous_station
    route.stations[route.stations.index(station) - 1] if @station != route.stations.first
  end

  def move_next
    if next_station
      @station.send_train(self)
      @station = next_station 
      @station.get_train(self)
    else
      return 
    end
  end

  def move_previous
    if previous_station
      @station.send_train(self)
      @station = previous_station
      @station.get_train(self)
    else
      return 
    end
  end

  def self.find(number)
    #@@trains[number]
    ObjectSpace.each_object(self).find { |train| train.number == number }
  end

  protected

  def validate!
    raise "Длина номера меньше пяти символов" if number.length < 3 
    raise "Неверный формат номера" if number !~ NUMBER_FORMAT
  end
end

=begin
st1 = Station.new("Moscow")
st2 = Station.new("London")
st3 = Station.new("Paris")
tr = PassTrain.new(12)
rt = Route.new(st1, st2)
rt.add_station(st3)
tr.add_route(rt)
=end 
