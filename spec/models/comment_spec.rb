require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:notes) }
  end

  context "assocations" do
    it { should belong_to(:job) }
  end
end
