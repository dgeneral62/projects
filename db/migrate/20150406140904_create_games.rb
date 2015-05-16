class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :rating
      t.string :release_date
      t.string :publisher
      t.string :platform

      t.timestamps null: false
    end
  end
end
