require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { Player.create(first_name: "Richie", last_name: "Yi", jersey_number: "33", team_id: 1) }

  describe '#setup' do

    it 'has a first name' do
      expect(player.first_name).to eq "Richie"
    end

    it 'has a last name' do
      expect(player.last_name).to eq "Yi"
    end

    it 'has a jersey number' do
      expect(player.jersey_number).to eq "33"
    end

    it 'has a team id' do
      expect(player.team_id).to eq 1
    end
  end
end
