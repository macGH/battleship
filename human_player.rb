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
      continue = false
      while !continue
        puts "#{@name}, where would you like to place a ship of length #{l}?"
        coord = get_user_input
        puts "Across or Down?"
        direction = get_user_input
        ship = Ship.new(l)
        continue = @grid.place_ship(ship, @grid.x_of(coord), @grid.y_of(coord), direction=="Across" ? true : false)
        if !continue
          puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        else
          @ships << ship
        end
      end
    end
  end

  def call_shot
    puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    get_user_input
  end

end
