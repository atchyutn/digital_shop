require 'rails_helper'

RSpec.describe Purchase, type: :model do
  # association tests
  it { should have_many(:cart_items).dependent(:destroy) }
  it { should belong_to(:user) }
  it { should belong_to(:payment_token) }

  # validation tests
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:placed_at) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:payment_token_id) }
end
