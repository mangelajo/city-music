json.extract! venue, :id, :name, :city_id, :street, :postalCode, :phone, :description, :website, :rating, :capacity, :created_at, :updated_at
json.url venue_url(venue, format: :json)
