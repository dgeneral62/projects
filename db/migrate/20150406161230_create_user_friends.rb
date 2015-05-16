class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
      t.string :gamer_id
      t.string :name
      t.string :player_rank
      t.string :platform

      t.timestamps null: false
    end
  end
end
