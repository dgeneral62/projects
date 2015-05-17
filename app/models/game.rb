class Game < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :user_games

  scoped_search on: :name, :complete_value => true
  scoped_search on: :rating, :complete_value => true
  scoped_search on: :publisher, :complete_value => true
  scoped_search on: :platform, :complete_value => true
end
