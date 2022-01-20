require_relative 'Bike'

class DockingStation
  
  # attr_reader :bike
  
  def release_bike
    if @bike == false
      fail "No bikes"
    end
    
  end

  def dock(bike)
    @bike = bike
  end

  def bike
    @bike
  end
  
end