class Api::V1::ApiPlacesController < ApplicationController

  # Test function API

  def placesXroutes

    @places = Place.all
    @result = Array.new

    @places.each do |place|
      @placesXroutes= Placeroute.select(:name).joins(:route).where(place_id: place.id)
      @result <<{
          nombreSitio:place.name,
          rutas: @placesXroutes.map { |c| c.name }

      }
    end


    respond_to do |format|
      format.json { render json: @result }
    end

  end

end

