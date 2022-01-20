require_relative 'Bike'

class DockingStation
  
  attr_reader :bike_storage
  DEFAULT_CAPACITY = 20

  def initialize(storage_size = DEFAULT_CAPACITY)
    @bike_storage = []
    @storage_size = storage_size
  end
  
  def release_bike
    fail "No bikes" if empty?
    if @bike_storage[0].working?
      @bike_storage.first
    else
      fail "Not working"
    end
  end

  def dock(bike, broken = false)
    fail "Full" if full?
    if broken
      bike.report_broken
    end
    @bike_storage.push(bike)
  end

  def full?
    @bike_storage.count >= @storage_size
  end

  def empty?
    @bike_storage.count == 0
  end

#  def bike
#    @bike
#  end
  
end
