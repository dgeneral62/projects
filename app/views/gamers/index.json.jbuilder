json.array!(@gamers) do |gamer|
  json.extract! gamer, :id, :name, :gamer_id, :phonenumber, :email
  json.url gamer_url(gamer, format: :json)
end
