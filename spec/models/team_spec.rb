require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { Team.create(team_admin_id: 1, name: "Panthers", league_id: 2, city: "Carolina", mascot: "Panther", primary_color: "green", secondary_color: "black") }

  describe '#setup' do
    
    it 'has a team admin id' do
      expect(team.team_admin_id).to eq 1
    end

    it 'has a team name' do
      expect(team.name).to eq "Panthers"
    end

    it 'has a league id' do
      expect(team.league_id).to eq 2
    end

    it 'has a city' do
      expect(team.city).to eq "Carolina"
    end

    it 'has a mascot' do
      expect(team.mascot).to eq "Panther"
    end

    it 'has a primary color' do
      expect(team.primary_color).to eq "green"
    end

    it 'has a secondary color' do
      expect(team.secondary_color).to eq "black"
    end
  end
end
