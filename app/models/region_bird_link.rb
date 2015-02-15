class RegionBirdLink < ActiveRecord::Base
  belongs_to :bird
  belongs_to :region
end
