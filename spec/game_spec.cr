require "minitest/autorun"

require "../src/game"

describe Game do
  let(:game) { Game.new }

  it "scores a gutter game" do
    roll_many(game, 0, 20)

    game.score.must_equal 0
  end

  it "scores open frames" do
    roll_many(game, 1, 20)

    game.score.must_equal 20
  end

  def roll_many(game, pins, times)
    times.times do
      game.roll(pins)
    end
  end
end
