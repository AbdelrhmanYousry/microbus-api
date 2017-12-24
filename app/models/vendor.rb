class Vendor < ApplicationRecord
    has_many :vendor_products
    has_many :products, through: :vendor_products
    
    validates :name, :email, :encrypted_password, :current_balance, presence: true
end
