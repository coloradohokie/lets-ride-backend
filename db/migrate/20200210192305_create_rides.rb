class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.string :date_time
      t.string :description
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
