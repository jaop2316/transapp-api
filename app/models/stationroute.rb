class Stationroute < ApplicationRecord
  belongs_to :route
  belongs_to :station
end
