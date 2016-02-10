require './grid'
require './off_the_grid'
class Player
  attr_reader :grid, :shots_grid, :ships

  def initialize()
    @grid = Grid.new
    @ships = []
  end
end
