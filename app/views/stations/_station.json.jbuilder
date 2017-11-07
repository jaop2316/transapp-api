json.extract! station, :id, :name, :latitude, :longitude, :created_at, :updated_at
json.url station_url(station, format: :json)
