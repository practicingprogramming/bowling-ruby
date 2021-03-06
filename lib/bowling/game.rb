module Bowling
  class Game
    FRAME_NUMBER = 10

    def initialize
      @rolls = []
    end

    def roll(pins)
      @rolls << pins
    end

    def score
      @frames = Array.new(FRAME_NUMBER)
      @frames.fill(0)
      frame_index = 0
      frame_roll_index = 0
      @rolls.each_with_index do |roll, roll_index|
        @frames[frame_index] += roll
        if spare?(frame_index, frame_roll_index)
          @frames[frame_index] += @rolls[roll_index + 1]
          frame_index += 1
          frame_roll_index = 0
          next
        end
        if strike?(frame_index, frame_roll_index)
          @frames[frame_index] += @rolls[roll_index + 1]
          @frames[frame_index] += @rolls[roll_index + 2]
          frame_index += 1
          frame_roll_index = 0
          next
        end
        if frame_roll_index == 1 && frame_index < FRAME_NUMBER - 1
          frame_index += 1
          frame_roll_index = 0
        else
          frame_roll_index += 1
        end
      end
      @frames.inject(0, :+)
    end

    private

    def spare?(frame_index, frame_roll_index)
      frame_roll_index == 1 && @frames[frame_index] == 10 && frame_index < FRAME_NUMBER - 1
    end

    def strike?(frame_index, frame_roll_index)
      frame_roll_index == 0 && @frames[frame_index] == 10 && frame_index < FRAME_NUMBER - 1
    end
  end
end
