require_relative 'symbol'
require_relative 'parser'

class Calc_Reader
  def initialize(input)
    @input = input
    @get_last = false
  end

  def get_symbol
    if @get_last
      @get_last = false
      return @last_charSymbol
    end

    charSymbol = CharSymbol.new

    @input.lstrip!

    case @input
    when /\A\(/ then
      charSymbol.type = CharSymbol::LBracket
    when /\A\)/ then
      charSymbol.type = CharSymbol::RBracket
    when /\A\^/ then
      charSymbol.type = CharSymbol::Index
    when /\A\*/ then
      charSymbol.type = CharSymbol::Multiply
    when /\A\// then
      charSymbol.type = CharSymbol::Divide
    when /\A\+/ then
      charSymbol.type = CharSymbol::Plus
    when /\A-/ then
      charSymbol.type = CharSymbol::Minus

    when /(\d+)/ #Integers      #Floats: /\A\d+(\.\d+)?/
      charSymbol.type = CharSymbol::Number
      charSymbol.value = $&.to_i #Floats: $&.to_f

    when ''
      charSymbol.type = CharSymbol::End
    end

    if charSymbol.unknown?
      raise ('Unknown operand')
    end
    @input = $'

    @last_charSymbol = charSymbol
    charSymbol
  end

  def go_back
    @get_last = true
  end
end
