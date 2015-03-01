json.trails @trails do |trail|
  json.name trail.name
  json.id trail.id
  json.region trail.region
  json.icon "http://harrywood.co.uk/maps/examples/web-maps-lite/markers/marker-green.png"
  json.description trail.description
  json.difficulty trail.difficulty
  json.scenery trail.scenery
  json.start_coordinates trail.start_coordinates
  json.end_coordinates trail.end_coordinates
  json.trail_coordinates trail.trail_coordinates
  json.distance trail.distance
  json.duration trail.duration
  json.food_supply trail.food_supply
  json.warning trail.warning
  json.photo_urls trail.photo_urls
end