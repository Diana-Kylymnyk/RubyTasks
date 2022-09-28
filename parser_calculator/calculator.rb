require_relative 'parser'

parser = Parser.new
puts "<<Parser calculator>>"
puts "Example: (1+(45-8)*3)/(2^2)"
loop do
  begin
    print 'Enter string: '
    puts parser.parse(gets)
  rescue RuntimeError
    puts "Error: #{$!}"
  end
end
