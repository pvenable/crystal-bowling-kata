require "minitest/autorun"

require "../src/game"

describe Game do
  let(:game) { Game.new }

  it "scores a gutter game" do
    roll_many(0, 20)

    game.score.must_equal 0
  end

  it "scores open frames" do
    roll_many(1, 20)

    game.score.must_equal 20
  end

  it "scores a spare" do
    game.roll(1)
    game.roll(9)
    roll_many(1, 18)

    game.score.must_equal 29
  end

  it "scores a strike" do
    game.roll(10)
    roll_many(1, 18)

    game.score.must_equal 30
  end

  def roll_many(pins, times)
    times.times do
      game.roll(pins)
    end
  end
end
