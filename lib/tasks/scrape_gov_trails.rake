namespace :scrape_gov_trails do 
  desc "Scrape trail's info from http://www.lcsd.gov.hk/en/healthy/hiking/"

  task :get_trails => :environment do
    require 'open-uri'
    require 'nokogiri'

    url = "http://www.lcsd.gov.hk/en/healthy/hiking/"
    get_trails(url)
  end
  
  def get_trails(url)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    

  end
end