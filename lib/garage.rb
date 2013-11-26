require_relative 'bike_container'

class Garage 
  include BikeContainer

  def initialize
    @name = 'My garage'
  end

  attr_accessor :name
  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

garage = Garage.new
garage.name
garage.name = 'My new garage'