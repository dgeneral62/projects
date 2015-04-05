class AddConfirmationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Confirmation, :boolean
  end
end
