class RemoveNameToNotification < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :name
  end
end
