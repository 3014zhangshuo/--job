class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :apply_id
      t.string :avatar

      t.timestamps
    end
  end
end
