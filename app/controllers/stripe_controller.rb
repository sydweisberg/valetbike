class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token
  HEROKU_SERVER="vectorbike-ecfe326f48ab.herokuapp.com/"

  def create_checkout_session
    begin
      session = Stripe::Checkout::Session.create({
        line_items: [{
          price: 'price_1QOoqiBdC2IsMXiiWSn0leCQ',
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "https://#{HEROKU_SERVER}/stripe/success?session_id={CHECKOUT_SESSION_ID}", # We need to talk to Prof. Brewer about where to redirect
        cancel_url: "https://#{HEROKU_SERVER}#{current_user.id}",
        client_reference_id: current_user.id
      })

      render json: { id: session.id }
    end
  end

  def success
    session_id = params[:session_id]

    begin
      session = Stripe::Checkout::Session.retrieve(session_id)

      if session.payment_status == 'paid'
        user = User.find(session.client_reference_id)
        amount_paid = session.amount_total / 100.0
        user.update_attribute(:balance, user.balance + amount_paid)
        # these do not work :(
        flash[:notice] = "Payment successful! Your balance is now $#{user.balance}0"
      else
        # this doesn't work :(
        flash[:alert] = "Payment failed, please try again."
      end
    rescue Stripe::StripeError => e
      flash[:alert] = "Stripe Error: #{e.message}"
    rescue => e
      flash[:alert] = "Unexpected error: #{e.message}"
    end

    redirect_to user_path(current_user)
  end
end
