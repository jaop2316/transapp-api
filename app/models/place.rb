class Place < ApplicationRecord
  belongs_to :category

  has_many :placeroutes
  has_many :routes, :through => :placeroute

end
