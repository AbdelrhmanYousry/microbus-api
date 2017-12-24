class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.integer :price
      t.time :duration
      t.text :description
      t.integer :target_count
      t.belongs_to :vendor_product
      t.integer :balance, null: false, default: 0

      t.timestamps
    end
  end
end
