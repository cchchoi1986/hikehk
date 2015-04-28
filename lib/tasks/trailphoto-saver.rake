namespace :photosaver do
  desc "saves to computer all photos from database"
  task :do => :environment do
    require 'open-uri'
    require 'nokogiri'

    ## one trail
    # test_trail = Trail.find(2)
    # trail_photos = test_trail.photo_urls
    # trail_photos.each do |f|
    #   url = "http://www.oasistrek.com/#{f}"
    #   # puts url_encode(url)
    #   # f = f.gsub('images/','').gsub('/','-')
    #   f = f.gsub('/','%2F')
    #   puts f
    #   File.open("#{f}", "wb") do |g|
    #     g.write(open(url).read)
    #   end
    # end

    ## all trails
    all_trails = Trail.all
    all_trails.each do |trail|
      trail.photo_urls.each do |g|
        begin
          url = "http://www.oasistrek.com/#{g}"
          # f = f.gsub('images/','').gsub('/','-')
          g = g.gsub('/','%2F')
          puts g
          File.open("#{g}", "wb") do |h|
            h.write(open(url).read)
          end
          
        rescue OpenURI::HTTPError => e
          if e.message == '404 Not Found'
            # handle 404 error
          else
            raise e
          end
        end
      end
    end


  end
end