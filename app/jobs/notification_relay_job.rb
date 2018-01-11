class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = args[0]
    if notification.notifiable_type == 'consumer'
      ActionCable.server.broadcast "notifications:#{notification.notifiable_id}", notification
    else
      ActionCable.server.broadcast "vendor_notifications:#{notification.notifiable_id}", notification
    end
  end
end
