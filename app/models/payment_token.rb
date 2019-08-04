class PaymentToken < ApplicationRecord
  # model associations
  has_many :purchases
  has_many :payment_token_taxes
  has_many :taxes, through: :payment_token_taxes
  
  belongs_to :product, optional: true
  belongs_to :user

  # model validations
  validates :token, presence: true, uniqueness: true
  
  def get_total
    if product
      product.offer_price
    else
      user.added_to_cart_items.map{|c| c.product.offer_price}.sum
    end
  end
  
  def get_grnad_total
    get_total + payment_token_taxes.map(&:get_amount).sum
  end
end
