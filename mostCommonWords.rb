def top_3_words (text)
  res = {}
  input_str = text.downcase.scan(/[a-z']+/)

  input_str.each do |word|
    if res[word]
      res[word] += 1
    else
      res[word] = 1
    end
  end
  res.sort_by { |k, v| v }.reverse[0..2]
end

$/ = "\n\n"
puts "Input your string:"
input = STDIN.gets.gsub("\n", ' ').squeeze(' ')
words = top_3_words(input)

if words.empty?
  puts "\nThere isn't a single word!!!"
else
  puts "\nTop words:"
  words.each do |k, v|
    puts "[#{k}] - #{v} times"
  end
end