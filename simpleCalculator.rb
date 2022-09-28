puts 'Num1:'
number1 = STDIN.gets.chomp.to_i
puts 'Num2:'
number2 = STDIN.gets.chomp.to_i

puts 'Operation (+ - * /)'
operation = STDIN.gets.chomp

puts 'Result:'
case operation
when '+'
  puts number1 + number2
when '-'
  puts number1 - number2
when '*'
  puts number1 * number2
when '/'
  begin
    puts number1 / number2
  rescue ZeroDivisionError
    puts 'Cannot divide by zero'
  end
else
  puts 'No such operation'
end
