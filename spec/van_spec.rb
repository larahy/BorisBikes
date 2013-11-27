require_relative '../lib/van'

describe Van do    
  
  let (:van) { Van.new }
  let (:broken_bike) { Bike.new.break }
  let (:bike) {Bike.new}
  let (:station) {DockingStation.new(:capacity => 20)}

  it 'should take default capacity if no other specified' do
    expect(van.capacity).to eq(10)
  end

  it 'should know when there are broken bikes at the station' do
    station.dock(broken_bike)
    expect(van.collect_from(station)).to be_true
  end

  it 'should collect broken bikes from the station' do
    station.dock(broken_bike)
  end

end