class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.time :placed_at
      t.string :status
      t.float :price
      t.integer :payment_token_id

      t.timestamps
    end
  end
end
