class RomanNumeralConverter
  
  DIGITS = [
    ["I", 1],
    ["IV", 4],
    ["V", 5],
    ["IX", 9],
    ["X", 10],
    ["L", 50],
    ["C", 100],
    ["D", 500],
    ["M", 1000],
  ]
  def convert(number)
    result = ""

    DIGITS.reverse.each do |glyph, limit|
      while number >= limit
        number -= limit
        result << glyph
      end
    end

    result
  end
end