class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :country_code, :string
    add_column :users, :authy_id, :string
  end
end
