namespace :scrape_birds do 
  desc "Scrape Hong Kong birds from wikipedia"

  task :get_birds => :environment do
    require 'open-uri'
    require 'nokogiri'

    url = "http://en.wikipedia.org/wiki/List_of_birds_of_Hong_Kong"
    get_birds(url)
  end
  
  def get_birds(url)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    # bird type from kimono
    birdDataStructure_type = "div > div > div > h2 > span"
    bird_type = html_doc.css(birdDataStructure_type)
    puts bird_type

    # bird common name
    birdDataStructure_name = "div > div.mw-content-ltr > ul > li > a"
    bird_common_name = html_doc.css(birdDataStructure_name)
    puts bird_common_name

    bird_common_name_url = html_doc.css(birdDataStructure_name)['href']
    puts bird_common_name_url

    #bird scentific name
    birdDataStructure_scentific = "div > div > ul > li > i"
    bird_scentific_name = html_doc.css(birdDataStructure_scentific)
    puts bird_scentific_name

    #bird picture url
    birdDataStructure_pix = "tbody > tr > td > a > img"
    new_url = url+ "/"+ birdDataStructure_name
    bird_pix = html_doc.css(birdDataStructure_pix)

  end
end