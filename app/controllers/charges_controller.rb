class ChargesController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = "sk_test_aCrc2HkKI5sVIPGkdjWxi0NQ"

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]
    amount = params[:amount]
    description = params[:description]

    # Charge the user's card:
    charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "EGP",
      :description => description,
      :source => token,
    )
    render json: (charge.amount)/100

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  end
end
