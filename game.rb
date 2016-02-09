require './human_player'
require './computer_player'

class Game
  SHIPS_LENGTHS = [2, 3, 3, 4, 5]

  def initialize(player1, player2, ships_lengths = SHIPS_LENGTHS)
    @player1 = player1
    @player2 = player2
    @ships_lengths = ships_lengths
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!\nIt's time to play Battleship."
  end

  def place_ships
    @player1.place_ships(@ships_lengths)
    @player2.place_ships(@ships_lengths)
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player1.shots_grid.display
    puts "\nYOUR BOARD:"
    @player1.grid.display
  end

  def take_turn
  end
end
