class StationsController < ApplicationController

  def index
    @stations = Station.all.order(params[:sort])
    @view = params[:view] || 'list'
  end

  def show
    @station = Station.find(params[:id])
  end

end
