class CurrentVendorOffersController < ApplicationController
   before_action  :authenticate_vendor_request!
  def index
    @offers = @current_vendor.offers
    # render json: @offers
  end
end
