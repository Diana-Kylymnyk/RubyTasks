def AlphabetPosition(arg)
  result = ""
  chars = arg.split('')
  chars.each { |char|
    count = 0
    ('a'..'z').each { |letter|
      count += 1
      if letter == char
        result += "#{count} "
      end
    }
  }
  result.delete_suffix(' ')
end

puts "Enter your string:"

letters = STDIN.gets.encode("UTF-8").downcase
positions = AlphabetPosition(letters)

puts "Alphabetical position of entered letters:\n" + positions
