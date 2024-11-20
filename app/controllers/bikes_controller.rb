class BikesController < ApplicationController

  def index
    @bikes = Bike.all.order(identifier: :asc)
  end

  def return
    # gets return station id based on the parameter passed to return from the form
    station_id = params[:station_id] 
    # if return station id is valid
    if !Station.find_by(id: station_id).nil?
      # gets correct bike object based on id
      @bike = Bike.find(params[:id])
      # updates bike to reflect being returned
      @bike.update(status: "available", current_station_id: station_id)
      # gets current rental
      @rental = Rental.find_by(user_id: session[:user_id], active: true)
      # if bike was returned late, set over_time = true
      if @rental.end_time < Time.now
        @rental.update(over_time: true)
      end
      # change rental to inactive
      @rental.update(active: false)
      # redirects the users back to the rental page
      redirect_to stations_path
    else
        # show alert/do not submit return if an invalid station ID is entered
        flash.alert = "Invalid station ID."
        redirect_to rental_path(current_rental), status: :unprocessable_entity
    end
  end

end
