#  TODO : should call set_authy_id if phone_number or country_code is changed
require "twilio_authy"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # model associations
  has_many :created_categories, class_name: "Category", foreign_key: "created_by", dependent: :destroy
  has_many :created_products, class_name: "Product", foreign_key: "created_by"
  has_many :purchases, -> {order(placed_at: :desc)}, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :purchased_cart_items, -> {where.not(order_id: nil)}, class_name: "CartItem"
  has_many :added_to_cart_items, -> {where(order_id: nil)}, class_name: "CartItem"
  
  validates_presence_of :first_name, :last_name
  
  after_create :set_authy_id
  
  def add_to_cart(product)
    added_to_cart_items.create!(product: product, price: product.offer_price) unless has_item_in_cart?(product)
  end
  
  def remove_from_cart(product)
    added_to_cart_items.find_by(product: product).destroy if has_item_in_cart?(product)
  end
  
  def has_item_in_cart?(product)
    added_to_cart_items.find_by(product_id: product.id)
  end
  
  def sync_cart_items(cart_products)
    products = Product.where(id: cart_products)
    products.each do |product|
      add_to_cart(product)
    end
  end
  
  def set_authy_id
    # TODO : Should be done background job
    TwilioAuthy.new(user: self).register_user if phone_number && country_code
  end
  
  def phone
    "#{self.country_code}#{self.phone_number}"
  end
  
  def name
    "#{first_name} #{last_name}"
  end
end
