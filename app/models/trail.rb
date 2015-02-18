class Trail < ActiveRecord::Base

  serialize :photo_urls, Array

  belongs_to :region
end
