require_relative 'bike_container'
require_relative 'bike'
require_relative 'docking_station'
require_relative 'van'
require_relative 'user'
require_relative 'garage'

station = DockingStation.new(:capacity => 20)
station1 = DockingStation.new(:capacity => 10)
station2 = DockingStation.new(:capacity => 10)

bikes = []
40.times {bikes << Bike.new}

users = []
20.times {users << User.new}

van = Van.new(:capacity => 10)
van1 = Van.new(:capacity => 10)

garage = Garage.new(:capacity => 10)
garage2 = Garage.new(:capacity => 10)

bikes.pop(20).each do |bike|
  station.dock(bike)
end
# p bikes.length
# p station

bikes.pop(10).each do |bike|
  station1.dock(bike)
end
p bikes.length
p station.bikes.include? station1.bikes

bikes.each do |bike|
  station2.dock(bike)
end

p bikes.length

users.take(10).each_with_index do |user, index|
  station.unload_to(user, station.bikes[index])
end

remaining_users = users.select {|user| user.empty?} 
p remaining_users.length

remaining_users.take(5).each_with_index do |user, index|
  station1.unload_to(user, station1.bikes[index])
end

leftover_users = remaining_users.select {|user| user.empty?}
p leftover_users.length


leftover_users.each_with_index do |user, index|
  station2.unload_to(user, station2.bikes[index])
end

p station.bikes.length
p station1.bikes.length
p station2.bikes.length












