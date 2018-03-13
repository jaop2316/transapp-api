class Route < ApplicationRecord
  validates :name, :presence => true
  validates :observations, :presence => true
  validates :horaLV, :presence => true
  validates :horaS, :presence => true
  validates :horaDF, :presence => true


  has_many :stationroutes
  has_many :stations, :through => :stationroute

  has_many :placeroutes
  has_many :places, :through => :placeroute

end
