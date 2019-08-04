class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # model associations
  has_many :created_categories, class_name: "Category", foreign_key: "created_by", dependent: :destroy
  has_many :created_products, class_name: "Product", foreign_key: "created_by"
  has_many :purchases, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :purchased_cart_items, -> {where.not(order_id: nil)}, class_name: "CartItem"
  has_many :added_to_cart_items, -> {where(order_id: nil)}, class_name: "CartItem"
  
  validates_presence_of :first_name, :last_name
  
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
end
