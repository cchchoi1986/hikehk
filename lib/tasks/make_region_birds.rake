namespace :make_region_birds do
  desc "make regions of hong kong"
  # rake make_region_birds:create
  task :create => :environment do

    require 'nokogiri'
    require 'open-uri'
    require 'csv'

    # csvdropbox = "https://dl.dropboxusercontent.com/u/7814617/LinkRegionBird.csv"
    # url_data = open(".csv")
    # csv_text = File.read('lib/tasks/LinkRegionBird.csv')
    # csv = CSV.parse(csv_text, :headers => true)
    # puts csv

    hash = {}
    CSV.foreach('lib/tasks/LinkRegionBird.csv', :headers => true) do |row| 
      array = []
      (2..row.length()-1).each do |i|
        array.push(row[i].squish.gsub("'","")) unless row[i] == nil
      end
      if hash[row[0]]
        hash[row[0]].push(array).flatten!.uniq!
      else
        hash[row[0]] = array
      end
      # puts hash.to_yaml
      # puts "------------"
    end

    match = 0;
    # looop thru the hash and create link
    hash.each do |key , value|
      region = Region.find_by(:name => key.to_s)
      # puts "#{key}=#{region.name}"
      
      value.each do |bird_name|
        bird = Bird.where("common_name like ?", "%#{bird_name}%")
        puts "number of bird array = #{bird.count}" 
        puts "checking the bird = #{bird_name}"
        puts "number of matches= #{match}"
        if bird.count > 0 
          match += bird.count
          puts "match found!!!! #{bird_name}=#{bird[0].common_name}"
          birdlink = region.region_bird_links.create(:bird => bird[0])
          puts birdlink.to_yaml
        end
      end
      puts "---------"
    end
  end
end