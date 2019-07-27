class CartItem < ApplicationRecord
  # model associations
  belongs_to :user
  belongs_to :product
  belongs_to :purchase, class_name: "Purchase", foreign_key: "order_id"

  # model validations
  validates_presence_of(:product_id, :order_id, :user_id, :price)
end
