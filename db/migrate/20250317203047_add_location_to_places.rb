class AddLocationToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :location, :string
  end
end
