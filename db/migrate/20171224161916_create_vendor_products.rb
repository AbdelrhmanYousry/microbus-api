class CreateVendorProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_products do |t|
      t.integer :product_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
