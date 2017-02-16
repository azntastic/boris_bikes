require_relative 'bike'

class DockingStation

  def initialize
    bike1 = Bike.new
  end

  def release_bike
    @bike #in other words, returning the bike that has been docked
  #if none exists, no new bike/ won't run release_bike
    # Bike.new if #none exists
  end

  def dock_bike(bike)
    #what this needs to do is accept the bike instance + save it
    @bike = bike
    #unless dock_bike(@bike)
  end

  attr_reader :bike

end
