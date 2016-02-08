require './ship'
require 'pry'

class Grid
  def initialize
    @grid = Array.new(10) {Array.new(10) {" "} }
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
    i = 0
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    @grid.each do |row|
      print "#{('A'..'Z').to_a[i]} | "
      row.each do |cell|
        print cell + " | "
      end
      print "\n"
      i += 1
    end
    puts "  -----------------------------------------"
    # puts "A |   |   |   |   |   |   |   |   |   |   |"
    # puts "B |   |   |   |   |   |   |   |   |   |   |"
    # puts "C |   |   |   |   |   |   |   |   |   |   |"
    # puts "D |   |   |   |   |   |   |   |   |   |   |"
    # puts "E |   |   |   |   |   |   |   |   |   |   |"
    # puts "F |   |   |   |   |   |   |   |   |   |   |"
    # puts "G |   |   |   |   |   |   |   |   |   |   |"
    # puts "H |   |   |   |   |   |   |   |   |   |   |"
    # puts "I |   |   |   |   |   |   |   |   |   |   |"
    # puts "J |   |   |   |   |   |   |   |   |   |   |"
  end

  def place_ship(ship, col, row, direction)
    ship.place(col, row, direction)
    @ships.each do |i|
      return false if i.overlaps_with?(ship)
    end
    if direction
      (0..ship.length - 1).each do |i|
        @grid[row - 1][col + i - 1] = "0"
      end
    else
      (0..ship.length - 1).each do |i|
        @grid[row  + i - 1][col - 1] = "0"
      end
    end
    @ships << ship
  end
end
