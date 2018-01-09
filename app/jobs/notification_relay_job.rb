class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = args[0]
    ActionCable.server.broadcast "notifications:#{notification.notifiable_id}", notification
  end
end
