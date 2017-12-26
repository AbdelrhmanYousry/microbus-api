class AddConfirmationTokenAndConfirmedAtToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :confirmation_token , :string
    add_column :vendors, :confirmed_at, :date
  end
end
