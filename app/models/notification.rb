class Notification < ApplicationRecord
  belongs_to :consumer

  belongs_to :recipient, class_name: "Consumer"
  belongs_to :notifiable, polymorphic: true
end
