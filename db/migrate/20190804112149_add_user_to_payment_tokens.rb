class AddUserToPaymentTokens < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_tokens, :user_id, :integer
  end
end
