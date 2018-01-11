class Wishlist < ApplicationRecord
  belongs_to :consumer
  belongs_to :product

validates :product_id, uniqueness: { scope: :consumer_id }
end
