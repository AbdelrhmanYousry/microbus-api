class Vendor < ApplicationRecord
    has_secure_password
    has_many :vendor_products
    has_many :products, through: :vendor_products
    has_many :offers , through: :vendor_products
    has_many :notifications, as: :notifiable
    has_many :transactions, source: :destination, source_type: 'Vendor'
    validates :name, :email, :password_digest, :current_balance, presence: true
    validates :email, format: { with: /(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/ }
    validates :password, length: { minimum: 6 }, on: :create


    # def offers
    #   Offer.joins(:vendor_product).where('vendor_products.vendor_id = ?', self.id)
    # end


  	def deposit(amount)
    	self.current_balance += amount
    	self.save
	end
end
