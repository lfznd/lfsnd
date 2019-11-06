class CargoTrain < Train

	FORMAT_NUMBER = /^[a-zа-я\d]{3}[-]?[a-zа-я\d]{2}$/i.freeze

	validate :number, :presence
  validate :number, :format, FORMAT_NUMBER
  validate :number, :type, String

  def initialize(number)
    super
    @type = :cargo
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(CargoCarriage)
  end
end
