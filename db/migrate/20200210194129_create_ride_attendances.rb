class CreateRideAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :ride_attendances do |t|
      t.references :rider, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true
      t.references :motorcycle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
