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
  
  def change_payment_status(payment_status)
    self.update_attribute(:status, "success")
    self.place_order if payment_status == "success"
  end
  
  def place_order
    Purchase.transaction do
      @purchase = Purchase.create(
        user_id:          self.user_id,
        payment_token_id: self.id,
        status:           "Paid",
        price:            self.get_grnad_total,
        placed_at:        Time.now
      )
      if self.product
        self.user.added_to_cart_items.create!(product: self.product, price: self.product.offer_price, order_id: @purchase.id)
      else
        self.user.added_to_cart_items.update_all(order_id: @purchase.id)
      end
      @purchase.send_payment_confirmation
    end
    return @purchase
  end
end
