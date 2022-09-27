# Клас ResPrinter займається виведенням на екран стану та результату гри
class ResPrinter

  def print_status(game)
    cls

    puts "\nWord: #{get_word_for_print(game.letters, game.correct_letters)}"

    puts "Mistakes: #{game.wrong_letters.join(', ')}"

    print_hangman(game.errors)

    if game.status == -1
      puts "\nYou lose.\n"
      puts 'The hidden word was: ' + game.letters.join('')
      puts
    elsif game.status == 1
      puts "Congratulations, you won!\n\n"
    else
      puts 'Number of possible mistakes ' + (7 - game.errors).to_s
    end
  end

  # Службовий метод класу, що повертає рядок, що зображує загадане слово
  def get_word_for_print(letters, correct_letters)
    result = ''

    letters.each { |item|
      if correct_letters.include?(item)
        result += item + ' '
      else
        result += '_ '
      end
    }

    result
  end

  # Метод, який малює шибеницю
  def print_hangman(errors)
    case errors
    when 0
      puts '
          _______
          |/
          |
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        '
    when 1
      puts '
        _______
        |/
        |     ( )
        |
        |
        |
        |
        |
        |
      __|________
      |         |
      '
    when 2
      puts '
        _______
        |/
        |     ( )
        |      |
        |
        |
        |
        |
        |
      __|________
      |         |
      '
    when 3
      puts '
        _______
        |/
        |     ( )
        |      |_
        |        \
        |
        |
        |
        |
      __|________
      |         |
      '
    when 4
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    /   \
        |
        |
        |
        |
      __|________
      |         |
      '
    when 5
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \
        |      |
        |
        |
        |
      __|________
      |         |
      '

    when 6
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \
        |      |
        |     / \
        |    /   \
        |
      __|________
      |         |
      '
    when 7
      puts '
        _______
        |/     |
        |     (_)
        |     _|_
        |    / | \
        |      |
        |     / \
        |    /   \
        |
      __|________
      |         |
      '

    end
  end

  def cls
    system('clear') || system('cls')
  end
end
