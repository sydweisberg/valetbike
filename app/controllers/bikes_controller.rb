class BikesController < ApplicationController

  def index
    @bikes = Bike.all.order(identifier: :asc)
  end

  def return
    # gets return station id based on the parameter passed to return from the form
    station_id = params[:station_id] 
    if !Station.find_by(id: station_id).nil?
      # gets correct bike object based on id
      @bike = Bike.find(params[:id])
      # updates the bikes status, and the current station id
      @bike.update(status: "available", current_station_id: station_id)
      if Rental.find(session[:current_rental_id]).end_time < Time.now
        Rental.find(session[:current_rental_id]).update(over_time: true)
      end
      session.update(current_rental_id: nil)
      # redirects the users back to the rental page
      redirect_to stations_path
    else
        # this isn't showing an alert, but it also isn't submitting the return
        flash.alert = "Please enter a valid station ID."
        redirect_to rental_path(current_rental), status: :unprocessable_entity
    end
  end

end
