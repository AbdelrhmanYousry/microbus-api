class Consumer < ApplicationRecord
  has_secure_password
  has_many :wishlists
  has_many :products, through: :wishlists

  has_many :source_transactions, class_name: 'Transaction', as: :source
  has_many :bought_offers, class_name: 'Offer', through: :source_transactions, source: :destination, source_type: 'Offer'
  has_many :destination_transactions, class_name: 'Transaction', as: :destination
  has_many :refunded_offers, class_name: 'Offer', through: :destination_transactions, source: :source, source_type: 'Offer'

  validates :name, :email, :password_digest, :current_balance, presence: true
  validates :name, :email, uniqueness: true

  #current_user.buy(Offer.find params[:id])
  def withdraw(amount)
    if self.current_balance >= amount
      self.current_balance -= amount


    self.save
    end

  end

  def deposit(amount)
    self.current_balance += amount
    self.save
  end
  

  def buy(offer)
    transaction do
      self.source_transactions.create! destination: offer, amount: offer.price
      self.withdraw(offer.price)
    end
  rescue
    return false
  end


  # end

  def charge(makmaks)
    self.current_balance += makmaks
  end


end