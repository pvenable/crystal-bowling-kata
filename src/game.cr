class Game
  def initialize
    @rolls = [] of Int32
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    total = 0
    roll_index = 0

    10.times do |frame_index|
      if strike?(roll_index)
        total += strike_bonus(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        total += 10 + spare_bonus(roll_index)
        roll_index += 2
      else
        total += @rolls[roll_index] + @rolls[roll_index + 1]
        roll_index += 2
      end
    end

    total
  end

  private def spare?(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

  private def spare_bonus(roll_index)
    @rolls[roll_index + 2]
  end

  private def strike?(roll_index)
    @rolls[roll_index] == 10
  end

  private def strike_bonus(roll_index)
    10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end
end
