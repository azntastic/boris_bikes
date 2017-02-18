require 'docking_station'

describe DockingStation do
    it "responds to release_bike" do
      expect(subject).to respond_to :release_bike
    end


  # it "releases working bike" do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end

  it { is_expected.to respond_to(:dock_bike).with(1).argument}

  it "saves the user's bike to the instance/ docks something", :barray do
    bike = Bike.new
    subject.num_bikes << bike
    expect(subject.dock_bike(bike)).to eq subject.num_bikes
  end

  it "shows there's a docked bike to user/ report attribute", :barray2 do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.num_bikes.pop).to eq bike
  end

  it "shows the released bike is the same as what's been docked" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  describe "#release_bike" do
    it "raises an error when no bike available" do
      expect{ subject.release_bike }.to raise_error "no bikes"
    end
  end

  # Old test when docking station could only accept 1 bike
  # describe "#dock_bike" do
  #   it "raises an error when station is full " do
  #     # bike1 = Bike.new
  #     # subject.dock_bike(bike1)
  #     # bike2 = Bike.new
  #     # expect{ subject.dock_bike(bike2) }.to raise_error "I iz full"
  #     subject.dock_bike(Bike.new)
  #     expect{ subject.dock_bike(Bike.new) }.to raise_error "I iz full"
  #   end
  # end

  describe "#full_bike" do
    it "raises an error when station is full", :tag do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) }
      expect{ subject.dock_bike(Bike.new) }.to raise_error "I iz full"
    end
  end

  describe "#notfull_bike" do
    it "allows docking when not full", :tag do
      (DockingStation::DEFAULT_CAPACITY - 1).times { subject.dock_bike(Bike.new) }
      bike20 = Bike.new
      subject.dock_bike(bike20)
      expect(subject.num_bikes.length).to eq DockingStation::DEFAULT_CAPACITY
    end
    it "Allows the change of default capacity", :capacity do
      #if capacity is changed, @capacity eq to new capacity
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end
    it "Checks to see if default capacity is 20 when capacity not set", :capacity do
      #if capacity not changed, @capacity eq to DEFAULT_CAPACITY
      station = DockingStation.new
      expect(station.capacity).to eq 20
   end
 end

end
