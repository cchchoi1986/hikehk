class Region < ActiveRecord::Base
  has_many :region_bird_links
  has_many :birds, through: :region_bird_links
  has_many :region_trail_links
  has_many :trails, through: :region_trail_links
  has_many :region_plant_links
  has_many :plants, through: :region_plant_links
end
