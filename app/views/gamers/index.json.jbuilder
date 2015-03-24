json.array!(@gamers) do |gamer|
  json.extract! gamer, :id, :firstname, :lastname, :phonenumber, :email
  json.url gamer_url(gamer, format: :json)
end
