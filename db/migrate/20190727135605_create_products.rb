class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :category_id
      t.float :price
      t.float :offer_price
      t.boolean :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
