class AddPostDateToUserStatus < ActiveRecord::Migration
  def change
    add_column :user_statuses, :PostDate, :date
  end
end
