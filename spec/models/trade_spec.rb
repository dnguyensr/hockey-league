require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:trade) { Trade.create(proposing_team_id: 1, accepting_team_id: 2, accepted: true) }

  describe '#setup' do

    it 'has a proposing team id' do
      expect(trade.proposing_team_id).to eq 1
    end

    it 'has an accepting team id' do
      expect(trade.accepting_team_id).to eq 2
    end

    it 'returns true if trade has been accepted' do
      expect(trade.accepted).to eq true
    end
  end
end
