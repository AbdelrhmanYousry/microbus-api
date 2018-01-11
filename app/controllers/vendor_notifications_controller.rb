class VendorNotificationsController < ApplicationController
    before_action :authenticate_vendor_request!
    
    def index
      @notifications = @current_vendor.notifications.order(created_at: :desc)
      render json: @notifications
    end
end
