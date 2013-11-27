require_relative '../lib/garage'

describe Garage do 
  let (:garage) {Garage.new}
  let (:van) { Van.new }
  let (:broken_bike) { Bike.new.break }
  let (:bike) {Bike.new}
  let (:station) {DockingStation.new(:capacity => 20)}

  it 'should fix broken bikes' do
    garage.dock(broken_bike)
    van.load_from(garage, broken_bike)
    van.unload_to(station, broken_bike)
    expect(station.available_bikes.count).to eql(1)
  end
end