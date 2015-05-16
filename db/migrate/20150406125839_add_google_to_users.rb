class AddGoogleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :google, :string
    add_column :users, :string, :string
  end
end
