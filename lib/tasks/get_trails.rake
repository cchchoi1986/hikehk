namespace :get_trails do
  desc "scrape all hong kong hiking trails"
  task :scrape => :environment do
    require 'open-uri'
    require 'nokogiri'

    trail = {
      # "name" => "",
      # "description" => "",
      # "region" => "",
      # "difficulty" => "",
      # "number_minutes" => "",
      # "distance_meters" => "",
      # "route_url" => "",
      # "start_longitud" => 0,
      # "start_latitud" => 0,
      # "end_longitud" => 0,
      # "end_latitud" => 0,
      # "transport" => "",
      # "food_supply" => "",
      # "photo_urls" => [],
      # "flora" => "",
      # "fauna" => "",
      # "history" => "",
      # "direction" => ""
    };

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
      region = temp.gsub(" Hiking Routes","").gsub("Hiking Routes in ","").gsub("Hiking routes in ","").gsub("Hiking routes on ","").gsub("jssu","Lantau").split.map(&:capitalize).join(' ')
      
      # gets trail region_urls
      trails_urls = []
      region_html_doc.css('div.button > a').each do |f|
        trails_urls.push(f.attr("href").to_s.gsub("hill.php","hill_e.php"))
      end
      # puts trails_urls

      trails_urls.each do |f|
        trail_html_doc = Nokogiri::HTML(open("http://www.oasistrek.com/#{f}").read)
        # gets trail names
        name = trail_html_doc.css('div.trailcontent img').attr("src").to_s.gsub("images/","").gsub("/ba_01.jpg","").gsub("/ba_e.jpg","").gsub("peak2","peak").gsub("rock2","rock").gsub("lai2","lai").gsub("/ba1.jpg","").gsub("lai2","lai").gsub("san_shek_wan","Tung O Ancient Trail").gsub("nicholson","Mount Nicholson").gsub("_"," ").split.map(&:capitalize).join(' ')
        first_part = name.split[0]
        # puts first_part
        trail["region"] = region
        trail["name"] = name

        # gets difficulty level
        difficulty_array = trail_html_doc.css("img[src='images/content_images/diff_icon_e.gif'] + .star").children
        # calculates difficulty from array
        difficulty = 0.0
        difficulty_array.each do |f|
          if f.attr('src') == "images/content_images/star_icon.gif"
            difficulty= difficulty+1
          elsif f.attr('src') == "images/content_images/half_star_icon.gif"
            difficulty= difficulty+0.5
          elsif f.attr('src') == "images/content_images/halfstar_icon.gif"
            difficulty= difficulty+0.5
          end
        end
        trail["difficulty"] = difficulty

        # gets scenery level
        scenery_array = trail_html_doc.css("img[src='images/content_images/scenary_icon_e.gif'] + .star").children
        # calculates scenery from array
        scenery = 0.0
        scenery_array.each do |f|
          if f.attr('src') == "images/content_images/star2_icon.gif"
            scenery= scenery+1.0
          elsif f.attr('src') == "images/content_images/half_star2_icon.gif"
            scenery= scenery+0.5
          elsif f.attr('src') == "images/content_images/halfstar2_icon.gif"
            scenery= scenery+0.5
          end
        end
        trail["scenery"] = scenery

        # gets duration, distance, foodsupply trail info
        temp_info_array = trail_html_doc.css("div.info")
        temp_info_array.each do |f|
          if f.children.attr("src").to_s == 'images/content_images/time_icon_e.gif'
            duration = f.text
            trail["duration"] = duration
          elsif f.children.attr("src").to_s == "images/content_images/distance_icon_e.gif"
            distance = f.text
            trail["distance"] = distance
          elsif f.children.attr("src").to_s == "images/content_images/support_icon_e.gif"
            food_supply = f.text.squish
            trail["food_supply"] = food_supply
          elsif f.children.attr("src").to_s == "images/content_images/aware_icon_e.gif"
            warning = f.text.squish
            trail["warning"] = warning
          end
        end

        # gets trail photo urls
        photo_urls = []
        trail_html_doc.css("div.imgteaser2 img").each do |f|
          photo_urls.push(f.attr("src"))
        end
        trail_html_doc.css("div.imgteaser img").each do |f|
          photo_urls.push(f.attr("src"))
        end
        trail["photo_urls"] = photo_urls
        

        # gets trail description
        description = first_part + " " + trail_html_doc.css("div.name").text
        # puts description
        # puts "<<<<<<<<<<<"
        trail['description'] = description
        puts "<<<<<<<<<<<<<"
        puts trail
      end

    end

  end
end

# .slice("Hiking Routes in ","")