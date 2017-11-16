class Api::V1::ApiRoutesController < ApplicationController
  def routesList
    @routes = Route.all

    @result = Array.new

    @routes.each do |route|
      @places_routes_list = Placeroute.select("name").joins(:place ).where({route_id: route.id})
      @ways_routes = route.name.split('-')
      @result << {
          nombreRuta: route.name,
          flotaLV: route.flotaLV,
          horaLV: route.horaLV,
          interLVP: route.interLVP,
          interLVN: route.interLVN,
          flotaS: route.flotaS,
          horaS: route.horaS,
          interSP: route.interSP,
          interSN: route.interSN,
          flotaDF: route.flotaDF,
          horaDF: route.horaDF,
          interDFP: route.interDFP,
          interDFN: route.interDFN,
          Observaciones: route.observations,
          items:[{sentido1:@ways_routes[0] ,sentido2:@ways_routes[1]}],
          sitios:@places_routes_list.map { |c| c.name }

      }
    end

    respond_to do |format|
      format.json {render json: @result}
    end

  end
end