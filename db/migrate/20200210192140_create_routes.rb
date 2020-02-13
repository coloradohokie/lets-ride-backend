class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.string :start_location
      t.string :end_location
      t.string :map_path

      t.timestamps
    end
  end
end
