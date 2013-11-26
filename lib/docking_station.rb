class DockingStation

DEFAULT_CAPACITY= 10

	def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end


	def bikecount
		@bikes.count
	end

	def dock(bike)
    #If the capacity is reached, raise an exception
    raise "Station is full" if full?
    @bikes << bike
	end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bikecount == @capacity 
  end

  def available_bikes
    #Syntax of .reject method is array.reject {|obj| block}
    #This will return elements for which given block returns false
    @bikes.reject {|bike| bike.broken?}
  end


end	
