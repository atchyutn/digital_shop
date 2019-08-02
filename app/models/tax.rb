class Tax < ApplicationRecord
  # model associations
  belongs_to :purchase, class_name: "Purchase", foreign_key: "order_id"

  # model validations
  validates_presence_of :name, :percent, :order_id
end
