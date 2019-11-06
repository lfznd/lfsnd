require_relative '../other/instance_counter'
require_relative '../other/validation'
require_relative '../other/display'
require_relative '../other/accessors'

class Station
  include InstanceCounter
  include Validation
  include Display
  extend Accessors

  attr_reader :station_name, :trains
  strong_attr_accessor :name, String

  validate :name, :presence

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_type(type)
    @trains.each { |train| train.type == type }
  end

  def each_train
    @trains.each { |train| yield(train) }
  end
end
