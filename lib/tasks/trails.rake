desc "scrape the relationship between recipes and a category"
  task :recipe_category_relations, [:starting_index] => :environment do |task, args|
    require 'open-uri'
    require 'nokogiri'

  end
end