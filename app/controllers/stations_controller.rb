class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @stations_routes_list = Stationroute.select("name").joins(:route ).where({station_id: @station.id} )
    @stations_routes_list_compact = @stations_routes_list.map { |c| c.name }
  end

  # GET /stations/new
  def new
    @station = Station.new

    @all_routes = Route.all

    @station_route = @station.stationroutes.build
  end

  # GET /stations/1/edit
  def edit
    @all_routes = Route.all
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    params[:routes][:ids].each do |route|
      if !route.empty?
        @station.stationroutes.build(:route_id => route)
      end
    end

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update

    params[:routes][:ids].each do |route|
      if !route.empty?
        @station.stationroutes.build(:route_id => route)
      end
    end

    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :latitude, :longitude, :image)
    end
end
