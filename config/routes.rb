Rails.application.routes.draw do
  get 'welcome/index'

  resources :places
  resources :categories
  resources :stations
  resources :routes

  # Set a index page

  root 'welcome#index'
  get   'welcome/index'

  #Configuration for generate JSON files from API
  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      get     "/stations",     to: "api_stations#stationsXroutes"
      get     "/places",       to: "api_places#placesXroutes"
      get     "/categories",   to: "api_categories#categoriesList"
      get     "/routes",   to: "api_routes#routesList"
    end
  end


end
