json.array!(@user_games) do |user_game|
  json.extract! user_game, :id, :name, :rating, :release_date, :publisher, :platform
  json.url user_game_url(user_game, format: :json)
end
