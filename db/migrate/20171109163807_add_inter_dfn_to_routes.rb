class AddInterDfnToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :interDFN, :string
  end
end
