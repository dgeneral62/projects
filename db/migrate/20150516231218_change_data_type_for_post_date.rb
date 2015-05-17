class ChangeDataTypeForPostDate < ActiveRecord::Migration
  def change
    change_table :user_statuses do |t|
          t.change :PostDate, :datetime   
    end
  end
end
