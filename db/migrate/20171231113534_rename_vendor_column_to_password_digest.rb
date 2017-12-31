class RenameVendorColumnToPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    rename_column :vendors, :encrypted_password, :password_digest
  end
end
