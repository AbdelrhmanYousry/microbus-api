class AddIsReadToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :isRead, :boolean, default: false
  end
end
