class FetchVendorController < ApplicationController
    before_action  :authenticate_vendor_request!

    def show
      render json: {vendor_id: @current_vendor.id, vendor_name: @current_vendor.name, vendor_email: @current_vendor.email}
    end

end
