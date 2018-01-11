class FetchNotificationsController < ApplicationController
  before_action :authenticate_request!

  def fetch_new_notifications
    @notifications = @current_user.notifications.where(isRead:false)
    unreadNotifications = @current_user.notifications.where(isRead: false).count
    render json: {notifications: @notifications, notifications_count: unreadNotifications}
  end

  def mark_as_read
    @notification = Notification.find params[:id]
    if @notification.update_attributes isRead: params[:isRead]
      unreadNotifications = @current_user.notifications.where(isRead: false).count
      render json: {notification: @notification, notifications_count: unreadNotifications}
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end
end
