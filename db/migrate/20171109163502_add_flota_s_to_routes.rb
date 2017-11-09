class AddFlotaSToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :flotaS, :integer
  end
end
