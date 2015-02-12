namespace :get_trails do
  desc "scrape all hong kong hiking trails"
  task :scrape => :environment do
    require 'open-uri'
    require 'nokogiri'

    starting_url = "http://www.oasistrek.com/trail_e.php"
    html_doc = Nokogiri::HTML(open(starting_url).read)
    
    # targets all hong kong regions and gets their name and links
    html_regions = html_doc.css(".bgb").children
    region_urls = [];
    html_regions.each do |i|
      region_urls.push(i.children[0].attr('href'))
      # puts 'hihi'
    end

    region_urls.each do |f|
      region_html_doc = Nokogiri::HTML(open("http:www.oasistrek.com/#{f}").read)
        puts region_html_doc.css('div.gbframe img').alt.gsub(" Hiking Routes")
    end

  end
end