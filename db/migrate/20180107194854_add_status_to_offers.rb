class AddStatusToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :status, :string, :default => 'progress'
  end
end
