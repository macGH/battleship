require './player'
require 'byebug'

class ComputerPlayer < Player
  include OffTheGrid

  def name
    "HAL 9000"
  end

  def place_ships(ship_lengths)
    ship_lengths.each do |l|
      continue = false
      while !continue
        ship = Ship.new(l)
        coord = call_shot
        direction = rand(2)
        if !off_the_grid(l, @grid.x_of(coord), @grid.y_of(coord), (direction == 1 ? true : false), @grid.width, @grid.height)
          continue = @grid.place_ship(ship, @grid.x_of(coord), @grid.y_of(coord), (direction == 1 ? true : false))
        end
      end
      @ships << ship
    end
    puts "HAL 9000 has placed its ships."
  end

  def call_shot
    col = rand(1..10)
    row = ('A'..'J').to_a[rand(10)]
    coord = row + col.to_s
  end
end
