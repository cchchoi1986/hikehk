namespace :get_trails do
  desc "scrape all hong kong hiking trails"
  task :scrape => :environment do
    require 'open-uri'
    require 'nokogiri'

    

    starting_url = "http://www.oasistrek.com/trail_e.php"
    html_doc = Nokogiri::HTML(open(starting_url).read)
    
    # targets all hong kong regions and gets their name and links
    html_regions = html_doc.css(".bgb").children
    region_urls = []
    html_regions.each do |i|
      region_urls.push(i.children.attr('href'))
    end
    # puts region_urls
    
    region_urls.each do |f|
      region_html_doc = Nokogiri::HTML(open("http://www.oasistrek.com/#{f}").read)
      
      # gets name of region
      temp = region_html_doc.css('body > div > div.gbframe > img').attr("alt").to_s
      region = ""
      region = temp.gsub(" Hiking Routes","").gsub("Hiking Routes in ","").gsub("Hiking routes in ","").gsub("Hiking routes on ","").gsub("jssu","Lantau").split.map(&:capitalize).join(' ')
      
      # gets trail region_urls
      trails_urls = []
      region_html_doc.css('div.button > a').each do |f|
        trails_urls.push(f.attr("href").to_s.gsub("hill.php","hill_e.php"))
      end
      # puts trails_urls

      trails_urls.each do |f|
        trail = {}
        

        trail_html_doc = Nokogiri::HTML(open("http://www.oasistrek.com/#{f}").read)

        puts "<<<<<<<<<<<<<"
        trail = { 
          :region => region, 
          :name => get_name(trail_html_doc), 
          :difficulty => get_difficulty_rating(trail_html_doc),
          :scenery => get_scenery_rating(trail_html_doc),
          :warning => get_warning(trail_html_doc),
          :food_supply => get_food_supply(trail_html_doc),
          :distance => get_distance(trail_html_doc),
          :duration => get_duration(trail_html_doc),
          :photo_urls => get_photo_urls(trail_html_doc),
          :description => get_description(trail_html_doc)
        }
        puts trail
      end

    end

  end
end

# .slice("Hiking Routes in ","")


# gets trail names
def get_name(trail_html_doc)
  name = trail_html_doc.css('div.trailcontent img').attr("src").to_s.gsub("images/","").gsub("/ba_01.jpg","").gsub("/ba_e.jpg","").gsub("peak2","peak").gsub("rock2","rock").gsub("lai2","lai").gsub("/ba1.jpg","").gsub("lai2","lai").gsub("san_shek_wan","Tung O Ancient Trail").gsub("nicholson","Mount Nicholson").gsub("_"," ").split.map(&:capitalize).join(' ')
  # puts description
  return name
  # return description
end

def get_description(trail_html_doc)
  name = trail_html_doc.css('div.trailcontent img').attr("src").to_s.gsub("images/","").gsub("/ba_01.jpg","").gsub("/ba_e.jpg","").gsub("peak2","peak").gsub("rock2","rock").gsub("lai2","lai").gsub("/ba1.jpg","").gsub("lai2","lai").gsub("san_shek_wan","Tung O Ancient Trail").gsub("nicholson","Mount Nicholson").gsub("_"," ").split.map(&:capitalize).join(' ')
  first_part = name.split[0]
  # puts first_part
  description = []
  temp_description = first_part + " " + trail_html_doc.css("div.name").text
  temp_description.split("\n").each do |f|
    if f != ""
      description.push(f.squish)
    end
  end
  # puts description
  # return name
  return description
end

# gets difficulty level
def get_difficulty_rating(trail_html_doc)
  difficulty = 0
  difficulty_array = trail_html_doc.css("img[src='images/content_images/diff_icon_e.gif'] + .star").children
  # calculates difficulty from array
  difficulty = 0.0
  difficulty_array.each do |f|
    if f.attr('src') == "images/content_images/star_icon.gif"
      difficulty = difficulty + 1
    elsif f.attr('src') == "images/content_images/half_star_icon.gif"
      difficulty = difficulty + 0.5
    elsif f.attr('src') == "images/content_images/halfstar_icon.gif"
      difficulty = difficulty + 0.5
    end
  end
  return difficulty
end

# gets scenery level
def get_scenery_rating(trail_html_doc)
  scenery = 0
  scenery_array = trail_html_doc.css("img[src='images/content_images/scenary_icon_e.gif'] + .star").children
  # calculates scenery from array
  scenery = 0.0
  scenery_array.each do |f|
    if f.attr('src') == "images/content_images/star2_icon.gif"
      scenery = scenery + 1.0
    elsif f.attr('src') == "images/content_images/half_star2_icon.gif"
      scenery = scenery + 0.5
    elsif f.attr('src') == "images/content_images/halfstar2_icon.gif"
      scenery = scenery + 0.5
    end
  end
  return scenery
end

def get_duration(trail_html_doc)
  duration = ""
  temp_info_array = trail_html_doc.css("div.info")
  temp_info_array.each do |f|
    if f.children.attr("src").to_s == 'images/content_images/time_icon_e.gif'
      duration = f.text.squish
    end
  end
  return duration
end

def get_distance(trail_html_doc)
  distance = ""
  temp_info_array = trail_html_doc.css("div.info")
  temp_info_array.each do |f|
    if f.children.attr("src").to_s == "images/content_images/distance_icon_e.gif"
      distance = f.text.squish
    end
  end
  return distance
end

def get_food_supply(trail_html_doc)
  food_supply = []
  temp_info_array = trail_html_doc.css("div.info")
  temp_info_array.each do |f|
    if f.children.attr("src").to_s == "images/content_images/support_icon_e.gif"
      f.text.split("\n").each do |f|
        if f != ""
          food_supply.push(f.squish)
        end
      end
    end
  end
  return food_supply
end

def get_warning(trail_html_doc)
  warning = []
  temp_info_array = trail_html_doc.css("div.info")
  temp_info_array.each do |f|
    if f.children.attr("src").to_s == "images/content_images/aware_icon_e.gif"
      f.text.split("\n").each do |f|
        if f != ""
          warning.push(f.squish)
        end
      end
    end
  end
  return warning
end

# gets trail photo urls
def get_photo_urls(trail_html_doc)
  photo_urls = []
  trail_html_doc.css("div.imgteaser2 img").each do |f|
    photo_urls.push(f.attr("src"))
  end
  trail_html_doc.css("div.imgteaser img").each do |f|
    photo_urls.push(f.attr("src"))
  end
  return photo_urls
end

