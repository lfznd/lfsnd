require_relative '../other/manufacturer'

class Carriage
  include Manufacturer

  attr_accessor :type, :number, :place
  attr_reader :occupied_place

  def initialize(number, type, place)
    @number = number
    @type = type
    @place = place
    @occupied_place = 0
  end

  def occupy_place(place)
    @occupied_place += place
  end

  def free_place
    @free_place = @place - @occupied_place
  end
end
