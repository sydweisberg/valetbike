class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create_checkout_session
    begin
      session = Stripe::Checkout::Session.create({
        line_items: [{
          price: 'price_1QNg0pBdC2IsMXiiOSRkSUoS',
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "http://localhost:3000/users/#{current_user.id}", # We need to talk to Prof. Brewer about where to redirect
        cancel_url: "http://localhost:3000/users/#{current_user.id}",
      })

      render json: { id: session.id }
    end
  end
end
