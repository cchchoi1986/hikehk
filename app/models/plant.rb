class Plant < ActiveRecord::Base
  has_many :regions, through: :region_plants
end
