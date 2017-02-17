require_relative 'bike'

class DockingStation
attr_reader :num_bikes

  def initialize
    @num_bikes = []
  end

  def release_bike
    fail "no bikes" if empty?
    @num_bikes.pop
  end

  def dock_bike(bike)
  #nb - Bike is created outside func.; Dock capcity = 1.
  #this method will send error if @bike already exists
  #@bike will only exist if a bike has already been docked
  #hence that bike will have become instance variable
    fail "I iz full" if full?
    @num_bikes << bike
  end

  private
  def full?
    @num_bikes.length >= 20
  end

  def empty?
    @num_bikes.empty?
  end

end
