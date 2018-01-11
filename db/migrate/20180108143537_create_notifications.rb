class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :notifiable_id
      t.string :notifiable_type
      t.string :body
      t.integer :offer_id

      t.timestamps
    end
  end
end
