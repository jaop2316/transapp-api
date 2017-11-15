class Station < ApplicationRecord
  has_many :stationroutes
  has_many :routes, :through => :stationroutes

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  # Get url for JSON structure.
  def image_url
    #current_path = Dir.pwd
    #{root_url} + image.url(:thumb)
    current_path = Dir.pwd
    base_path = current_path + "/public/"
    image_path = image.url(:thumb)
    base_path + image_path
  end



end
