class AddPlaceurlToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :placeurl, :string
  end
end
