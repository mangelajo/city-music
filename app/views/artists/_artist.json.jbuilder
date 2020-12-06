json.extract! artist, :id, :name, :description, :website, :rating, :created_at, :updated_at
json.url artist_url(artist, format: :json)
