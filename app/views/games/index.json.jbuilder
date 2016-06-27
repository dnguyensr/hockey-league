json.array!(@games) do |game|
  json.extract! game, :id, :team_game_id, :game_date, :game_time
  json.url game_url(game, format: :json)
end
