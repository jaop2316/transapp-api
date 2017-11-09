Rails.application.routes.draw do
  resources :places
  resources :categories
  resources :stations
  resources :routes

  #Configuration for generate JSON files from API
  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      get     "/stations",     to: "api_stations#stationsXroutes"
      get     "/places",       to: "api_places#placesXroutes"
      get     "/categories",   to: "api_categories#categoriesList"
    end
  end


end
