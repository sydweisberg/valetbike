class BikesController < ApplicationController

  def index
    @bikes = Bike.all.order(identifier: :asc)
  end

  def return
    # gets correct bike object based on id
    @bike = Bike.find(params[:id])
    # gets return station id based on the parameter passed to return from the form
    station_id = params[:station_id] 
    # updates the bikes status, and the current station id
    @bike.update(status: "available", current_station_id: station_id)
    # redirects the users back to the rental page
    redirect_to stations_path
  end

end
