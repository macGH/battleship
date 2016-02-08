require 'pry'

class Ship
  attr_reader :length, :col, :row, :direction

  def initialize (length) #, row=-1, col=-1, direction=nil)
    @length = length
    @row = -1
    @col = -1
    @direction = nil
    @pegs = Array.new(@length, false)
  end

  def place(col, row, direction)
    return false if !@direction.nil?
    @row = row
    @direction = direction
    @col = col
  end

  def covers?(col, row)
    if @direction
      @row == row && col >= @col && col < @col+length
    else
      @col == col && row >= @row && row < @row+length
    end
  end

  def overlaps_with?(ship)
    if @direction
      (@col..(@col + @length - 1)).each do |i|
        return true if ship.covers?(i, @row)
      end
    else
      (@row..(@row + length - 1)).each do |i|
        return true if ship.covers?(@col,i)
      end
    end
    return false
  end

  def fire_at(col, row)
    if self.covers?(col, row)
      index = (direction ? col - @col : row - @row )
      @pegs[index] ? false : @pegs[index] = true
    end
  end

  def sunk?
    !@pegs.include?(false)
  end

end
