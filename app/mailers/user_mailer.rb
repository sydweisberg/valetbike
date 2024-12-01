class UserMailer < ApplicationMailer
  default :from => "welcome@valetbike.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to ValetBike!")
  end
end
