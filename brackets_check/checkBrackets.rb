def is_correct_brackets(string, key_value)
  if string.length % 2 != 0
    return false
  end

  closed_brackets = []

  string.chars do |char|
    if (closed_by_open_bracket = key_value[char])
      closed_brackets << closed_by_open_bracket
    elsif closed_brackets.pop != char
      return false
    end
  end
  closed_brackets.length === 0
end

def input_char
  character = ''
  while !character || (character && character.length < 1)
    character = STDIN.gets.chomp.encode('UTF-8')[0]
    end
  if character == '0'
    exit
  end
  character
end

brackets_key_value = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
}

all_brackets = brackets_key_value.keys + brackets_key_value.values
input_string = ''

puts "<<Brackets check>>\n(enter 0 to exit)"
while 1
  puts "\nEnter bracket: "

  character = input_char

  unless all_brackets.include? character
    next
  end

  input_string += character

  res = is_correct_brackets(input_string, brackets_key_value)

  puts "Brackets: #{input_string} => #{res}"
end