class Trail < ActiveRecord::Base

  serialize :description, Array
  serialize :food_supply, Array
  serialize :warning, Array
  serialize :photo_urls, Array
  serialize :start_coordinates, Hash
  serialize :end_coordinates, Hash
  serialize :trail_coordinates, Array

  belongs_to :region
end
