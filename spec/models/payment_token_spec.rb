require 'rails_helper'

RSpec.describe PaymentToken, type: :model do
  # association specs
  it { should have_many(:purchases) }

  # validation specs
  [:price, :token].each do |field|
    it { validate_presence_of(field) }
  end
end
