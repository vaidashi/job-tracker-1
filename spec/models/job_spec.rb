require 'rails_helper'


RSpec.describe Job, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:level_of_interest) }
    it { is_expected.to validate_presence_of(:city) }
  end

  context "assocations" do
    it { should belong_to(:company) }
    it { should belong_to(:category) }
  end
end
