class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = args[0]
    if notification.notifiable_type == "Consumer"
      ActionCable.server.broadcast "notifications:#{notification.notifiable_id}", notification
    elsif notification.notifiable_type == "Vendor"
      ActionCable.server.broadcast "vendor_notifications:#{notification.notifiable_id}", notification
    end
  end
end
