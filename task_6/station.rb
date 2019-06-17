require_relative "instance_counter"
require_relative "validate"

class Station
  include InstanceCounter
  include Validate

  attr_reader :name, :trains

  NAME_LENGTH_ERROR = "Название не может быть короче 3 символов"

  @@all_stations = []

  def initialize(name)
    @name = name 
    @trains = []
    @@all_stations << self
    validate!
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

  protected

  def validate!
    raise NAME_LENGTH_ERROR if name.length < 3
  end
end
