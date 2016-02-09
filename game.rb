require './human_player'
require './computer_player'

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!\nIt's time to play Battleship."
  end
end
