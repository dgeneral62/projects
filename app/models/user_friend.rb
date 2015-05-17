class UserFriend < ActiveRecord::Base
  has_and_belongs_to_many :friends

  scoped_search on: :gamer_id, :complete_value => true
  scoped_search on: :name, :complete_value => true
  scoped_search on: :player_rank, :complete_value => true
  scoped_search on: :platform, :complete_value => true
end
