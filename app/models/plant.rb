class Plant < ActiveRecord::Base

  serialize :photo_urls, Array
  
  has_many :regions, through: :region_plants
end
