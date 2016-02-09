require './player.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name

  def initialize(name="Dave")
    super()
    @name = name
  end

  def place_ships(ship_lengths)
    ship_lengths.each do |l|
      puts "#{@name}, where would you like to place a ship of length #{l}?"
      coord = get_user_input
      puts "Across or Down?"
      direction = get_user_input

      @ships << Ship.new(l)
      @grid.place_ship(@ships.last, @grid.x_of(coord), @grid.y_of(coord), direction=="Across" ? true : false)
    end

  end

end
