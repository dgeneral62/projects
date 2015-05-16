json.array!(@games) do |game|
  json.extract! game, :id, :name, :rating, :release_date, :publisher, :platform
  json.url game_url(game, format: :json)
end
