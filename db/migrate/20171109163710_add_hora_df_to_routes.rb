class AddHoraDfToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :horaDF, :string
  end
end
