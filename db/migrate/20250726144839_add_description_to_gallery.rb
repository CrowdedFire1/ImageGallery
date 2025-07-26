class AddDescriptionToGallery < ActiveRecord::Migration[8.0]
  def change
    add_column :galleries, :description, :string
  end
end
