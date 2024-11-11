class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  # GET /rentals or /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1 or /rentals/1.json
  def show
    @rental = Rental.find(params[:id])
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)
    respond_to do |format|
      if @rental.save
        # if the rental is valid...
        # make the start time of the rental the time the rental was created
        # use rental duration to calculate correct end time
        @rental.update(start_time: @rental.created_at, end_time: @rental.created_at + @rental.duration.minutes)
        # redirct user to the page for their rental
        format.html { redirect_to rental_path(@rental), notice: "Rental was successfully created."}
      else
        # else, display flash alert and refresh the page for the current station
        format.html do
          flash.alert = "Invalid rental."
          redirect_to stations_path(@station), status: :unprocessable_entity
        end
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to rental_url(@rental), notice: "Rental was successfully updated." }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:bike_id, :end_time, :identifier, :start_time, :over_time, :user_id, :duration)
    end
end
