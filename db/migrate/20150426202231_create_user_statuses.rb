class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :email
      t.string :status

      t.timestamps null: false
    end
  end
end
