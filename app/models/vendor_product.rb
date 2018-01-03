class VendorProduct < ApplicationRecord
  belongs_to :vendor
  belongs_to :product
  has_many :offers
end
