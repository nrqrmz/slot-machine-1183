class SlotMachine
  def initialize(reels = [])
    @reels = reels
  end

  SYMBOLS = %w[cherry seven bell star joker]

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end
    @reels
  end

  def score
    if three_identical?
      get_points(@reels[0]) * 10
    elsif two_and_joker?
      get_points(@reels.sort[1]) * 5
    else
      0
    end
  end

  private

  def three_identical?
    @reels.uniq.count == 1
  end

  def two_and_joker?
    @reels.uniq.count == 2 && @reels.include?('joker')
  end

  def get_points(symbol)
    SYMBOLS.index(symbol) + 1
  end
end
