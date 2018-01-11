class VendorProduct < ApplicationRecord
  belongs_to :vendor
  belongs_to :product
  has_many :offers
  validates :product_id, uniqueness: { scope: :vendor_id }

end
