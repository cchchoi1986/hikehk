class Trail < ActiveRecord::Base

  serialize :description, Array
  serialize :food_supply, Array
  serialize :warning, Array
  serialize :photo_urls, Array
  serialize :vegetation, Array

  belongs_to :region
end
