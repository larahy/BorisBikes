require_relative '../lib/docking_station'

describe DockingStation do

  let (:bike) {Bike.new}
  let (:station) {DockingStation.new}
  let (:station) {DockingStation.new(:capacity => 20)}

	it 'should dock bikes that are unbroken' do
		expect(station.bikecount).to eq(0)
		station.dock(bike)
		expect(station.bikecount).to eq(1)
	end

  it 'should release bikes that are unbroken' do
    station.dock(bike)
    station.release(bike)
    expect(station.bikecount).to eq(0)
  end

  it 'should know when station is full' do
    expect(station).not_to be_full
    20.times { station.dock(Bike.new) }
    expect(station).to be_full
  end


end
