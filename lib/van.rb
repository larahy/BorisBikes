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

  def load_from(container, borisbike)
    container.release(borisbike)
    self.dock(borisbike)
  end

  def unload_to(container, borisbike)
    self.release(borisbike)
    container.dock(borisbike)
  end

end 