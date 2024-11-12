class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to login_path, flash: {alert: 'You must be signed in'} if current_user.nil?
  end

  # def redirect_if_authenticated
  #  redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
  # end
end
