require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { Game.create(away_team_id: 1, home_team_id: 2, date_time: "2016-07-03 07:55:40") }

  describe '#setup' do

    it 'has an away team id' do
      expect(game.away_team_id).to eq 1
    end

    it 'has a home team id' do
      expect(game.home_team_id).to eq 2
    end

    it 'has a game date and time' do
      expect(game.date_time).to eq "2016-07-03 07:55:40"
    end
  end
end
