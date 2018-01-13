class Consumer < ApplicationRecord
  has_secure_password
  has_many :wishlists
  has_many :products, through: :wishlists

  has_many :source_transactions, class_name: 'Transaction', as: :source
  has_many :bought_offers, class_name: 'Offer', through: :source_transactions, source: :destination, source_type: 'Offer'
  has_many :destination_transactions, class_name: 'Transaction', as: :destination
  has_many :refunded_offers, class_name: 'Offer', through: :destination_transactions, source: :source, source_type: 'Offer'
  has_many :notifications, as: :notifiable
  validates :name, :email, :password_digest, :current_balance, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/ }
  validates :password, length: { minimum: 6 }


  #current_user.buy(Offer.find params[:id])
  def withdraw(amount)
      self.current_balance -= amount
      self.save
  end

  def deposit(amount)
    self.current_balance += amount
    self.save
  end


  def buy(offer)

    if self.current_balance >= offer.price && offer.status != "completed" && offer.status != "expired"
      transaction do
        self.withdraw(offer.price)
        self.source_transactions.create! destination: offer, amount: offer.price
        offer.completed_check
      end
    end
  rescue
    return false
  end


  # end

  def charge(makmaks)
    self.current_balance += makmaks
  end


end
