class SessionsController < ApplicationController
  # skip_before_action :authenticate_user, only: [:new, :create]
  # before_action :redirect_if_authenticated, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Logged in successfully' }
    else
      render :new
    end
  end

  def update
    # i think we will need an update function but this will not be the correct logic
    @rental = Rental.find_by(id: params[:rental][:id])
    if @rental.present? && @rental.user_id == current_user.id && @rental.end_time > Time.now
      session[:current_rental_id] = @rental.id
    else 
      session[:current_rental_id] = nil
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { success: 'Logged Out' }
  end
end
