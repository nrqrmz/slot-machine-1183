require_relative '../slot_machine'

def test_scenario(reels, value)
  it "returns #{value} when passed [#{reels[0]}|#{reels[1]}|#{reels[2]}]" do
    slot_machine = SlotMachine.new(reels)
    score = slot_machine.score
    expect(score).to eq(value)
  end
end

describe SlotMachine do
  describe '#score' do
    describe 'three identical symbols' do
      test_scenario(%w[joker joker joker], 50)
      test_scenario(%w[star star star], 40)
      test_scenario(%w[bell bell bell], 30)
      test_scenario(%w[seven seven seven], 20)
      test_scenario(%w[cherry cherry cherry], 10)
    end

    describe 'two jokers and other symbol' do
      test_scenario(%w[joker joker star], 25)
      test_scenario(%w[joker joker bel], 25)
      test_scenario(%w[joker joker sever], 25)
      test_scenario(%w[joker joker cherry], 25)
    end

    describe 'two equal symbols and a joker' do
      test_scenario(%w[star star joker], 20)
      test_scenario(%w[bell bell joker], 15)
      test_scenario(%w[seven seven joker], 10)
      test_scenario(%w[cherry cherry joker], 5)
    end

    describe 'all different symbols' do
      test_scenario(%w[bell cherry seven], 0)
    end
  end
end
