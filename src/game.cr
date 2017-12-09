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
      if spare?(roll_index)
        total += 10 + @rolls[roll_index + 2]
      else
        total += @rolls[roll_index] + @rolls[roll_index + 1]
      end

      roll_index += 2
    end

    total
  end

  private def spare?(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end
end
