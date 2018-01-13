class CurrentVendorOffersController < ApplicationController
   before_action  :authenticate_vendor_request!
  def index
    if params[:status].present?
      @offers = @current_vendor.offers.where status: params[:status]
    else
      @offers = @current_vendor.offers.order(created_at: :desc)
    end
  end
end
