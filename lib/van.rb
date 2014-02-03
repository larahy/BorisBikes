require_relative 'bike_container'
require_relative 'docking_station'
require_relative 'garage.rb'

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_from?(station)
    !station.broken_bikes.empty?
  end

end 