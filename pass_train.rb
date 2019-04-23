class PassTrain < Train

	def initialize(number, type = "pass", speed = 0)
		@number = number
		@type = type
		@speed = speed
	end 

	def add_carriage(carriage)
		@carriages << carriage if speed.zero? && carriage.type == "pass"
	end

	def remove_carriage
		@carriages.pop if speed.zero? 
	end
end

