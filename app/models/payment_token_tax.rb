class PaymentTokenTax < ApplicationRecord
  belongs_to :tax
  belongs_to :payment_token
  
  def get_amount
    if tax.tax_type.downcase == "percent"
      return (tax.amount/100)*payment_token.get_total
    end
    return tax.amount
  end
end