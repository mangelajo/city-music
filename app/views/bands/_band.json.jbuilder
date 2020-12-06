json.extract! band, :id, :name, :website, :description, :rating, :created_at, :updated_at
json.url band_url(band, format: :json)
