require_relative 'bike_container'
require_relative 'bike'
require_relative 'van'

class Garage 
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def dock(borisbike)
    borisbike.fix
    super(borisbike)
  end

end 
