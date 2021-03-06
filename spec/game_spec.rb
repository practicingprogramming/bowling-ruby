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

  describe 'one spare' do
    before do
      game.roll(3)
      game.roll(7)
      roll_many(game, 18, 1)
    end

    it 'calculates score' do
      expect(game.score).to eq(29)
    end
  end

  describe 'two spares' do
    before do
      game.roll(3)
      game.roll(7)
      game.roll(4)
      game.roll(6)
      roll_many(game, 16, 1)
    end

    it 'calculates score' do
      expect(game.score).to eq(41) # 16 + 10 + 10 + 4 + 1
    end
  end

  describe 'last frame is spare' do
    before do
      roll_many(game, 18, 1)
      game.roll(3)
      game.roll(7)
      game.roll(5)
    end

    it 'calculates score' do
      expect(game.score).to eq(33) # 18 + 15
    end
  end

  describe 'one strike' do
    before do
      game.roll(10)
      roll_many(game, 18, 1)
    end

    it 'calculates score' do
      expect(game.score).to eq(30) # 10 + 18 + 2
    end
  end

  describe 'two strikes' do
    before do
      game.roll(10)
      game.roll(10)
      roll_many(game, 16, 1)
    end

    it 'calculates score' do
      expect(game.score).to eq(49) # 21 + 12 + 16
    end
  end

  describe 'last frame is strike' do
    before do
      roll_many(game, 18, 1)
      game.roll(10)
      game.roll(4)
      game.roll(6)
    end

    it 'calculates score' do
      expect(game.score).to eq(38) # 18 + 20
    end
  end

  describe 'all strikes' do
    before do
      roll_many(game, 12, 10)
    end

    it 'calculates score' do
      expect(game.score).to eq(300)
    end
  end

  def roll_many(game, times, pins)
    (0...times).each do
      game.roll(pins)
    end
  end
end
