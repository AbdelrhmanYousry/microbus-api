class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :current_balance, null:false, default: 0

      t.timestamps
    end
  end
end
