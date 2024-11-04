class StationsController < ApplicationController

  def index
    @stations = Station.all.order(identifier: :asc)
    @view = params[:view] || 'map'
  end

  def show
    @station = Station.find(params[:id])
  end

end
