class AddInterSnToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :interSN, :string
  end
end
