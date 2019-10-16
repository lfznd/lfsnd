require_relative '../other/instance_counter'
require_relative '../other/validate'
require_relative '../other/display'

class Station
  include InstanceCounter
  include Validate
  include Display

  attr_accessor :name, :trains

  NAME_FORMAT_ERROR = 'Имя не может быть пустым!'.freeze

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

  protected

  def validate!
    raise NAME_FORMAT_ERROR if @name.length.zero?
  end
end
