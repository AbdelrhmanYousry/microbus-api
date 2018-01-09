class AlterDurationInOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :deadline, :datetime
  end
end
