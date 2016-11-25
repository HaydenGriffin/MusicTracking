json.extract! artist, :id, :name, :start, :genre, :bio, :created_at, :updated_at
json.url artist_url(artist, format: :json)