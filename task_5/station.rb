require_relative "instance_counter"

class Station
  include InstanceCounter

  attr_reader :name, :trains

  @@all_stations = []

  def initialize(name)
    @name = name 
    @trains = []
    @@all_stations << self
    register_instance
  end

  def self.all
    @@all_stations
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def show_train
    trains.each{ |train| puts train.number } 
  end

  def show_types(type)
    trains.each { |train| train.type == type }  
  end
end
