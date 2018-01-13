class CurrentVendorOffersController < ApplicationController
   before_action  :authenticate_vendor_request!
  def index
    @offers = @current_vendor.offers.order(created_at: :desc)
    # render json: @offers
  end
end
