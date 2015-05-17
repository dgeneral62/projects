json.array!(@user_friends) do |user_friend|
  json.extract! user_friend, :id, :gamer_id, :name, :player_rank, :platform
  json.url user_friend_url(user_friend, format: :json)
end
