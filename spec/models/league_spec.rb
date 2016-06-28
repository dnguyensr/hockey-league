require 'rails_helper'

RSpec.describe League, type: :model do
  let(:league) { League.create(league_admin_id: 1, name: "NHL", sport: "Hockey") }

  describe '#setup' do
    
    it 'has a league admin id' do
      expect(league.league_admin_id).to eq 1
    end

    it 'has a league name' do
      expect(league.name).to eq "NHL"
    end

    it 'has a sport' do
      expect(league.sport).to eq "Hockey"
    end
  end
end
