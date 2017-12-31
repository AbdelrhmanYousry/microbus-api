class Vendor < ApplicationRecord
    has_secure_password
    has_many :vendor_products
    has_many :products, through: :vendor_products

    has_many :transactions, source: :destination, source_type: 'Vendor'

    validates :name, :email, :password_digest, :current_balance, presence: true
end
