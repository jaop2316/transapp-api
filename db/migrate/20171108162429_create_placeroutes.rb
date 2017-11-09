class CreatePlaceroutes < ActiveRecord::Migration[5.1]
  def change
    create_table :placeroutes do |t|
      t.integer :place_id
      t.integer :route_id

      t.timestamps
    end
  end
end
