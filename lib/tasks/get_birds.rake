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

    birdDataStructure_type = "div > div > div > h2 > span"
    # attr "/^()(.*?)()$/"
    birdDataStructure_name = "div > div.mw-content-ltr > ul > li > a"
    # attr "/^()(.*?)()$/"
    birdDataStructure_scentific = "div > div > ul > li > i"
    # attr "/^()(.*?)()$/"

    bird_type = html_doc.css(birdDataStructure_type)

    bird_common_name = html_doc.css(birdDataStructure_name)

    bird_common_name_url = html_doc.css(birdDataStructure_name)['href']

    bird_scentific_name = html_doc.css(birdDataStructure_scentific)

    puts bird_common_name
    puts bird_common_name_url
    puts bird_scentific_name

    birdDataStructure_pix = "tbody > tr > td > a > img"
    # attr /^()(.*?)()$/
    url = url+ "/"+ birdDataStructure_name
    bird_pix = html_doc.css(birdDataStructure_pix
      )


  end
end