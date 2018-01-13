class OffersController < ApplicationController
before_action :authenticate_vendor_request!, only: [:create]
before_action :authenticate_request!, only: [ :consumer_offers]
before_action  :session_info_check!, only: [:show]


  def index
    @offers = Offer.where(status: 'progress')
  end

  def create
    offer = @current_vendor.offers.new offer_params


    if offer.save
      render json: offer
    else
      render json: { message: 'failed'}, status: :unauthorized
    end

  end

  def consumer_offers
    @offers = @current_user.bought_offers
  end

  def show
      @offer = Offer.find(params[:id])
  end

  def update
  end

  private
  def offer_params
    params.require(:offer).permit(:name, :description, :price , :deadline, :target_count, :vendor_product_id, :thumbnail, :status)
  end
end
