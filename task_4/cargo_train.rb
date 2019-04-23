class CargoTrain < Train

	def initialize (number, type = "cargo" , speed = 0)
		@number = number
		@type = type
		@speed = speed
	end 

	def add_carriage(carriage)
		@carriages << carriage if speed.zero? && carriage.type == "cargo"
	end

	def remove_carriage
		@carriages.pop if speed.zero? 
	end
end
