class PassTrain < Train
  def initialize(number)
    super
    @type = :passenger
  end

  def attachable_carriage?(carriage)
    carriage.is_a?(PassCarriage)
  end
end
