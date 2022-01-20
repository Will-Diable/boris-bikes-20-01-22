require "DockingStation.rb" 

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end 

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    # return docked bike
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    # return docked bike
    expect(subject.bike).to eq bike
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
      expect(subject.release_bike).to eq raise_error
    end 
  end

end