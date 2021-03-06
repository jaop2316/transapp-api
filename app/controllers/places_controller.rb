class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @places_routes_list = Placeroute.select("name").joins(:route).where({place_id: @place.id})
  end

  # GET /places/new
  def new
    @place = Place.new
    @all_categories = Category.all
    @all_routes = Route.all
    @place_route = @place.placeroutes.build

  end

  # GET /places/1/edit
  def edit
    @all_categories = Category.all
    @all_routes = Route.all
    @place_route = @place.placeroutes.build
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    params[:routes][:ids].each do |route|
      if !route.empty?
        @place.placeroutes.build(:route_id => route)
      end
    end

    respond_to do |format|
      if @place.save
        format.html {redirect_to @place, notice: 'Place was successfully created.'}
        format.json {render :show, status: :created, location: @place}
      else
        format.html {render :new}
        format.json {render json: @place.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update

    params[:routes][:ids].each do |route|
      if !route.empty?
        @place.placeroutes.build(:route_id => route)
      end
    end

    respond_to do |format|
      if @place.update(place_params)
        format.html {redirect_to @place, notice: 'Place was successfully updated.'}
        format.json {render :show, status: :ok, location: @place}
      else
        format.html {render :edit}
        format.json {render json: @place.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html {redirect_to places_url, notice: 'Place was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:name, :category_id ,:placeurl)
  end
end
