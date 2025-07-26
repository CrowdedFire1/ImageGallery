class CreateGalleriesPhotosJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_table :galleries_photos, id: false do |t|
      t.references :gallery, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
    end

    add_index :galleries_photos, [ :gallery_id, :photo_id ], unique: true
  end
end
