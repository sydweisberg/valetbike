class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :current_rental
  helper_method :active_rental?

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to login_path, flash: {alert: 'You must be signed in'} if current_user.nil?
  end

  def current_rental
    if session[:current_rental_id] && Rental.find_by(id: session[:current_rental_id]).end_time > Time.now
      @current_rental = Rental.find_by(id: session[:current_rental_id])
    else
      @current_rental = nil
    end

  end
  
  def active_rental?
    !current_rental.nil?
  end

  # def redirect_if_authenticated
  #  redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
  # end
end
