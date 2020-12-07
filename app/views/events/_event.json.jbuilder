json.extract! event_date, :id, :date, :event
json.url event_url(event_date.event, format: :json)
json.images event_date.event.images do |attachment|
  json.filename attachment.filename
  json.url url_for(attachment)
end
