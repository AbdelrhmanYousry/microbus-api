class Offer < ApplicationRecord
  belongs_to :vendor_product
  mount_uploader :thumbnail, ThumbnailUploader


  has_many :source_transactions, class_name: 'Transaction', as: :source
  has_many :refund_consumers, class_name: 'Consumer', through: :source_transactions, source: :destination, source_type: 'Consumer'
  has_many :destination_transactions, class_name: 'Transaction', as: :destination do |transaction|
    def refund
      transaction do
        self.each do |dtransaction|
          dtransaction.source.destination_transactions.create! source: proxy_association.owner, amount: proxy_association.owner.price
          dtransaction.source.deposit(proxy_association.owner.price)      
        end
      end
    end

  end

  has_one :vendor, through: :vendor_product

  validates :name, :price, :deadline, :description, :target_count, :thumbnail,  presence: true

  has_many :buying_consumers, class_name: 'Consumer', through: :destination_transactions, source: :source, source_type: 'Consumer' 
  # do |consumers|
  # 	def refund
  # 		transaction do
	 #  		self.each do |consumer|
  # 	  		consumer.destination_transactions.create! source: proxy_association.owner, amount: proxy_association.owner.price

  # 	  		consumer.deposit(proxy_association.owner.price)

       
	 #  		end
	 #  	end
  # 	end
  # end

  has_one :vendor, through: :vendor_product
  has_one :product, through: :vendor_product
  has_many :wishlist_consumers, through: :product, source: :consumers

  # scope :active, -> { where(active: true) }
  after_create :setup_trigger, :completed_check

  def progress
    (self.buying_consumers.count.to_f / self.target_count.to_f) * 100
  end

  def current_balance
  	destination_transactions.sum(:amount)
  end

  def pay_to_vendor
  	self.vendor.deposit(current_balance)
  end
  
  def completed_check
  	if self.buying_consumers.count == self.target_count
  		CompletedJob.perform_later(self)
  	end
  end
  
  private
  def setup_trigger
    # ExpiredJob.set(wait_until: self.deadline.to_i).perform_later(self)
    # deadline = self.deadline.in_time_zone("Africa/Cairo").to_time
    ExpiredJob.set(wait_until: self.deadline.in_time_zone("Africa/Cairo").to_time-2.hour).perform_later(self) 
  end



  def epxired_check
  	if self.status == "expired"
  		self.buying_consumers.refund
  	end
  	
  end
end
