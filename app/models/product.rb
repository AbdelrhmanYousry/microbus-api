class Product < ApplicationRecord
  searchkick word_start: [:name]
    has_many :wishlists
    has_many :consumers, through: :wishlists

    has_many :vendor_products
    has_many :vendors, through: :vendor_products
    validates :name, presence: true, uniqueness: true

end
