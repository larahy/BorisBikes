require_relative '../lib/van'

describe Van do    
  
  let (:van) { Van.new(:capacity => 10) }
  let (:boris_bike) { Bike.new.break }
  let (:bike) {Bike.new}
  let (:station) {DockingStation.new(:capacity => 20)}
  let (:garage) {Garage.new(:capacity => 10)}

  it 'should take default capacity if no other specified' do
    expect(van.capacity).to eq(10)
  end

  it 'should know when there are broken bikes at the station' do
    station.dock(boris_bike)
    expect(van.collect_from?(station)).to be_true
  end


  it 'should load broken bikes from station' do
    station.dock(boris_bike)
    van.load_from(station, boris_bike)
    expect(van.collect_from?(station)).to be_false
  end

  it 'should unload broken bikes at the garage' do
    station.dock(boris_bike)
    van.load_from(station, boris_bike)
    van.unload_to(garage, boris_bike)
    expect(garage.bikecount).to eq(1)
  end


   it 'should not accept bike when it is full' do
    10.times { van.load_from(station, boris_bike) }
    expect(lambda { van.dock(bike) }).to raise_error(RuntimeError)
  end
end