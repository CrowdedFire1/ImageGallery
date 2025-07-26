class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.integer :photo_id
      t.string :alt_text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :photos, :photo_id, unique: true
  end
end
