require_relative 'bike'
attr_reader :num_bikes

class DockingStation

  def initialize
    @num_bikes = []
  end

  def release_bike
    fail "no bikes" if @num_bikes.empty?
    @num_bikes.pop
  end

  def dock_bike(bike)
  #nb - Bike is created outside func.; Dock capcity = 1.
  #this method will send error if @bike already exists
  #@bike will only exist if a bike has already been docked
  #hence that bike will have become instance variable
    fail "I iz full" if @num_bikes.length >= 20
    @num_bikes << bike
  end
end
