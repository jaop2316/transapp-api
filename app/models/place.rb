class Place < ApplicationRecord
  belongs_to :category
  validates :name, :presence => true

  has_many :placeroutes
  has_many :routes, :through => :placeroute

end
