class RegionPlantLink < ActiveRecord::Base
  belongs_to :region 
  belongs_to :plant 
end
