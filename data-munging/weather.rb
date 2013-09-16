class WeatherReader
  
  def initialize(filepath)
    @filepath = filepath
  end

  def read
    smallest_day = nil
    smallest_temp = nil
    File.open(@filepath).each do |row|
      tokens = row.split(' ')  
      if tokens[0].to_i > 0
        if !smallest_temp || smallest_temp > tokens[2].to_i
          smallest_temp = tokens[2].to_i
          smallest_day = tokens[0]
        end
      end
    end

    puts "Day with the smallest temperature: #{smallest_day}"
    puts "Smallest temperature spread: #{smallest_temp}"
  end
end

WeatherReader.new('weather.dat').read