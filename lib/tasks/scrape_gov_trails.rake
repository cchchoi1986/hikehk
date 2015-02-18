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

    trailDataStructure_first_pix = "div > div > div.slide.cycle-slide.cycle-slide-active > a.clr_bx.cboxElement > img"

    trailDataStructure_other_pix = "div.cycle-carousel-wrap > div.thumbs.cycle-slide > a > span > img"

    trailDataStructure_name = "div > div > div > div > h1"



  end
end