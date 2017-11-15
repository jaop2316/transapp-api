class Api::V1::ApiPlacesController < ApplicationController

  # Test function API

  def placesXroutes

    #@categories = Category.all
    @places = Place.all
    @places_group = @places.group_by {|t| t.category_id }
    #@places_group = Place.group(:category_id)
    @result = Array.new

    @places_group.each do |category_id, places|
        @result << {
            categoria: category_id,
            items: [{ name: places.each{ |x| print  x.name },
                      #routes:@places_routes_list
                    }]


        }

     end

    respond_to do |format|
      format.json { render json: @result }
    end

  end

end

