class OffersController < ApplicationController
before_action :authenticate_vendor_request!, only: [:create]
before_action :authenticate_request!, only: [:index]

  def index
    @offers = Offer.all
  end

  def create
    offer = @current_vendor.offers.new offer_params


    if offer.save
      render json: offer
    else
      render json: { message: 'failed'}, status: :unauthorized
    end

  end

def show
    @offer = Offer.find(params[:id])
end

def update
  end

  private
  def offer_params
    params.require(:offer).permit(:name, :description, :price , :duration, :target_count, :vendor_product_id, :thumbnail, :status)
  end
end
