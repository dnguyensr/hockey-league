json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :jersey_number, :team_id
  json.url player_url(player, format: :json)
end
