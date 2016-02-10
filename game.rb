require './human_player'
require './computer_player'

class Game
  SHIPS_LENGTHS = [2, 3, 3, 4, 5]

  def initialize(player1, player2, ships_lengths = SHIPS_LENGTHS)
    @players = [player1, player2]
    @ships_lengths = ships_lengths
    @turn_number = 1
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!\nIt's time to play Battleship."
  end

  def place_ships
    @players[0].place_ships(@ships_lengths)
    @players[1].place_ships(@ships_lengths)
  end

  def display_status
    puts "SHOTS TAKEN:"
    @players[@turn_number % 2].grid.display(true)
    puts "\nYOUR BOARD:"
    @players[(@turn_number % 2) - 1].grid.display
  end

  def take_turn
    current_player = @players[(@turn_number % 2) - 1]
    coord = current_player.call_shot
    col = current_player.grid.x_of(coord)
    row = current_player.grid.y_of(coord)

    @players[@turn_number % 2].grid.fire_at(col, row) ? (puts "Hit!") : (puts "Miss!")

    @turn_number += 1

  end
end
