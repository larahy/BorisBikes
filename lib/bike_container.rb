module BikeContainer
 
  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  attr_accessor :capacity
  # def capacity
  #   @capacity 
  # end

  # def capacity=(value)
  #   @capacity = value
  # end


  def bikecount
    bikes.count
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bikecount == capacity
  end

  def dock(bike)
    raise "Yikes, no room at the inn." if full?
    bikes << bike
  end

  def available_bikes
    #Syntax of .reject method is array.reject {|obj| block}
    #This will return elements for which given block returns false
    bikes.reject {|bike| bike.broken?}
  end

end




 

