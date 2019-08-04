class Tax < ApplicationRecord
  has_many :payment_token_taxes
  
  scope :active, -> {where(status: true)}
  
  # model validations
  validates_presence_of :name, :amount, :tax_type
  
  def detailed_name
    return "#{name}@#{amount}%" if tax_type.downcase == "percent"
    return name
  end
end
