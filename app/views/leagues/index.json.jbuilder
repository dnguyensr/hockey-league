json.array!(@leagues) do |league|
  json.extract! league, :id, :league_admin_id, :name, :sport
  json.url league_url(league, format: :json)
end
