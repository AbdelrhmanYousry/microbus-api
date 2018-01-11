class AddConfirmationTokenAndConfirmedAtToConsumer < ActiveRecord::Migration[5.1]
  def change
    add_column :consumers, :confirmation_token , :string
    add_column :consumers, :confirmed_at, :date
  end
end
