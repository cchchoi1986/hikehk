class Bird < ActiveRecord::Base
  has_many :regions, through: :region_birds

  has_many :region_bird_links
end
