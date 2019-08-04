class Category < ApplicationRecord
  # model assocations
  belongs_to :user, class_name: "User", foreign_key: "created_by", optional: true
  has_many :products, dependent: :destroy

  # model validations
  validates :name, presence: true
  # validates :created_by, presence: true
end
