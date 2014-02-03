require_relative '../lib/garage'

describe Garage do 
  let (:garage) {Garage.new(:capacity => 10)}
  let (:van) { Van.new(:capacity => 10)}
  let (:broken_bike) { Bike.new.break }
  let (:bike) {Bike.new}
  let (:station) {DockingStation.new(:capacity => 20)}

  it 'should fix broken bikes' do
    van.unload_to(garage, broken_bike)
    van.load_from(garage, broken_bike)
    van.unload_to(station, broken_bike)
    expect(station.available_bikes.count).to eql(1)
  end
end