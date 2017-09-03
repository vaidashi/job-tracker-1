require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context "assocations" do
    it { should belong_to(:company) }
  end
end
