require 'rails_helper'

RSpec.describe Product, type: :model do
  # assocation tests
  it { should have_many(:cart_items) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }

  # validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:created_by) }
end
