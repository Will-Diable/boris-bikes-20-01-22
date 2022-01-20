require_relative 'Bike'

class DockingStation
  
  attr_reader :bike_storage

  def initialize
    @bike_storage = []
  end
  
  def release_bike
    fail "No bikes" if @bike_storage.length == 0
    @bike_storage.pop
  end

  def dock(bike)
    fail "Full" if @bike_storage.length > 19
    @bike_storage.push(bike)
  end

#  def bike
#    @bike
#  end
  
end