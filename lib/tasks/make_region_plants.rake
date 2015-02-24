namespace :make_region_plants do
  desc "make regions of hong kong"
  task :create => :environment do

      require 'nokogiri'
      require 'open-uri'
      # require 'csv'

      url = "https://docs.google.com/spreadsheets/d/1vUGHTLK9BrGilPFWSahFz4M_UvIUH01kGvz1Vj1gsYE/pubhtml"

      html_doc = Nokogiri::HTML(open(url).read)

      region = html_doc.css("table.waffle > tbody > tr > td:nth-child(2)")
      # region.each do |f|
            # puts f.text
      # end

      districts = {
            "Aberdeen" => Region.find_by(:name => "Southern").id,
            "Tai Tong" => Region.find_by(:name => "Yuen Long").id,
            "Tai Tam" => Region.find_by(:name => "Eastern").id,
            "Tai Tan" => Region.find_by(:name => "Tai Po").id,
            "Pak Tam Chung" => Region.find_by(:name => "Sai Kung").id,
            "Kei Ling Ha" => Region.find_by(:name => "Sha Tin").id,
            "Ngong Ping" => Region.find_by(:name => "Islands").id,
            "Nai Chung" => Region.find_by(:name => "Sha Tin").id,
            "Kam Shan" => Region.find_by(:name => "Kwai Tsing").id,
            "Chung Pui" => Region.find_by(:name => "North").id,
            "Clear Water Bay" => Region.find_by(:name => "Sai Kung").id,
            "Wong Shek" => Region.find_by(:name => "Tai Po").id,
            "Pok Fu Lam" => Region.find_by(:name => "Southern").id,
            "Quarry Bay" => Region.find_by(:name => "Eastern").id,
            "Wong Nai Chung" => Region.find_by(:name => "Wan Chai").id,
            "Nam Shan" => Region.find_by(:name => "Islands").id
      }
      # puts districts["Aberdeen"]

      row = html_doc.css("table.waffle > tbody > tr")
      row.each do |f|
            array = []
            rowtext = f.to_s
            rowtext.gsub!(/(<tr style)(.*)/,"")
            rowtext.gsub!(/(<th id)(.*)/,"")
            rowtext.to_s.gsub!(/(<td class="s2)(.*)/,"")
            rowtext.gsub!(/(<\/tr)(.*)/,"")
            rowtext.gsub!(/(<td class="s1 softmerge"><div class="softmerge-inner" style="width: 110px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s0 softmerge" dir="ltr"><div class="softmerge-inner" style="width: 251px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s1 softmerge"><div class="softmerge-inner" style="width: 86px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s0 softmerge"><div class="softmerge-inner" style="width: 110px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s1 softmerge"><div class="softmerge-inner" style="width: 88px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s0 softmerge"><div class="softmerge-inner" style="width: 251px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s1 softmerge"><div class="softmerge-inner" style="width: 93px; left: -1px;">)(.*)/,"")
            rowtext.gsub!(/(<td class="s1 softmerge"><div class="softmerge-inner" style="width: 251px; left: -1px;">)(.*)(<\/div><\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s0" dir="ltr">)(.*)(<\/td>)/,'\2')
            rowtext.gsub!(/(<td class="s0">)(.*)(<\/td>)/,'\2')
            # print rowtext.squish

            rowtext.split("\n").each do |e|
                  if e != ""
                        array.push(e)
                  end
            end
            # print array[0],array[3]
            region = districts[array[0]]
            Plant.where("scientific_name like ?", "%#{array[3]}%").each do |f|
                  # puts f.id
                  # puts region
                  RegionPlantLink.create({
                        :region_id => region,
                        :plant_id => f.id
                  })
            end

            
            puts "================="
      end



  end
end