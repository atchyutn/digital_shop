require 'rails_helper'

RSpec.describe CartItem, type: :model do
  # association specs
  it { should belong_to(:user) }
  it { should belong_to(:purchase) }
  it { should belong_to(:product) }

  # validation specs
  [:product_id, :user_id, :price].each do |field|
    it { should validate_presence_of(field) }
  end
end
