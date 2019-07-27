class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # model associations
  has_many :categories, class_name: "Category", foreign_key: "created_by"
  has_many :products, class_name: "Product", foreign_key: "created_by"
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  # validations
  validates_presence_of :role
end
