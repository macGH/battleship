require './ship'
require 'byebug'

class Grid
  attr_reader :width, :height

  def initialize
    @width = 10
    @height = 10
    @grid = Array.new(@height) {Array.new(@width) {" "} }
    @ships = Array.new()
  end

  def has_ship_on?(col, row)
    @ships.any? {|ship| ship.covers?(col, row)}
  end

  def display(scrub = false)
    i = 0
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    @grid.each do |row|
      temp_str = ""
      temp_str += "#{('A'..'Z').to_a[i]} | "
      row.each do |cell|
        if scrub
          temp_str += cell.gsub("O", " ").gsub("X", "+") + " | "
        else
          temp_str += cell.gsub("-", " ") + " | "
        end
      end
      puts temp_str.strip
      i += 1
    end
    puts "  -----------------------------------------"
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
    @ships.all? {|s| s.sunk?}

  end

  def x_of(coord)
    return coord.scan(/\d+/)[0].to_i
  end

  def y_of(coord)
    convert_col_to_num(coord[/[a-zA-Z]+/])
  end

  private def convert_col_to_num(col)
    return ('A'..'Z').to_a.index(col)+1
  end




end
