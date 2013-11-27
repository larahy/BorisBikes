require_relative 'bike_container'
require_relative 'docking_station'
require_relative 'garage.rb'

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_from(station)
    station.broken_bikes.count >= 1
  end

  def load_from(station, broken_bikes)
    station.release(broken_bikes)
    self.dock(broken_bikes)
  end

  def unload_to(garage, broken_bikes)
    self.release(broken_bikes)
    garage.dock(broken_bikes)
  end

end 