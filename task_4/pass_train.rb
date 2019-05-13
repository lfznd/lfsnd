class PassTrain < Train

  def initialize (number)
    super
    @type = "pass"
  end 

  def add_carriage(carriage)
    super if carriage.type == "pass"
  end
end
