json.plants @plants do |plant|
  json.common_name plant.common_name
  json.chinese_name plant.chinese_name
  json.scientific_name plant.scientific_name
  json.family_name plant.family_name
  json.chinese_family_name plant.chinese_family_name
  json.plant_type plant.plant_type
  json.photo_urls plant.photo_urls
end