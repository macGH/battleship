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
    opposing_player = @players[@turn_number % 2]
    coord = current_player.call_shot
    col = current_player.grid.x_of(coord)
    row = current_player.grid.y_of(coord)

    opposing_player.grid.fire_at(col, row) ? (puts "Hit!") : (puts "Miss!")

    if opposing_player.grid.sunk?
      declare_winner(current_player)
      return false
    end
    @turn_number += 1
    true
  end

  def play
    welcome
    place_ships
    loop do
      puts "\n"
      display_status
      puts "\n"
      break if !take_turn
    end
  end

  private def declare_winner(winner)
    puts "Congratulations, #{winner.name}! A winner is YOOOUUUUUUU! "
  end

end
