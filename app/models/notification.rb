class Notification < ApplicationRecord
  after_create -> { NotificationRelayJob.perform_now(self) }
  belongs_to :notifiable, polymorphic: true
end
