json.birds @birds do |bird|
  json.common_name bird.common_name
  json.scientific_name bird.scientific_name
  json.photo_url bird.photo_urls
end