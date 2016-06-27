json.array!(@teams) do |team|
  json.extract! team, :id, :team_admin_id, :name, :league_id, :city, :mascot, :primary_color, :secondary_color
  json.url team_url(team, format: :json)
end
