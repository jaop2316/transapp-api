json.extract! route, :id, :name, :observations, :created_at, :updated_at
json.url route_url(route, format: :json)
