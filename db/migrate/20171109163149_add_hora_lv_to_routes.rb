class AddHoraLvToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :horaLV, :string
  end
end
