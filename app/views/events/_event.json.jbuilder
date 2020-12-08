json.extract! event, :id, :name, :description, :venue, :price_min, :price_max,
                :source_url, :tickets_urls, :video_url, :created_at, :updated_at, :band
json.url event_url(event, format: :json)

# This would be simpler, but it wouldn't allow, in a future, to provide specific details
# of the event dates (like available ticket counts, etc)
#  json.event_dates  event.event_dates.map { |e| e.date }

json.event_dates event.event_dates do |event_date|
  json.extract! event_date, :date, :id
end

json.images event.images do |attachment|
  json.filename attachment.filename
  json.url url_for(attachment)
end
