namespace :make_regions do
  desc "make regions of hong kong"
  task :create => :environment do
    # require 'open-uri'
    # require 'nokogiri'

    new_territories_array = [
      "Islands", 
      "Kwai Tsing", 
      "North", 
      "Sai Kung", 
      "Sha Tin", 
      "Tai Po", 
      "Tsuen Wan", 
      "Tuen Mun",
      "Yuen Long"
    ]

    kowloon_array = [
      "Kowloon City",
      "Kwun Tong",
      "Sham Shui Po",
      "Wong Tai Sin",
      "Yau Tsim Mong"
    ]

    hong_kong_array = [
      "Central & Western",
      "Eastern",
      "Southern",
      "Wan Chai"
    ]

    new_territories_array.each do |f|
      Region.create( :district => "New Territories", :name => f )
    end

    kowloon_array.each do |f|
      Region.create( :district => "Kowloon", :name => f)
    end

    hong_kong_array.each do |f|
      Region.create( :district => "Hong Kong", :name => f)
    end
    
  end
end