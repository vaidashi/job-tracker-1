require 'rails_helper'

RSpec.describe Company, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "assocations" do
    it { should have_many(:jobs) }
  end
end
