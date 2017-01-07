class AddIsRecruiterToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_recruiter, :boolean, default: false
  end
end
