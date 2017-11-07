class Station < ApplicationRecord
  has_many :stationroutes
  has_many :routes, :through => :stationroutes
end
