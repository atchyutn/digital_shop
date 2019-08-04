class Purchase < ApplicationRecord
  self.table_name = "orders"
  # model associations
  has_many :cart_items, class_name: "CartItem", foreign_key: "order_id", dependent: :destroy
  has_many :taxes, class_name: "Tax", foreign_key: "order_id", dependent: :destroy
  belongs_to :user
  belongs_to :payment_token

  # model validations
  validates_presence_of :user_id, :placed_at, :status, :price, :payment_token_id
  
  def send_payment_confirmation
    CheckoutNotifierMailer.payment_confirmation(self).deliver
  end
end
