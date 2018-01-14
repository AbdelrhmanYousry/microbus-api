class Offer < ApplicationRecord
  after_create :makeOfferNotification

  belongs_to :vendor_product
  mount_uploader :thumbnail, ThumbnailUploader
  validates :name, :price, :deadline, :description, :target_count, :thumbnail,  presence: true
  validates :price, :numericality => { :greater_than => 0 }
  validates :target_count, :numericality => { :greater_than => 0 }
  validate :deadline_cannot_be_in_the_past

  has_one :product, through: :vendor_product
  has_one :vendor, through: :vendor_product


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

  has_many :buying_consumers, class_name: 'Consumer', through: :destination_transactions, source: :source, source_type: 'Consumer'
  has_many :wishlist_consumers, through: :product, source: :consumers

  validates :name, :price, :deadline, :description, :target_count, :thumbnail,  presence: true
  validates :price, :numericality => { :greater_than => 0 }
  validates :target_count, :numericality => { :greater_than => 0 }
  validate :deadline_cannot_be_in_the_past, on: :create

  after_create :setup_trigger, :completed_check

  def progress
    (self.buying_consumers.count.to_f / self.target_count.to_f) * 100
  end

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Time.now.in_time_zone("Africa/Cairo")+2.hour
      errors.add(:deadline, "can't be in the past")
    end
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

  def notify
    self.vendor.notifications.create(offer_id: self.id, body:"Sorry, Your offer on #{self.product.name} wasnt successful")
  end

  def notifySuccess
    self.vendor.notifications.create(offer_id: self.id, body:"Your offer on #{self.product.name} was successful, #{self.current_balance} was transferred to you!")
  end

  def notify_consumers_success
    self.buying_consumers.each do |consumer|
      consumer.notifications.create(offer_id: self.id, body: "Offer #{self.name} was successful, the seller is processing your order")
    end
  end

  def notify_consumers_failure
    self.buying_consumers.each do |consumer|
      consumer.notifications.create(offer_id: self.id, body: "Offer #{self.name} was not successful, #{self.price} was refunded to you")
    end
  end

  private
  def setup_trigger
    ExpiredJob.set(wait_until: self.deadline.utc-2.hours).perform_later(self)
  end



  def epxired_check
  	if self.status == "expired"
  		self.buying_consumers.refund
  	end
  end

  def makeOfferNotification
    self.wishlist_consumers.each do |consumer|
      consumer.notifications.create(offer_id: self.id, body: "Seller #{self.vendor.name} created an offer on item #{self.product.name} check it now! ")
    end
  end





end
