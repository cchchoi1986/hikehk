namespace :make_region_birds do
  desc "make regions of hong kong"
  # rake create:make_region_birds
  task :create => :environment do

    require 'nokogiri'
    require 'open-uri'

    url = "https://drive.google.com/open?id=1w1IC_uSzD1KXI9kcQbQB4e2x29_k924XEvxZRQiz5JA&authuser=0"

    html_doc = Nokogiri::HTML(open(url).read)

    region = html_doc.css("")


    districtsNum = {
      "Islands" => 1, 
      "Kwai Tsing" => 2, 
      "North" => 3, 
      "Sai Kung" => 4, 
      "Sha Tin" => 5, 
      "Tai Po" => 6, 
      "Tsuen Wan" => 7, 
      "Tuen Mun" => 8,
      "Yuen Long" => 9,
      "Kowloon City" => 10,
      "Kwun Tong" => 11,
      "Sham Shui Po" => 12,
      "Wong Tai Sin" => 13,
      "Yau Tsim Mong" => 14, 
      "Central & Western" => 15,
      "Eastern" => 16,
      "Southern" => 17,
      "Wan Chai" => 18
    }

    districts = {
      "Kowloon Park" => "Yau Tsim Mong",
      "Tai Po Kau Nature Reserve" => "Tsuen Wan",
      "Shing Mun Reservoir" => "Tsuen Wan",
      "Ho Chung Valley" => "Sai Kung", 
      "Ng Tung Chai" => "Tsuen Wan",
      "Wun Yiu" => "Tsuen Wan",
      "Tai Mo Shan" => "Tsuen Wan",
      "Sha Lo Tung" => "Tai Po", 
      "Mai Po Nature Reserve" => "Yuen Long",
      "Tsim Bei Tsui" => "Yuen Long",
      "Starling Inlet (Luk Keng and Nam Chung)" => "Tai Po",
      "Kam Tin" => "Yuen Long",
      "Long Valley" => "Yuen Long",
      "Hong Kong Park" => "Central & Western",
      "Lung Fu Shan" => "Central & Western",
      "Aberdeen Reservoirs" => "Southern",
      "The Peak" => "Central & Western",
      "Mount Davis" => "Central & Western",
    }
    
    Bird.where("").each do |f|
      puts districts
      puts f.id
      RegionBirdLink.create({
        :region_id => region,
        :bird_id => f.id
      })
    end
  end

  def find_bird(url)
    # urlHK = "http://www.hkbws.org.hk/web/eng/hongkong_eng.htm"
    # urlKln = "http://www.hkbws.org.hk/web/eng/kowloon_eng.htm"
    # urlNT = "http://www.hkbws.org.hk/web/eng/new_territories_eng.htm"
    # puts "scraping #{url}"
    # document = open(url).read
    # html_doc = Nokogiri::HTML(document)
    # locations = html_doc.css("td > div")
    # locations.each_with_index do |location, index|
      # puts location
      # puts index+1
      # CAUTION: HO CHUNG NOT WORKING

      # grap the location title
      # location_title = location.css('p:nth-child(1)').text
      # puts location_title
      # grab the location birds

      # match location with region

      # loop thry the birds and store them in DB

    # birdDataStructure_HK = "tbody > tr > td > div > p:nth-child(1)"
    # bird_HK_region = bird.css(birdDataStructure_HK).text
    # puts bird_HK_region

    # birdDataStructure_species = "tbody > tr > td > div > p:nth-child(5)"
    # bird__HK_name = bird.css(birdDataStructure_species).text
    # puts bird__HK_name

    # create an array of hash
    # equate the region to a district
    # save each record
    # Alexandrine Parakeet, Japanese Thrush, Grey-backed Thrush, Chestnut-tailed Starling, Red-whiskered Bulbul, Magpie Robin, Chinese Bulbul, Fork-tailed Sunbird, Blue Magpie, Black-crowned Night Heron
    # birdDataStructure_KLN_species = "table > tbody > tr > td > p:nth-child(5).style5"
    # bird_KLN_name = bird.css(birdDataStructure_KLN_species).text

    # birdDataStructure_NT_species = "tbody > tr > td > div > p:nth-child(5)" # missing ng tung chai, starling inlet
    # bird_NT_name = bird.css(birdDataStructure_NT_species).text

    # foo ={
    #   :bird_common_name => bird_name,
    #   :district => bird_region
    # }
    # HK_array.push(foo)
    end
  end
end