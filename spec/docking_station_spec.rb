require 'docking_station'

describe DockingStation do
    it "responds to release_bike" do
      expect(subject).to respond_to :release_bike
    end


  it "releases working bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "won't release a bike if one has already been created" do
    expect { Bike.new }.to raise_error("no bikes available")
    print Bike.new
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument}

  it "saves the user's bike to the instance/ docks something" do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end

  it "shows there's a docked bike to user/ report attribute" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end
end
