require './ship'
require 'pry'

class Grid
  def initialize
    @grid = Array.new()
    @ships = Array.new()
  end

  def has_ship_on?(col, row)
    # binding.pry
    @ships.each do |ship|
      # binding.pry
      return true if ship.covers?(col, row)
    end
    false
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    puts "A |   |   |   |   |   |   |   |   |   |   |"
    puts "B |   |   |   |   |   |   |   |   |   |   |"
    puts "C |   |   |   |   |   |   |   |   |   |   |"
    puts "D |   |   |   |   |   |   |   |   |   |   |"
    puts "E |   |   |   |   |   |   |   |   |   |   |"
    puts "F |   |   |   |   |   |   |   |   |   |   |"
    puts "G |   |   |   |   |   |   |   |   |   |   |"
    puts "H |   |   |   |   |   |   |   |   |   |   |"
    puts "I |   |   |   |   |   |   |   |   |   |   |"
    puts "J |   |   |   |   |   |   |   |   |   |   |"
    puts "  -----------------------------------------"
  end

  def place_ship(ship, col, row, direction)
    ship.place(col, row, direction)
    @ships << ship
  end
end
