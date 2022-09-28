require_relative 'reader'

class Parser
  def parse(input)

    @reader = Calc_Reader.new(input)

    value = evaluation
    charSymbol = @reader.get_symbol

    if charSymbol.type == CharSymbol::End
      value
    else
      raise 'No end to expression'
    end
  end

  def evaluation
    value = mult_div

    charSymbol = @reader.get_symbol

    while (charSymbol.type == CharSymbol::Plus || charSymbol.type == CharSymbol::Minus)
      value2 = mult_div

      case charSymbol.type

      when CharSymbol::Plus
        value += value2
      when CharSymbol::Minus
        value -= value2
      end

      charSymbol = @reader.get_symbol
    end
    @reader.go_back
    value
  end

  def mult_div
    value = get_digit

    charSymbol = @reader.get_symbol
    while (charSymbol.type == CharSymbol::Multiply || charSymbol.type == CharSymbol::Divide || charSymbol.type == CharSymbol::Index)
      denominator = get_digit

      case charSymbol.type
      when CharSymbol::Multiply
        value *= denominator
      when CharSymbol::Divide
        begin
          value /= denominator
        rescue ZeroDivisionError
          puts 'Cannot divide by zero'
        end
      else
        value **= denominator
      end
      charSymbol = @reader.get_symbol
    end
    @reader.go_back
    value
  end

  def get_digit
    charSymbol = @reader.get_symbol

    case charSymbol.type
    when CharSymbol::LBracket
      value = evaluation

      next_charSymbol = @reader.get_symbol
      unless next_charSymbol.type == CharSymbol::RBracket
        raise 'Missing bracket'
      end
    when CharSymbol::Number
      value = charSymbol.value
    when CharSymbol::Minus
      next_symbol = @reader.get_symbol
      value = 0 - next_symbol.value
    else
      raise 'Incorrect!'
    end
    value
  end
end
