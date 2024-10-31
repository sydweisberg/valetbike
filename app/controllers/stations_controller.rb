class StationsController < ApplicationController

  def index
    @stations = Station.all.order(identifier: :asc)
  end

  def show
    @station = Station.find(params[:id])
  end

end
