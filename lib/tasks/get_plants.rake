namespace :get_plants do
  desc "scrape all hong kong plants"
  task :scrape => :environment do
    require 'open-uri'
    require 'nokogiri'

    subpages = (2360..13112).to_a
    # subpages = (3339..3341).to_a
    total = 0
    subpages.each do |f|
      html_doc = Nokogiri::HTML(open("http://www.herbarium.gov.hk/subpages.aspx?id=#{f}").read)
        if html_doc.css("div.Text_overflow > table.products_details_table tr:nth-child(1) > td:nth-child(2)").text != " "
          puts '========================================'
          total = total + 1
          family_name = ""
          chinese_family_name = ""
          scientific_name = ""
          chinese_name = ""
          common_name = ""
          plant_type = ""
          flowering_period = ""

          photos = get_photos(html_doc)

          index = 1
          html_doc.css("table.products_details_table tr").each do |row|
            if row.text.gsub(/(Family Name)(.*)/,'\1')=="Family Name"
              family_name = row.text.gsub!(/(Family Name)(.*)/,'\2')
            elsif row.text.gsub(/(Chinese Family Name)(.*)/,'\1') == "Chinese Family Name"
              chinese_family_name = row.text.gsub!(/(Chinese Family Name)(.*)/,'\2')
            elsif row.text.gsub(/(Scientific Name)(.*)/,'\1') == "Scientific Name"
              scientific_name = row.text.gsub!(/(Scientific Name)(.*)/,'\2')
            elsif row.text.gsub(/(Chinese Name)(.*)/,'\1') == "Chinese Name"
              chinese_name = row.text.gsub!(/(Chinese Name)(.*)/,'\2')
            elsif row.text.gsub(/(Common Name)(.*)/,'\1') == "Common Name"
              common_name = row.text.gsub!(/(Common Name)(.*)/,'\2')
            elsif row.text.gsub(/(Plant Type)(.*)/,'\1') == "Plant Type"
              plant_type = row.text.gsub!(/(Plant Type)(.*)/,'\2')
            elsif row.text.gsub(/(Flowering Period)(.*)/,'\1') == "Flowering Period"
              flowering_period = row.text.gsub!(/(Flowering Period)(.*)/,'\2')
            end
            index = index + 1
          end

          plant = {
            :family_name => family_name,
            :chinese_family_name => chinese_family_name,
            :name => common_name,
            :chinese_name => chinese_name,
            :family_name => family_name,
            :plant_type => plant_type,
            :flowering_time => flowering_period,
            :photo_urls => photos
          }

          puts "plant: #{plant}"
        end
        puts "~index: #{f}"
        puts "~total: #{total}"
      end
    end
  end

def get_photos(html_doc)
  photos =[]
  imgScript = html_doc.css("script")[2].text
  imgScript.gsub!(/(var imgArrSmall =\[)(.*)/,'')
  imgScript.gsub!(/(var imgArrBig = \[)(.*)(\];)/,'\2')
  imgScript.gsub!(/(var imgArrSmallTitle=\[)(.*)/,'')
  imgScript.gsub!(/(var imgArrBigTitle=)(.*)/,'')
  imgScript.gsub!(/(var iconTitleLeft=)(.*)/,'')
  imgScript.gsub!(/(var iconTitleRight=)(.*)/,'')
  imgScript.gsub!(/(var iconTitleUp=)(.*)/,'')
  imgScript.gsub!(/(var iconTitleDown=)(.*)/,'')
  imgScript.gsub!("\s","")
  imgScript.gsub!(" ","")
  imgScript.gsub!("\n","")
  imgScript.gsub!("\t","")
  imgScript.gsub!("\\\\","/")
  imgScript.gsub!("\\\"","")
  # imgScript.gsub!(/&nbsp;/,'')
  imgScript.gsub!(/\r/,'')
  # print imgScript

  imgScript.split(",").each do |f|
    photos.push(f)
  end
  return photos
end