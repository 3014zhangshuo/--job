class CreateApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :applies do |t|
      t.string :name
      t.string :description
      t.string :start
      t.integer :number
      t.string :web
      t.string :phone
      t.string :picture

      t.timestamps
    end
  end
end
