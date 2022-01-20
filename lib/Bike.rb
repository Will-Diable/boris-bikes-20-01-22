class Bike
  
  def initialize
    @works = true
  end

  def report_broken
    @works = false
  end

  def working?
    return @works
  end

end
