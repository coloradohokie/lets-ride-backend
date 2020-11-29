class AddCreatedByToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :created_by, :string
    add_column :routes, :difficulty, :integer
    add_column :routes, :miles, :integer
    add_column :routes, :minutes, :integer
  end
end
