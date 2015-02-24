namespace :scrape_birds do 
  desc "Scrape Hong Kong birds from wikipedia"
  # rake scrape_birds:get_birds
  task :get_birds => :environment do
    require 'open-uri'
    require 'nokogiri'
    url = "http://en.wikipedia.org/wiki/List_of_birds_of_Hong_Kong"
    get_birds(url)
  end
  
  def get_bird_pix(bird_url)
    #concatenate bird_url with wikipedia
    complete_bird_url = "http://en.wikipedia.org" + bird_url 

    bird_document = open(complete_bird_url).read
    html_doc = Nokogiri::HTML(bird_document)
    birdDataStructure_pix = "a.image > img"
    bird_pix_list = html_doc.css(birdDataStructure_pix).first.attr("src").gsub("//","").gsub("220px","440px")
    return bird_pix_list
  end

  def get_birds(url)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)

    # set the format for the li
    birdsFormat = "div > div.mw-content-ltr > ul > li"
    birds = html_doc.css(birdsFormat)
    # puts birds 

    start = false
    # scrape the li an loop thru it with .each
    birds.each do |bird|
      # puts the li
      bird_common_name = bird.css('a').attr('title') ? bird.css('a').attr('title').text.squish : ''

      case bird_common_name
        when "Pacific loon"
          start = true
        when "List of birds"
          start = false
      end

      if start == true
          
        bird_scientific_name = bird.css('i').text
        puts bird_scientific_name

        bird_url = bird.css('a').attr('href')
        puts bird_url
        
        # call the get_bird_pix for that url
        bird = Bird.create({
          :common_name => bird_common_name,
          :scientific_name => bird_scientific_name,
          :photo_urls => get_bird_pix(bird_url)
          })
        puts bird.to_yaml
      end
    end
  end
end
