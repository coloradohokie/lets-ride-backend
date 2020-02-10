class CreateMotorcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :motorcycles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.references :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
