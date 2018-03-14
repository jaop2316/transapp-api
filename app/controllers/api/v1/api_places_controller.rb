class Api::V1::ApiPlacesController < ApplicationController

  # Test function API

  def placesXroutes

    @places = Place.all.group_by(&:category_id)
    @result = Array.new

    @places.each do |category, places|
      @category_name = Category.find(category)
      @place = Array.new()
      places.each do |place|
        @placesXroutes= Placeroute.select(:name).joins(:route).where(place_id: place.id)
        @place.push({nombreSitio:place.name ,url: place.placeurl ,rutas:@placesXroutes.map{ |c| c.name}} )
      end
      @result.push(nombreCategoria:@category_name.name,id:category ,items:@place)
    end

    respond_to do |format|
      format.json { render json: @result }
    end

  end

end

