class ChangePaymentTokens < ActiveRecord::Migration[5.2]
  def change
    change_column :payment_tokens, :token, :string
    change_column :payment_tokens, :status, :string
    
    add_column :payment_tokens, :product_id, :ineteger
  end
end
