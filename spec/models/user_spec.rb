require 'rails_helper'

# Test suite for the user model
RSpec.describe User, type: :model do
  # Association tests
  it { should have_many(:categories) }
  it { should have_many(:products) }
  it { should have_many(:purchases).dependent(:destroy) }
  it { should have_many(:cart_items).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
end
