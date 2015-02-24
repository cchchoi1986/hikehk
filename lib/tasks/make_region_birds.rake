namespace :make_region_birds do
  desc "make regions of hong kong"
  task :create => :environment do

    require 'nokogiri'
    require 'open-uri'

    urlHK = "http://www.hkbws.org.hk/web/eng/hongkong_eng.htm"
    urlKln = "http://www.hkbws.org.hk/web/eng/kowloon_eng.htm"
    urlNT = "http://www.hkbws.org.hk/web/eng/new_territories_eng.htm"
    html_doc = Nokogiri::HTML(open(url).read)

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

    def find_bird(url)

      hk_bird_document = open(url).read
      HK_array = [];

      birdDataStructure_HK = "tbody > tr > td > div > p:nth-child(1).style3"
      bird_region = bird.css(birdDataStructure_HK).text

      birdDataStructure_species = "tbody > tr > td > div > p:nth-child(5).style2"
      bird_name = bird.css(birdDataStructure_species).text

      foo ={
        :bird_common_name => bird_name,
        :district => bird_region
      }
      HK_array.push(foo)


      birdDataStructure_KLN_species = "table > tbody > tr > td > p:nth-child(5).style5"
      birdDataStructure_NT_species = ""


      Bird.where().each do |f|
        puts districts
        puts f.id
        # RegionBirdLink.create({
        #   :region_id => districts
        #   :bird_id => f.id
        # })
      end
    end



  end
end