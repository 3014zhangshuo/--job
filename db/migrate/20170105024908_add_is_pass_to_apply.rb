class AddIsPassToApply < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :is_pass, :boolean, default: false
  end
end
