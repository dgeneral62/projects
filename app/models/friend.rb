class Friend < ActiveRecord::Base
  has_and_belongs_to_many :user_friends

  scoped_search on: :gamer_id, :complete_value => true
  scoped_search on: :name, :complete_value => true
  scoped_search on: :player_rank, :complete_value => true
  scoped_search on: :platform, :complete_value => true

  scoped_search :in => :user_friends, :on => :gamer_id
  scoped_search :in => :user_friends, :on  => :name
end
