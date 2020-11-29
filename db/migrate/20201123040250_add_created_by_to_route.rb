class AddCreatedByToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :created_by, :string
  end
end
