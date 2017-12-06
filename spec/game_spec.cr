require "spec"
require "../src/game"

describe Game do
  it "scores a gutter game" do
    game = Game.new

    20.times do
      game.roll(0)
    end

    game.score.should eq 0
  end
end
