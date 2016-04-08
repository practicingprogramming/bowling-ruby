describe Bowling::Game do
  let(:game) { Bowling::Game.new }

  describe 'all zeroes' do
    before do
      roll_many(game, 20, 0)
    end

    it 'scores 0' do
      expect(game.score).to eq(0)
    end
  end

  describe 'all ones' do
    before do
      roll_many(game, 20, 1)
    end

    it 'scores 1' do
      expect(game.score).to eq(20)
    end
  end

  def roll_many(game, times, pins)
    (0...times).each do
      game.roll(pins)
    end
  end
end
