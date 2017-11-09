class Api::V1::ApiPlacesController < ApplicationController

  # Test function API

  def placesXroutes

    #@categories = Category.all
    @places = Place.all
    @places_group = @places.group_by{|t| t.category_id}
    @result = Array.new

    @places.each do |place|
      @places_routes_list = Placeroute.select("name").joins(:route ).where({place_id: place.id})
      @result << {
          categoria: place.category.name,
          items: [{nombreSitio: place.name,rutas: @places_routes_list }],
          #group: @places_group
      }
    end

    respond_to do |format|
      format.json { render json: @result }
    end

  end

end