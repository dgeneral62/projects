json.array!(@friends) do |friend|
  json.extract! friend, :id, :gamer_id, :name, :player_rank, :platform
  json.url friend_url(friend, format: :json)
end
