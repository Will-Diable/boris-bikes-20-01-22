require "DockingStation.rb" 

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike.working?).to eq true
  end 

  it { is_expected.to respond_to(:dock).with(1).argument }

#  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    # return docked bike
    expect(subject.dock(bike)).to include(bike)
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # return docked bike
    expect(subject.release_bike).is_a? Bike
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # release docked bike
      expect(subject.release_bike).to eq bike
    end 
  end

    describe '#release from empty dock' do
    it 'releases a bike' do
      bike = Bike.new
      # try to release docked bike
      expect {subject.release_bike}.to raise_error "No bikes"
    end 
  end

  describe "#Store 20 bikes" do
    it "store bikes" do
      20.times { subject.dock Bike.new }
      expect {subject.dock Bike.new}.to raise_error "Full"
    end
  end

  describe "Only store 10 bikes" do
    it "store 10" do
      docking_station = DockingStation.new(10)
      10.times { docking_station.dock Bike.new }
      expect {docking_station.dock Bike.new}.to raise_error "Full"
    end
  end

#  describe "Can a bike be broken" do
#    it "break bike" do
#      new_bike = Bike.new
#      new_bike.report_broken
#      expect(new_bike.working?).to eq false
#    end
#  end

  describe "Can report broken bike" do
    it "" do
      new_bike = Bike.new
      subject.dock(new_bike, true)
      expect(new_bike.working?).to eq false
    end
  end

  describe "dont release broken bikes" do
    it "" do
      new_bike = Bike.new
      subject.dock(new_bike, true)
      expect {subject.release_bike}.to raise_error "Not working"
    end
  end


end