class Product < ApplicationRecord
  # model associations
  has_many :cart_items
  
  belongs_to :user, class_name: "User", foreign_key: "created_by", optional: true
  belongs_to :category

  # model validations
  validates_presence_of :name, :category_id, :price

end
