class CreateStationroutes < ActiveRecord::Migration[5.1]
  def change
    create_table :stationroutes do |t|
      t.integer :station_id
      t.integer :route_id

      t.timestamps
    end
  end
end
