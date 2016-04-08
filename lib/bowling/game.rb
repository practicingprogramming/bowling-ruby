module Bowling
  class Game
    def initialize
      @rolls = []
    end

    def roll(pins)
      @rolls << pins
    end

    def score
      @rolls.inject(0, :+)
    end
  end
end
