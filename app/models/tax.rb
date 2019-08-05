class Tax < ApplicationRecord
  has_many :payment_token_taxes
  
  scope :active, -> {where(status: true)}
  
  # model validations
  validates_presence_of :name, :amount, :tax_type
  validate :tax_type_validation
  
  def detailed_name
    return "#{name}@#{amount}%" if tax_type.downcase == "percent"
    return name
  end

  private

  # validate tax type to either percent of amount
  def tax_type_validation
    errors.add(:tax_type, "Please choose one from given options") unless ["amount", "percent"].include? tax_type
  end
end
