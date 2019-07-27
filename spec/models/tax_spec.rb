require 'rails_helper'

RSpec.describe Tax, type: :model do
  # association specs
  it { should belong_to(:purchase) }

  # validation specs
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:percent) }
  it { should validate_presence_of(:order_id) }
end
