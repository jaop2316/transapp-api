class AddFlotaDfToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :flotaDF, :integer
  end
end
