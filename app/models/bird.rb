class Bird < ActiveRecord::Base
  has_many :regions, through: :region_birds
end
