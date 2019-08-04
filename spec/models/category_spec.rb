require 'rails_helper'

RSpec.describe Category, type: :model do
  # association specs
  it { should belong_to(:user) }
  it { should have_many(:products).dependent(:destroy) }

  # validation specs
  it { should validate_presence_of(:name) }
end
