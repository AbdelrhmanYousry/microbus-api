class TransactionsController < ApplicationController
    before_action :authenticate_request!
  def buy
    offer = Offer.where(id: params[:offer_id])
    @current_user.buy(offer[0])
      render json: {balance: @current_user.current_balance, offer: offer[0]}, status: :ok

  end
end
