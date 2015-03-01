json.name @trail.name
json.id @trail.id
json.region @trail.region.name
json.district @trail.region.district
json.icon "http://harrywood.co.uk/maps/examples/web-maps-lite/markers/marker-green.png"
json.description @trail.description
json.difficulty @trail.difficulty
json.scenery @trail.scenery
json.distance @trail.distance
json.duration @trail.duration
json.food_supply @trail.food_supply
json.warning @trail.warning
json.photo_urls @trail.photo_urls
json.start_coordinates @trail.start_coordinates
json.end_coordinates @trail.end_coordinates
json.region_id @trail.region_id

json.birds @trail.region.birds do |bird|
  json.common_name bird.common_name
  json.scientific_name bird.scientific_name
  json.photo_url bird.photo_urls
end

json.plants @trail.region.plants do |plant|
  json.common_name plant.common_name
  json.chinese_name plant.chinese_name
  json.scientific_name plant.scientific_name
  json.family_name plant.family_name
  json.chinese_family_name plant.chinese_family_name
  json.plant_type plant.plant_type
  json.photo_urls plant.photo_urls
end