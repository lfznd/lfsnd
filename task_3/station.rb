class Station
  
  attr_reader :name, :trains

  def initialize(name)
    @name = name 
    @trains = []
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def show_train
    trains.each{|train| puts train} 
  end

  def show_types(type)
    trains.each {|train| train.type == type}  
  end
end
