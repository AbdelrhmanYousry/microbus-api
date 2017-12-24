class Consumer < ApplicationRecord
  has_many :wishlists
  has_many :products, through: :wishlists
  validates :name, :email, :encrypted_password, :current_balance, presence: true
end
