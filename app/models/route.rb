class Route < ApplicationRecord
  has_many :stationroutes
  has_many :stations, :through => :stationroute

  has_many :placeroutes
  has_many :places, :through => :placeroute
end
