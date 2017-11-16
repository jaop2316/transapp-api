class Api::V1::ApiCategoriesController < ApplicationController

  def categoriesList
    @categories = Category.all

    @result = Array.new

    @categories.each do |category|
      @category_places = category.places.select(:name)
      @places = category.places.where({category_id:category.id})
      @places_routes_list = Placeroute.select("name").joins(:route).where({place_id: category.places.select(:id)})
      @result << {
          nombreCategoria: category.name,
          items: [{ nombreSitio: category.places.select(:name), rutas:@places_routes_list.map { |c| c.name }}]
      }
    end

    respond_to do |format|
      format.json { render json: @result }
    end

  end
end