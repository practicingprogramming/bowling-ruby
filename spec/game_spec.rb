describe Bowling::Game do
  let(:game) { Bowling::Game.new }

  describe 'all zeroes' do
    before do
      (0...20).each do
        game.roll(0)
      end
    end

    it 'scores 0' do
      expect(game.score).to eq(0)
    end
  end
end
