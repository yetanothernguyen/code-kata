class StatsReader

  def initialize(filepath, type)
    @filepath = filepath
    @type = type
  end

  def read
    stats = []
    File.open(@filepath).each do |row|
      tokens = row.split(' ')
      if tokens[0].to_i > 0
        stat = calculate_stat(tokens)
        if !stats[1] || stats[1] > stat
          stats[0] = get_stat_owner(tokens)
          stats[1] = stat
        end
      end
    end

    puts "#{stats[0]} #{stats[1]}"
  end

  def calculate_stat(tokens)
    if @type == 'weather'
      return tokens[2].to_i
    elsif @type == 'football'
      return (tokens[6].to_i - tokens[8].to_i).abs
    end
  end

  def get_stat_owner(tokens)
    if @type == 'weather'
      return tokens[0]
    elsif @type == 'football'
      return tokens[1]
    end
  end
end

StatsReader.new('weather.dat', 'weather').read
StatsReader.new('football.dat', 'football').read