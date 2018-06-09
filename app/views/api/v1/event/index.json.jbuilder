

json.array! @Events do |event|

  json.id event.id
  json.name event.name
  json.location event.location
  json.date event.date
  json.time event.time.try(:strftime, '%H:%M')
  json.image_url event.imageurl.url
  json.description event.description
  json.musicgenres event.musicgenres

end


