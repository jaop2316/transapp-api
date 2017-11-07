class Api::V1::ApiStationsController < ApplicationController

  # Test function API

  def stationsXroutes
    @stations = Station.all


    @result = Array.new

    @stations.each do |station|
      @stations_routes_list = Stationroute.select("name").joins(:route ).where({station_id: station.id})
      @result << {
          cod: station.id,
          nombre: station.name,
          latitud:station.latitude,
          longitud:station.longitude,
          rutas: @stations_routes_list,
      }
    end

    respond_to do |format|
      format.json { render json: @result }
    end

  end

end