class CreateGalleries < ActiveRecord::Migration[8.0]
  def change
    create_table :galleries do |t|
      t.integer :gallery_id
      t.string :name
      t.boolean :hidden
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :galleries, :gallery_id, unique: true
  end
end
