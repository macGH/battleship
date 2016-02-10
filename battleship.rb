require './game'
puts "                                     |__"
puts "                                     |\\/"
puts "                                     ---"
puts "                                     / | ["
puts "                              !      | |||"
puts "                            _/|     _/|-++'"
puts "                        +  +--|    |--|--|_ |-"
puts "                     { /|__|  |/\\__|  |--- |||__/"
puts "                    +---------------___[}-_===_.'____                 /\\"
puts "                ____\`-\' ||___-{]_| _[}-  |     |_[___\\==--            \\/   _"
puts " __..._____--==/___]_|__|_____________________________[___\\==--____,------' .7"
puts "|                                                                     BB-61/"
puts " \\_________________________________________________________________________| "
puts "                          WELCOME TO BATTLESHIP\n"

puts
puts
puts "Player 1, are you 'Human' or 'Computer'?"
choice = gets.chomp.upcase

if choice == "HUMAN"
  puts "What's your name?"
  input = gets.chomp
  player1 = HumanPlayer.new(input)
else
  player1 = ComputerPlayer.new
end


puts "Player 2, are you 'Human' or 'Computer'?"
choice = gets.chomp

if choice == "HUMAN"
  puts "What's your name?"
  input = gets.chomp
  player2 = HumanPlayer.new(input)
else
  player2 = ComputerPlayer.new
end

game = Game.new(player1, player2)

game.play
