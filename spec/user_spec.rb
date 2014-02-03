require_relative '../lib/user'

describe User do
  
  let (:bike) {Bike.new}
  let (:bike2) {Bike.new}
  let (:bike3) {Bike.new}
  let (:user) {User.new}
  let (:user2) {User.new}
  let (:station) {DockingStation.new(:capacity => 10)}

  it 'should not be able to rent more than one bike' do
    station.dock(bike)
    station.release(bike)
    user.dock(bike)
    expect(user).to be_full
  end

  it 'should be able to rent a bike from the station' do
    station.dock(bike)
    user.load_from(station, bike)
    expect(user).to be_full
    expect(station.bikecount).to eq(0)
  end

  it 'should be able to break bikes' do
    station.dock(bike)
    user.load_from(station, bike)
    user.crash(bike)
    user.unload_to(station, bike)
    expect(station.broken_bikes.count).to eql(1)
  end

  it 'should allow more than one user at a time' do
    station.dock(bike)
    station.dock(bike2)
    station.dock(bike3)
    user.load_from(station, bike)
    user2.load_from(station, bike2)
    expect(station.available_bikes).to include(bike3)
  end
    
end