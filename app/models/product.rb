class Product < ApplicationRecord
  # model associations
  has_many :cart_items
  belongs_to :user, class_name: "User", foreign_key: "created_by"
  belongs_to :category

  # model validations
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :created_by, presence: true

end
