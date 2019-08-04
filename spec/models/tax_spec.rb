require 'rails_helper'

RSpec.describe Tax, type: :model do
  # validation specs
  it { should validate_presence_of(:name) }
end
