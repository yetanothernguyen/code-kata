class FootballReader
  
  def initialize(filepath)
    @filepath = filepath
  end

  def read
    team = nil
    diff = nil
    File.open(@filepath).each do |row|
      tokens = row.split(' ')
      if tokens[0].to_i > 0
        diff = (tokens[6].to_i - tokens[8].to_i).abs
        if !team || diff > diff
          team = tokens[1]
          diff = diff
        end
      end
    end

    puts "Team: #{team}"
    puts "Goals difference: #{diff}"
  end
end

FootballReader.new('football.dat').read