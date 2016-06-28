require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#setup' do

    it 'has an away team id' do
      away_team = instance_double("Team", :id => 1)
      home_team = instance_double("Team", :id => 2)
      Game.create(away_team_id: away_team.id, home_team_id: home_team.id, date_time: "2016-07-03 07:55:40")

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
