class PassTrain < Train

  def initialize (number)
    super
    @type = type
  end 

  def add_carriage(carriage)
    super if carriage.type == "pass"
  end
end
