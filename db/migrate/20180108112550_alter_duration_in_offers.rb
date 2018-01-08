class AlterDurationInOffers < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :duration
    add_column :offers, :deadline, :datetime
  end
end
