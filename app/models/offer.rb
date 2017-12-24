class Offer < ApplicationRecord
  belongs_to :vendor_product
  validates :name, :price, :duration, :description, :target_count, presence: true
end
