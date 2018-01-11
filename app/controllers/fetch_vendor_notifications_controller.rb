class FetchVendorNotificationsController < ApplicationController
  before_action :authenticate_vendor_request!

  def fetch_latest_notifications
    @notifications = @current_vendor.notifications.order(:isRead, created_at: :desc).limit(5)
    unreadNotifications = @current_vendor.notifications.where(isRead: false).count
    render json: {notifications: @notifications, notifications_count: unreadNotifications}
  end

  def mark_as_read
    @notification = Notification.find params[:id]
    if @notification.update_attributes isRead: params[:isRead]
      unreadNotifications = @current_vendor.notifications.where(isRead: false).count
      render json: {notification: @notification, notifications_count: unreadNotifications}
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end
end
