class AddThumbnailToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :thumbnail, :string
  end
end
