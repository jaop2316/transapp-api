class AddInterDfpToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :interDFP, :string
  end
end
