# Клас Game зберігає стан гри та надає функції для її розвитку
class Game

  def initialize(word)
    @letters = get_letters(word)

    @errors = 0

    @correct_letters = []
    @wrong_letters = []

    @status = 0
  end

  # Метод, який повертає масив букв загаданого слова
  def get_letters(word)
    if word == nil || word == ''
      abort 'To play, enter the hidden word as an argument when ' \
        'starting the program'
    end

    word.encode('UTF-8').split('')
  end

  # Метод, що повертає статус гри
  def status
    @status
  end

  # Основний метод гри "зробити наступний крок".
  def next_step(letter)
    if @status == -1 || @status == 1
      return
    end

    if @correct_letters.include?(letter) || @wrong_letters.include?(letter)
      return
    end

    if @letters.include?(letter)
      @correct_letters << letter

      # Додаткова перевірка
      if @correct_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else
      @wrong_letters << letter
      @errors += 1
      if @errors >= 7
        @status = -1
      end
    end
  end

  # Метод, що запитує користувача букву і повертає її як результат.
  def ask_next_letter
    puts "\nEnter next letter"

    letter = ''
    while letter == ''
      letter = STDIN.gets.encode('UTF-8').chomp
    end

    next_step(letter)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def correct_letters
    @correct_letters
  end

  def wrong_letters
    @wrong_letters
  end
end