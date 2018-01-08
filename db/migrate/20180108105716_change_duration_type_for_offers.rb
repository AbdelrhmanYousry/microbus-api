class ChangeDurationTypeForOffers < ActiveRecord::Migration[5.1]
  def change
	  change_column :offers, :duration, :integer	
  end
end
