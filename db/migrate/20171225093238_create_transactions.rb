class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :source_id
      t.string :source_type
      t.integer :destination_id
      t.string :destination_type
      t.integer :amount

      t.timestamps
    end
  end
end
