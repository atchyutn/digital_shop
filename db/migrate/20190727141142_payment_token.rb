class PaymentToken < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_tokens do |t|
      t.integer :price
      t.integer :token
      t.integer :status

      t.timestamps
    end
  end
end
