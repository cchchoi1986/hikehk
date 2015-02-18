namespace :scrape_birds do 
  desc "Scrape Hong Kong birds from wikipedia"

  task :get_birds => :birds do
    require 'open-uri'
    require 'nokogiri'

    url = "http://en.wikipedia.org/wiki/List_of_birds_of_Hong_Kong"
    get_trails(url)
  end
  
  def get_birds(url)
    document = open(url).read
    html_doc = Nokogiri::HTML(document)


  end
end