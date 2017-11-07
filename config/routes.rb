Rails.application.routes.draw do
  resources :stations
  resources :routes

  #Configuration for generate JSON files from API
  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      get     "/stations",     to: "api_stations#stationsXroutes"
    end
  end


end
