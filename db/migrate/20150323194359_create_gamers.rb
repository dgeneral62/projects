class CreateGamers < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.string :firstname
      t.string :lastname
      t.string :phonenumber
      t.string :email

      t.timestamps null: false
    end
  end
end
