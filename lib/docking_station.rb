require_relative 'bike_container'

class DockingStation

  include BikeContainer

	def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
	end

  # def fix
  #   if DockingStation.new.broken_bikes.count >= 1
  #   else
  #   end
  # end
end	
