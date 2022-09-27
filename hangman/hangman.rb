# Підключаємо класи Game та ResPrinter
require_relative 'game'
require_relative 'res_printer'

printer = ResPrinter.new

puts "<<Hangman>>\n\n"
sleep 1

word = ARGV[0]
game = Game.new(word)

# Основний цикл програми
while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

# Виводимо результат гри
printer.print_status(game)