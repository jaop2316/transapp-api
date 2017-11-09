class AddInterLvpToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :interLVP, :string
  end
end
