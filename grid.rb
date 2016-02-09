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
      temp_str = ""
      temp_str += "#{('A'..'Z').to_a[i]} | "
      row.each do |cell|
        temp_str += cell + " | "
      end
      puts temp_str.strip
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
        @grid[row - 1][col + i - 1] = "O"
      end
    else
      (0..ship.length - 1).each do |i|
        @grid[row  + i - 1][col - 1] = "O"
      end
    end
    @ships << ship
  end

  def fire_at(col, row)
    @ships.each do |s|
      if s.fire_at(col, row)
        @grid[row-1][col-1] = "X"
        return true
      end
    end
    false
  end

  def sunk?
    return false if @ships.empty?
    @ships.each do |s|
      return false if !s.sunk?
    end
    true
  end

  def x_of(coord)
    return coord.scan(/\d+/)[0].to_i
  end

end
