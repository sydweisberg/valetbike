class BikesController < ApplicationController

  def index
    @bikes = Bike.all.order(identifier: :asc)
  end

  def return
    puts "you're in bike return!"
    @bike = Bike.find(params[:id])
    station_id = params[:station_id] 
    @bike.update(status: "available", current_station_id: station_id)
    redirect_to stations_path
  end

end
