class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :name
      t.integer :percent
      t.integer :order_id

      t.timestamps
    end
  end
end
