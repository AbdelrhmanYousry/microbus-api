class RenameColumnToPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    rename_column :consumers, :encrypted_password, :password_digest
  end
end
