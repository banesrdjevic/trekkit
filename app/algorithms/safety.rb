module SafetyAlgorithm
  def self.run(mode)
    hour = Time.now.hour

    case hour
    when 8..20
      safety_exp = 100

    when 20..22, 6..8
      case mode
      when 'driving'
        safety_exp = 100
      when 'cab'
        safety_exp = 95
      when 'uber'
        safety_exp = 85
      when 'bus', 'subway', 'bicycling', 'divvy'
        safety_exp = 75
      when 'walking'
        safety_exp = 60
      end

    when 22..23, 0..6
      case mode
      when 'driving'
        safety_exp = 100
      when 'cab'
        safety_exp = 75
      when 'uber'
        safety_exp = 60
      when 'bus', 'subway', 'bicycling', 'divvy'
        safety_exp = 25
      when 'walking'
        safety_exp = 0
      end
    end
    safety_exp
  end
end