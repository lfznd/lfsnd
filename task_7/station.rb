require_relative ('./instance_counter.rb')
require_relative ('./validate.rb')

class Station
  include InstanceCounter
  include Validate
  
  attr_accessor :name, :trains

  NAME_FORMAT_ERROR = "Имя не может быть пустым!"

  @@stations = []
  
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains
    @trains.each.with_index(1) { |train, index| puts "#{index}. Поезд № #{train.number}, типа - #{train.type}, количество вагонов - #{train.carriages.count}" } 
  end

  def show_type(type)
    @trains.each { |train| train.type == type }
  end

  def self.all
    @@stations
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise NAME_FORMAT_ERROR if @name.length == 0
  end
end
