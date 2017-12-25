class Transaction < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :destination, polymorphic: true
end
