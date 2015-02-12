namespace :get_trails do
  desc "scrape all hong kong hiking trails"
  task :scrape => :environment do
    require 'open-uri'
    require 'nokogiri'

    starting_url = "http://www.oasistrek.com/trail_e.php"
    html_doc = Nokogiri::HTML(open(starting_url).read)
    # targets all hong kong regions and gets their name and links
    html_regions = html_doc.css(".bgb").children
    html_regions.each do |i|
      region_name = 
      region_url = i.children[0].attr('href')
      # puts 'hihi'
    end

  end
end