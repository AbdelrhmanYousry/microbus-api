class VendorNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vendor_notifications:#{current_user.id}"
    # stream_from "NotificationsChannel"
  end

  def unsubscribed
    stop_all_streams
  end
end
