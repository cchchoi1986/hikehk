namespace :scrape_birds do 
  desc "Scrape Hong Kong birds from wikipedia"
  # rake get_birds:scrape_birds
  task :get_birds => :environment do
    require 'open-uri'
    require 'nokogiri'
    url = "http://en.wikipedia.org/wiki/List_of_birds_of_Hong_Kong"
    # get_birds(url)
    urla = "http://en.wikipedia.org/wiki/Pacific_loon"
    get_bird_pix(urla)
  end
  
  def get_bird_pix(url)
    bird_document = open(bird_url).read
    html_doc = Nokogiri::HTML(bird_document)
    
    birdDataStructure_pix = "tbody > tr > td > a > img"
    bird_pix = html_doc.css(birdDataStructure_pix).attr("href")
    puts bird_pix

  end

  def get_birds(url)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    # bird family name
    birdDataStructure_type = "div > div > div > h2 > span"
    bird_family_name = html_doc.css(birdDataStructure_type).attr("id")
    # puts bird_family_name 
    #Loons

    # bird common name
    birdDataStructure_name = "div > div.mw-content-ltr > ul > li > a"
    bird_common_name = html_doc.css(birdDataStructure_name).attr("title")
    # puts bird_common_name
    #Pacific loon

    # bird scentific name
    birdDataStructure_scentific = "div > div > ul > li > i"
    bird_scentific_name = html_doc.css(birdDataStructure_scentific).text
    # puts bird_scentific_name 
    #Gavia pacifica

    bird_common_name_url = html_doc.css(birdDataStructure_name).attr("href")
    bird_url = "http://en.wikipedia.org" + bird_common_name_url
    # puts bird_url
    # get_bird_pix(bird_url)

  end

end
