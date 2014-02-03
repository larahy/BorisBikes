module BikeContainer
 
  DEFAULT_CAPACITY = 1

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def bikecount
    bikes.count
  end

  def capacity=(value)
    @capacity = value
  end

  def release(bike)
    bikes.delete_if do |x| 
      x == bike 
    end  
  end

  def full?
    bikecount == capacity
  end

  def empty?
    bikecount == 0
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

  def broken_bikes
    bikes.select {|bike| bike.broken?}
  end

  def load_from(container, borisbike)
    move_bike_across(container, self, borisbike)
  end

  def unload_to(container, borisbike)
    move_bike_across(self, container, borisbike)
  end

private
  
  def move_bike_across(source, dest, bike)
    source.release(bike)
    dest.dock(bike)
  end

end




 

