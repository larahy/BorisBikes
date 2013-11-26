require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

  describe BikeContainer do
    let(:bike) {Bike.new}
    let(:holder) {ContainerHolder.new}

    it 'should accept a bike' do
    # We expect the holder to start with 0 bikes
      expect(holder.bikecount).to eq(0)
    # After docking, we expect the holder to have 1 bike
      holder.dock(bike)
      expect(holder.bikecount).to eq(1)
    end
end