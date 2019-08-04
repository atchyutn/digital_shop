class AddTaxStructure < ActiveRecord::Migration[5.2]
  def change
    remove_column :taxes, :order_id
    remove_column :taxes, :percent
    add_column :taxes, :tax_type, :string
    add_column :taxes, :amount, :float
    add_column :taxes, :status, :boolean
    
    create_table :payment_token_taxes do |t|
      t.integer :payment_token_id
      t.integer :tax_id

      t.timestamps
    end
    
    change_column :cart_items, :price, :float
    change_column :payment_tokens, :price, :float
  end
end
