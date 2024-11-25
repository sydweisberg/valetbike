class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create_checkout_session
    begin
      session = Stripe::Checkout::Session.create({
        line_items: [{
          price: 'price_1QOoqiBdC2IsMXiiWSn0leCQ',
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "http://localhost:3000/stripe/success?session_id={CHECKOUT_SESSION_ID}", # We need to talk to Prof. Brewer about where to redirect
        cancel_url: "http://localhost:3000/users/#{current_user.id}",
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
        user.balance += amount_paid
        user.save!

        flash[:notice] = "Payment successful! Your balance is now $#{user.balance}"
      else
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
