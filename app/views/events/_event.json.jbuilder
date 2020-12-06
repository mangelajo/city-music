json.extract! event, :id, :name, :venue_id, :description, :price_min, :price_max, :source_url, :tickets_urls, :video_url, :created_at, :updated_at
json.url event_url(event, format: :json)
