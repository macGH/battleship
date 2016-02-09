require './grid'
class Player
  attr_reader :grid, :ships

  def initialize()
    @grid = Grid.new
    @ships = []
  end
end
