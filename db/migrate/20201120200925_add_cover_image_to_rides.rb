class AddCoverImageToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :cover_image_url, :string
    rename_column :motorcycles, :image_path, :image_url
    rename_column :photos, :image_path, :image_url
    rename_column :routes, :map_path, :map_url
  end
end
