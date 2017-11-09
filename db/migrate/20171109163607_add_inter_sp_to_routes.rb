class AddInterSpToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :interSP, :string
  end
end
