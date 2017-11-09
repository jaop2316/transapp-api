class AddHoraSToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :horaS, :string
  end
end
