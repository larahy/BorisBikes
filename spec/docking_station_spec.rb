require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do

  let (:station) {DockingStation.new(:capacity => 123)}

  it 'should allow setting default capacity on intialising' do
    expect(station.capacity).to eq(123)
  end     

 #  def fill_station(station)
 #    20.times {station.dock(Bike.new)}
 #  end

	# it 'should dock bikes that are unbroken' do
	# 	expect(station.bikecount).to eq(0)
	# 	station.dock(bike)
	# 	expect(station.bikecount).to eq(1)
	# end

  it 'should release bikes that are unbroken' do
    bike = Bike.new
    station.dock(bike)
    station.release(bike)
    expect(station.bikecount).to eq(0)
  end

  it 'should only release bikes that have been docked' do
    docked_bike, undocked_bike = Bike.new, Bike.new
    station.dock(docked_bike)
    station.release(undocked_bike) 
    expect(station.bikecount).to eq(1)
  end

 #  it 'should know when station is full' do
 #    expect(station).not_to be_full
 #    20.times { station.dock(Bike.new) }
 #    expect(station).to be_full
 #  end

 #  it 'should not accept bike when it is full' do
 #    fill_station(station)
 #    expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
 #  end

  it 'should provide a list of available bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end

  it 'should know how many bikes are broken' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(broken_bike)
    station.dock(working_bike)
    expect(station.broken_bikes.count).to eql(1)
  end

  it "should know when station is empty" do
    bike = Bike.new
    station.dock(bike)
    station.release(bike)
    expect(station).to be_empty
  end

end
