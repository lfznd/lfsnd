class CargoCarriage < Carriage
  def initialize(number, place)
    super(number, :cargo, place)
  end

  def occupy_place(place)
    raise 'Недостаточно места' if (free_place - place).negative?

    super(place)
  rescue StandardError => e
    puts e.message
  end
end
