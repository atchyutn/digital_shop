require 'rails_helper'

# Test suite for the user model
RSpec.describe User, type: :model do
  # Association tests

  # Validation tests
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
end
