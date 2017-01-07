class AddUserIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :user_id, :integer
    add_index :works, :user_id
  end
end
