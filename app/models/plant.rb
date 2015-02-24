class Plant < ActiveRecord::Base

  serialize :photo_urls, Array
  
  has_many :region_plant_links
  has_many :regions, through: :region_plant_links
end
