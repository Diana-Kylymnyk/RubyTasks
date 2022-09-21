puts "Welcome to the game!"
puts "Do you want to start? (yes|no)"
game_start = STDIN.gets.strip
points = 0
if game_start == "yes"
  arr = [:rock, :scissors, :paper, :exit]
  loop do
    computer_choice = arr[rand(0..2)]
    puts "Make a choice: 1-rock, 2-scissors, 3-paper, 4-exit"
    number = gets.to_i
    you_choice = arr[number - 1]
    if computer_choice == you_choice
      puts "Computer: #{computer_choice}, You: #{you_choice}"
      puts "Draw"
    elsif computer_choice == :rock && you_choice == :scissors ||
      computer_choice == :scissors && you_choice == :paper ||
      computer_choice == :paper && you_choice == :rock
      puts "Computer: #{computer_choice}, You: #{you_choice}"
      puts "Losing"
      points -= 1
    elsif you_choice == :exit
      puts "You have #{points} points."
      puts "Exit!"
      exit
    elsif computer_choice == :scissors && you_choice == :rock ||
      computer_choice == :paper && you_choice == :scissors ||
      computer_choice == :rock && you_choice == :paper
      puts "Computer: #{computer_choice}, You: #{you_choice}"
      puts "Victory!!!"
      points += 1
    else
      puts "Incorrect choice!!!"
    end
  end
elsif game_start == "no"
  puts "You left the game."
  exit
else
  puts "Incorrect command!"
end
