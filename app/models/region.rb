class Region < ActiveRecord::Base
  has_many :birds, through: :region_birds
  has_many :trails, through: :region_trails
  has_many :plants, through: :region_plants
end
