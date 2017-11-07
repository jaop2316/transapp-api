class Route < ApplicationRecord
  has_many :stationroutes
  has_many :stations, :through => :stationroute
end
