require './ship'
require './off_the_grid'
require 'byebug'

class Grid
  include OffTheGrid
  attr_reader :width, :height

  def initialize(width = 10, height = 10)
    @width = width
    @height = height
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
    return false if col > @width || row > @height
    @ships.each do |s|
      return false if off_the_grid(s.length, col, row, s.direction, @width, @height)
      if s.fire_at(col, row)
        @grid[row-1][col-1] = "X"
        return true
      end
    end
    @grid[row-1][col-1] = "-" if @grid[row-1][col-1] == " "
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
    total = 0
    col.upcase.reverse.split("").each_with_index do |letter, i|
    total += (('A'..'Z').to_a.index(letter)+1) * 26**i
   end
   total
  end




end
