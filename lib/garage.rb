require_relative 'bike_container'
require_relative 'bike'
require_relative 'van'

class Garage 
  include BikeContainer

  def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
  end

  def dock(broken_bike)
    broken_bike.fix
    super(broken_bike)
  end

end 
