class Station
  attr_accessor :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train.number}" } 
  end

  def show_type(type)
    @trains.each { |train| train.type == type }
  end
end
