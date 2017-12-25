class Offer < ApplicationRecord
  belongs_to :vendor_product

  has_many :source_transactions, class_name: 'Transaction', as: :source
  has_many :refund_consumers, class_name: 'Consumer', through: :source_transactions, source: :destination, source_type: 'Consumer'
  has_many :destination_transactions, class_name: 'Transaction', as: :destination
  has_many :buying_consumers, class_name: 'Consumer', through: :destination_transactions, source: :source, source_type: 'Consumer'
  has_one :vendor, through: :source_transactions, source: :destination, source_type: 'Vendor'

  validates :name, :price, :duration, :description, :target_count, presence: true
end
