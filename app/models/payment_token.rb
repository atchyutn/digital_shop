class PaymentToken < ApplicationRecord
  # model associations
  has_many :purchases

  # model validations
  validates :price, presence: true 
end
