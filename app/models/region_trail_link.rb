class RegionTrailLink < ActiveRecord::Base
  belongs_to :trail 
  belongs_to :region 
end
