json.array!(@trades) do |trade|
  json.extract! trade, :id, :proposing_team_id, :accepting_team_id, :accepted
  json.url trade_url(trade, format: :json)
end
