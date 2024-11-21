class StationsController < ApplicationController
  include StationsHelper
  def index
    if params[:sort] == "available_bikes"
      @stations = Station.all.sort_by { |station| count_rentable_bikes(station) }.reverse
    else
      @stations = Station.all.order(params[:sort])
    end
    @view = params[:view] || 'list'
  end

  def show
    @station = Station.find(params[:id])
  end

end
